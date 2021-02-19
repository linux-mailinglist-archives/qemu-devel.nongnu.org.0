Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82F331FBE8
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:23:16 +0100 (CET)
Received: from localhost ([::1]:54384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7ch-0008Hn-PH
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD74D-0002yc-7A
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:37 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73V-0003hE-Ew
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:36 -0500
Received: by mail-wm1-x32a.google.com with SMTP id x4so7882567wmi.3
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HCUP9aHI+eQ+pUUZGOO1dNsG+dvoHvU/fP6me+Xsa6A=;
 b=Hrsv3BiFoTZ+BiUKC5Hm/vCDuCK9HBxhaS+Sv4qAxP2d39CkY3gPB1mfYr/o/TtNAS
 HziB0W9yYocJDO16Esiv/HJYp+ZEwLQQvq5m25gJk93Txy8X+InsveqMJHT4nQ4+w0K5
 dq3VC+CE0MmwQxqzvI1DaN+7C7dRgKkKWcnuJLV1dPPYbWVR3SgMD2IZDGUhLFrVQdo4
 BFm8zfAA0PMzmuMQMfbyFMDsvjeXQS5pAAbQDYOexkxtnuD8APlghkFBobkdLe0knz66
 IomdlT6Y1SDDeCGyHhxXKrDTM1Nfw6uzfXLdNfxqOshD+sgbKEH4wZPhyvkavEEkR2cl
 wSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HCUP9aHI+eQ+pUUZGOO1dNsG+dvoHvU/fP6me+Xsa6A=;
 b=H+UTMbuszcJ+9n4IiY0VFPfLjOzV23nVbuyF17ZfiMGFV3o5X4yUKge7vSdflBW/tD
 0xDVZDOzo+v/aC03Buji/zo8AFC4+xg080YVnFdBeumTLFKiJzVUm3/ckTvEXlFpJxbV
 x9cq6F+VxCqo489aGqWDoirW71AhmJwClaOTmjyToEOu9hI5PPunbz97DbxNjYg/kWcs
 iuBEAhUR6Yxwv/4usXeGvUQaCYD8tQWH0zer5ntKfPxsTbdqQr8gqdZFgOfPv9tcX0QP
 iH6/1kcZ1GbEbF+FT0kf9kwAbmGirdZMnYANu5ODK42kFa4qEUVCKtFzHsVvaJZgfken
 RXtg==
X-Gm-Message-State: AOAM531pboz7qrm/4xJfX5sON1Me5wH62NCNays2Ap4dnrzoZU+w3in6
 sohvKRuvUzkR2zGo8n38u02K9hQBX60jlw==
X-Google-Smtp-Source: ABdhPJxltp0pPj0JX/xMUddZvXenA9vBvR3rdW9gHv/bt/XpKnLzsI5P/6zCqJa+Xdy8UdV6touMzQ==
X-Received: by 2002:a7b:c341:: with SMTP id l1mr8345714wmj.182.1613746012193; 
 Fri, 19 Feb 2021 06:46:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 43/44] docs/system/arm/mps2.rst: Document the new mps3-an547
 board
Date: Fri, 19 Feb 2021 14:46:16 +0000
Message-Id: <20210219144617.4782-44-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add brief documentation of the new mps3-an547 board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/mps2.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/mps2.rst b/docs/system/arm/mps2.rst
index 601ccea15cb..f83b1517871 100644
--- a/docs/system/arm/mps2.rst
+++ b/docs/system/arm/mps2.rst
@@ -1,5 +1,5 @@
-Arm MPS2 and MPS3 boards (``mps2-an385``, ``mps2-an386``, ``mps2-an500``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``, ``mps3-an524``)
-=========================================================================================================================================
+Arm MPS2 and MPS3 boards (``mps2-an385``, ``mps2-an386``, ``mps2-an500``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``, ``mps3-an524``, ``mps3-an547``)
+=========================================================================================================================================================
 
 These board models all use Arm M-profile CPUs.
 
@@ -27,6 +27,8 @@ QEMU models the following FPGA images:
   Dual Cortex-M33 as documented in Arm Application Note AN521
 ``mps3-an524``
   Dual Cortex-M33 on an MPS3, as documented in Arm Application Note AN524
+``mps3-an547``
+  Cortex-M55 on an MPS3, as documented in Arm Application Note AN547
 
 Differences between QEMU and real hardware:
 
-- 
2.20.1


