Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5165F563E91
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 06:47:43 +0200 (CEST)
Received: from localhost ([::1]:34412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7V2k-0007d6-1d
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 00:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1o7UyP-0003tw-4z
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 00:43:13 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:33299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1o7UyM-0004Ur-U1
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 00:43:12 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id A4A55580A8B;
 Sat,  2 Jul 2022 00:43:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sat, 02 Jul 2022 00:43:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1656736986; x=1656740586; bh=59pT8WNXrJaMVqikRFYQJYTgu
 m5O3NF8WaDXvgi3o5g=; b=x9JCwubnmYU0+vWaXxqfnj2t0lQc2qReedbCjPPkL
 u8xPv7shpclFf8bwBIbCW2a1Jin7J/8JreGXfkW8nIedOaPJM9CVq7A0dzG830zM
 qdED0UOz3/R7QE8RJ83jkndnvxUyuc7C5ULGXmAQWkxZindyqCgSDxT4JtbOyVZD
 1A+j5sIpwaPDETdFYiOtw0he3rkvdQCQvg6PzCRSOQV3wLWH+2CjLpaLvGr6NpH+
 gWvRURnMu9qbSK00/ckrnbIfpEcEjNjq7neeTGjEgaVxDV4AlZEnM8iOOt5gjITz
 b8nkHx5HOeG2kZbeUcTeqXalLTu2KngsqNZlNES5NlY0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=i9e814621.fm2;
 t=1656736986; x=1656740586; bh=59pT8WNXrJaMVqikRFYQJYTgum5O3NF8
 WaDXvgi3o5g=; b=fXetZsyjYP90XTvU+Uq3aLroSG3KPPqCrBivwkxh8OQ/dxw4
 nriEB6RWnKSlS8Urrq7oXe8DQc80IhjC8EQNa5ZkXTHA/gdBCSONahJoeK3bnjJO
 KJKWEauvDH224EaQiY8ih9AgmKIjM3KQL3r8QnUPvRd6KVuX+sHrdTOZXfycwM5X
 YCx/Gz99NwihYPaUtlEzTSNJn3lnZl0koFcF/oKE19fUJABDUKPJhBzMYSgQzyW3
 XBs/t9mrqHr7cnWFeyiujWe5FruPNWR6wk4Dx5TrtRP1XP3mnH+7Npth5lopMYmX
 zc1rhx7kw3sBOTE2meGxrgZ2cKn4sj4c7V2uhA==
X-ME-Sender: <xms:2sy_Yoiw2lSOgAksp50fVCdX0NJAYqfijgcyJ2bklAn-crl73FVrWg>
 <xme:2sy_YhB2DZHiqL2CqjOkrLdhGPlsJIknIK3_Tp5Xny7jAlfiXOVK-GYOJZEDNNfeN
 uxpc9RXtUocSDj0V3k>
X-ME-Received: <xmr:2sy_YgH97Yifi1dS051Xr-e33sqtM9pw2OVtqCfPFFjVoDB-pqXKOKZdfytLpQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehgedgkeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheprfgvthgv
 rhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrfgrth
 htvghrnhepgfehvdeffffhleegteeggfekjeegffetjeejuedvueelkeelieelgfevfffh
 jedunecuffhomhgrihhnpehusghunhhtuhdrtghomhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:2sy_YpQLc37nc7Hs5e9NswheOBgO8JHG0EqKmKCEJR2HqSEUAEaxWQ>
 <xmx:2sy_YlyqFnRgpOXbL8LGckCGXVnwrGwbcYsDcwszJywAq3nH0avVuA>
 <xmx:2sy_Yn7NayAi4DCWC17J1soOQNGwfkR0z58dblpfu8ugpDuO6MSD3A>
 <xmx:2sy_Yt8kZf0GLHESqHft7OHk4Viuh-ZoqfUOsFUIKFgx-in_a5_5Ng>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 2 Jul 2022 00:43:06 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, f4bug@amsat.org,
 akihiko.odaki@gmail.com, kraxel@redhat.com
Subject: [PATCH] ui/cocoa: Fix switched_to_fullscreen warning
Date: Fri,  1 Jul 2022 21:43:04 -0700
Message-Id: <20220702044304.90553-1-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.229; envelope-from=peter@pjd.dev;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

I noticed this error while building QEMU on Mac OS X:

    [1040/1660] Compiling Objective-C object libcommon.fa.p/ui_cocoa.m.o
    ../ui/cocoa.m:803:17: warning: variable 'switched_to_fullscreen' set but not used [-Wunused-but-set-variable]
        static bool switched_to_fullscreen = false;
                    ^
    1 warning generated.

I think the behavior is fine if you remove "switched_to_fullscreen", I can
still switch in and out of mouse grabbed mode and fullscreen mode with this
change, and Command keycodes will only be passed to the guest if the mouse
is grabbed, which I think is the right behavior. I'm not sure why a static
piece of state was needed to handle that in the first place. Perhaps the
refactoring of the flags-state-change fixed that by toggling the Command
keycode on.

I tested this with an Ubuntu core image on macOS 12.4

    wget https://cdimage.ubuntu.com/ubuntu-core/18/stable/current/ubuntu-core-18-i386.img.xz
    xz -d ubuntu-core-18-i386.img.xz
    qemu-system-x86_64 -drive file=ubuntu-core-18.i386.img,format=raw

Fixes: 6d73bb643aa7 ("ui/cocoa: Clear modifiers whenever possible")
Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 ui/cocoa.m | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 84c84e98fc..13e208b037 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -800,7 +800,6 @@ - (bool) handleEventLocked:(NSEvent *)event
     int buttons = 0;
     int keycode = 0;
     bool mouse_event = false;
-    static bool switched_to_fullscreen = false;
     // Location of event in virtual screen coordinates
     NSPoint p = [self screenLocationOfEvent:event];
     NSUInteger modifiers = [event modifierFlags];
@@ -952,13 +951,6 @@ - (bool) handleEventLocked:(NSEvent *)event
 
             // forward command key combos to the host UI unless the mouse is grabbed
             if (!isMouseGrabbed && ([event modifierFlags] & NSEventModifierFlagCommand)) {
-                /*
-                 * Prevent the command key from being stuck down in the guest
-                 * when using Command-F to switch to full screen mode.
-                 */
-                if (keycode == Q_KEY_CODE_F) {
-                    switched_to_fullscreen = true;
-                }
                 return false;
             }
 
-- 
2.37.0


