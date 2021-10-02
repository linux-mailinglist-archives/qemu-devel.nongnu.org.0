Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1AB41FEBC
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 01:37:36 +0200 (CEST)
Received: from localhost ([::1]:37206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWoZT-00075a-4M
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 19:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWoY4-0006J8-Sn
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 19:36:08 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWoXz-0001yU-Vp
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 19:36:08 -0400
Received: by mail-wr1-x431.google.com with SMTP id d26so22092998wrb.6
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 16:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ME1zJ0ljIOmVbmPlP1+5/GuR2mIy4QpzHgh+hL5GDuI=;
 b=gOjlDdBcP1ZJD6kQCeH6GlQh3FBt5raoUXL8X9WLbhKpIkMPd/xJ70p/SzQs7udoTs
 kpDr65z5acsuovZbgQdnnf2m1tikxnPUdGRnLEddP9fHNPZgkpaKdw+eEQjiSi8U4eOs
 vAgtw8mHd1EkBbXsJwvEJHnjZfC+HwVY1IZHrNotQ5ndJgv3JJnqm88Ih0gwC8apcRci
 3mPrdrjuEVDwYUCTgtVJV1YaOf3yIpHut+t0EgS3UMUISzAPQ/EAtzC9O+WKrMD4HLnh
 1t8WCJVQzUORduIA3WplbnCJZ0WBeDNrZihsiDaqEdufDuOYxx0k3y23BLLpl1a+b75V
 8PkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ME1zJ0ljIOmVbmPlP1+5/GuR2mIy4QpzHgh+hL5GDuI=;
 b=H/N9DUpA/WNfGMhK/dTqhDf21Wx9UhkI8iydPRZtOk1gtL28r0VPKGg9SOJPiBxVBG
 VnAXo9BdqO581BhKMN9v18IF+zk5kTrnOmMTVr5FRpJcVGA9VA7auuVxz5gwBOV8ENoN
 Hc5ZM6kQFTSo07+7Q4KSXYH0LFvXRm+YlLu5uuDRDmVfV68iS6JgnJGzbbR/2eIS17pK
 GTYWk4Q3YrYiuqz3mbnzmnXor4BziFgIZi8EqeVzSvVIMIgPXzvP6wL8sSTynzOS8aVA
 vqWxTM7ywpvm5A8c9w+M5XPOLtsXW7We/4Jfzyv8VR53np0/x/sZYjwSOP6NGNp9MF9I
 uZdw==
X-Gm-Message-State: AOAM530pzALpsGmC7Owm2/0/xt0+XU8jZYMB+F5QxKg64HuUh7mNxltr
 HAyBlnheG/kIU1W5Oys+r2zzyoV/ZW8=
X-Google-Smtp-Source: ABdhPJzF3HaIndz26A0BPKEApIQCEeSAl5dLYYQDII4LtXlsyX5yE+8QEKRohVMOGB4PeI9Lrj3MgQ==
X-Received: by 2002:a5d:47a4:: with SMTP id 4mr5446446wrb.274.1633217761900;
 Sat, 02 Oct 2021 16:36:01 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id c17sm11629088wmr.15.2021.10.02.16.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 16:36:01 -0700 (PDT)
Message-ID: <69aa1b04-b30a-e12e-f82c-1b777d29e1b3@amsat.org>
Date: Sun, 3 Oct 2021 01:36:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 3/3] target/nios2: Use tcg_constant_*
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20211002233054.3575646-1-f4bug@amsat.org>
 <20211002233054.3575646-4-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211002233054.3575646-4-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.413,
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/21 01:30, Philippe Mathieu-Daudé wrote:
> Replace uses of tcg_const_* with the allocate and free close together.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/nios2/translate.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)

> @@ -448,9 +445,8 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
>          if (likely(instr.c != R_ZERO)) {
>              tcg_gen_mov_tl(cpu_R[instr.c], cpu_R[instr.imm5 + CR_BASE]);
>  #ifdef DEBUG_MMU
> -            TCGv_i32 tmp = tcg_const_i32(instr.imm5 + CR_BASE);
> -            gen_helper_mmu_read_debug(cpu_R[instr.c], cpu_env, tmp);
> -            tcg_temp_free_i32(tmp);
> +            gen_helper_mmu_read_debug(cpu_R[instr.c], cpu_env,
> +                                      tcg_constant_i32(instr.imm5 + CR_BASE));
>  #endif
>          }

I missed mmu_write() is also read-only, thus can use tcg_constant_*().

