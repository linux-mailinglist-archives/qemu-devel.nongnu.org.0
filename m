Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 488B1537A51
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 14:02:42 +0200 (CEST)
Received: from localhost ([::1]:51596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nve6b-00029F-BZ
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 08:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvdjN-0000rG-He; Mon, 30 May 2022 07:38:43 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:39626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvdjK-0003FS-Sj; Mon, 30 May 2022 07:38:41 -0400
Received: by mail-pg1-x52d.google.com with SMTP id q123so4893892pgq.6;
 Mon, 30 May 2022 04:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fhO+vZLDHA7albDwv32BqtMGmy87QnZPPW1NVQ048W4=;
 b=fpmquVJOrCt7CPQ0g0RPe/3ySy9MyEb6uC/BNZM4mltRq2Uil7JyGyEN0i2qCfxdkm
 RnrOiayN6Qz1D8PRSdFNQemhBVuo5H0NZDFn/mQnQYw+zeE5AsaxrRlAN8EVkUKPJ5Ab
 aK98asP6ag4btzcJFw8TfPCR9VvmVswIhJGR6tu1TRtnjvL3UbjJCb/hveee0y3Q2nRD
 vEXqleq2EheDZy0+QLKADaus0cS4tIZuLW6kz8de4Z+H3ReCyfFTFScg9pAVLwlReFiS
 9xlalIAfdWqqLNC4Z2vQTofyEAV/slHxBiXtovHmwL81V9XWgc1QhZUdGcHVkpvmX0Ds
 Pddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fhO+vZLDHA7albDwv32BqtMGmy87QnZPPW1NVQ048W4=;
 b=jLjfeyvqTkHkJKMT2l1xeUBxv2+fVt+B+2fOYmB/21gWk1ddbdy1lPuTWgFQv1XkIF
 I6cdUPD7pMmLtc/hgYHFQyuwpzj8RvQG+I4vCnVoB9rSOwSFdKy7fKUZyatyf60z/fS+
 h939akRfFXx2RBXHaHDvwn30aaAHNrF46n2z9x0orW83HHVwSx1BkRgiiAEewIIqN1tS
 6WmsBFCRD+mURAwFQbn2bCyAEsH50pJgQsUcFOF40dwNfkn/USxr+TYjlFDAcSNv1aVZ
 QBWiJfilyY4C3BaRNTvWPToKJllA/FJZwNat7j9nP+5gPZWzEatC/z3gcW5Jcxl2PP1b
 niKA==
X-Gm-Message-State: AOAM531mcA5fm6k2NSSMcXl01FfriGQcALX9ZOOMmHxLfoashDFFEDSA
 x2eiY7Wjw8oQDXtoeCtSbhE=
X-Google-Smtp-Source: ABdhPJwVDvMybIBhhizPld0xpz6bEUzmhUI7C5zaHM7IR5Qir8+7Klf84jhF8eMcXBoSu2L2q9XTFw==
X-Received: by 2002:a62:1dcc:0:b0:519:17be:89be with SMTP id
 d195-20020a621dcc000000b0051917be89bemr20799189pfd.30.1653910714935; 
 Mon, 30 May 2022 04:38:34 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ie17-20020a17090b401100b001e31474c0c1sm1300151pjb.47.2022.05.30.04.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 04:38:34 -0700 (PDT)
Message-ID: <80574d02-8434-db8f-ab1b-61c530cb12ea@amsat.org>
Date: Mon, 30 May 2022 13:38:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v3 2/7] hw/isa/piix4: Use object_initialize_child() for
 embedded struct
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20220528192057.30910-1-shentey@gmail.com>
 <20220528192057.30910-3-shentey@gmail.com>
In-Reply-To: <20220528192057.30910-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52d.google.com
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

On 28/5/22 21:20, Bernhard Beschow wrote:
> Found-by: Peter Maydell <peter.maydell@linaro.org>

I suppose you refer to this thread:
https://lore.kernel.org/qemu-devel/CAFEAcA_y69=iXMH75dHeNkxMa038Z7Xk63GW9fdcAFHJSWS=sA@mail.gmail.com/

I'm going to change the tag to "Reported-by".

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix4.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index 9a6d981037..1d04fb6a55 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -224,7 +224,7 @@ static void piix4_init(Object *obj)
>   {
>       PIIX4State *s = PIIX4_PCI_DEVICE(obj);
>   
> -    object_initialize(&s->rtc, sizeof(s->rtc), TYPE_MC146818_RTC);
> +    object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
>   }
>   
>   static void piix4_class_init(ObjectClass *klass, void *data)

