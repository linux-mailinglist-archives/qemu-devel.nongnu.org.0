Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D212D0BDC
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 09:39:48 +0100 (CET)
Received: from localhost ([::1]:37304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmC3e-00037n-O8
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 03:39:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shiliyang@huawei.com>)
 id 1kmC1t-0002gq-Ew
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 03:37:57 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shiliyang@huawei.com>)
 id 1kmC1q-0000s4-9h
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 03:37:56 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CqGrR0FFwzM1f4;
 Mon,  7 Dec 2020 16:36:55 +0800 (CST)
Received: from [10.108.235.13] (10.108.235.13) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Mon, 7 Dec 2020 16:37:26 +0800
To: <berrange@redhat.com>
From: shiliyang <shiliyang@huawei.com>
Subject: [PATCH] crypto: Fix some code style problems, add spaces around
 operator
Message-ID: <eec07863-d8fa-1ad0-5b64-4683d48478ab@huawei.com>
Date: Mon, 7 Dec 2020 16:37:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.108.235.13]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=shiliyang@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: alex.chen@huawei.com, hunongda@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch fixes error style problems found by checkpatch.pl:
ERROR: spaces required around that '*'
ERROR: space required after that ','
ERROR: spaces required around that '|'

Signed-off-by: Liyang Shi <shiliyang@huawei.com>
---
 crypto/aes.c          | 2 +-
 crypto/desrfb.c       | 2 +-
 crypto/tlscredsx509.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/aes.c b/crypto/aes.c
index 159800df65..56efc95196 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -1182,7 +1182,7 @@ int AES_set_decrypt_key(const unsigned char *userKey, const int bits,
         rk = key->rd_key;

         /* invert the order of the round keys: */
-        for (i = 0, j = 4*(key->rounds); i < j; i += 4, j -= 4) {
+        for (i = 0, j = 4 * (key->rounds); i < j; i += 4, j -= 4) {
                 temp = rk[i    ]; rk[i    ] = rk[j    ]; rk[j    ] = temp;
                 temp = rk[i + 1]; rk[i + 1] = rk[j + 1]; rk[j + 1] = temp;
                 temp = rk[i + 2]; rk[i + 2] = rk[j + 2]; rk[j + 2] = temp;
diff --git a/crypto/desrfb.c b/crypto/desrfb.c
index 3274c36510..675847c93b 100644
--- a/crypto/desrfb.c
+++ b/crypto/desrfb.c
@@ -56,7 +56,7 @@ static const unsigned char pc1[56] = {
         13,  5, 60, 52, 44, 36, 28,	20, 12,  4, 27, 19, 11,  3 };

 static const unsigned char totrot[16] = {
-        1,2,4,6,8,10,12,14,15,17,19,21,23,25,27,28 };
+        1, 2, 4, 6, 8, 10, 12, 14, 15, 17, 19, 21, 23, 25, 27, 28 };

 static const unsigned char pc2[48] = {
         13, 16, 10, 23,  0,  4,  2, 27, 14,  5, 20,  9,
diff --git a/crypto/tlscredsx509.c b/crypto/tlscredsx509.c
index dd7267ccdb..c89dd62435 100644
--- a/crypto/tlscredsx509.c
+++ b/crypto/tlscredsx509.c
@@ -143,7 +143,7 @@ qcrypto_tls_creds_check_cert_key_usage(QCryptoTLSCredsX509 *creds,
     if (status < 0) {
         if (status == GNUTLS_E_REQUESTED_DATA_NOT_AVAILABLE) {
             usage = isCA ? GNUTLS_KEY_KEY_CERT_SIGN :
-                GNUTLS_KEY_DIGITAL_SIGNATURE|GNUTLS_KEY_KEY_ENCIPHERMENT;
+                GNUTLS_KEY_DIGITAL_SIGNATURE | GNUTLS_KEY_KEY_ENCIPHERMENT;
         } else {
             error_setg(errp,
                        "Unable to query certificate %s key usage: %s",
-- 
2.29.1.59.gf9b6481aed

