Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090D553A913
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 16:23:26 +0200 (CEST)
Received: from localhost ([::1]:42514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwPFs-00005F-HM
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 10:23:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nwPED-0007dy-JX; Wed, 01 Jun 2022 10:21:41 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nwPEC-0000qV-07; Wed, 01 Jun 2022 10:21:41 -0400
Received: by mail-wr1-x436.google.com with SMTP id t6so2594956wra.4;
 Wed, 01 Jun 2022 07:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x3KlGq2dfA8Wz8DxMYol/+JMkMuX6W/QyUylqa7MlM0=;
 b=j61akj6urnq+EBjh6/pu/mSUs1smDIn7YVFv5ZDvSruORoc3Fn1KA3W39AwX4mvu5w
 H5OGJ4Kwi/TNSoyHzdZDHSv4XD3wlhEXMB2ApB9DnerVToiCepOfcxWNbzcjDZxpk31D
 H65/L1eM9iEJCMYrVBpwxAdGjqU2ZMw5jiOd2A/9u4r6STFJsEZjmd/Yo3UKP80YxX+C
 LWqmlILRYLdl3Wits1pyX8dGSXlcNNlC0Ioqb5hwyxX+sjKT+WbopRPuK9rxHGXSvVRW
 H9KJdvl+NYSP0Ok/AmwZqiuOZXbayRJFlZal2KDgJf9a94OG/wlhBwUohnzxacbRIwSM
 mJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x3KlGq2dfA8Wz8DxMYol/+JMkMuX6W/QyUylqa7MlM0=;
 b=qe9HPYkZQXBd67Ew5EH++RUcIaNd5Xu3T9a7DWzTb98gjUVsqESlGGLQy4yPm/7S/E
 hBWAiTazcjEM1oKUBMbGuemg+6u17jdikSBe3dP6EFM3+HVrViltRUpdT1St39AfDt5W
 WTy40MxuzUxrOcAtOMWBlx4w8d8CdksaU9i/FiYz+oI5vlQ3uB8AbHvkMkAxLZ5IyGhG
 9XHdFS8CvnA9Yv5nzUutTRUBMMdAHZsfNYfIrdb0AI7FpNOHqIB00pOmtiM7ehRY6MJe
 Xji4H+yqVPPUNj5KWIyfEeQedhIl+GobMGZBZhkrw4XQ2CHhLoS39Yqb2B9XmDsY9Sje
 zmWw==
X-Gm-Message-State: AOAM530TV8iOpoVp/McH1TA6d6L1wkHSAs3mD3a6fNmIKMf4Vdfrc1WQ
 i6if/1M+a8jGdCY4aU5HtG8=
X-Google-Smtp-Source: ABdhPJyboJyOfqYmFypJrraP5gS7T6453Kk0t7X7G0VeqQdke0TLewPV478Q/MqCiRjmx/qAUD8uwQ==
X-Received: by 2002:a5d:64e9:0:b0:20f:dcf7:2173 with SMTP id
 g9-20020a5d64e9000000b0020fdcf72173mr54511wri.332.1654093298091; 
 Wed, 01 Jun 2022 07:21:38 -0700 (PDT)
Received: from [192.168.1.82] (26.red-83-50-226.dynamicip.rima-tde.net.
 [83.50.226.26]) by smtp.gmail.com with ESMTPSA id
 c6-20020adffb46000000b0020c5253d90asm1782496wrs.86.2022.06.01.07.21.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 07:21:37 -0700 (PDT)
Message-ID: <ffe922c2-f833-cce4-2da4-03fac5fb458c@amsat.org>
Date: Wed, 1 Jun 2022 16:21:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] target/ppc: fix vbpermd in big endian hosts
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20220601125355.1266165-1-matheus.ferst@eldorado.org.br>
In-Reply-To: <20220601125355.1266165-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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

+Mark for commit ef96e3ae96.

On 1/6/22 14:53, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> The extract64 arguments are not endian dependent as they are only used
> for bitwise operations. The current behavior in little-endian hosts is
> correct; since the indexes in VRB are in PowerISA-ordering, we should
> always invert the value before calling extract64. Also, using the VsrD
> macro, we can have a single EXTRACT_BIT definition for big and
> little-endian with the correct behavior.
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
> Found this bug while refactoring VECTOR_FOR_INORDER_I uses. The
> complete patch series will also use Vsr[DB] instead of VBPERM[DQ]_INDEX,
> but it will need more testing. For now, we're just changing what is
> necessary to fix the instruction.
> ---
>   target/ppc/int_helper.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
> index 105b626d1b..4c5d3f03f8 100644
> --- a/target/ppc/int_helper.c
> +++ b/target/ppc/int_helper.c
> @@ -1307,14 +1307,13 @@ XXGENPCV(XXGENPCVDM, 8)
>   #define VBPERMQ_INDEX(avr, i) ((avr)->u8[(i)])
>   #define VBPERMD_INDEX(i) (i)
>   #define VBPERMQ_DW(index) (((index) & 0x40) != 0)
> -#define EXTRACT_BIT(avr, i, index) (extract64((avr)->u64[i], index, 1))
>   #else
>   #define VBPERMQ_INDEX(avr, i) ((avr)->u8[15 - (i)])
>   #define VBPERMD_INDEX(i) (1 - i)
>   #define VBPERMQ_DW(index) (((index) & 0x40) == 0)
> -#define EXTRACT_BIT(avr, i, index) \
> -        (extract64((avr)->u64[1 - i], 63 - index, 1))
>   #endif
> +#define EXTRACT_BIT(avr, i, index) \
> +        (extract64((avr)->VsrD(i), 63 - index, 1))
>   
>   void helper_vbpermd(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
>   {


