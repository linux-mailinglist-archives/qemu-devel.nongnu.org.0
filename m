Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9781D6193
	for <lists+qemu-devel@lfdr.de>; Sat, 16 May 2020 16:24:21 +0200 (CEST)
Received: from localhost ([::1]:46066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZxjf-00068A-Rv
	for lists+qemu-devel@lfdr.de; Sat, 16 May 2020 10:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <teachk@foxmail.com>)
 id 1jZwvC-00030L-1a
 for qemu-devel@nongnu.org; Sat, 16 May 2020 09:32:10 -0400
Received: from out203-205-221-245.mail.qq.com ([203.205.221.245]:60107
 helo=qq.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <teachk@foxmail.com>)
 id 1jZwv6-0007CO-LQ
 for qemu-devel@nongnu.org; Sat, 16 May 2020 09:32:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1589635904; bh=dqNWq+Cq319NegWg6B2F9qiSIJaev6Gp6VZfGEzFlqE=;
 h=From:To:Cc:Subject:Date;
 b=nde6qM/aR9sn0/9nw263nW5dW5uAIlpzkR5O+xNS46ncapxHzg7yN9C2rVgN7JLUU
 ODkTWD0tbhtwyXN+uGkkRSrm9aew4F2teW186f6LMhT4+V6HgZQH8h8xYAA3fAQ+j4
 pI5hFgcE3Etd60xPE+Wp3KL4Zf5LoO8vwHMLbMc0=
Received: from localhost.localdomain ([120.200.144.22])
 by newxmesmtplogicsvrsza6.qq.com (NewEsmtp) with SMTP
 id 7E78A01D; Sat, 16 May 2020 21:31:39 +0800
X-QQ-mid: xmsmtpt1589635899tv0urv9rl
X-QQ-XMAILINFO: N1Suf0tbEPcE/BCjGpluwTRJhI4tESztUm2uUoqLkq6U95xXj01MeDllbI2fhj
 OfiMnlRcDOQC6oEfF46XEqOC7YJ1i5FBE/cLYibOjXg5jESwzU1DU416cWhqz9EAmCzvI8jiXLWv
 0DHpu6Avpt3Q4JWyr8oj2J5UH8XxsB7qD0/YNFh8hbmDkw2xz5rz00xpT8rT++VpWJq4PD4ibXAf
 WWzrg4kCWeG2vU0IP3E4sFmzaNgwAGOHStaS7liJ/9jXRzdCEkxKvRmEWNGOlPekB6qwPAtE9hwT
 QhU7G1gX1Tt5TKZlkoA1Zz+iINtxSh/X0eQ2TAaxHp57A3XKbiw5HgmQzd2jqyqYyLzd1HI2j53z
 Ql4zt7h4EeT/j1bmtOYgE1OJCssr13Xm/csfhmL23ZKRVQ4bMNfEV0OAJC2djc1sBjGpbRkHhnTV
 ha6hKO49TIWWqsSLWfzqe9FIuPkSxS8jA3s/WmGQ0/A5r0glRBEBqguquoqrMKgFdnhImSf3y2M1
 7t4qX5XdlwSF4q5RWWsypj5AYQwOcVY9esTsGcsN3FeDsraIB55GH28uRwuhKPpKDX7sWzOoiVIZ
 jUgZHVyoD5f9xfwMPEPpVFVGh+TsTIIephf9vqU/qrNYjyZuN6wVShlepyTIYCiUX8wN8=
From: teachk <teachk@foxmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] virtio-crypto: Convert DPRINTF to trace event
Date: Sat, 16 May 2020 21:31:22 +0800
Message-Id: <20200516133122.374-1-teachk@foxmail.com>
X-Mailer: git-send-email 2.22.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.205.221.245; envelope-from=teachk@foxmail.com;
 helo=qq.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/16 09:31:46
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_DYNAMIC=0.982, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 16 May 2020 10:23:12 -0400
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
Cc: Hou Weiying <weiying_hou@outlook.com>, arei.gonglei@huawei.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hou Weiying <weiying_hou@outlook.com>

Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
---
 hw/virtio/trace-events            | 12 ++++++++++++
 hw/virtio/virtio-crypto.c         | 26 ++++++++++++++------------
 include/hw/virtio/virtio-crypto.h | 11 -----------
 3 files changed, 26 insertions(+), 23 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index e83500bee9..f7c20f211a 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -73,3 +73,15 @@ virtio_iommu_get_domain(uint32_t domain_id) "Alloc domain=%d"
 virtio_iommu_put_domain(uint32_t domain_id) "Free domain=%d"
 virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
 virtio_iommu_report_fault(uint8_t reason, uint32_t flags, uint32_t endpoint, uint64_t addr) "FAULT reason=%d flags=%d endpoint=%d address =0x%"PRIx64
