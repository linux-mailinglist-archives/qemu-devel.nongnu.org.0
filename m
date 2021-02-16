Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4AE31CAE7
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 14:13:12 +0100 (CET)
Received: from localhost ([::1]:54052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC0AB-0008N4-Hn
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 08:13:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lC08j-0007lm-Gy; Tue, 16 Feb 2021 08:11:43 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lC08f-0005pK-GX; Tue, 16 Feb 2021 08:11:40 -0500
Received: by mail-wr1-x429.google.com with SMTP id l12so12954458wry.2;
 Tue, 16 Feb 2021 05:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qPmnEBLZQ8/VqyYB8hHwV/1QgHDFBiAU9QUAD4eyk9Y=;
 b=UMLqYx2eGAxNa/kHvSRMMoaGXa8dPI1gZMz7aDSaBDQs9g7I4z/lHx/4IpK79SBC4B
 qPsCgJp8KLS6ofB+9UXmWwlzC8YbeCSLy2IVuw3svBHrM2cvmRG4M71PMnG3u4kbwwms
 vE0n9RqwjI1fcS6MiT09KYqAYEDK7A46Q0WtoeMNDbFl6pvCmx3u1AWWt1VRmPmkhXG1
 a3D5LtQlLBlo9jQTyalhFC57ECeYqz4QFyBsoiPGhuGyVKrOyQg/WxVqebVrjE3+RAwA
 iYymUUtS4c7FQVg8l1cEeC2xpSzHz0IFQtWIws8Nqm2tx2kBFUwUm//LKYiL14HBhNMC
 P/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=qPmnEBLZQ8/VqyYB8hHwV/1QgHDFBiAU9QUAD4eyk9Y=;
 b=RF+67mNGb6MjJwhlyO/AMxORot27CNwEmeA2H40peZI0HZZfligCLk4OiRdmwju3AV
 i4+kosVtStNcq96feBbxFR/TLR7kK/fVB32DncQAmW4WCl79VavYZPskXLC4/mLrKXct
 HGm3CSbR8pcBpGugZBi3rOmDhkXInlZ/V2HTOCxZ95xykjJ+LulJW0mS/RyYItlzpTOx
 MbejugwB6TehIJ7g7r7V7SdlCBJUl8Tw2Hxz1eYhxcGyeuDSzSfyiYr2rkHlWXss3WOk
 kLYDK9LnLCEe1wmz5NClTb6eXOrrYddAXUVnGdG9YUtNmTRuAiygEQK6p/B0Z/hn1aXg
 +Gqw==
X-Gm-Message-State: AOAM530+yDsiWZDij9pgMjH1a0YzgEwdr899zftHyjxDQoQf1zyy7cQb
 TvOIC16aLfnALMCycZ0z6jD3IQHbgNA=
X-Google-Smtp-Source: ABdhPJzBwMxIgTj2aGupMNgkPC7LTEZhX35y7z9Ra5+yJBnldmR9cwdTnyM7kuUvW1SBvc5LoHMKLg==
X-Received: by 2002:a5d:5185:: with SMTP id k5mr24044786wrv.352.1613481094499; 
 Tue, 16 Feb 2021 05:11:34 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l2sm3562699wmf.15.2021.02.16.05.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 05:11:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4] MAINTAINERS: Add an entry for the Siemens SX1 (OMAP310)
 machines
Date: Tue, 16 Feb 2021 14:11:32 +0100
Message-Id: <20210216131132.1116574-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.19,
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the Siemens SX1 (OMAP310) cellphones with the other ARM machines.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v4: Maintained -> Odd Fixes (no test image known)
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8201f12271b..47f8c591760 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -656,6 +656,12 @@ S: Maintained
 F: hw/rtc/goldfish_rtc.c
 F: include/hw/rtc/goldfish_rtc.h
 
+Siemens SX1 (OMAP310)
+M: Peter Maydell <peter.maydell@linaro.org>
+L: qemu-arm@nongnu.org
+S: Odd Fixes
+F: hw/arm/omap_sx1.c
+
 Gumstix
 M: Peter Maydell <peter.maydell@linaro.org>
 R: Philippe Mathieu-Daudé <f4bug@amsat.org>
-- 
2.26.2


