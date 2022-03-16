Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826114DAA8E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 07:17:47 +0100 (CET)
Received: from localhost ([::1]:34786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUMyg-0005ys-KP
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 02:17:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nUMs9-0008G9-NK
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 02:11:01 -0400
Received: from [2607:f8b0:4864:20::1036] (port=40702
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nUMs8-0008AX-AJ
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 02:11:01 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 mv2-20020a17090b198200b001c65bae5744so447050pjb.5
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 23:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=te0tR6G6H7tz+JArH2fdqr7BzTF95Ac8HypKtVH0BT0=;
 b=lrC7fzlvNWgjecps2iOuut/gcorFH4ohO3rt7Xiw8h22v8ib/88AO8eUOZXOhch58T
 ZUvFcl8EA8TV8AKBNqiORCvDGfBwDZ0IMf2Q+Pov4BweHmmlpqSsKdS0fFXYV43YZT2N
 Wisn4Qs6isBAg75SryOd2Vh9AJpZT4kibeEBCt8TjLmWZOSbB7CTQfPD2q4sWVcePBd6
 F6el1BQmE4nTfOjRv484mmpbIJWVGPn+yc/fMYlhn6atIm/qgd+OdkS7Jjqt5I+nsvIf
 ji+LrNxzFAsZhECd+32lh8BUWDDQaWfYfhTNoS1ePf4FNd08Lk6kto1iaKEk46r84sK3
 ufnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=te0tR6G6H7tz+JArH2fdqr7BzTF95Ac8HypKtVH0BT0=;
 b=jcSca6vo50o8/djn4WyxK/eUZAXr6vtOp8zHMWxp5YqFsfyiwrbJBmZkqMLYwOFjDx
 cDWA4NfJIoYM0xLUV/OR3/3mW9GVL957MmjEHSsTqKZ/wa+/Rn0bVsHcKTI09jxUkRlh
 SvQadOCUvsNlTJniD5WfWg65Jb9ItEjgKMBgHricC9RJylR3EX2KbmvMZLkyl5krsZOa
 Xyr7dr0bYM4mbJPjs1vj+naQdB/rxEn5EgeLZwSi23Vi2OovQYAVBTsIXHqNzf3P9DoR
 L40ABZO3IXoer4SXYXRdA+BndJA1Zu5lO3QkwZ2BBMm6HIgBeosE1DGRzQn5Volc/2HO
 HK0w==
X-Gm-Message-State: AOAM531ZVlmDndd2PjfeNajhEMswYp2qna2ApsrHHTOdYEiCznrfQWrg
 QMizYUVleIOWQ3CpMn990jBNwmpFQ0U=
X-Google-Smtp-Source: ABdhPJwB1Fl6WkMUJVQzzUkWu5e4hicd2MeTl3Ea3XMvy6SOdoFT37NbAbYQQjWggeoSqXrdbcXJ+g==
X-Received: by 2002:a17:902:8f96:b0:153:62bb:c4a3 with SMTP id
 z22-20020a1709028f9600b0015362bbc4a3mr15126617plo.154.1647411058836; 
 Tue, 15 Mar 2022 23:10:58 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:dd81:833a:94c3:358a])
 by smtp.gmail.com with ESMTPSA id
 z2-20020aa79902000000b004f75842c97csm1332052pff.209.2022.03.15.23.10.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Mar 2022 23:10:58 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] audio/mixeng: Do not declare unused variables
Date: Wed, 16 Mar 2022 15:10:53 +0900
Message-Id: <20220316061053.60587-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The unused variables when FLOAT_MIXENG is defined caused warnings on
Apple clang version 13.1.6 (clang-1316.0.21.2).

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 audio/mixeng.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/audio/mixeng.c b/audio/mixeng.c
index f27deb165b6..100a306d6fe 100644
--- a/audio/mixeng.c
+++ b/audio/mixeng.c
@@ -342,13 +342,13 @@ f_sample *mixeng_clip_float[2] = {
 void audio_sample_to_uint64(const void *samples, int pos,
                             uint64_t *left, uint64_t *right)
 {
-    const struct st_sample *sample = samples;
-    sample += pos;
 #ifdef FLOAT_MIXENG
     error_report(
         "Coreaudio and floating point samples are not supported by replay yet");
     abort();
 #else
+    const struct st_sample *sample = samples;
+    sample += pos;
     *left = sample->l;
     *right = sample->r;
 #endif
@@ -357,13 +357,13 @@ void audio_sample_to_uint64(const void *samples, int pos,
 void audio_sample_from_uint64(void *samples, int pos,
                             uint64_t left, uint64_t right)
 {
-    struct st_sample *sample = samples;
-    sample += pos;
 #ifdef FLOAT_MIXENG
     error_report(
         "Coreaudio and floating point samples are not supported by replay yet");
     abort();
 #else
+    struct st_sample *sample = samples;
+    sample += pos;
     sample->l = left;
     sample->r = right;
 #endif
-- 
2.32.0 (Apple Git-132)


