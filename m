Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD6A30CD9C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 22:07:19 +0100 (CET)
Received: from localhost ([::1]:52106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l72tJ-00034g-OX
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 16:07:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l72m9-0002sD-1I
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:59:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l72m6-0007Om-Ti
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:59:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612299588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GCsDS0t3ZTS4NBHckBplUJ0frNx7d00ggon3r8WYiLc=;
 b=bWj4/Q4/lNBwS0tmHnhgiw069y/5rocslXBvbAilltecq8KTjQ1uRRM3ehcgd7xk2mhezR
 qeAEe487NxOEDglzY4FkJaF5ri4XapRfVd4ozCV5mb1CFDaNWHovSwNBfOicMCDwMLb0+u
 1TiAljyHt1sdXD0GYzymJw/h06uioOI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-TfSiKqDUPAG0ABTGL8LceA-1; Tue, 02 Feb 2021 15:59:45 -0500
X-MC-Unique: TfSiKqDUPAG0ABTGL8LceA-1
Received: by mail-ed1-f70.google.com with SMTP id u19so10213679edr.1
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 12:59:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GCsDS0t3ZTS4NBHckBplUJ0frNx7d00ggon3r8WYiLc=;
 b=mWwjhO1hxm4a6W0g5PC3NN78l43rYw3CHTTkA4I7Xx4GiuvFPDhx4o7CX7P8YXf4zd
 23trM9vl8oLHmCZbjWKMu0XRrJ5Fm6jxY/nOpeLFF5skJuuCeccHHZJJcGT8swNVeVA/
 BthWSBKjMSidWCsEdmWiYFIBAtmbvebb4ZCWKzGpWgmmmd7CfjCY34KdswN5VkAkOMH/
 TPpE2sBp+cwLwoCExmxh0rz8NahtcX0VXm75Tyg9tFTzIGGGwJqkCAmtmhgoMr7cJzjn
 WkxBLaU/8yM9hOcMWbXen4rgSaF4SwUr0b1EZVps1LJN1VSHAiXYFvVlCtKy0Gmw51BJ
 wufw==
X-Gm-Message-State: AOAM530rly2BfZC4DuHEkKQ0aY6jOap3U1KnKj0tuI+uzKOANPuMDXY7
 SKKdC0IdXeFCotOBrurU/OwYCgVApNl7jU4JrO51BEJKpLihywKzxq0xsqf9YvvkWwhHMxoPIuL
 86QhiYTvbSiBby7mBhb6r+az/91zFQq57eD6LrxbJb5sbPTpyRGbqx/ei6ygRI5yD
X-Received: by 2002:a17:906:5e5a:: with SMTP id
 b26mr12697575eju.327.1612299583650; 
 Tue, 02 Feb 2021 12:59:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOQeuoj112ym+ONA8FZIjcqwUF9f63qKeGMpddE4Wk1sSoT+WivNEbYh/Xf6y/79FDpYFrXA==
X-Received: by 2002:a17:906:5e5a:: with SMTP id
 b26mr12697549eju.327.1612299583451; 
 Tue, 02 Feb 2021 12:59:43 -0800 (PST)
Received: from x1w.redhat.com (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id r7sm11639ejo.20.2021.02.02.12.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 12:59:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/12] tests/fp/fp-test: Replace the word 'blacklist'
Date: Tue,  2 Feb 2021 21:58:23 +0100
Message-Id: <20210202205824.1085853-12-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210202205824.1085853-1-philmd@redhat.com>
References: <20210202205824.1085853-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Otubo <otubo@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the word "blacklist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/fp/fp-test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/fp/fp-test.c b/tests/fp/fp-test.c
index 06ffebd6db1..5a4cad8c8b2 100644
--- a/tests/fp/fp-test.c
+++ b/tests/fp/fp-test.c
@@ -123,7 +123,7 @@ static void not_implemented(void)
     fprintf(stderr, "Not implemented.\n");
 }
 
-static bool blacklisted(unsigned op, int rmode)
+static bool is_allowed(unsigned op, int rmode)
 {
     /* odd has not been implemented for any 80-bit ops */
     if (rmode == softfloat_round_odd) {
@@ -161,10 +161,10 @@ static bool blacklisted(unsigned op, int rmode)
         case F32_TO_EXTF80:
         case F64_TO_EXTF80:
         case F128_TO_EXTF80:
-            return true;
+            return false;
         }
     }
-    return false;
+    return true;
 }
 
 static void do_testfloat(int op, int rmode, bool exact)
@@ -194,7 +194,7 @@ static void do_testfloat(int op, int rmode, bool exact)
     verCases_writeFunctionName(stderr);
     fputs("\n", stderr);
 
-    if (blacklisted(op, rmode)) {
+    if (!is_allowed(op, rmode)) {
         not_implemented();
         return;
     }
-- 
2.26.2


