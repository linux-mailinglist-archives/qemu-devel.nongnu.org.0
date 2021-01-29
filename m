Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58D8308B60
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:29:24 +0100 (CET)
Received: from localhost ([::1]:35192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XaF-0003I8-UA
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:29:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5XIq-0003G6-SH
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:11:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5XIn-0006v7-Ep
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:11:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611940279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XVgxAnmumRG0Eq1PgXFB2QqRTRBwymFtBPXX+eeghr0=;
 b=J3nBeOZHUtdF6su4BTL0+RcNX0ktIBxXCq2Q6ZLaH09Cn/Uu/JqkK1t9HFUat+6AyG7T2n
 bu9/QBrRen9knTb8LOfAxBk+NEKbOIGL5wppYtVKpnGBVN2BUa0hGqR7+eUfLCglbGM+YW
 a+ZyZp4Jlr3d4lEMEBx5E7RwFYTRFdM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-jEByeO4hMdqR0RK6sTPviw-1; Fri, 29 Jan 2021 12:11:14 -0500
X-MC-Unique: jEByeO4hMdqR0RK6sTPviw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFCCA1800D41;
 Fri, 29 Jan 2021 17:11:13 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-94.ams2.redhat.com
 [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82EA35D741;
 Fri, 29 Jan 2021 17:11:11 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/13] crypto: Fix some code style problems,
 add spaces around operator
Date: Fri, 29 Jan 2021 17:10:50 +0000
Message-Id: <20210129171102.4109641-2-berrange@redhat.com>
In-Reply-To: <20210129171102.4109641-1-berrange@redhat.com>
References: <20210129171102.4109641-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, libvir-list@redhat.com,
 shiliyang <shiliyang@huawei.com>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: shiliyang <shiliyang@huawei.com>

This patch fixes error style problems found by checkpatch.pl:
ERROR: spaces required around that '*'
ERROR: space required after that ','
ERROR: spaces required around that '|'

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Liyang Shi <shiliyang@huawei.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
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
2.29.2


