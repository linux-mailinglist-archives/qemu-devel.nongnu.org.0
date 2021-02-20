Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B94432023A
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 01:28:47 +0100 (CET)
Received: from localhost ([::1]:50988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDG8c-0005Rp-C9
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 19:28:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFv8-0002RK-8K; Fri, 19 Feb 2021 19:14:50 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:36907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFv6-0005y1-Ms; Fri, 19 Feb 2021 19:14:49 -0500
Received: by mail-ed1-x531.google.com with SMTP id o3so12725595edv.4;
 Fri, 19 Feb 2021 16:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=afHWT3306/WX6rKfVJ4c+pjfPJhY8s9AlcBO1bosnCI=;
 b=t6MfMfZ+/S5BgDGBG6qV/krghURiNqk8layQjWevThH5+I3vYTh/2gEG6aJNnMfVTI
 bBGNYsrYXPolh73R+4bzIyry/IVH+aWODlwBwArZ06oXhezsi6Qnh52FOP7Gb+8LzK9x
 sLlPepnYWZaI0iFOd3lGxWsU0nozHiNE4VQ6zhTh2fJ4CeloATFtLx4wWv3xxR2rBe6X
 LghXVpwJ29aAq8npILFdgzNlDbIU1IRIHn9vYPJFxLz/jCCFxEL/3x7GybACXSDMAang
 /Rfbs+XbIqx33NranwpDS9gYyRWj0euxqD2uczm+lFz0hb2JaMZOYF6aCtQe231DhFKn
 3zwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=afHWT3306/WX6rKfVJ4c+pjfPJhY8s9AlcBO1bosnCI=;
 b=P+bEiWGbnkmDv5KkKXU++gwchICSXEBV2VxFeEC3YOpNVNfiIZKdvPId+rAPacayAl
 9KiDIHatau7ZWEFIdVPVMV+/0PA9s19/JIoh+w2FSkjEh0uyTlsHukM5LPZV5knchiVQ
 5WcRtGRdZxzygfNioRxXwz4G2BKtnXegCJupp+r/2rf1dkpN/ElPJbpxvPLuy0s4R84p
 xGMzA+LSFPWcaEIsm009n2eAKyoEZR2fTw19bC27PLCBRgtSr9XmjCNq7MMONMrkquHM
 jHBlRbABnO2XTJ5AbPK+wnWbkL26QPThLaD3LSDMV9q80zegeMNY3jdcIrSU5Sr+WTk0
 zSXw==
X-Gm-Message-State: AOAM532rgqYnDslX/VQMevb5li4KzPId5MgjtJmCADsOj/XKok5jqfrH
 8CnOa6o+ViHqdNGn82MHZsK+UeKzdk4=
X-Google-Smtp-Source: ABdhPJz57mUGxD786cm6+4jkQAGOmVo/cV8H2BDN7NXXh7XgcPfl6Xs0X/Yenzr54YsLVkbXtfzkcg==
X-Received: by 2002:a05:6402:26c9:: with SMTP id
 x9mr11764633edd.365.1613780086578; 
 Fri, 19 Feb 2021 16:14:46 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id ha21sm5896773ejb.97.2021.02.19.16.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 16:14:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/18] MAINTAINERS: Add Bin Meng as co-maintainer for SD/MMC
 cards
Date: Sat, 20 Feb 2021 01:13:09 +0100
Message-Id: <20210220001309.2225022-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210220001309.2225022-1-f4bug@amsat.org>
References: <20210220001309.2225022-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is new interest in the SD/MMC device emulation, so it
would be good to have more than only one maintainer / reviewer
for it.

Bin Meng proved by his contributions a deep understanding of the
SD cards internals, so let's add him to the corresponding section
in the MAINTAINERS file.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <20210216132841.1121653-1-f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 66354e6e495..5eeba79c5a3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1754,6 +1754,7 @@ F: hw/ssi/xilinx_*
 
 SD (Secure Card)
 M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+M: Bin Meng <bin.meng@windriver.com>
 L: qemu-block@nongnu.org
 S: Odd Fixes
 F: include/hw/sd/sd*
-- 
2.26.2


