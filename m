Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DB7298925
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 10:10:05 +0100 (CET)
Received: from localhost ([::1]:44662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kWyVw-0000ht-Le
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 05:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kWyRv-0004OE-Q6; Mon, 26 Oct 2020 05:05:55 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kWyRt-0000bM-L9; Mon, 26 Oct 2020 05:05:55 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CKTTH1DVfzkZVg;
 Mon, 26 Oct 2020 17:05:55 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Mon, 26 Oct 2020 17:05:49 +0800
Message-ID: <5F96916D.1020501@huawei.com>
Date: Mon, 26 Oct 2020 17:05:49 +0800
From: AlexChen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 4/4] qga: Switch and case should be at the same indent
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=alex.chen@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 05:05:50
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: AlexChen <alex.chen@huawei.com>
---
 qga/main.c | 52 ++++++++++++++++++++++++++--------------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/qga/main.c b/qga/main.c
index 69660d9abd..33e510ba19 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -280,20 +280,20 @@ QEMU_HELP_BOTTOM "\n"
 static const char *ga_log_level_str(GLogLevelFlags level)
 {
     switch (level & G_LOG_LEVEL_MASK) {
-        case G_LOG_LEVEL_ERROR:
-            return "error";
-        case G_LOG_LEVEL_CRITICAL:
-            return "critical";
-        case G_LOG_LEVEL_WARNING:
-            return "warning";
-        case G_LOG_LEVEL_MESSAGE:
-            return "message";
-        case G_LOG_LEVEL_INFO:
-            return "info";
-        case G_LOG_LEVEL_DEBUG:
-            return "debug";
-        default:
-            return "user";
+    case G_LOG_LEVEL_ERROR:
+        return "error";
+    case G_LOG_LEVEL_CRITICAL:
+        return "critical";
+    case G_LOG_LEVEL_WARNING:
+        return "warning";
+    case G_LOG_LEVEL_MESSAGE:
+        return "message";
+    case G_LOG_LEVEL_INFO:
+        return "info";
+    case G_LOG_LEVEL_DEBUG:
+        return "debug";
+    default:
+        return "user";
     }
 }

@@ -695,19 +695,19 @@ DWORD WINAPI service_ctrl_handler(DWORD ctrl, DWORD type, LPVOID data,
     GAService *service = &ga_state->service;

     switch (ctrl) {
-        case SERVICE_CONTROL_STOP:
-        case SERVICE_CONTROL_SHUTDOWN:
-            quit_handler(SIGTERM);
-            SetEvent(ga_state->wakeup_event);
-            service->status.dwCurrentState = SERVICE_STOP_PENDING;
-            SetServiceStatus(service->status_handle, &service->status);
-            break;
-        case SERVICE_CONTROL_DEVICEEVENT:
-            handle_serial_device_events(type, data);
-            break;
+    case SERVICE_CONTROL_STOP:
+    case SERVICE_CONTROL_SHUTDOWN:
+        quit_handler(SIGTERM);
+        SetEvent(ga_state->wakeup_event);
+        service->status.dwCurrentState = SERVICE_STOP_PENDING;
+        SetServiceStatus(service->status_handle, &service->status);
+        break;
+    case SERVICE_CONTROL_DEVICEEVENT:
+        handle_serial_device_events(type, data);
+        break;

-        default:
-            ret = ERROR_CALL_NOT_IMPLEMENTED;
+    default:
+        ret = ERROR_CALL_NOT_IMPLEMENTED;
     }
     return ret;
 }
-- 
2.19.1