+
+# virtio-crypto.c
+virtio_crypto_cipher_session_helper_cipher_alg_and_direction(uint32_t cipher_alg, uint8_t direction) "cipher_alg=%" PRIu32 ", info->direction=%" PRIu32
+virtio_crypto_cipher_session_helper_keylen(uint32_t keylen) "keylen=%" PRIu32
+virtio_crypto_create_sym_session_auth_keylen(uint32_t auth_keylen) "auth_keylen=%" PRIu32
+virtio_crypto_create_sym_session_session_id(int64_t session_id) "create session_id=%" PRIu64 " successfully"
+virtio_crypto_sym_op_helper_src_len(uint32_t src_len) "src_len=%" PRIu32
+virtio_crypto_sym_op_helper_dst_len(uint32_t dst_len) "dst_len=%" PRIu32
+virtio_crypto_sym_op_helper_hash_result_len(uint32_t hash_result_len) "hash_result_len=%" PRIu32
+virtio_crypto_handle_close_session(uint64_t session_id) "close session id %" PRIu64
+virtio_crypto_sym_op_helper_iv_len(uint32_t iv_len) "iv_len %" PRIu32
+virtio_crypto_sym_op_helper_aad_len(uint32_t aad_len) "aad_len %" PRIu32
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index bd9165c565..676948a4dd 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -24,6 +24,7 @@
 #include "hw/virtio/virtio-access.h"
 #include "standard-headers/linux/virtio_ids.h"
 #include "sysemu/cryptodev-vhost.h"
+#include "trace.h"
 
 #define VIRTIO_CRYPTO_VM_VERSION 1
 
