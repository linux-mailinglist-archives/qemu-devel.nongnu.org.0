Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FE35380D7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 16:25:45 +0200 (CEST)
Received: from localhost ([::1]:57050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvgL1-0006O9-Tt
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 10:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvgGZ-0003CB-US
 for qemu-devel@nongnu.org; Mon, 30 May 2022 10:21:14 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:36851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvgGY-00077D-Di
 for qemu-devel@nongnu.org; Mon, 30 May 2022 10:21:07 -0400
Received: by mail-pl1-x62d.google.com with SMTP id u18so4286417plb.3
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 07:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rVuXqtYlGrfoUPPcZrvL7DZWBa2nho2ibnmTEGqZ7AE=;
 b=WStQi1Kki+NcLdiNZ9aAJXeF4yroodzGoO4OwYKe4yg8a+UE5uajH2kEX0yVVcZknE
 bcmP93PxnWc4euxZaJ8wbFEnPmjJMGHM0ELLGAJuDlPHwLLxvxnvCx/RyXymsr2ZoiLB
 wuHdFBDpAv2fqyRfR5azCPpogiz2+lk/dS956gautONfKB5WBljacMIZwZpaRBiWIoDV
 097NaRdPbVoIA88Id7hOQk1Vsorsm4gWolxTiCwfrsoVfx75PNwmGnKO6jiDOPaJv120
 8EdXvkyb1c2sYZe3Ug5HiTsXp2tYJjRbpq3njK7tn6qGKPeKVM/wu66y8faHHrQvzX0F
 fVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rVuXqtYlGrfoUPPcZrvL7DZWBa2nho2ibnmTEGqZ7AE=;
 b=ryLeZB6VsuAZIIvcA//bxSMzv2+YWoXi6wPfYbjGWxEg6pMox7IyYsXehuGfVG+XCc
 2FvLSuzLyrYyj27/6FcLKJ+u0lR1LE9m8iPd/zOsjoeupNJZ1igJVCrMNIQwTllTazx9
 PEPJ/4mkSnPSQ01kcE03TEYzo+cNo3juZ9uv46e3hqhuIZmHPb6RN2imEFQfZfxTBQlt
 88wpVC7AVrRKkKx1rUrycIj6LEEZjLof31PiEvdvDGiMPq7xrA/FzSax7KW5aTLkWHd1
 J911ZAmCoaBS2LuEQyGzu952eGjsomAsm7pUZbA+kJGl/ZkPS/NwODy8CjwL1JxQxwge
 dpyA==
X-Gm-Message-State: AOAM530Eo5S4/3BNhfPzOhXhmvGvZMmM8WcCnTfmrzS+Cyd/EV69T1SL
 ZA6XfxPdTQJ1IWaxDNavtHY=
X-Google-Smtp-Source: ABdhPJxFeW1iNDvNtfr8u/6xe3FmzePqhoo8JbIzFDWe90tFKvyS21uqrkJEHbxOztrCRu0bCDzSkg==
X-Received: by 2002:a17:902:9043:b0:14f:aa08:8497 with SMTP id
 w3-20020a170902904300b0014faa088497mr56612211plz.109.1653920464462; 
 Mon, 30 May 2022 07:21:04 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k14-20020aa7998e000000b0050dc76281f2sm8830073pfh.204.2022.05.30.07.21.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 07:21:03 -0700 (PDT)
Message-ID: <b39c0cb8-77e3-c596-d687-5ecac68c7ce3@amsat.org>
Date: Mon, 30 May 2022 16:21:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] target/mips: Fix FTRUNC_S and FTRUNC_U trans helper
Content-Language: en-US
To: nihui <shuizhuyuanluo@126.com>, qemu-devel@nongnu.org
References: <20220503144241.289239-1-shuizhuyuanluo@126.com>
In-Reply-To: <20220503144241.289239-1-shuizhuyuanluo@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 3/5/22 16:42, nihui wrote:
> Fix the FTRUNC_S and FTRUNC_U trans helper problem.
> 
> Signed-off-by: nihui <shuizhuyuanluo@126.com>
> ---
>   target/mips/tcg/msa_translate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
> index 0b3dd0957c..1bcdbb1121 100644
> --- a/target/mips/tcg/msa_translate.c
> +++ b/target/mips/tcg/msa_translate.c
> @@ -752,8 +752,8 @@ static bool trans_msa_2rf(DisasContext *ctx, arg_msa_r *a,
>   }
>   
>   TRANS(FCLASS,   trans_msa_2rf, gen_helper_msa_fclass_df);
> -TRANS(FTRUNC_S, trans_msa_2rf, gen_helper_msa_fclass_df);
> -TRANS(FTRUNC_U, trans_msa_2rf, gen_helper_msa_ftrunc_s_df);
> +TRANS(FTRUNC_S, trans_msa_2rf, gen_helper_msa_ftrunc_s_df);
> +TRANS(FTRUNC_U, trans_msa_2rf, gen_helper_msa_ftrunc_u_df);
>   TRANS(FSQRT,    trans_msa_2rf, gen_helper_msa_fsqrt_df);
>   TRANS(FRSQRT,   trans_msa_2rf, gen_helper_msa_frsqrt_df);
>   TRANS(FRCP,     trans_msa_2rf, gen_helper_msa_frcp_df);

Fixes: 5c5b64000c ("target/mips: Convert MSA 2RF instruction format to 
decodetree")

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Queued.

