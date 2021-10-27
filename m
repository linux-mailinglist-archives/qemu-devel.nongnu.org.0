Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 801AE43D092
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 20:20:38 +0200 (CEST)
Received: from localhost ([::1]:49538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfnXR-0004Zy-GR
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 14:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnLI-0003lr-He
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:08:04 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:51024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnLH-0003wo-2m
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:08:04 -0400
Received: by mail-wm1-x32f.google.com with SMTP id b71so2655002wmd.0
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NNgl2mpfAiZfhYDiQ9ogv6PCsGIpzu4OcCVGnleJ4Xs=;
 b=RngCEyVCMPA1/Sc7AT3IOqt92w4EdROVYLHEOVilh/08djvPuL1UMuxw6wKjSmdRjo
 /qvjK44YYQs0shxFw2vCbQ1HsI07s5vFnFUQ2QqffLTb5FSAgimIW0qnr8g4pWlseBVC
 8O+hqXrnqE2xQjA97OE40FfT+FXlH05GS/x9bvMEf+/rdGLaT6vtu/xc4/X9dNKJQLKJ
 KTwFxZq7wHQOnrDp5Io9pi2szrBDKo0YlFX+F5RFZMQ7ebePCxDrD7K/q1WXP+ywITuZ
 t6mKHnV0mRWpCwMVRbFTGqz8hBLC4kL2QJgPs3lF6xusyJ7ElBzLTUITcQ1XI+zo/gZl
 XY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NNgl2mpfAiZfhYDiQ9ogv6PCsGIpzu4OcCVGnleJ4Xs=;
 b=oKAKu0C4QkfnKe6CuM2bI3czyn4GPP4oaknQIPDdnOrwMPM22zHTI3NNTiAADmhA3S
 o0Ft33CVSAw1hxVdXWaHhfZhnXdPy45X0XvgMR4n7koY/Lxy0bpwEeIGgYdlU+HiyLAM
 ii3sudE8leIh7uBnaCn5gsOegMlK0RZHXlkWrPPYcpZCP+1zafv9KEyzDFOoXHOWubgB
 8/z9heSiWPbieVts1IBEfQXBE2L9RcnUC649FnpTZzycCyy2mlVd3waIjy19xAuqTKvp
 29a+K47pUU9w+xR675zUJJNyQ2s+qWC6TX60oh1yyzaqWNXxD4osTI9nOtEIE6ozJJ3z
 aJug==
X-Gm-Message-State: AOAM530mqDV5CgOwJ8AAKAdynODvvpEyU+t6g7Dz+gMkj8THwpJj6vY3
 F38P5WRGelSe/KoAeuvR1MJxPJzOVMk=
X-Google-Smtp-Source: ABdhPJwR8YbvHuJqHmFiFJlqYif5YVM8Fw0lQ1gL34Yf/MWgHR0GY7fVp8Q0ZBHymuyhlvm8E+C/YA==
X-Received: by 2002:a7b:cd8f:: with SMTP id y15mr2882228wmj.107.1635358081637; 
 Wed, 27 Oct 2021 11:08:01 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id t19sm581858wry.89.2021.10.27.11.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:08:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/32] target/mips: Use enum definitions from
 CPUMIPSMSADataFormat enum
Date: Wed, 27 Oct 2021 20:07:04 +0200
Message-Id: <20211027180730.1551932-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027180730.1551932-1-f4bug@amsat.org>
References: <20211027180730.1551932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace magic DataFormat value by the corresponding
enum from CPUMIPSMSADataFormat.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 5acb27f1d71..41ade61879e 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -1789,10 +1789,10 @@ static void gen_msa_3rf(DisasContext *ctx)
     case OPC_MULR_Q_df:
     case OPC_MADDR_Q_df:
     case OPC_MSUBR_Q_df:
-        tdf = tcg_constant_i32(df + 1);
+        tdf = tcg_constant_i32(DF_HALF + df);
         break;
     default:
-        tdf = tcg_constant_i32(df + 2);
+        tdf = tcg_constant_i32(DF_WORD + df);
         break;
     }
 
@@ -2021,7 +2021,7 @@ static void gen_msa_2rf(DisasContext *ctx)
     TCGv_i32 twd = tcg_const_i32(wd);
     TCGv_i32 tws = tcg_const_i32(ws);
     /* adjust df value for floating-point instruction */
-    TCGv_i32 tdf = tcg_constant_i32(df + 2);
+    TCGv_i32 tdf = tcg_constant_i32(DF_WORD + df);
 
     switch (MASK_MSA_2RF(ctx->opcode)) {
     case OPC_FCLASS_df:
-- 
2.31.1


