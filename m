Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE54B25D81D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 13:55:53 +0200 (CEST)
Received: from localhost ([::1]:38914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEAJt-0001L3-0E
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 07:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kEA6V-0000OX-TL
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 07:42:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52681
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kEA6U-0005Fq-44
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 07:42:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599219721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vq0F63TwAmF545aJt6SfKmcoeuvR1cdZmiT6FTtj8qs=;
 b=XjOi14DR887iEuzx8BkRw8Hi9f5Lt0Xu2Qffrk2EpwC1EKS4daZcf8PAiKA2PLtIfS6LAD
 wl67fyaVOIIuIX9yNkydMbkg08paabA4uXUtmsU+Ca+fTKsw1e6OTyhDmovA+3EHJ2eu5N
 DB0+7HOZ9fuijhzTSHMRrS5rdHBh3/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-BRuhoQPNNnSvQ7btQx3jvQ-1; Fri, 04 Sep 2020 07:41:59 -0400
X-MC-Unique: BRuhoQPNNnSvQ7btQx3jvQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC87718B33D9;
 Fri,  4 Sep 2020 11:41:37 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A1B47CD92;
 Fri,  4 Sep 2020 11:41:36 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/46] tests: do not print benchmark output to stdout
Date: Fri,  4 Sep 2020 07:40:58 -0400
Message-Id: <20200904114122.31307-23-pbonzini@redhat.com>
In-Reply-To: <20200904114122.31307-1-pbonzini@redhat.com>
References: <20200904114122.31307-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 03:58:24
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

As this makes the TAP output invalid. Use g_test_message().

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20200828110734.1638685-13-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/benchmark-crypto-cipher.c | 8 ++++----
 tests/benchmark-crypto-hash.c   | 2 +-
 tests/benchmark-crypto-hmac.c   | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/benchmark-crypto-cipher.c b/tests/benchmark-crypto-cipher.c
index 53032334ec..1936aa4ae0 100644
--- a/tests/benchmark-crypto-cipher.c
+++ b/tests/benchmark-crypto-cipher.c
@@ -70,8 +70,8 @@ static void test_cipher_speed(size_t chunk_size,
     }
     g_test_timer_elapsed();
 
-    g_print("Enc chunk %zu bytes ", chunk_size);
-    g_print("%.2f MB/sec ", (double)total / MiB / g_test_timer_last());
+    g_test_message("Enc chunk %zu bytes ", chunk_size);
+    g_test_message("%.2f MB/sec ", (double)total / MiB / g_test_timer_last());
 
     g_test_timer_start();
     remain = total;
@@ -85,8 +85,8 @@ static void test_cipher_speed(size_t chunk_size,
     }
     g_test_timer_elapsed();
 
-    g_print("Dec chunk %zu bytes ", chunk_size);
-    g_print("%.2f MB/sec ", (double)total / MiB / g_test_timer_last());
+    g_test_message("Dec chunk %zu bytes ", chunk_size);
+    g_test_message("%.2f MB/sec ", (double)total / MiB / g_test_timer_last());
 
     qcrypto_cipher_free(cipher);
     g_free(plaintext);
diff --git a/tests/benchmark-crypto-hash.c b/tests/benchmark-crypto-hash.c
index d16837d00a..598111e75a 100644
--- a/tests/benchmark-crypto-hash.c
+++ b/tests/benchmark-crypto-hash.c
@@ -48,7 +48,7 @@ static void test_hash_speed(const void *opaque)
     }
     g_test_timer_elapsed();
 
-    g_print("%.2f MB/sec ", (double)total / MiB / g_test_timer_last());
+    g_test_message("%.2f MB/sec ", (double)total / MiB / g_test_timer_last());
 
     g_free(out);
     g_free(in);
diff --git a/tests/benchmark-crypto-hmac.c b/tests/benchmark-crypto-hmac.c
index f1dfa240cb..f9fa22df95 100644
--- a/tests/benchmark-crypto-hmac.c
+++ b/tests/benchmark-crypto-hmac.c
@@ -55,10 +55,10 @@ static void test_hmac_speed(const void *opaque)
     } while (g_test_timer_elapsed() < 5.0);
 
     total /= MiB;
-    g_print("hmac(sha256): ");
-    g_print("Testing chunk_size %zu bytes ", chunk_size);
-    g_print("done: %.2f MB in %.2f secs: ", total, g_test_timer_last());
-    g_print("%.2f MB/sec\n", total / g_test_timer_last());
+    g_test_message("hmac(sha256): ");
+    g_test_message("Testing chunk_size %zu bytes ", chunk_size);
+    g_test_message("done: %.2f MB in %.2f secs: ", total, g_test_timer_last());
+    g_test_message("%.2f MB/sec\n", total / g_test_timer_last());
 
     g_free(out);
     g_free(in);
-- 
2.26.2



