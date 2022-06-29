Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB53A55FC05
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 11:30:05 +0200 (CEST)
Received: from localhost ([::1]:54826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6U1M-0002XM-Kl
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 05:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6ThD-0000k6-CH; Wed, 29 Jun 2022 05:09:21 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:42617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6Th9-0003YK-8O; Wed, 29 Jun 2022 05:09:15 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MPXMa-1oKHDm2M4I-00MfJl; Wed, 29
 Jun 2022 11:08:56 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 05/11] trivial typos: namesapce
Date: Wed, 29 Jun 2022 11:08:43 +0200
Message-Id: <20220629090849.1350227-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629090849.1350227-1-laurent@vivier.eu>
References: <20220629090849.1350227-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qxsvthMUJQXPZdEjDzghaMoaRrYcSc280reHISYYXR8m6VwjOeO
 c27rRotK7MTu4hzDMhjSj+j4IZOOi7VXMQZQWi6ID27CcpD121uKsFCFKM1hgCMM2rvbLgq
 LupR7MnX2HCVoXbmsWnX6OP+4U/sT9XS/uOQ9gLg6T+cKEIIb0jUcEPirByDIFNtL6uKDWq
 D1EyOpaI/QJSBkVQYulQg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tqVxDB8dg8k=:2jz7OiMwCmtJb1w8ClQZw8
 gOzBcFFLzmgOlYCJKbeVLcgBQB1GwxL0/ShZHSFsYZ6690sTX5dYYM9TPm0Hh4q5dJ75uKOYv
 YYwNIq466sH7qwBj3MsnTgvFSRFGvBgzYuveb3mRLDZg3LZqXpSMYovxzJ1l7T+os+r0Dgn/l
 5WE0YuDkDMTQENZ/CTJxjnR9oODTz5f8caT0P++LL73xjAr8Vn7aCM0thK7+7/7fEsoDPvCWM
 XzM5OWXm3t+6/V0mboPVLNYUzjrQSW2cOP4uqD6k6bwxqQyarwaG3r2kz4jySu7Yvi3Tji3o9
 NItdCsGhCXHCWNGgxLw4LDz+OLg4okZGlO59eUmEvdI4V28qw0/zwbX+6pCIXDEAAs1hVPLKa
 dRpfxRk8RVz9zbnNXRu1qit3OO0gA5gVY2xhabfgyi4g9nWVZoelihZZmmo9GP4hdmfmFLpc0
 XJQPOJWyQt8Xc10CzjJ8HV/P94nsQl3BlzHO1AnzqMFeNCaZ4trzA+JPgOnamAQ9bx3cxX51d
 EeWtbrFS1KtyX9WRndq4ZiW2R4a8nQjaSITEaINr0LeaPYXtdyB4xg/mlHXzEPVa3GgsxGBD1
 xygFU5Qtq1wxm0G5PNec9NE8SVqU/FWhFpqVwxc2WJx/aAwDT47w+dC3ph68byVdUBG883cmT
 KqRdsmVS8UC3x52FnxioqfqQBSzjuh8CYdPSF0mZvT7BgG7xRj2W4lqDIx0QH+grtK7H4XJ2m
 Z1NtwY9S/ocY+Ig7+vO2tqTS01m73i/Hvv7aeg==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

'namespace' is misspelled in a bunch of places.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Message-Id: <20220614104045.85728-3-dgilbert@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/9pfs/9p-xattr-user.c | 8 ++++----
 hw/acpi/nvdimm.c        | 2 +-
 hw/nvme/ctrl.c          | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/9pfs/9p-xattr-user.c b/hw/9pfs/9p-xattr-user.c
index f2ae9582e610..535677ed609b 100644
--- a/hw/9pfs/9p-xattr-user.c
+++ b/hw/9pfs/9p-xattr-user.c
@@ -27,7 +27,7 @@ static ssize_t mp_user_getxattr(FsContext *ctx, const char *path,
 {
     if (strncmp(name, "user.virtfs.", 12) == 0) {
         /*
-         * Don't allow fetch of user.virtfs namesapce
+         * Don't allow fetch of user.virtfs namespace
          * in case of mapped security
          */
         errno = ENOATTR;
@@ -49,7 +49,7 @@ static ssize_t mp_user_listxattr(FsContext *ctx, const char *path,
             name_size -= 12;
         } else {
             /*
-             * Don't allow fetch of user.virtfs namesapce
+             * Don't allow fetch of user.virtfs namespace
              * in case of mapped security
              */
             return 0;
@@ -74,7 +74,7 @@ static int mp_user_setxattr(FsContext *ctx, const char *path, const char *name,
 {
     if (strncmp(name, "user.virtfs.", 12) == 0) {
         /*
-         * Don't allow fetch of user.virtfs namesapce
+         * Don't allow fetch of user.virtfs namespace
          * in case of mapped security
          */
         errno = EACCES;
@@ -88,7 +88,7 @@ static int mp_user_removexattr(FsContext *ctx,
 {
     if (strncmp(name, "user.virtfs.", 12) == 0) {
         /*
-         * Don't allow fetch of user.virtfs namesapce
+         * Don't allow fetch of user.virtfs namespace
          * in case of mapped security
          */
         errno = EACCES;
diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index 0d43da19ea42..5f85b1632706 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -476,7 +476,7 @@ struct NvdimmFuncGetLabelDataOut {
     /* the size of buffer filled by QEMU. */
     uint32_t len;
     uint32_t func_ret_status; /* return status code. */
-    uint8_t out_buf[]; /* the data got via Get Namesapce Label function. */
+    uint8_t out_buf[]; /* the data got via Get Namespace Label function. */
 } QEMU_PACKED;
 typedef struct NvdimmFuncGetLabelDataOut NvdimmFuncGetLabelDataOut;
 QEMU_BUILD_BUG_ON(sizeof(NvdimmFuncGetLabelDataOut) > NVDIMM_DSM_MEMORY_SIZE);
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index d349b3e42620..ca335dd7da6d 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -76,7 +76,7 @@
  *   the SUBNQN field in the controller will report the NQN of the subsystem
  *   device. This also enables multi controller capability represented in
  *   Identify Controller data structure in CMIC (Controller Multi-path I/O and
- *   Namesapce Sharing Capabilities).
+ *   Namespace Sharing Capabilities).
  *
  * - `aerl`
  *   The Asynchronous Event Request Limit (AERL). Indicates the maximum number
-- 
2.36.1


