Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D2517BB40
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 12:13:30 +0100 (CET)
Received: from localhost ([::1]:34784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jAAv2-0008Hl-Qf
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 06:13:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38988)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jAAru-0003Fr-TO
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 06:10:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jAArt-0004bb-Jq
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 06:10:14 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36861)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jAArt-0004Yg-CY
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 06:10:13 -0500
Received: by mail-wr1-x435.google.com with SMTP id s17so955730wrs.3
 for <qemu-devel@nongnu.org>; Fri, 06 Mar 2020 03:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=j948o00wX+jLqnNVakqaDFVSuLWgzJuT/5nvfGKmzs0=;
 b=yQPcb7wfzjCcEwnKdUCGRg5IRi+zJNDSYbiV/u0A8/MvKrGcANogKdggrva41p0bco
 HzkxeHp6MZmGHoSsYgXv0BHD9LaPtEJZcDrH7SeguzvhbyuGgJzgIOxqGH+GNyPIwkM2
 nGUo/yK8BqSCCiu9RJUY8X6tDA8czavVhv6QUbCHp4hsFgGI3bIkOo15mkTMoTOGUEG0
 o6CpjPEVv5eUVJOle2niBdaJ2u2sFdjqxWXWWNK8zIRloy3mUyOb5cq+0/gV5E3OWMp+
 WtP5WdsLW6OvpQTOMZh2xI0fE1SyPlsYq+u+7Sq1vPZE4C7vTf2CX4VAcQlYrGdCTLEV
 WZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j948o00wX+jLqnNVakqaDFVSuLWgzJuT/5nvfGKmzs0=;
 b=gd3dEbjRKX2Xc18w9l9P41Hh9QgWl5/aYSe2dhKSpPsJ6uFold4NWt9dsIUsP93NH4
 gj1hPDDmyQj+nvPmbRUF2j1k7xV/B+j4qYeNr8j5ZiaNI13DXj7Y+OtRHngPclnV5L3y
 LUG8pBnmWnJWQZoweqI9iOaiCgEBkABxTGKfUm4MRb7fKPzktmM7PFQaBdycDgNnM4bK
 yR5l3aqvhBT7R1UuRD39DS4VOYVHN5FU49PU9L4FDhz3sW6mFU5zc9Fb4HUsDC5IftKQ
 xO6gD7xFYRULktTDt5sGFOpi9lOVIF/2Wwt+5nunX7DKMFaXLuXp4wtiA+2Di0/+J3A9
 Jf6Q==
X-Gm-Message-State: ANhLgQ2B7sYIMQdqPHcmU/ou3ZXOvWeNW5rtHHSXAAA1siEgCLTQuMrl
 GKDIPEH6qurRT8J7KIeR8tnRjyWQWVXK7w==
X-Google-Smtp-Source: ADFU+vu7UT7uTn/IibU8oKwInsGzzXOMAO+vRgojZoANfofcW+CKoxNeLVSq8x4dX8ahkDuZSAk4Zg==
X-Received: by 2002:adf:a50b:: with SMTP id i11mr3851554wrb.60.1583493012014; 
 Fri, 06 Mar 2020 03:10:12 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm12553029wma.26.2020.03.06.03.10.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 03:10:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/33] qemu-doc: move system requirements chapter inside PC
 section
Date: Fri,  6 Mar 2020 11:09:33 +0000
Message-Id: <20200306110959.29461-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200306110959.29461-1-peter.maydell@linaro.org>
References: <20200306110959.29461-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::435
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

The system requirements documented in this chapter are limited to x86 KVM targets.
Clean them up and move them to the target section.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20200228153619.9906-8-peter.maydell@linaro.org
Message-id: 20200226113034.6741-8-pbonzini@redhat.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 qemu-doc.texi | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 88e84300e91..40fab523f35 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -38,7 +38,6 @@
 * Introduction::
 * QEMU System emulator::
 * QEMU System emulator targets::
-* System requirements::
 * Security::
 * Implementation notes::
 * Deprecated features::
@@ -190,6 +189,7 @@ various targets are mentioned in the following sections.
 @menu
 * pcsys_devices::      Peripherals
 * cpu_models_x86::     Supported CPU model configurations on x86 hosts
+* pcsys_req::          OS requirements
 @end menu
 
 @node pcsys_devices
@@ -267,6 +267,13 @@ CS4231A is the chip used in Windows Sound System and GUSMAX products
 @include docs/system/cpu-models-x86.texi
 @raisesections
 
+@node pcsys_req
+@subsection OS requirements
+
+On x86_64 hosts, the default set of CPU features enabled by the KVM accelerator
+require the host to be running Linux v4.5 or newer.  Red Hat Enterprise Linux
+7 is also supported, since the required functionality was backported.
+
 @node PowerPC System emulator
 @section PowerPC System emulator
 @cindex system emulation (PowerPC)
@@ -1038,19 +1045,6 @@ so should only be used with trusted guest OS.
 
 @c man end
 
-@node System requirements
-@chapter System requirements
-
-@section KVM kernel module
-
-On x86_64 hosts, the default set of CPU features enabled by the KVM accelerator
-require the host to be running Linux v4.5 or newer.
-
-The OpteronG[345] CPU models require KVM support for RDTSCP, which was
-added with Linux 4.5 which is supported by the major distros. And even
-if RHEL7 has kernel 3.10, KVM there has the required functionality there
-to make it close to a 4.5 or newer kernel.
-
 @include docs/security.texi
 
 @include qemu-tech.texi
-- 
2.20.1


