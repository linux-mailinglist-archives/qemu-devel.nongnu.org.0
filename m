Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AE9262E5A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 14:12:21 +0200 (CEST)
Received: from localhost ([::1]:60768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFyxY-0003qz-MN
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 08:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kFyvy-0002V9-Oz
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 08:10:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20644
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kFyvw-0003ya-T8
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 08:10:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599653439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z9Okbf6iGkTmuAD1TmAARnC27UkRhS0yBw/Etgdubj0=;
 b=AXDPUMtEFqHpgIxcvW8ZPXMdAe17vXqQSOiRP0So6oawYoe7Od1IuoIM9NE/XDA6b9V1NM
 DtZphm4MeMu/wUcb/wqDpBqQXxCKahqdRNyzhY8yVM1bb/dLRcFH2X9QF17CeM+rErFEK9
 0CKwAo2AfqQqg1OklX5Waku93bha+JU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-a-1xwgCqP2G9CUccRW30ew-1; Wed, 09 Sep 2020 08:10:37 -0400
X-MC-Unique: a-1xwgCqP2G9CUccRW30ew-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACC60802B61;
 Wed,  9 Sep 2020 12:10:36 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-81.ams2.redhat.com
 [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9C8310023A7;
 Wed,  9 Sep 2020 12:10:32 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests: fix output message formatting for crypto benchmarks
Date: Wed,  9 Sep 2020 13:10:27 +0100
Message-Id: <20200909121027.1040647-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 03:05:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The output was changed from g_print to g_test_message in

  commit 24441f912e67233d9c52ce6b459ed75de2484525
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Fri Aug 28 15:07:30 2020 +0400

    tests: do not print benchmark output to stdout

    As this makes the TAP output invalid. Use g_test_message().

The functions do not result in equivalent output. The g_print
statements were putting all the information on a single line
for ease of interpretation. The change to g_test_message split
the output across many lines making it painful to read.

The opportunity is used to tweak the information printed to
be more consistent across tests.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/benchmark-crypto-cipher.c | 12 ++++++++----
 tests/benchmark-crypto-hash.c   |  4 +++-
 tests/benchmark-crypto-hmac.c   |  7 +++----
 3 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/tests/benchmark-crypto-cipher.c b/tests/benchmark-crypto-cipher.c
index 1936aa4ae0..c04f0a0fba 100644
--- a/tests/benchmark-crypto-cipher.c
+++ b/tests/benchmark-crypto-cipher.c
@@ -70,8 +70,10 @@ static void test_cipher_speed(size_t chunk_size,
     }
     g_test_timer_elapsed();
 
-    g_test_message("Enc chunk %zu bytes ", chunk_size);
-    g_test_message("%.2f MB/sec ", (double)total / MiB / g_test_timer_last());
+    g_test_message("enc(%s-%s) chunk %zu bytes %.2f MB/sec ",
+                   QCryptoCipherAlgorithm_str(alg),
+                   QCryptoCipherMode_str(mode),
+                   chunk_size, (double)total / MiB / g_test_timer_last());
 
     g_test_timer_start();
     remain = total;
@@ -85,8 +87,10 @@ static void test_cipher_speed(size_t chunk_size,
     }
     g_test_timer_elapsed();
 
-    g_test_message("Dec chunk %zu bytes ", chunk_size);
-    g_test_message("%.2f MB/sec ", (double)total / MiB / g_test_timer_last());
+    g_test_message("dec(%s-%s) chunk %zu bytes %.2f MB/sec ",
+                   QCryptoCipherAlgorithm_str(alg),
+                   QCryptoCipherMode_str(mode),
+                   chunk_size, (double)total / MiB / g_test_timer_last());
 
     qcrypto_cipher_free(cipher);
     g_free(plaintext);
diff --git a/tests/benchmark-crypto-hash.c b/tests/benchmark-crypto-hash.c
index 598111e75a..927b00bb4d 100644
--- a/tests/benchmark-crypto-hash.c
+++ b/tests/benchmark-crypto-hash.c
@@ -48,7 +48,9 @@ static void test_hash_speed(const void *opaque)
     }
     g_test_timer_elapsed();
 
-    g_test_message("%.2f MB/sec ", (double)total / MiB / g_test_timer_last());
+    g_test_message("hash(%s): chunk %zu bytes %.2f MB/sec",
+                   QCryptoHashAlgorithm_str(opts->alg),
+                   opts->chunk_size, total / g_test_timer_last());
 
     g_free(out);
     g_free(in);
diff --git a/tests/benchmark-crypto-hmac.c b/tests/benchmark-crypto-hmac.c
index f9fa22df95..5cca636789 100644
--- a/tests/benchmark-crypto-hmac.c
+++ b/tests/benchmark-crypto-hmac.c
@@ -55,10 +55,9 @@ static void test_hmac_speed(const void *opaque)
     } while (g_test_timer_elapsed() < 5.0);
 
     total /= MiB;
-    g_test_message("hmac(sha256): ");
-    g_test_message("Testing chunk_size %zu bytes ", chunk_size);
-    g_test_message("done: %.2f MB in %.2f secs: ", total, g_test_timer_last());
-    g_test_message("%.2f MB/sec\n", total / g_test_timer_last());
+    g_test_message("hmac(%s): chunk %zu bytes %.2f MB/sec",
+                   QCryptoHashAlgorithm_str(QCRYPTO_HASH_ALG_SHA256),
+                   chunk_size, total / g_test_timer_last());
 
     g_free(out);
     g_free(in);
-- 
2.26.2


