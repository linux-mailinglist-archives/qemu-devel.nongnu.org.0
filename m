Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADC332ED73
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 15:50:08 +0100 (CET)
Received: from localhost ([::1]:46640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIBmJ-0003Iu-5c
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 09:50:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIBl6-000237-Nv
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:48:52 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIBl3-0007Ig-MD
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:48:52 -0500
Received: by mail-wr1-x42d.google.com with SMTP id f12so2358946wrx.8
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 06:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H2PThwTQIl906+wEewRZ6lvmWIUQrRdCUiNrHANKF5E=;
 b=sXbbHTljFTyk5a2ygIb1wlrPXaRw6YzDEDvACnNl13ngjdLy8j1iU5VZwtk/Fma3a2
 jEpIMDKj4Gx3b5JMFhu+R7QnOtEYcVRhVJg+NzGN7+d2H/VIU5IFkTosYih/aaz0JYgq
 kPVsSfQRuUzBsBn/nHwCXbGcvI7Vl1k1PCvHHXuMvlphniZnqi4ZCPCij1jT63mVN17o
 2OFMLGm+23Q8sga4XC2WqkgSl1hASpj1AtzABWYX2jc3AEfj85mDPN4kMX97dQydxa58
 L+qo6rDs7giPdr1/e4NKhJ5zgZN1RfG0zfdgJ88rB1JJ/TG/7Ko7j31eXFRJry+4Gk0U
 fVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H2PThwTQIl906+wEewRZ6lvmWIUQrRdCUiNrHANKF5E=;
 b=AQ/XIdh1WUJTOgKBwia8MgJuH6rehx6+GcaGRnU5/Bta0+EBqw18QlOvuHf9PO0+1a
 h5WbqwgYSCBcHOL8djNGRHczPgzAAlUWoVfvLQ/GsTsgSZCHpj+5a8uw/U2JROZJPIrw
 MbcEpqXAuIplNxm4OAgxqa2zUgYo5BnYpU/CfK7ZRZhICCEAs0X3XonzseqT+f6y3Yir
 XRd1FYRFRaqDHq4lkHN8y6erixIgCJWZWcPumL5GyWNW1ClYpfSno9C+OS9esI53KLEE
 zHKLInMu2TSivIlMLGh8eb26tSoHV8g3wvMrZOLKcU6zDMJyoq7RMQnnLhaOvEgO3DTa
 yHqA==
X-Gm-Message-State: AOAM532E1MXKrwc4RsiIMYDX+9nBaFyRurmvmU0p6HKOMn/qhwKo59WD
 B6SOGViRjSievYVPbB4Kal/rNg==
X-Google-Smtp-Source: ABdhPJzPE0u2D1Y4HiExq+OtA7q5AY9vOpl82sIFSiUiU+TeMxgWz3JB3WIEbYpKOG4GAtlY0d1fIA==
X-Received: by 2002:adf:b60f:: with SMTP id f15mr9879865wre.83.1614955728182; 
 Fri, 05 Mar 2021 06:48:48 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b186sm4994919wmc.44.2021.03.05.06.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 06:48:47 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5B5101FF7E;
 Fri,  5 Mar 2021 14:48:46 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] .editorconfig: update the automatic mode setting for Emacs
Date: Fri,  5 Mar 2021 14:48:39 +0000
Message-Id: <20210305144839.6558-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It seems the editor specific keywords have been deprecated in the main
editorconfig plugin:

  https://github.com/editorconfig/editorconfig-emacs#file-type-file_type_ext-file_type_emacs

Update the keywords to the suggested one and point users at the
extension.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 .editorconfig | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/.editorconfig b/.editorconfig
index 22681d91c6..22656e849d 100644
--- a/.editorconfig
+++ b/.editorconfig
@@ -4,6 +4,11 @@
 # plugin.
 #
 # Check https://editorconfig.org for details.
+#
+# Emacs: you need https://github.com/10sr/editorconfig-custom-majormode-el
+# to automatically enable the appropriate major-mode for your files
+# that aren't already caught by your exiting config.
+#
 
 root = true
 
@@ -15,17 +20,17 @@ charset = utf-8
 [*.mak]
 indent_style = tab
 indent_size = 8
-file_type_emacs = makefile
+emacs_mode = makefile
 
 [Makefile*]
 indent_style = tab
 indent_size = 8
-file_type_emacs = makefile
+emacs_mode = makefile
 
 [*.{c,h,c.inc,h.inc}]
 indent_style = space
 indent_size = 4
-file_type_emacs = c
+emacs_mode = c
 
 [*.sh]
 indent_style = space
@@ -34,11 +39,11 @@ indent_size = 4
 [*.{s,S}]
 indent_style = tab
 indent_size = 8
-file_type_emacs = asm
+emacs_mode = asm
 
 [*.{vert,frag}]
-file_type_emacs = glsl
+emacs_mode = glsl
 
 [*.json]
 indent_style = space
-file_type_emacs = python
+emacs_mode = python
-- 
2.20.1


