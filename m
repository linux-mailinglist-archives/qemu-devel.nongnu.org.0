Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCF34208CB
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:53:54 +0200 (CEST)
Received: from localhost ([::1]:46728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXKfS-0003CW-0f
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mXKE3-0000VC-4M
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:25:36 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mXKE1-0008NC-Nd
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:25:34 -0400
Received: by mail-wr1-x433.google.com with SMTP id e12so9359560wra.4
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 02:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y4gMUR647cYzWyzOeuk1+NZMTGb3YRwNgFh2b4z/VlM=;
 b=S3craSTbkKrRslE5yUqrsUwChyIONqkFM18TqhQY/IDOSDxz00bk7aZYv0hb/ifjFa
 xfO3jCIQyXVG172kIMgswNc0qmKRAIoMpBF51RnrfobyQminsrYV5P40Lq66tW+ZGNPN
 8TvLANaIo39yA31+c7eLot/05Xejcu7tuHLTud48DSu2YAAQddP7i1qZ1JB5yqqCYfoe
 cJGHs6QRvDFVVGS9XZGLawD/5dZMx6NWENKEmZ8UYvcR+4UjVKH6kDziFUAQtgI3sP89
 h5KbMIvxFMpjt1tGm2ttveMQg2QIYHFtnw1rNvnKF1/kOAqNly4bVUjB9s34bPadb6Ve
 qMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=y4gMUR647cYzWyzOeuk1+NZMTGb3YRwNgFh2b4z/VlM=;
 b=6GX1hHCHnX8RjMq0hqRaAsODgu4xRppJeI5+Q3yPBCWEJlbYq/rP1TVvZuyxPzIl1O
 SnDpgw6Y7yI8BAhgUOM1bEr7fIrPtctQlsweuFRg4ZclpuctKC/VMzqSbEUnE3hxESSC
 mmPiLkScxakGFHRiRxDCT1g34/ddASY1Ss/sqPmWJjv3F4YPxToynArB+lH+/jV772qn
 RrkpPrQfy5+hyE11WIQZeeB/6R5Su1j5CaUBHhztHNcDxGJhdsTUPwz4HLAHVEYK17uJ
 W55YyMITIOW7kax5AkHSMBd2uhqVNVSC5suxBs/RoYxknnsPojn1Q6n7elYe0GPoC11H
 vgZg==
X-Gm-Message-State: AOAM5314WHqmZEJnehTt/LIVeFGlK5Ugr+LKVHdrh+5Z7KZ9d/Q6fq+M
 csWao9v7p87DXOZqfuuFYWeyMv06+dg=
X-Google-Smtp-Source: ABdhPJzP7E6tCC8rWDoA/VaGJtCVGCF5zvonbgT78lotQzgZf5DBUfFlHodkKgHmwG15MjOh2HV2cw==
X-Received: by 2002:a05:6000:18cf:: with SMTP id
 w15mr12713413wrq.314.1633339532098; 
 Mon, 04 Oct 2021 02:25:32 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id y23sm16379768wmi.16.2021.10.04.02.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 02:25:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] MAINTAINERS: Split MIPS TCG frontend vs MIPS
 machines/hardware
Date: Mon,  4 Oct 2021 11:25:14 +0200
Message-Id: <20211004092515.3819836-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004092515.3819836-1-f4bug@amsat.org>
References: <20211004092515.3819836-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paul Burton <paulburton@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hardware emulated models don't belong to the TCG MAINTAINERS
section. Move them to a new 'Overall MIPS Machines' section
in the 'MIPS Machines' group.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a5268ad0651..f1d7279a0f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -236,11 +236,8 @@ R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
 S: Odd Fixes
 F: target/mips/
-F: configs/devices/mips*/*
 F: disas/mips.c
 F: docs/system/cpu-models-mips.rst.inc
-F: hw/mips/
-F: include/hw/mips/
 F: tests/tcg/mips/
 
 MIPS TCG CPUs (nanoMIPS ISA)
@@ -1168,6 +1165,13 @@ F: hw/microblaze/petalogix_ml605_mmu.c
 
 MIPS Machines
 -------------
+Overall MIPS Machines
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+S: Odd Fixes
+F: configs/devices/mips*/*
+F: hw/mips/
+F: include/hw/mips/
+
 Jazz
 M: Hervé Poussineau <hpoussin@reactos.org>
 R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
-- 
2.31.1


