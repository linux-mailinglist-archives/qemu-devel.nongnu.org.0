Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1926051BF
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 23:07:39 +0200 (CEST)
Received: from localhost ([::1]:52358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olGHq-00008t-Lb
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 17:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1olGAI-0001sI-T3; Wed, 19 Oct 2022 16:59:50 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:42799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1olGAD-0007zl-K6; Wed, 19 Oct 2022 16:59:50 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-13ae8117023so592241fac.9; 
 Wed, 19 Oct 2022 13:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1ABijYx0GRhtQDcQuIhvr86ZemIiadru8y44JoTeJUM=;
 b=IVSUWoYG5+8+jORVsyZ6hXyGvC6L+eTkY/bTYqbWWvpOr4DYuaSqyEVOb2SEDLbFoO
 by7G4kjAetD3vcws5+/ZVKslemBF8pNxK5sy+0Di7Gws3n6RwW3Zzhs3CygrKXhWkhep
 Z3qnj5uEPP53+QCf/GtyEQi19p+s0CoHbf1Ak0yRGsatsVFc1FST0S9wK7qJpUsRfWny
 BP/VMEmW+zxlUlJc6pVMpfFy8yDelqvRfbmXcW5E8IFdK3v3hAraN1BaUMwrRv4E4SxZ
 st/ta7U2vRT6ZiWxx6PRYbDSYGooFoBIv/SFfmokKpnIlX7MqTmmLga9Ck17xW0y/Hm9
 KilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1ABijYx0GRhtQDcQuIhvr86ZemIiadru8y44JoTeJUM=;
 b=nJjt7o86CruYusPwGn99abetd9mauufx77pIwwsFEC20Qv1RA7wrTd6eu9SIivplHb
 HZ/wWgpZtJKtEbHSHwcuM+xA5DkzCVfCPewP6ey7vhuaonRKsMUYsZm/B4eM7tv5ga4s
 f4KgmdHqT6bxvubX2JWz1UJ8TY6Xmkl7QnJGPdQB1+BBtAY5AUYJ/85qXHT/d6c7IqGj
 BGyyu9c/fv4XtkzrP0O3owiPXmmjnY+BqYbxQRU5sIXzEjXNWqUvZMrwo0S3ipPclZGg
 nqA3iNK01ON5IByWFxG1JhttG/Mvim9CDaR2+35odbgiZkOvgaQ1lvaE0EB9Op+5AuQA
 C+ag==
X-Gm-Message-State: ACrzQf1ejd0MRVl7O0nz/hS4tsi6odrswChw2mP5lnrJx8wfJ/qNFrsU
 T1gKIwxHCIEtyf409oG2s3c=
X-Google-Smtp-Source: AMsMyM6CA8SMuT90b5SNAyMt8jBYxvg2x3eGPAnx5BVBjWY0ksKHx1PHq/f3Yizoc5SVEVU864Cabg==
X-Received: by 2002:a05:6870:7392:b0:131:8d0e:bdb7 with SMTP id
 z18-20020a056870739200b001318d0ebdb7mr6177434oam.274.1666213183010; 
 Wed, 19 Oct 2022 13:59:43 -0700 (PDT)
Received: from [192.168.10.102] ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a05680814c400b003458d346a60sm7175908oiw.25.2022.10.19.13.59.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 13:59:42 -0700 (PDT)
Message-ID: <8c308e1f-6051-2eeb-2e92-473991a60187@gmail.com>
Date: Wed, 19 Oct 2022 17:59:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 6/6] target/ppc: move msgsync to decodetree
Content-Language: en-US
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 farosas@linux.ibm.com
References: <20221006200654.725390-1-matheus.ferst@eldorado.org.br>
 <20221006200654.725390-7-matheus.ferst@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221006200654.725390-7-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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



On 10/6/22 17:06, Matheus Ferst wrote:
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/insn32.decode                       |  1 +
>   target/ppc/translate.c                         | 14 --------------
>   target/ppc/translate/processor-ctrl-impl.c.inc |  9 +++++++++
>   3 files changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index 5ba4a6807d..70a3b4de5e 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -915,3 +915,4 @@ MSGCLR          011111 ----- ----- ..... 0011101110 -   @X_rb
>   MSGSND          011111 ----- ----- ..... 0011001110 -   @X_rb
>   MSGCLRP         011111 ----- ----- ..... 0010101110 -   @X_rb
>   MSGSNDP         011111 ----- ----- ..... 0010001110 -   @X_rb
> +MSGSYNC         011111 ----- ----- ----- 1101110110 -
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 087ab8e69d..f092bbeb8b 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -6239,18 +6239,6 @@ static void gen_icbt_440(DisasContext *ctx)
>        */
>   }
>   
> -/* Embedded.Processor Control */
> -
> -static void gen_msgsync(DisasContext *ctx)
> -{
> -#if defined(CONFIG_USER_ONLY)
> -    GEN_PRIV(ctx);
> -#else
> -    CHK_HV(ctx);
> -#endif /* defined(CONFIG_USER_ONLY) */
> -    /* interpreted as no-op */
> -}
> -
>   #if defined(TARGET_PPC64)
>   static void gen_maddld(DisasContext *ctx)
>   {
> @@ -6853,8 +6841,6 @@ GEN_HANDLER2_E(tlbivax_booke206, "tlbivax", 0x1F, 0x12, 0x18, 0x00000001,
>                  PPC_NONE, PPC2_BOOKE206),
>   GEN_HANDLER2_E(tlbilx_booke206, "tlbilx", 0x1F, 0x12, 0x00, 0x03800001,
>                  PPC_NONE, PPC2_BOOKE206),
> -GEN_HANDLER2_E(msgsync, "msgsync", 0x1F, 0x16, 0x1B, 0x00000000,
> -               PPC_NONE, PPC2_ISA300),
>   GEN_HANDLER(wrtee, 0x1F, 0x03, 0x04, 0x000FFC01, PPC_WRTEE),
>   GEN_HANDLER(wrteei, 0x1F, 0x03, 0x05, 0x000E7C01, PPC_WRTEE),
>   GEN_HANDLER(dlmzb, 0x1F, 0x0E, 0x02, 0x00000000, PPC_440_SPEC),
> diff --git a/target/ppc/translate/processor-ctrl-impl.c.inc b/target/ppc/translate/processor-ctrl-impl.c.inc
> index 3703001f31..021e365a57 100644
> --- a/target/ppc/translate/processor-ctrl-impl.c.inc
> +++ b/target/ppc/translate/processor-ctrl-impl.c.inc
> @@ -92,3 +92,12 @@ static bool trans_MSGSNDP(DisasContext *ctx, arg_X_rb *a)
>   #endif
>       return true;
>   }
> +
> +static bool trans_MSGSYNC(DisasContext *ctx, arg_MSGSYNC *a)
> +{
> +    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
> +    REQUIRE_HV(ctx);
> +
> +    /* interpreted as no-op */
> +    return true;
> +}

