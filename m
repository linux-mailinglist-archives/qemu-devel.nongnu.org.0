Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEECD3AA11C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:18:50 +0200 (CEST)
Received: from localhost ([::1]:57520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYFe-0007EP-1Z
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYBk-0002MS-HK; Wed, 16 Jun 2021 12:14:48 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYBj-0005uA-3l; Wed, 16 Jun 2021 12:14:48 -0400
Received: by mail-wr1-x42e.google.com with SMTP id v9so3328916wrx.6;
 Wed, 16 Jun 2021 09:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EHdSfYa44ifrw4JLoefcZ8HjwoJfatHiQn3SHL7K7GQ=;
 b=pieEz39UWLRSfoqL4M4mx3TucnoYuXmTueqD9OwUaEBfEUmLcGOx02iOBIgzb2zRbu
 1Fr3Zv+crAizuB6ZV3rZNNQIh/8Em/8AoT98Lry9dI34Epi3bIhXVdLpbfeYGl4p6sJP
 dOUiLLHfTrHXBcytnC+rOJO8RGbicRjXXTAHDd/2ruug44spOozDkC4Z6PJQ69XpmsQg
 MCRt3AZUstRcJUy5cxEO+w2897c22lecZp1LB+eCT2nZyilU1OI7vPwdI2GfatMRiaAG
 02cpck6lH+G6NghCETNxrbTGj3qt/HIcUM/yNUuxivctOjesGVaQKTOHCqkNAHLaUKxo
 Dc0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EHdSfYa44ifrw4JLoefcZ8HjwoJfatHiQn3SHL7K7GQ=;
 b=MvVGeAsE0bBIiiJTAlVAgXgaz9z3kai+oCQifu/1akeALTbnqAAQrRqrChL877dJd/
 TSsztcH9az0bKivtwttL8k/AVbxLAMbc3IqGemeRas344OfYpCElepJSH9iX+/hPcycJ
 Y0852gL8Iu3xA6cdsR5wvhBp/gZr0OGTolWQpsyIUTV41hx6ILbFdA6dVjc0QH96MQ9p
 GTD00lBg9arKLb5OWdpREFx+gLTYZEveyIya6EiZPDBb+8X6w2GUtxyKPhIiSWuEDjFO
 VsEdfj2j275wGTBaFX97AzFlP/AlKh6QOQBjjBF8MF6vbaKGU90ZxvBVlTib8G4Tm3EF
 YPYA==
X-Gm-Message-State: AOAM532l/PBpao31lMRgM6AeGAHkMi2incBQb0xAfVn5X9Ase8dn+QcX
 Lq72VQFONUyC54Ag48MNUysO1DrKONrJsQ==
X-Google-Smtp-Source: ABdhPJzLPrMLXLR+8FiTaORTuN19s0yMmCURhmB64bLGiupczKpOlM1CmjjEzL2KS/YSZ0jaFen4ng==
X-Received: by 2002:a5d:4f05:: with SMTP id c5mr186692wru.341.1623860084809;
 Wed, 16 Jun 2021 09:14:44 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id o26sm2179209wms.27.2021.06.16.09.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:14:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/13] hw/i2c/ppc4xx_i2c: Add reference to datasheet
Date: Wed, 16 Jun 2021 18:14:10 +0200
Message-Id: <20210616161418.2514095-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616161418.2514095-1-f4bug@amsat.org>
References: <20210616161418.2514095-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It took me a while to find this model datasheet, since it is
an OCR scan. Add a reference to save other developers time.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i2c/ppc4xx_i2c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/i2c/ppc4xx_i2c.c b/hw/i2c/ppc4xx_i2c.c
index c0a8e045670..f4c5bc12d36 100644
--- a/hw/i2c/ppc4xx_i2c.c
+++ b/hw/i2c/ppc4xx_i2c.c
@@ -1,6 +1,8 @@
 /*
  * PPC4xx I2C controller emulation
  *
+ * Documentation: PPC405GP User's Manual, Chapter 22. IIC Bus Interface
+ *
  * Copyright (c) 2007 Jocelyn Mayer
  * Copyright (c) 2012 François Revol
  * Copyright (c) 2016-2018 BALATON Zoltan
-- 
2.31.1


