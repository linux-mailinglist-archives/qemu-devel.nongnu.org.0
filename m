Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C927E4CB0AF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 22:09:32 +0100 (CET)
Received: from localhost ([::1]:44700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPWDz-0007JG-Qs
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 16:09:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxy-0005wy-JN
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:59 -0500
Received: from [2a00:1450:4864:20::429] (port=35378
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxv-0000KD-Op
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:58 -0500
Received: by mail-wr1-x429.google.com with SMTP id b5so4701948wrr.2
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1SN1vpTnpt9IXjnMGc+qCvooXM94wtAW18+rqDaYSkU=;
 b=riUauh981Zz6b2WCAUQAH5DN/wmGtrFDAP1w9CdtZFPpimM/vM7livDbVOdbgQxP5y
 NECGviyQucRbQ45mAUDqdXDBJk802+NJ1m0BFwAuWcmr4oloGHHzQAC2oI0qLB+ejBvM
 a/UPwVIxPGcZEnZwdZDa4PH0ZZzijeCY9sCYvuXn2MQ9cHQV6Qm6H2JfozNmFDO8VaTW
 +jr/RcjqkD9lIu5zmwT5l9KIxuSLxlLyK0IpMA2nblZHhM4S+H+2flqjZ9kfvnpXzs8D
 CMu4Nd45QnIS9B5G/ZRObkz0+I1Iy6xbIhOGW4BDlWPF1d0Q3AVPM9YiDsnvLHRd9ukf
 8SjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1SN1vpTnpt9IXjnMGc+qCvooXM94wtAW18+rqDaYSkU=;
 b=T9UclQSLgE9ylZ8Cj1MlE7b2iI2hw3PPn6MfDYTG7jFZ4hNFRqO9Azh0kTHC76LNjo
 f4EGCtgFBbQGGUqFuxudYIJKW2WFOe3LnXoIxrK+7UT64pA/5rMY0KBwcQVGcD1PwNmC
 dTfZNqRuNyk18U++r8llb5jWO+catfsI+XDHZT8z/xzGKF8GwvH01KUTaqOWghCiRPkT
 kW5aqNq6OYzRnMvA8r0H3HKl/0X0te2VKfP24VjH59MePn9Ta7AUXXnPKlc8lT2QBtsH
 dvQkuotl7MV8tEScaGXUp6jMzCs80XmV4dPG9bQnvoIgd8h2ZTadU0WTRAsMBgDsEwu+
 HQnw==
X-Gm-Message-State: AOAM531mhDq1zzQx0cRpfiyY/zh1glN+EpWkdOoB9H2aBwk0A+pEsoot
 QXfinfwoN672N6eBGVRpkLMoScB+VUrzAA==
X-Google-Smtp-Source: ABdhPJwoByr6z8mxSj78/WzWj1t/lVcXhYcHk5YriKVLHdVYqJ9H9dJF7BOp8yGmyEeBpuvdHeyTew==
X-Received: by 2002:adf:a551:0:b0:1f0:23fd:6f11 with SMTP id
 j17-20020adfa551000000b001f023fd6f11mr5041316wrb.7.1646254374492; 
 Wed, 02 Mar 2022 12:52:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b001e31279cc38sm90801wrn.11.2022.03.02.12.52.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 12:52:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/26] ui/cocoa.m: Fix updateUIInfo threading issues
Date: Wed,  2 Mar 2022 20:52:29 +0000
Message-Id: <20220302205230.2122390-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302205230.2122390-1-peter.maydell@linaro.org>
References: <20220302205230.2122390-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The updateUIInfo method makes Cocoa API calls.  It also calls back
into QEMU functions like dpy_set_ui_info().  To do this safely, we
need to follow two rules:
 * Cocoa API calls are made on the Cocoa UI thread
 * When calling back into QEMU we must hold the iothread lock

Fix the places where we got this wrong, by taking the iothread lock
while executing updateUIInfo, and moving the call in cocoa_switch()
inside the dispatch_async block.

Some of the Cocoa UI methods which call updateUIInfo are invoked as
part of the initial application startup, while we're still doing the
little cross-thread dance described in the comment just above
call_qemu_main().  This meant they were calling back into the QEMU UI
layer before we'd actually finished initializing our display and
registered the DisplayChangeListener, which isn't really valid.  Once
updateUIInfo takes the iothread lock, we no longer get away with
this, because during this startup phase the iothread lock is held by
the QEMU main-loop thread which is waiting for us to finish our
display initialization.  So we must suppress updateUIInfo until
applicationDidFinishLaunching allows the QEMU main-loop thread to
continue.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-id: 20220224101330.967429-2-peter.maydell@linaro.org
---
 ui/cocoa.m | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index a8f1cdaf926..5ed1495552a 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -522,8 +522,9 @@ QemuCocoaView *cocoaView;
     }
 }
 
-- (void) updateUIInfo
+- (void) updateUIInfoLocked
 {
+    /* Must be called with the iothread lock, i.e. via updateUIInfo */
     NSSize frameSize;
     QemuUIInfo info;
 
@@ -554,6 +555,25 @@ QemuCocoaView *cocoaView;
     dpy_set_ui_info(dcl.con, &info, TRUE);
 }
 
+- (void) updateUIInfo
+{
+    if (!allow_events) {
+        /*
+         * Don't try to tell QEMU about UI information in the application
+         * startup phase -- we haven't yet registered dcl with the QEMU UI
+         * layer, and also trying to take the iothread lock would deadlock.
+         * When cocoa_display_init() does register the dcl, the UI layer
+         * will call cocoa_switch(), which will call updateUIInfo, so
+         * we don't lose any information here.
+         */
+        return;
+    }
+
+    with_iothread_lock(^{
+        [self updateUIInfoLocked];
+    });
+}
+
 - (void)viewDidMoveToWindow
 {
     [self updateUIInfo];
@@ -1985,8 +2005,6 @@ static void cocoa_switch(DisplayChangeListener *dcl,
 
     COCOA_DEBUG("qemu_cocoa: cocoa_switch\n");
 
-    [cocoaView updateUIInfo];
-
     // The DisplaySurface will be freed as soon as this callback returns.
     // We take a reference to the underlying pixman image here so it does
     // not disappear from under our feet; the switchSurface method will
@@ -1994,6 +2012,7 @@ static void cocoa_switch(DisplayChangeListener *dcl,
     pixman_image_ref(image);
 
     dispatch_async(dispatch_get_main_queue(), ^{
+        [cocoaView updateUIInfo];
         [cocoaView switchSurface:image];
     });
     [pool release];
-- 
2.25.1


