/*
 
See LICENSE folder for this sample’s licensing information.
 
Abstract:
Using pipelines
*/

import Foundation
import SwiftyRedis

try await RedisPipeline()
    .hset(
        key: "user::123",
        fieldValue:
                .init(field: "username", value: "testuser"),
                .init(field: "password", value: "hash123")
    )
    .sadd(key: "users", member: "123")
    .exec(try await RedisClient.LOCAL.get_connection())
