Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B22F455BB7A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 20:05:53 +0200 (CEST)
Received: from localhost ([::1]:57800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5t7Q-0003UM-C4
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 14:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o5t2V-0001yk-L6; Mon, 27 Jun 2022 14:00:47 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:35454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o5t2T-0000ln-LB; Mon, 27 Jun 2022 14:00:47 -0400
Received: by mail-oi1-x22a.google.com with SMTP id r82so5174566oig.2;
 Mon, 27 Jun 2022 11:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NO8oIZC9Sg8rFIBaqlQs9JFhtWvXXDAPjBaAnpWc1Tk=;
 b=p9sAZNXLxbFFMokmtnZDjGG4sXhicSW5p9pWKMkLMZRgRhBBqBnbrIv3vtgvuIsZAv
 h75MsyYa7JGmsYYVYINRsr3zvJBgEWnY0O6McO3OUhpD8njComnNSQxq27jcHBFmqqmf
 3N9+8Ufy1ouNmBZtfUlDf5+ZuQmvdCVqgkpneiEiSfNHk3E2jWtXaAr6ynQEFsEr/goe
 l5EmnyjAV+0AoKRiIElr575DwEj/DfJLQunLO1rWPRsWy2Wgm42cQuX1FNUIq1BR+sbc
 O37cWp61VykHL1tYvP0XGYVeLFGU3aSulDcaditzRoaJwAanlmfXAxMJWmB4RYv7rFtL
 69kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NO8oIZC9Sg8rFIBaqlQs9JFhtWvXXDAPjBaAnpWc1Tk=;
 b=mbuS47sZ5WiEPKVhVlBq5QHGyy6FWjCW6fFf3nwHu+BypQLvi1KiF3jcXBwsrMOXbv
 ifkdwmtcrf0j/nh4PglagXmoLWkLKPzJQ2/jf7rM1P37GCd6/ifVhSXS1yDXZ8K5V3aL
 asMm2IZytepHVD3Hg015fmrMmCZLynKGzSQKMlwNJde8FJblrQsjbjeoXAlfOI1PnEX+
 5i/BIUvVT9knpg5uGtNLY6Mh8BKFf2I3P1HkVdqaBnwjYe8oFPTtQDVzRl8olFkDfLZI
 hp42zzypsIRKK5cmgYfHibufo2PVZdiCG/8NyNqgP/A9diLN+ZIDdRmhwwbvk0D+8Yc/
 H2LA==
X-Gm-Message-State: AJIora90116Cxzh5U4wjyxPYWsMQ4iCvJgZkeKbTbGjyt/m3wZUbRalp
 LVy3sUg8sbWf1crN/Sw64G0=
X-Google-Smtp-Source: AGRyM1sd/YXIKZhE8kGQ0NNb/4rQoc09fX/JzsjpilB68qNNhjDVkfHDWJTLb9wCpyz+6CyE6iJGRw==
X-Received: by 2002:aca:c004:0:b0:32f:2601:b1a6 with SMTP id
 q4-20020acac004000000b0032f2601b1a6mr8945816oif.130.1656352834879; 
 Mon, 27 Jun 2022 11:00:34 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 65-20020a4a1844000000b0042300765d39sm6260449ooo.46.2022.06.27.11.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 11:00:34 -0700 (PDT)
Message-ID: <f3ea7123-ba0f-3955-9f32-af7d13054e39@gmail.com>
Date: Mon, 27 Jun 2022 15:00:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 5/6] target/ppc: fix PMU Group A register read/write
 exceptions
Content-Language: en-US
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 farosas@linux.ibm.com, laurent@vivier.eu
References: <20220627141104.669152-1-matheus.ferst@eldorado.org.br>
 <20220627141104.669152-6-matheus.ferst@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220627141104.669152-6-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/27/22 11:11, Matheus Ferst wrote:
> A call to "gen_(hv)priv_exception" should use POWERPC_EXCP_PRIV_* as the
> 'error' argument instead of POWERPC_EXCP_INVAL_*, and POWERPC_EXCP_FU is
> an exception type, not an exception error code. To correctly set
> FSCR[IC], we should raise Facility Unavailable with this exception type
> and IC value as the error code.
> 
> Fixes: 565cb1096733 ("target/ppc: add user read/write functions for MMCR0")
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/power8-pmu-regs.c.inc | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-regs.c.inc
> index 2bab6cece7..c3cc919ee4 100644
> --- a/target/ppc/power8-pmu-regs.c.inc
> +++ b/target/ppc/power8-pmu-regs.c.inc
> @@ -22,7 +22,7 @@
>   static bool spr_groupA_read_allowed(DisasContext *ctx)
>   {
>       if (!ctx->mmcr0_pmcc0 && ctx->mmcr0_pmcc1) {
> -        gen_hvpriv_exception(ctx, POWERPC_EXCP_FU);
> +        gen_exception_err(ctx, POWERPC_EXCP_FU, FSCR_IC_PMU);
>           return false;
>       }
>   
> @@ -46,10 +46,10 @@ static bool spr_groupA_write_allowed(DisasContext *ctx)
>   
>       if (ctx->mmcr0_pmcc1) {
>           /* PMCC = 0b01 */
> -        gen_hvpriv_exception(ctx, POWERPC_EXCP_FU);
> +        gen_exception_err(ctx, POWERPC_EXCP_FU, FSCR_IC_PMU);
>       } else {
>           /* PMCC = 0b00 */
> -        gen_hvpriv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
> +        gen_hvpriv_exception(ctx, POWERPC_EXCP_PRIV_REG);
>       }
>   
>       return false;
> @@ -214,7 +214,7 @@ void spr_read_PMC56_ureg(DisasContext *ctx, int gprn, int sprn)
>        * Interrupt.
>        */
>       if (ctx->mmcr0_pmcc0 && ctx->mmcr0_pmcc1) {
> -        gen_hvpriv_exception(ctx, POWERPC_EXCP_FU);
> +        gen_exception_err(ctx, POWERPC_EXCP_FU, FSCR_IC_PMU);
>           return;
>       }
>   
> @@ -249,7 +249,7 @@ void spr_write_PMC56_ureg(DisasContext *ctx, int sprn, int gprn)
>        * Interrupt.
>        */
>       if (ctx->mmcr0_pmcc0 && ctx->mmcr0_pmcc1) {
> -        gen_hvpriv_exception(ctx, POWERPC_EXCP_FU);
> +        gen_exception_err(ctx, POWERPC_EXCP_FU, FSCR_IC_PMU);
>           return;
>       }
>   

