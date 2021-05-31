Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E24E3958B6
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 12:05:00 +0200 (CEST)
Received: from localhost ([::1]:47522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnen4-0005VM-Rc
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 06:04:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lnem2-0004Tn-AZ
 for qemu-devel@nongnu.org; Mon, 31 May 2021 06:03:54 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lnem0-00066v-NE
 for qemu-devel@nongnu.org; Mon, 31 May 2021 06:03:54 -0400
Received: by mail-wr1-x433.google.com with SMTP id z8so5196644wrp.12
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 03:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P5k/gMDDAdMvvUqn4003r4cA5jendSnYwRfdT7Oc2QQ=;
 b=HVEYmxFkw5tk0MqnXplk5wT/H/hThb+laJ2PjztrquENljF8PxwwUXGU0dWltMqWWs
 0AyUq517tMPBIQSrwNlNXc5mN2lgu8f3Qov+Q3EMSeLYjOCpUWTzFT5CY7r/MTnQZjrp
 Or3jZT/jBlg0hLc6aAaC8wOuHcRRxQMU5OaHx59mwNbmw4zTZR94PYzQZO0fGh1/+YCR
 YzxPErZDBHMysj1d3xSFT6i6eEDhI3nLpbho9skWr0GZaDBRgN5brVT2i2cpnYjrWBeF
 n7pYBAYJTDed4kHzE7vCf2inViUfGzFdPJQq+c/pmlJNCrJf/qUhmKHLNcDgtKrS/nnk
 vz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=P5k/gMDDAdMvvUqn4003r4cA5jendSnYwRfdT7Oc2QQ=;
 b=R1f32LlOS/xWauHfxYXcHdhK5G6k3lgsh4z0b88JZsdd8Wald4M0jlg0hbKZwANiMn
 BWNpFWiZ29LNeLYTIn1TrJ9xmqGyOD/qtusSbK1XVOk1TU7ZIsG1uYUe6UtsyDY7jL2t
 8xes3AUV4x+r2l5DqHPOZZohT4e4XntO5IVq4a8Fs6VZJWClfcZtpIqYRBKYfGmf2PyT
 FSBArWX/B79hY7ByY+lxt9BBUwoLtQVPvmwta4dEODPiL5komNW5Eflvy4VTGDR3Rurc
 V7eO9EyUWHhLByglpcYs9n7Xa+RhlVRr+J2gXtt8zurIAEpGZb7qjLYNEtivvr66W+J7
 j1vg==
X-Gm-Message-State: AOAM533lQpoDhcdl3yjfPckDaTUbcpEnz7XC6oye9K8V8qRqTd7hP2l8
 +Pion8zjk3A/+1+tzrEHAp5K/qITbwZkcw==
X-Google-Smtp-Source: ABdhPJy6DaTSpe0uoMh2/62cnybRwxLt1dV8zxFoPadTDuOTevuoW+f2JX9mReKjvaE0LoCW49bjSg==
X-Received: by 2002:a05:6000:1b8a:: with SMTP id
 r10mr21524543wru.296.1622455430445; 
 Mon, 31 May 2021 03:03:50 -0700 (PDT)
Received: from localhost.localdomain
 (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id m7sm18226354wrv.35.2021.05.31.03.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 03:03:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/vm/freebsd: Increase code coverage
Date: Mon, 31 May 2021 12:03:48 +0200
Message-Id: <20210531100348.1655156-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Install more dependencies to increase code coverage.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/vm/freebsd | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/vm/freebsd b/tests/vm/freebsd
index 6e20e843228..85049b43136 100755
--- a/tests/vm/freebsd
+++ b/tests/vm/freebsd
@@ -46,7 +46,9 @@ class FreeBSDVM(basevm.BaseVM):
         "gettext",
 
         # libs: crypto
+        "cyrus-sasl",
         "gnutls",
+        "nettle",
 
         # libs: images
         "jpeg-turbo",
@@ -56,6 +58,7 @@ class FreeBSDVM(basevm.BaseVM):
         "sdl2",
         "gtk3",
         "libxkbcommon",
+        "pixman",
 
         # libs: opengl
         "libepoxy",
@@ -63,6 +66,8 @@ class FreeBSDVM(basevm.BaseVM):
 
         # libs: migration
         "zstd",
+
+        "usbredir",
     ]
 
     # TODO: Enable gnutls again once FreeBSD's libtasn1 got fixed
-- 
2.26.3


