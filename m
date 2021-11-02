Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F19F443065
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:27:58 +0100 (CET)
Received: from localhost ([::1]:47570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhulZ-0007Uv-4L
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu6c-0005BK-U8
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:45:39 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu6a-0006ST-VQ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:45:38 -0400
Received: by mail-wr1-x42e.google.com with SMTP id u1so1806225wru.13
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vEW9qyLcIIcmU7FBn9bHd1IYCxVAVro4srRgHcoUWnM=;
 b=Y6mh/hhEl5X6+OwRBWIeovWQn5DlPYzS8E0aBMS2uW3A5uYmn17Ess44QghLrkSs+o
 esT/yxYnQA4pgSMhvSmj8nR7UHaseAPJV49jLHL+H4ITsREWtelHDGbxNzcFz/P8dON8
 v18WWAbqCOvIgZF0LKEDy5ULjajfjA2/Favt2ba+pYg2XQzsQNe2U/HFFOJ/BipSm/Ni
 mp4sd+5P4l4opyiXz7KYh1uTbb4ajOikFAI7TpNI2iHIpdTmvUf3pMAUQ9tt+ffIk9FC
 IuJyEv8P9SrCEI5lldqS4fSZCmfZufpk9WobPL4BM2amxXyU7V3ROqbZesm0JTysvcSb
 jCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vEW9qyLcIIcmU7FBn9bHd1IYCxVAVro4srRgHcoUWnM=;
 b=oP7vWg4aWl6N8METVldaqeu9cyDjRH+9rK8ThSJzIsCyPyOkLpcbOAv/nGX5W1QZxD
 C32Cd9bPQMJvvyxc80Kw3/J/E32/nwu5RbBPn8mw9J4woaxtk6SFGdQ/Z5uZdQ8ATjlt
 xe4LbeinU3HFJqc41sSolmFQ9yPF93SqQaag5BPfO3oTYspDuZQfgPpxrwO05skOphqu
 ZiazHboEIc9sue1LcvloUaJBvF3bAB0jDbthXfJ/PtE1ia5M6gQbqBHBG2lUbJ+RSoR0
 HrtBCY4OsgM18D6PtN6AIyew91gd/KvoxCAGo/UWusEeDE+TKL+nyDwObrak0A+okzv1
 XWMA==
X-Gm-Message-State: AOAM532T+7G/tRYraTzTvZlY+sf3nKjPXG3nE3kD5JNptZiHB9iAExU+
 hNb5D1gezgClS9dM+AQpNWIjXLKexg4=
X-Google-Smtp-Source: ABdhPJzPXpgrCy6Ccm/ItK8e6C/L1MVibb2Uk+ilwL19PEvQcxOw5AXy6Yq4vRoF/hYx4KnWZDrtww==
X-Received: by 2002:a05:6000:10cb:: with SMTP id
 b11mr35288742wrx.71.1635860735501; 
 Tue, 02 Nov 2021 06:45:35 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 k21sm2548453wmj.45.2021.11.02.06.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:45:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/41] target/mips: Remove obsolete FCR0_HAS2008 comment on
 P5600 CPU
Date: Tue,  2 Nov 2021 14:42:35 +0100
Message-Id: <20211102134240.3036524-37-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FCR0_HAS2008 flag has been enabled in commit ba5c79f2622
("target-mips: indicate presence of IEEE 754-2008 FPU in
R6/R5+MSA CPUs"), so remove the obsolete FIXME comment.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211028212103.2126176-1-f4bug@amsat.org>
---
 target/mips/cpu-defs.c.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index ee8b322a564..582f9400702 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -369,7 +369,6 @@ const mips_def_t mips_defs[] =
          * Config3: VZ, CTXTC, CDMM, TL
          * Config4: MMUExtDef
          * Config5: MRP
-         * FIR(FCR0): Has2008
          * */
         .name = "P5600",
         .CP0_PRid = 0x0001A800,
-- 
2.31.1


