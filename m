Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 622A76A2810
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:03:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqRn-0005qx-3i; Sat, 25 Feb 2023 04:02:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pVqRP-0005dc-RO; Sat, 25 Feb 2023 04:02:05 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pVqRN-0005P0-3Y; Sat, 25 Feb 2023 04:02:02 -0500
Received: by mail-oi1-x22f.google.com with SMTP id e21so1376227oie.1;
 Sat, 25 Feb 2023 01:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N/YLTCV+ZtB2HCmouUoHMzOT9BBIbImxaF3ijSEvXp4=;
 b=qzMwfRxP313bAkXKusGcZNzE3Visw84G5NdmNIoDyDJ/18keJy8ODfPXCRdYBBZELx
 lebyeffPnfWLHKk3nUGJGuT9K4YgsYcROTsrm7ljwIqJg+PsH58AoDfeAYEZXLHhFT90
 4GBa7Oe9gQLKuKGOXwc94MmkRg4FvWaH7w3+uz6gbT2Jp/EFVIp9HnmYHZwtu7KNhx+Q
 DywqhY3cfqjli5U7MON/vaXUWGHWeHDwq/k754PBfCyxGzqiU34nefebrY3vIGFmwnc+
 UmATSnT83mYWAgDn83ePmmiFVj1gnE+5b4jGVz207FuFd1i8Tys8fLIKXX/Ue7P8nV0J
 TX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N/YLTCV+ZtB2HCmouUoHMzOT9BBIbImxaF3ijSEvXp4=;
 b=AlsMT0ywrl+SBwbR9EzEZstKIPIKH1VdYTUOjYJi8Lyliut3sVN1Ucg+G3PIpJxSiL
 mxAIdpsYlasKHqYgN430k1nNc6zwo2mkG3wIedxQtJCp4kFLxs6k0gNGWdydNx5w3UK7
 nL4TS5/XsOSdcU1rki+w2PHTQ8fWzvlf+BtR/cDwQEd1zWiyzs9fb/WjBEXwJPqcX+IC
 rbwtszPA/1c1r1+Q+YJR20uZzyMGgGH6+naCQBbHheLqfnBMlM9CbiyZkDZsyQ8UJrEo
 17wJB+/h1ly0zcIKtHiqR+lM9qKaxrcjaJlcYBbdLzhzrz3FrsWjuOK9EW8Jfdbp7Ady
 1hIQ==
X-Gm-Message-State: AO0yUKVQSl/hUkTWe58lo3r0TWCSl8D6yw/X3JgnqXKVC+F14JfxPMhQ
 34kHTnX0sQKXuDMUMcK9cPjgywZoJ1E=
X-Google-Smtp-Source: AK7set8/S+R66dCFxbSnt+dSwErNdNjInbMqMkKz6JfqUDxsU7Abf39geOQvH5OcSkTMD29TZ1oyUw==
X-Received: by 2002:aca:2b0b:0:b0:383:fb1f:e44f with SMTP id
 i11-20020aca2b0b000000b00383fb1fe44fmr2164081oik.24.1677315719586; 
 Sat, 25 Feb 2023 01:01:59 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 p129-20020acaf187000000b0038413a012dasm348108oih.4.2023.02.25.01.01.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 01:01:59 -0800 (PST)
Message-ID: <e9f21a6f-aecb-5cf0-e9fa-1afe6ac6ea88@gmail.com>
Date: Sat, 25 Feb 2023 06:01:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] target/ppc/translate: Add dummy implementation for dcblc
 instruction
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
References: <20230130184950.5241-1-shentey@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230130184950.5241-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 1/30/23 15:49, Bernhard Beschow wrote:
> The dcblc instruction is used by u-boot in mpc85xx/start.S. Without it,
> an illegal istruction exception is generated very early in the boot
> process where the processor is not yet able to handle exceptions. See:
> 
> https://github.com/u-boot/u-boot/blob/v2023.01/arch/powerpc/cpu/mpc85xx/start.S#L1840
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


And queued to ppc-next. Thanks,


Daniel

>   target/ppc/translate.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index edb3daa9b5..8c32e697d9 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -5261,6 +5261,14 @@ static void gen_dcbtls(DisasContext *ctx)
>       tcg_temp_free(t0);
>   }
>   
> +/* dcblc */
> +static void gen_dcblc(DisasContext *ctx)
> +{
> +    /*
> +     * interpreted as no-op
> +     */
> +}
> +
>   /* dcbz */
>   static void gen_dcbz(DisasContext *ctx)
>   {
> @@ -6832,6 +6840,7 @@ GEN_HANDLER_E(dcbtep, 0x1F, 0x1F, 0x09, 0x00000001, PPC_NONE, PPC2_BOOKE206),
>   GEN_HANDLER(dcbtst, 0x1F, 0x16, 0x07, 0x00000001, PPC_CACHE),
>   GEN_HANDLER_E(dcbtstep, 0x1F, 0x1F, 0x07, 0x00000001, PPC_NONE, PPC2_BOOKE206),
>   GEN_HANDLER_E(dcbtls, 0x1F, 0x06, 0x05, 0x02000001, PPC_BOOKE, PPC2_BOOKE206),
> +GEN_HANDLER_E(dcblc, 0x1F, 0x06, 0x0c, 0x02000001, PPC_BOOKE, PPC2_BOOKE206),
>   GEN_HANDLER(dcbz, 0x1F, 0x16, 0x1F, 0x03C00001, PPC_CACHE_DCBZ),
>   GEN_HANDLER_E(dcbzep, 0x1F, 0x1F, 0x1F, 0x03C00001, PPC_NONE, PPC2_BOOKE206),
>   GEN_HANDLER(dst, 0x1F, 0x16, 0x0A, 0x01800001, PPC_ALTIVEC),

