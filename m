Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A41135FA302
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 19:56:16 +0200 (CEST)
Received: from localhost ([::1]:38098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohx0g-0006rY-FT
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 13:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwb9-0001Vd-2q
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:29:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwb3-0006bo-IF
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:29:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665422984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rf0XQwc/BmRyvyPNJvIiGLwnDIY+n+JfNAjnoyzxZeU=;
 b=Ufoe2x8l9U+m/Zez6oPtjf9z8wtRR6B75jej+d/1MTJxKcyt/WU6gEseTkw/A0QceqZ26c
 9/EnVGOLHzrjhpeZuYTOm0z6tV2OVU2y/eKC1ewdYtCQM5Z6lnHQmr0dioA7TO0KGCp7ls
 dnipucej8OcILnNaL1M/zlu6f41R8Zg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-483-GRlA71w7PhqN71wKPcs7qQ-1; Mon, 10 Oct 2022 13:29:36 -0400
X-MC-Unique: GRlA71w7PhqN71wKPcs7qQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay21-20020a05600c1e1500b003b45fd14b53so5819195wmb.1
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:29:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rf0XQwc/BmRyvyPNJvIiGLwnDIY+n+JfNAjnoyzxZeU=;
 b=1jMBjw5k3imc9ti9brVgRuqvIelMR9QmUpn/8maInV9IEgw/OPPJb2PNe+emOtC7VG
 rG8LyR5ttlZvZu9IsFQoFA8U6nJBw+NDlq+8WXAwiXrcEvIucoNWTfO7U1DzCTaXhzxy
 yigKcBPpF7k8oRmtXjakagl02ka2DcT13I5UFtMmvnHzWhG0wPZEicYt+fyuTWZuGkYD
 9E3DJRBe+CuTiWmV3ibxi+HzXXHg62Q/1oG9ZGHrXDqlp5ojFkGu83eDwFabhq+EMqW4
 zS4afbZ2IEqte7n4DCk7ABwB87U7ObrvCtTnbDCyBxC8KYWuNaeU1yJ9IEB3W5Ar4t6S
 8miQ==
X-Gm-Message-State: ACrzQf2rRX36zP9SLUqM04kQCQ/y2fAR/zILrdcoVBI93N8jDLH4JHoX
 T1Bj6jGiGj5DIAbWjUZPdguMzU6QDQn6k36QeSvIPRMaDQnXQY1MRUdo/IOg2wO6bVbBDo70nAG
 o138nKOJIKjeA1kX7vpMs83t98FpnbibeT/JRRjcRnzYySRo4szmBwnnyihSU
X-Received: by 2002:adf:cf0a:0:b0:22e:3f43:a5f7 with SMTP id
 o10-20020adfcf0a000000b0022e3f43a5f7mr12321396wrj.634.1665422974565; 
 Mon, 10 Oct 2022 10:29:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7CMka6eloDJzCaI32P+S8Mr/ZX7Dfq8Moc+AA2H0zzMcphSlgOJ4l+2wTNEDwICYWIqqgxww==
X-Received: by 2002:adf:cf0a:0:b0:22e:3f43:a5f7 with SMTP id
 o10-20020adfcf0a000000b0022e3f43a5f7mr12321377wrj.634.1665422974255; 
 Mon, 10 Oct 2022 10:29:34 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c089600b003c43dc42b4dsm7812799wmp.16.2022.10.10.10.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:29:33 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:29:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 12/55] tests/qtest: add a timeout for subprocess_run_one_test
Message-ID: <20221010172813.204597-13-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

Hangs have been observed in the tests and currently we don't timeout
if a subprocess hangs. Rectify that.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>

Message-Id: <20220802095010.3330793-16-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/qtest/qos-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
index 33cdada380..566cb3b00b 100644
--- a/tests/qtest/qos-test.c
+++ b/tests/qtest/qos-test.c
@@ -185,7 +185,7 @@ static void run_one_test(const void *arg)
 static void subprocess_run_one_test(const void *arg)
 {
     const gchar *path = arg;
-    g_test_trap_subprocess(path, 0,
+    g_test_trap_subprocess(path, 180 * G_USEC_PER_SEC,
                            G_TEST_SUBPROCESS_INHERIT_STDOUT |
                            G_TEST_SUBPROCESS_INHERIT_STDERR);
     g_test_trap_assert_passed();
-- 
MST


