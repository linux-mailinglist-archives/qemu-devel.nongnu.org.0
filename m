Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 863875FA32E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:10:51 +0200 (CEST)
Received: from localhost ([::1]:48874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxEo-0006Av-CV
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwbB-0001d6-Vd
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:29:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwb8-0006d6-Cz
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:29:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665422989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5SkDIYazeL5AgpK2mExrNLbpNnLXzfMlqNa5jH9gxLw=;
 b=DXP+zBqDrZxzfOaW/67BqHQC83sgxFka+q1fxg4RO4JhdfYY50lEMcUQDgXkgwbGwGQrL2
 x6elStXIXz9vlUcPhc91t2IDIKzmb2jZ4wKwHVyBkwsaxpYNaLZ4Z9eOA//48jRdzgO8Z8
 w+F6uhL0/CbLXEXjf1NpmiGedD1mYvo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-664-6g58VjdFMAWlCA0nVyYKuQ-1; Mon, 10 Oct 2022 13:29:48 -0400
X-MC-Unique: 6g58VjdFMAWlCA0nVyYKuQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 h129-20020a1c2187000000b003bf635eac31so4254741wmh.4
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:29:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5SkDIYazeL5AgpK2mExrNLbpNnLXzfMlqNa5jH9gxLw=;
 b=heFyOGZNLavZcXTYc8GE167xlG7dzmvlg+DaB9ScDhR6meKJgE75eKRNn16lltVszR
 JluDy4muYdPskSlPNOWysia7bSnIKS5k1xa2ViIi/mfBB0nG1p509txeZA1+X1LAMCDf
 Hl39U87KiwwUqRnPbhLHvkqNINnJqGri9do+NQiwGID3fCH70di57CmEvgyMJ/f/XIC8
 v10MuqBErJkW+S1tFqbAhNJzgvyukkd3BkkMaQdw6pHOOizXQH0aBgtau+svH+jk2yts
 e+H7VEOUDPalzoEcM7ZfkQZm4Et7bVtNQ2TuxPG7Ady/FdOuqDIR9FYmNlKUTYjHiZpz
 Ra7Q==
X-Gm-Message-State: ACrzQf0FtfRCcSNVXTp6ZN4FXWl4gSVD597nHsVe67Aqf9H96YqZkeNv
 tR01nVpv4ZThzu64auGw3YnCbDqNKHOxYuX5Pr2t/C12pGrw2PWAyl5JJRQ0UIdW4uV7hrCzgct
 cT+gUo4MLqHhyCIQuQbXe/os0TFdgfz2xghj0i1i9mAKUOjS6moLd/cIciSFy
X-Received: by 2002:a05:6000:1683:b0:230:d0b5:72c9 with SMTP id
 y3-20020a056000168300b00230d0b572c9mr2857810wrd.336.1665422987492; 
 Mon, 10 Oct 2022 10:29:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4evNBO3oIsl4Y40dhOtwzdR7BSowYA389BkMHQZWlZdQ+UENQegUItiSTAAPkTei+73pXtVA==
X-Received: by 2002:a05:6000:1683:b0:230:d0b5:72c9 with SMTP id
 y3-20020a056000168300b00230d0b572c9mr2857794wrd.336.1665422987253; 
 Mon, 10 Oct 2022 10:29:47 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 l9-20020adfe589000000b0022e6178bd84sm9313795wrm.8.2022.10.10.10.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:29:46 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:29:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 15/55] tests/qtest: plain g_assert for
 VHOST_USER_F_PROTOCOL_FEATURES
Message-ID: <20221010172813.204597-16-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Alex Bennée <alex.bennee@linaro.org>

checkpatch.pl warns that non-plain asserts should be avoided so
convert the check to a plain g_assert.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220802095010.3330793-19-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/vhost-user-test.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index 8d2d4ba535..a99f55ed84 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -985,8 +985,7 @@ static void test_multiqueue(void *obj, void *arg, QGuestAllocator *alloc)
 static void vu_net_set_features(TestServer *s, CharBackend *chr,
         VhostUserMsg *msg)
 {
-    g_assert_cmpint(msg->payload.u64 &
-            (0x1ULL << VHOST_USER_F_PROTOCOL_FEATURES), !=, 0ULL);
+    g_assert(msg->payload.u64 & (0x1ULL << VHOST_USER_F_PROTOCOL_FEATURES));
     if (s->test_flags == TEST_FLAGS_DISCONNECT) {
         qemu_chr_fe_disconnect(chr);
         s->test_flags = TEST_FLAGS_BAD;
-- 
MST


