Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B45A9573D90
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 22:07:18 +0200 (CEST)
Received: from localhost ([::1]:47500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBidh-0003Cj-MB
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 16:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oBicR-0001iS-Fs; Wed, 13 Jul 2022 16:05:59 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:46874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oBicP-0003Gg-Tr; Wed, 13 Jul 2022 16:05:59 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1013ecaf7e0so15356113fac.13; 
 Wed, 13 Jul 2022 13:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GAqfgMkKW2nIE0HEh9X9FRtdIUtXgNbZ78b9tJC6tEY=;
 b=KEGVhvzUPG0wEb7Ai8d45vPc0oX5Ylo6IvLUIviemj6kOcv9E24Q91qfSPPmHrPTPT
 +uHCGH6ACn2M6CMSq35OuTLntKeI/oIXveRBYvioqJ1ibPz/UHEOW1KCmny+LsOawEIh
 737j4HcuN5bXl78ebcV60g2GoQ6vGOq1kVsaEf9OGDYwjI3ieIhPDMh6gBQIWDjE/N5+
 PhIFTZGwLbWo5wZ/vUKgc+szf0zOpVAl8fHBOBKmDnEf0xUertLprVFQuG7OwohWK5Nl
 2MxtS1lPe8SiQlD0jGRFKbBTFZkpkMORSiSqI7aCySr/OCWZEYFCf84rw47AViMworlw
 XmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GAqfgMkKW2nIE0HEh9X9FRtdIUtXgNbZ78b9tJC6tEY=;
 b=g30nMpjbbYGkuqcmG0+SoanIC9q5Tf3mdcM0g/Gwa6z+FCsBGcPS+6blD87O8gIcUr
 3azdBGv4cXVnjsuHt6pK8bxdQdcLoZ0C71347i8/KFThmvU3aQdZepMVFI+JO5i08bKC
 xZ1vsKPn+2fC9IMh//QEmgYmQGGzf2Rzs1BleAj5skBcbZRQ1GWfpsHJnQKnxLA3ll1Q
 cld6/1b+uXs9iGuuyF/5MTVoBLgLhY9YWGKJHXSR/0l4w3BHz27FE9Is6rTyB/Tx9qW1
 oPVSQFD3mY1Z0TTWeUFCfAN56xfYER/hUz4ELS0VcFWwN72JPvMPwpD8NxLe2VC6tlfJ
 BWmA==
X-Gm-Message-State: AJIora89/0RYb/tZEB9J2K/Oxt4praW5a5g0m8V8yd2NeDc8VlgwTiv4
 ouwjdOhsdNtw6o4qPIm/wAU=
X-Google-Smtp-Source: AGRyM1tA3PbIFlUml5bLWzaOW8A+X2GQR1dXlFXsTF55jufg9kooKAAq5hXm081EBIyHbUYu23+1VQ==
X-Received: by 2002:a05:6870:c10f:b0:10c:f0e:fd2a with SMTP id
 f15-20020a056870c10f00b0010c0f0efd2amr2736977oad.84.1657742756103; 
 Wed, 13 Jul 2022 13:05:56 -0700 (PDT)
Received: from [192.168.10.102] (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 p203-20020acaf1d4000000b0032b99637366sm5629707oih.25.2022.07.13.13.05.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jul 2022 13:05:55 -0700 (PDT)
Message-ID: <c0324023-1fbb-f7de-f9d3-a8a1722da14e@gmail.com>
Date: Wed, 13 Jul 2022 17:05:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/6] target/ppc: fix exception error value in slbfee
Content-Language: en-US
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 farosas@linux.ibm.com, laurent@vivier.eu
References: <20220627141104.669152-1-matheus.ferst@eldorado.org.br>
 <20220627141104.669152-3-matheus.ferst@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220627141104.669152-3-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
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
> Testing on a POWER9 DD2.3, we observed that the Linux kernel delivers a
> signal with si_code ILL_PRVOPC (5) when a userspace application tries to
> use slbfee. To obtain this behavior on linux-user, we should use
> POWERPC_EXCP_PRIV with POWERPC_EXCP_PRIV_OPC.
> 
> No functional change is intended for softmmu targets as
> gen_hvpriv_exception uses the same 'exception' argument
> (POWERPC_EXCP_HV_EMU) for raise_exception_*, and the powerpc_excp_*
> methods do not use lower bits of the exception error code when handling
> POWERPC_EXCP_{INVAL,PRIV}.
> 
> Reported-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/translate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 55f34eb490..d7e5670c20 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -5386,12 +5386,12 @@ static void gen_slbmfev(DisasContext *ctx)
>   static void gen_slbfee_(DisasContext *ctx)
>   {
>   #if defined(CONFIG_USER_ONLY)
> -    gen_inval_exception(ctx, POWERPC_EXCP_PRIV_REG);
> +    gen_hvpriv_exception(ctx, POWERPC_EXCP_PRIV_OPC);
>   #else
>       TCGLabel *l1, *l2;
>   
>       if (unlikely(ctx->pr)) {
> -        gen_inval_exception(ctx, POWERPC_EXCP_PRIV_REG);
> +        gen_hvpriv_exception(ctx, POWERPC_EXCP_PRIV_OPC);
>           return;
>       }
>       gen_helper_find_slb_vsid(cpu_gpr[rS(ctx->opcode)], cpu_env,

