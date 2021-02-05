Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8924310FFB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:34:39 +0100 (CET)
Received: from localhost ([::1]:43890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85wE-0008CT-Uc
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:34:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l84kg-0000qB-2G
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:18:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l84kY-0003Lq-6Y
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:18:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612545509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nx2nPxxxuc5UiIMJauJWi9ngWETzpUQ2HSqsQ8pKpvE=;
 b=gc6wC2+XRtdUBu/0R7/+qlAxDFRqsNRkkvSZZQOmYnrjZT30j3kn457Vnvw1F4+BxpwFoD
 GlZmWcaXpuF52KacZi1q+4yx75tWU+7vBctvElO/0MaLPb12zeQkh28CBWa+zwPsLnHIyM
 U+7o/fuFQrAy8J/KmiiMLXurXBuKQ84=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-9rjxcgkaOFWPg7h1KpCeEA-1; Fri, 05 Feb 2021 12:18:27 -0500
X-MC-Unique: 9rjxcgkaOFWPg7h1KpCeEA-1
Received: by mail-ej1-f69.google.com with SMTP id x22so7219250ejb.10
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:18:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nx2nPxxxuc5UiIMJauJWi9ngWETzpUQ2HSqsQ8pKpvE=;
 b=o3irdWFZMWesR/dAL/yqaRM9QPu5owbedMqkUrzCBf5HpyYgP8Ioomg3PulnYL2o0X
 mFVt5exg/ObZgmO+wfRy+e4iMh5B7mvx9akmXOoQX3sXWlc6nEfR/kPBWRlcy8M0bpEZ
 qtVXEKJkqxF3sRdwzekyenVvpvtX09Id3KhhUlYTJUvqAITK+hRPnpdh5oVy9PSdAlA+
 T46MFoZe6tGGoPRoi2zxcAx/QJGeTEw/qKuN5ECDu4LfOVvCYD5ewoyNuAi16sBmK1bo
 KtIc1f/ZJHnmUedJ5pTUmF8x1dE1Bi7G3idC2bUUHWCFBu5s9xmGqz+3uQXDsJ9aHOPh
 9RDg==
X-Gm-Message-State: AOAM533hq03EnVJusqYv+XHEJWZn0EQGYYWyjflFpl9CQYXbSiBnoA+r
 jaH2KePIi/5b7vweWuyBLugm+DciytExS7k4eb8rX4BlsfAuemMHg4x8rKiuSIkkpbjrT/upFgN
 lZCwVnvePiOx8HnhskmNbld+ryzXgi+vv8dKkQHlQalAN5+t1L3gK+zbSK075JiAh
X-Received: by 2002:aa7:d817:: with SMTP id v23mr4384805edq.192.1612545506517; 
 Fri, 05 Feb 2021 09:18:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjdTz5eqTHEvfZlrunlq58k7UhC7YnmB7AkgytyFRKvCFHrxg39Cnyds41amdwXJqZx3BLpg==
X-Received: by 2002:aa7:d817:: with SMTP id v23mr4384780edq.192.1612545506377; 
 Fri, 05 Feb 2021 09:18:26 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o10sm4202431eju.89.2021.02.05.09.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:18:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/8] ui: Replace the word 'whitelist'
Date: Fri,  5 Feb 2021 18:18:10 +0100
Message-Id: <20210205171817.2108907-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210205171817.2108907-1-philmd@redhat.com>
References: <20210205171817.2108907-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
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
Cc: Eduardo Otubo <otubo@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the words "whitelist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v2: Do not use acronyms (danpb)
---
 ui/console.c       | 2 +-
 ui/vnc-auth-sasl.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index c5d11bc7017..5a8311ced20 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1708,7 +1708,7 @@ bool dpy_gfx_check_format(QemuConsole *con,
                 return false;
             }
         } else {
-            /* default is to whitelist native 32 bpp only */
+            /* default is to allow native 32 bpp only */
             if (format != qemu_default_pixman_format(32, true)) {
                 return false;
             }
diff --git a/ui/vnc-auth-sasl.c b/ui/vnc-auth-sasl.c
index f67111a3662..df7dc08e9fc 100644
--- a/ui/vnc-auth-sasl.c
+++ b/ui/vnc-auth-sasl.c
@@ -288,7 +288,7 @@ static int protocol_client_auth_sasl_step(VncState *vs, uint8_t *data, size_t le
             goto authreject;
         }
 
-        /* Check username whitelist ACL */
+        /* Check the username access control list */
         if (vnc_auth_sasl_check_access(vs) < 0) {
             goto authreject;
         }
@@ -409,7 +409,7 @@ static int protocol_client_auth_sasl_start(VncState *vs, uint8_t *data, size_t l
             goto authreject;
         }
 
-        /* Check username whitelist ACL */
+        /* Check the username access control list */
         if (vnc_auth_sasl_check_access(vs) < 0) {
             goto authreject;
         }
-- 
2.26.2


