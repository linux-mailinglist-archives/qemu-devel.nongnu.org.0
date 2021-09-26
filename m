Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C98294186E3
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 09:17:18 +0200 (CEST)
Received: from localhost ([::1]:40230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUOPV-0008Mc-CW
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 03:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUOO1-0007eD-Kd
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 03:15:52 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUONx-0002m6-Lz
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 03:15:44 -0400
Received: by mail-wr1-x432.google.com with SMTP id d6so40965610wrc.11
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 00:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JpYg1plkHv4bv4GTyUFky3yHZlsUy07X2Dc2mq6VmCQ=;
 b=aEug991DsYFbHvJLVsT4UAvsVAw2GBM2yl6dz+YEJbDqFltWdUm2Ij+33jhjzIRsXF
 UUzMQBF2S0c4n/mEv6JjFhdz/AbAbOdQOwJS8qKn2do/HWTO0uoUzbyYbKnReZ1Cd7C6
 rxaaqs4K7lwxQTB/0Dy9KyKpgRF51UgVDvgB8ZgDg/Z2vKX1vQjfZHPRoRpy41vsYpu8
 D9D9FZp83GTP9MN4a3WBDCMhwcbnnBbxuONssUSD4LM0u/Bmc/xNSQ9TLbi7tp9SKNlx
 grK3sxdRbu9/aZHZ/i7C6F0yYqbhoXM1GivsUwwaRTPyoZRbecGKtQrKs+6cJxCQm7sY
 1e4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JpYg1plkHv4bv4GTyUFky3yHZlsUy07X2Dc2mq6VmCQ=;
 b=hECEAEKrmoaR+o5QrRniF9wInM+UOJuKPEvo20YwFygZsbMJFLkWCUCb2y2w53fD2o
 wpddNos6NJYn0s/1Tg2nm797jBRNoJsxLJgyjtgacWQ66BO66hqR8C1dxdS302Wy+m9f
 11Cr2q3KQncv+oRKPSinZVmdAKMukqDwB3xqXty2oniJ3PmE1v6ME0uYseoyyOqe4Vpk
 w4sLJASeAtXuer7A6dLThSYKxxbN7vXgpEobMHCKBqo2nfF+Wf/6HxFwo2I6W6nLUrGO
 BcDGePz+Se0korpSxn3Eu6JcVMCIMcwXbFOWqocG7ZVw9JRg6qcqfIIpmN3qPN24MHKZ
 XgYQ==
X-Gm-Message-State: AOAM533rZzTGp37L7CAQh3Gpfq+14DEHk9kVT8R3u5CY3R6nAzXcljVw
 +4eqSPokeeNloZiljF8U3B8=
X-Google-Smtp-Source: ABdhPJyXW+6q1HtTx7gGNEArUG5wO/GVgTCHpdRU24xer0YTUligvGE8cYPkxi2ZA9WIyroCaoI8Zg==
X-Received: by 2002:a7b:c5c8:: with SMTP id n8mr10138110wmk.192.1632640539803; 
 Sun, 26 Sep 2021 00:15:39 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id m29sm13406901wrb.89.2021.09.26.00.15.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 00:15:39 -0700 (PDT)
Message-ID: <8fb1e344-a31d-02cf-edf8-fe775d3dc307@amsat.org>
Date: Sun, 26 Sep 2021 09:15:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v6 26/30] tcg/loongarch64: Implement tcg_target_init
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210925173032.2434906-1-git@xen0n.name>
 <20210925173032.2434906-27-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210925173032.2434906-27-git@xen0n.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.039,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
 XiaoJuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/25/21 19:30, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/loongarch64/tcg-target.c.inc | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)

> +static void tcg_target_init(TCGContext *s)
> +{
> +    tcg_target_available_regs[TCG_TYPE_I32] = ALL_GENERAL_REGS;
> +    tcg_target_available_regs[TCG_TYPE_I64] = ALL_GENERAL_REGS;
> +
> +    tcg_target_call_clobber_regs = ALL_GENERAL_REGS;

If you plan to add support for vector registers later, I think it is
safer to start today with:

       tcg_target_call_clobber_regs = -1ull;

> +    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S0);
> +    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S1);
> +    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S2);
> +    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S3);
> +    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S4);
> +    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S5);
> +    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S6);
> +    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S7);
> +    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S8);
> +    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S9);
> +
> +    s->reserved_regs = 0;
> +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_ZERO);
> +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP0);
> +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP1);
> +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP2);
> +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_SP);
> +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TP);
> +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_RESERVED);
> +}
> 

Conditional on using -1 to initialize:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

