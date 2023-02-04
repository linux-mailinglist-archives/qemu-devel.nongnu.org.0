Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5B968AB1B
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:11:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOL5u-0005FS-4o; Sat, 04 Feb 2023 11:08:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5n-00057w-KP
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:43 -0500
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5l-0006vp-Ed
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:43 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MrxfX-1osdNr3prh-00nzZo; Sat, 04
 Feb 2023 17:08:39 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Letu Ren <fantasquex@gmail.com>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 09/22] linux-user: add more netlink protocol constants
Date: Sat,  4 Feb 2023 17:08:17 +0100
Message-Id: <20230204160830.193093-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204160830.193093-1-laurent@vivier.eu>
References: <20230204160830.193093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6NGrLWZ+s5gBpApTLYcdfmN6u/320x6R5kH3KIyzfzPAD5UugkU
 3H1+oJhJ8h62Yt5+9O8+u9brYpjz8am9ICxgHxwcPDcjbCc/mMUyGaKAq/EZGxBpGHlMYcJ
 +PHkezlJW7XgMCL/r4w/bYmZVI30gkzAiMzONg8tyPMxB2g8gAQYPqK3zIs0OzEZzNgxH9C
 g8Zd99e2XaDdR8/57oiUQ==
UI-OutboundReport: notjunk:1;M01:P0:uH5CD42gIVk=;gIFhXFw97OxbvoJiiVB+VLyEtlm
 Cm0EwCRRiWdpfduPdVzE0iY9PcwY9KJmlTB4iATbI/Q0gO/bcMtuqR1oUGWJD+oc1e214K9Z9
 FQFgiqhrBXrE1oF4tfZKfWwH0bhNTA6lHUQ7AFw4+jleJ/O6snJGalIVIqm/xXybF6v0E9rAM
 BdPfWQG5nVR7Q1Q3iWN+SRI9rAKvJE6s+ozXUhyEPxPVp7kmuqzWFGjjAu3iTuTlkyLzud/rR
 IBAKDSaSnW8gnFnuxptrZ65f9Vu/pllLFxYVTfhUtkFl3d9RknGAV11ZugDalFbLSqUz/OTAy
 v7593KH0+wMcWU+eXJ/Dm6Ds3d3JFLaWpZkEKtTQfJ+WIryGg+pq5kGnKB5HkLhT6tBUt4qRN
 t5NfxA4Z6/qHZZMaFvo5qD5FfCLUn9ciqRIsT4Bm6LihkomLcY9VyaaK0eS9N42viUyiSgMaw
 UzcOfTQNWr2VFkCP6o1UEUMS6QYT7c7lo/ydhNyaH2LVjZ6fS9NwoEkBfh06zyOcITHyRbkeN
 534+mBaTfHi/voiPf8yqls9UxhvF+xWsIpjLpFA/wV5EyYw5H5e/qkAKG2gxYqQFNnuGy93WR
 LFVBZrxXu0pNRtLco66n9NBQrcI+dSK0VSt8e4IaHVO7KEmnWDsh6i7vl/AzSxYy8MjAHMJ2a
 xz0VWa+17KFrv79EulAGulRA35zQxLcynvZR+mf7rA==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Letu Ren <fantasquex@gmail.com>

Currently, qemu strace only prints four protocol contants. This patch
adds others listed in "linux/netlink.h".

Signed-off-by: Letu Ren <fantasquex@gmail.com>
Message-Id: <20230101141105.12024-1-fantasquex@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c | 48 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 081fc87344ca..f38227ba5db5 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -506,21 +506,69 @@ print_socket_protocol(int domain, int type, int protocol)
         case NETLINK_ROUTE:
             qemu_log("NETLINK_ROUTE");
             break;
+        case NETLINK_UNUSED:
+            qemu_log("NETLINK_UNUSED");
+            break;
+        case NETLINK_USERSOCK:
+            qemu_log("NETLINK_USERSOCK");
+            break;
+        case NETLINK_FIREWALL:
+            qemu_log("NETLINK_FIREWALL");
+            break;
+        case NETLINK_SOCK_DIAG:
+            qemu_log("NETLINK_SOCK_DIAG");
+            break;
+        case NETLINK_NFLOG:
+            qemu_log("NETLINK_NFLOG");
+            break;
+        case NETLINK_XFRM:
+            qemu_log("NETLINK_XFRM");
+            break;
+        case NETLINK_SELINUX:
+            qemu_log("NETLINK_SELINUX");
+            break;
+        case NETLINK_ISCSI:
+            qemu_log("NETLINK_ISCSI");
+            break;
         case NETLINK_AUDIT:
             qemu_log("NETLINK_AUDIT");
             break;
+        case NETLINK_FIB_LOOKUP:
+            qemu_log("NETLINK_FIB_LOOKUP");
+            break;
+        case NETLINK_CONNECTOR:
+            qemu_log("NETLINK_CONNECTOR");
+            break;
         case NETLINK_NETFILTER:
             qemu_log("NETLINK_NETFILTER");
             break;
+        case NETLINK_IP6_FW:
+            qemu_log("NETLINK_IP6_FW");
+            break;
+        case NETLINK_DNRTMSG:
+            qemu_log("NETLINK_DNRTMSG");
+            break;
         case NETLINK_KOBJECT_UEVENT:
             qemu_log("NETLINK_KOBJECT_UEVENT");
             break;
+        case NETLINK_GENERIC:
+            qemu_log("NETLINK_GENERIC");
+            break;
+        case NETLINK_SCSITRANSPORT:
+            qemu_log("NETLINK_SCSITRANSPORT");
+            break;
+        case NETLINK_ECRYPTFS:
+            qemu_log("NETLINK_ECRYPTFS");
+            break;
         case NETLINK_RDMA:
             qemu_log("NETLINK_RDMA");
             break;
         case NETLINK_CRYPTO:
             qemu_log("NETLINK_CRYPTO");
             break;
+        case NETLINK_SMC:
+            qemu_log("NETLINK_SMC");
+            break;
         default:
             qemu_log("%d", protocol);
             break;
-- 
2.39.1


