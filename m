Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 866304DDB4D
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 15:10:02 +0100 (CET)
Received: from localhost ([::1]:52080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVDIn-0001lQ-Iu
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 10:10:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nVD5x-0006Dp-Rc
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:56:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nVD5v-00085Y-W9
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:56:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647611803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CKwyxSYoWcYMR7zWANArUY9Wj0YqvQZgSAOYbzSALFM=;
 b=Gn53EJdeeI/H/23+lKSku+0Nhhcaa6t6TQFI8knBYrnl0hYFfjZbjLEWT9iLD40HPEIeUQ
 DiFYinY5IOkidHKG1gCE98YZEjIshNDO6svW1M0/psu4FBw8z93fDORPQ8zGrBibq5cJcb
 d4fMyQbfiodmQQj1fUZqb/s1BO75Gik=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-Bqx2nBCDPZSoOcypt4_mJQ-1; Fri, 18 Mar 2022 09:56:38 -0400
X-MC-Unique: Bqx2nBCDPZSoOcypt4_mJQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC6768002BF;
 Fri, 18 Mar 2022 13:56:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.196.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B93B1457F13;
 Fri, 18 Mar 2022 13:56:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3059D18003A8; Fri, 18 Mar 2022 14:56:34 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/6] audio/mixeng: Do not declare unused variables
Date: Fri, 18 Mar 2022 14:56:31 +0100
Message-Id: <20220318135634.2851040-4-kraxel@redhat.com>
In-Reply-To: <20220318135634.2851040-1-kraxel@redhat.com>
References: <20220318135634.2851040-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

The unused variables when FLOAT_MIXENG is defined caused warnings on
Apple clang version 13.1.6 (clang-1316.0.21.2).

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220316061053.60587-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/mixeng.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/audio/mixeng.c b/audio/mixeng.c
index f27deb165b67..100a306d6fec 100644
--- a/audio/mixeng.c
+++ b/audio/mixeng.c
@@ -342,13 +342,13 @@ f_sample *mixeng_clip_float[2] = {
 void audio_sample_to_uint64(const void *samples, int pos,
                             uint64_t *left, uint64_t *right)
 {
+#ifdef FLOAT_MIXENG
+    error_report(
+        "Coreaudio and floating point samples are not supported by replay yet");
+    abort();
+#else
     const struct st_sample *sample = samples;
     sample += pos;
-#ifdef FLOAT_MIXENG
-    error_report(
-        "Coreaudio and floating point samples are not supported by replay yet");
-    abort();
-#else
     *left = sample->l;
     *right = sample->r;
 #endif
@@ -357,13 +357,13 @@ void audio_sample_to_uint64(const void *samples, int pos,
 void audio_sample_from_uint64(void *samples, int pos,
                             uint64_t left, uint64_t right)
 {
+#ifdef FLOAT_MIXENG
+    error_report(
+        "Coreaudio and floating point samples are not supported by replay yet");
+    abort();
+#else
     struct st_sample *sample = samples;
     sample += pos;
-#ifdef FLOAT_MIXENG
-    error_report(
-        "Coreaudio and floating point samples are not supported by replay yet");
-    abort();
-#else
     sample->l = left;
     sample->r = right;
 #endif
-- 
2.35.1