@@ -49,8 +50,9 @@ virtio_crypto_cipher_session_helper(VirtIODevice *vdev,
     info->cipher_alg = ldl_le_p(&cipher_para->algo);
     info->key_len = ldl_le_p(&cipher_para->keylen);
     info->direction = ldl_le_p(&cipher_para->op);
-    DPRINTF("cipher_alg=%" PRIu32 ", info->direction=%" PRIu32 "\n",
-             info->cipher_alg, info->direction);
+    trace_virtio_crypto_cipher_session_helper_cipher_alg_and_direction(
+            info->cipher_alg, info->direction);
+
 
     if (info->key_len > vcrypto->conf.max_cipher_key_len) {
         error_report("virtio-crypto length of cipher key is too big: %u",
@@ -60,7 +62,7 @@ virtio_crypto_cipher_session_helper(VirtIODevice *vdev,
     /* Get cipher key */
     if (info->key_len > 0) {
         size_t s;
-        DPRINTF("keylen=%" PRIu32 "\n", info->key_len);
+        trace_virtio_crypto_cipher_session_helper_keylen(info->key_len);
 
         info->cipher_key = g_malloc(info->key_len);
         s = iov_to_buf(*iov, num, 0, info->cipher_key, info->key_len);
@@ -130,7 +132,8 @@ virtio_crypto_create_sym_session(VirtIOCrypto *vcrypto,
             }
             /* get auth key */
             if (info.auth_key_len > 0) {
-                DPRINTF("auth_keylen=%" PRIu32 "\n", info.auth_key_len);
+                trace_virtio_crypto_create_sym_session_auth_keylen(
+                            info.auth_key_len);
                 info.auth_key = g_malloc(info.auth_key_len);
                 s = iov_to_buf(iov, out_num, 0, info.auth_key,
                                info.auth_key_len);
@@ -165,8 +168,7 @@ virtio_crypto_create_sym_session(VirtIOCrypto *vcrypto,
                                      vcrypto->cryptodev,
                                      &info, queue_index, &local_err);
     if (session_id >= 0) {
-        DPRINTF("create session_id=%" PRIu64 " successfully\n",
-                session_id);
+        trace_virtio_crypto_create_sym_session_session_id(session_id);
 
         ret = session_id;
     } else {
@@ -193,7 +195,7 @@ virtio_crypto_handle_close_session(VirtIOCrypto *vcrypto,
     Error *local_err = NULL;
 
     session_id = ldq_le_p(&close_sess_req->session_id);
-    DPRINTF("close session, id=%" PRIu64 "\n", session_id);
+    trace_virtio_crypto_handle_close_session(session_id);
 
     ret = cryptodev_backend_sym_close_session(
               vcrypto->cryptodev, session_id, queue_id, &local_err);
@@ -474,7 +476,7 @@ virtio_crypto_sym_op_helper(VirtIODevice *vdev,
     op_info->len_to_cipher = len_to_cipher;
     /* Handle the initilization vector */
     if (op_info->iv_len > 0) {
-        DPRINTF("iv_len=%" PRIu32 "\n", op_info->iv_len);
+        trace_virtio_crypto_sym_op_helper_iv_len(op_info->iv_len);
         op_info->iv = op_info->data + curr_size;
 
         s = iov_to_buf(iov, out_num, 0, op_info->iv, op_info->iv_len);
@@ -488,7 +490,7 @@ virtio_crypto_sym_op_helper(VirtIODevice *vdev,
 
     /* Handle additional authentication data if exists */
     if (op_info->aad_len > 0) {
-        DPRINTF("aad_len=%" PRIu32 "\n", op_info->aad_len);
+        trace_virtio_crypto_sym_op_helper_aad_len(op_info->aad_len);
         op_info->aad_data = op_info->data + curr_size;
 
         s = iov_to_buf(iov, out_num, 0, op_info->aad_data, op_info->aad_len);
@@ -503,7 +505,7 @@ virtio_crypto_sym_op_helper(VirtIODevice *vdev,
 
     /* Handle the source data */
     if (op_info->src_len > 0) {
-        DPRINTF("src_len=%" PRIu32 "\n", op_info->src_len);
+        trace_virtio_crypto_sym_op_helper_src_len(op_info->src_len);
         op_info->src = op_info->data + curr_size;
 
         s = iov_to_buf(iov, out_num, 0, op_info->src, op_info->src_len);
@@ -520,11 +522,11 @@ virtio_crypto_sym_op_helper(VirtIODevice *vdev,
     op_info->dst = op_info->data + curr_size;
     curr_size += op_info->dst_len;
 
-    DPRINTF("dst_len=%" PRIu32 "\n", op_info->dst_len);
+    trace_virtio_crypto_sym_op_helper_dst_len(op_info->dst_len);
 
     /* Handle the hash digest result */
     if (hash_result_len > 0) {
-        DPRINTF("hash_result_len=%" PRIu32 "\n", hash_result_len);
+        trace_virtio_crypto_sym_op_helper_hash_result_len(hash_result_len);
         op_info->digest_result = op_info->data + curr_size;
     }
 
diff --git a/include/hw/virtio/virtio-crypto.h b/include/hw/virtio/virtio-crypto.h
index ffe2391ece..f59f91f11e 100644
--- a/include/hw/virtio/virtio-crypto.h
+++ b/include/hw/virtio/virtio-crypto.h
@@ -19,17 +19,6 @@
 #include "sysemu/iothread.h"
 #include "sysemu/cryptodev.h"
 
-
-#define DEBUG_VIRTIO_CRYPTO 0
-
-#define DPRINTF(fmt, ...) \
-do { \
-    if (DEBUG_VIRTIO_CRYPTO) { \
-        fprintf(stderr, "virtio_crypto: " fmt, ##__VA_ARGS__); \
-    } \
-} while (0)
-
-
 #define TYPE_VIRTIO_CRYPTO "virtio-crypto-device"
 #define VIRTIO_CRYPTO(obj) \
         OBJECT_CHECK(VirtIOCrypto, (obj), TYPE_VIRTIO_CRYPTO)
-- 
2.17.1



