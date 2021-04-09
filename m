Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4A43599B0
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 11:44:29 +0200 (CEST)
Received: from localhost ([::1]:33778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUngi-00070T-GJ
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 05:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUnZU-0008VO-Am
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:37:00 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:38527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUnZS-0002uc-VR
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:37:00 -0400
Received: by mail-ed1-x52d.google.com with SMTP id m3so5782081edv.5
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 02:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PXqnygnDNRvgHqFuhkZNL41NPY6pp82Qlb6Fn+d88n8=;
 b=nKpx5aSojz4tdZC6/pso6slZDGWhIJIGZOdizPPUjbaPCxfQFlIuVo+t2tQHLPXjTx
 v3ViF57x0wX3b5ENata9isOhztsm6eqhevpOsxZDlNRbSwlA9LtHp+wcrmxpzs8KlyjN
 DqzpKmIBrdiMCThGDeS8vN8S8mYEp32CtLt295OBSTDr8anbnPgX8hUvdGt7NE7eTi2B
 bNw9iFWcB9/McxhYFtdP3vfqnJOt1HYajpKx2NMFISlACa6m8rUn38c1RU60nh4myaJa
 s4T8P4nv0BtTshUGiHnLhZFCnfh/RSEfQaUeuTcwY8keXTK4Qa7FY2Li/ABvrVIYmzuj
 OhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PXqnygnDNRvgHqFuhkZNL41NPY6pp82Qlb6Fn+d88n8=;
 b=QS6TSRyUISdWoqf7rVpAIOI8rTLHumJFRQ5cyZ0miMZCkgwN0FcfU9ylQugfKh/we/
 AnYWIFmBN6Z01EqA9FEK++vSTgprfqCtANqnDpohfidHWbAjm4zd3D7PGo6y04ii6Slw
 joJKwI9OBqMkdhieiZ7eBJklO9HSSX+R98RhAeAYOYS6Vcyuyswnz40BYPunnWPppu2W
 6CzZW5H78bEE+QXwNt1i8MbG+3zHnqtGSoyRiDiGcPo2yPyvOjaXyYg/2LWpzt5toiA7
 hLaE8tAu+jntmQVxF9hC3/iV80bhpQrNbxlF3tt0ghi4AeP/IOjCmgZ17tMgsWnqSj55
 PXNQ==
X-Gm-Message-State: AOAM533U5k8HeGa+okoqI8CDBMSq6HsyDdCgQ81Q5k2SqQ5Cyty7zwT4
 Bv2lQHVWfWHhdbcRRSq1QkdfYWp0TFw+Pg==
X-Google-Smtp-Source: ABdhPJytB528ytxgXKFTaaCXEJyVT4c1+lPaEmPqtyhRgd7zEGafjTYY/ICBGrATZXkQZkgekH9pLA==
X-Received: by 2002:a05:6402:344e:: with SMTP id
 l14mr16811382edc.184.1617961017441; 
 Fri, 09 Apr 2021 02:36:57 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id bh14sm941191ejb.104.2021.04.09.02.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 02:36:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-6.1 v2 6/6] hw/mips/loongson3_virt: Raise CPU clock to
 2 GHz
Date: Fri,  9 Apr 2021 11:36:23 +0200
Message-Id: <20210409093623.2402750-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210409093623.2402750-1-f4bug@amsat.org>
References: <20210409093623.2402750-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Luc Michel <luc@lmichel.fr>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hao Wu <wuhaotsh@google.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit cd3a53b727d ("clock: Add clock_ns_to_ticks() function")
removed the limitation of using clock with a frequency of 1 GHz
or more.

The previous commit converted the MIPS CP0 timer to use this
new clock_ns_to_ticks() function. We can now use a clock of
2 GHz with the Loongson3 virt board.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/loongson3_virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
index b15071defc6..0b72ef8a684 100644
--- a/hw/mips/loongson3_virt.c
+++ b/hw/mips/loongson3_virt.c
@@ -152,7 +152,7 @@ static const MemoryRegionOps loongson3_pm_ops = {
     }
 };
 
-#define DEF_LOONGSON3_FREQ (800 * 1000 * 1000)
+#define DEF_LOONGSON3_FREQ (2000 * 1000 * 1000)
 
 static uint64_t get_cpu_freq_hz(void)
 {
-- 
2.26.3


