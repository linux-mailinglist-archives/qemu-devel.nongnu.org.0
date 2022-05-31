Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 616F2538C5B
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 09:57:56 +0200 (CEST)
Received: from localhost ([::1]:57644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvwlH-0004i6-08
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 03:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvwi0-0003wG-FQ; Tue, 31 May 2022 03:54:32 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:36675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvwhv-0001iz-4n; Tue, 31 May 2022 03:54:32 -0400
Received: by mail-pl1-x62a.google.com with SMTP id u18so5994925plb.3;
 Tue, 31 May 2022 00:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E/VjZs7NLUGu3kYgf4nLXOfmwuZzQrDH3rYw9is3F6s=;
 b=BNgoqDva3CSYtgGTLkPreFAr1gA8bZBfGryHXLl2FwPXjUuVRNWYXI2EPyI+l1buId
 C2VCqhwAdL+DdGJ7uttgWJw5PeK+jWYINQNkpXAtCLm1iWfkiM4Urw2Y1R2Lo0ehH0qL
 NIYNpDBFWhrGOSypFV6V/ogKHK1PsUlPFmDtFIgXZr1/A1drje4gVm8rCA4yfgrcYfcK
 DnWqC9FHKEARMv2ynBVejGbAHmYNtsz9zn7h+sJbUVA+z0NmKhPd2HG63zpEb5XweBh0
 fCM+etKuytvDfj3H5eDkMkmgVApD3pUZEBM6umlk+W8O7jME8BRzv/Eo3f2ANruCPtIf
 5tGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E/VjZs7NLUGu3kYgf4nLXOfmwuZzQrDH3rYw9is3F6s=;
 b=zmCuLjXdOc1R23gPWu/wsdmDUoKXH8B3kKf2IDsHv4hK19MsStHbx4sed1Cv6QEWrD
 EK2ZR4sY3+35FFXLBQsOs4TSMNz4IRRik5HKi2fDef30+rcgb2ijsnYHyD7kz8pcUiiz
 1M4o158kk0cSR8nRLggMf7k8gronFXlyDpPwLsCknSHO2fnyQXWLWzn0EEtHAXQSLvH8
 2DWPY2tIQEtxx/nFTwlwNYxGnqqlctOfrw44I6Q/D/FS0wK/l4zK5FZNFzCds1DppcIg
 GdGQq5bYgqtCqQp8BFnLdyCqyAC/NTVNPXZHrWqqe20Z6Z//QwUiL9euuqroWuzq7mNT
 5F+w==
X-Gm-Message-State: AOAM530AuxsDdEUdrDh/uF5C/spC0sr8yhfRvwllrdEtj05858gKJhzM
 dJQGda0FqvTP170eA6lhMhuS6jYLLUA=
X-Google-Smtp-Source: ABdhPJxB/qqs21r7x7L0zZCUYTCFRJf+psgam4GV8gGVKyA8roYs4U4TTXzXvl9J4xnG9tAg8qF9/Q==
X-Received: by 2002:a17:903:186:b0:161:f394:3e75 with SMTP id
 z6-20020a170903018600b00161f3943e75mr53136270plg.113.1653983665179; 
 Tue, 31 May 2022 00:54:25 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v129-20020a626187000000b0050dc762814asm10147973pfb.36.2022.05.31.00.54.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 00:54:24 -0700 (PDT)
Message-ID: <a652e973-8166-8d9b-adfa-2ac08c6dc770@amsat.org>
Date: Tue, 31 May 2022 09:54:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v2 14/25] hw/sd: Basis for eMMC support
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
 <20220530193816.45841-15-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220530193816.45841-15-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On 30/5/22 21:38, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>

I missed something during the cherry-pick, this should be:

From: Cédric Le Goater <clg@kaod.org>

> The initial eMMC support from Vincent Palatin was largely reworked to
> match the current SD framework.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> TODO: Do not inherit TYPE_SD_CARD, duplicate sd_class_init()
> ---
>   hw/sd/sd.c         | 42 ++++++++++++++++++++++++++++++++++++++++++
>   include/hw/sd/sd.h |  3 +++
>   2 files changed, 45 insertions(+)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index b2f16dbb73..8b178aa261 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -2166,6 +2166,19 @@ static const SDProto sd_proto_sd = {
>       },
>   };
>   
> +static const SDProto sd_proto_emmc = {
> +    .name = "eMMC",
> +    .cmd = {
> +        [0]         = sd_cmd_GO_IDLE_STATE,
> +        [5]         = sd_cmd_illegal,
> +        [19]        = sd_cmd_SEND_TUNING_BLOCK,
> +        [41]        = sd_cmd_illegal,
> +        [52 ... 54] = sd_cmd_illegal,
> +        [58]        = sd_cmd_illegal,
> +        [59]        = sd_cmd_illegal,
> +    },
> +};
> +
>   static void sd_instance_init(Object *obj)
>   {
>       SDState *sd = SD_CARD(obj);
> @@ -2284,9 +2297,38 @@ static const TypeInfo sd_info = {
>       .instance_finalize = sd_instance_finalize,
>   };
>   
> +static void emmc_realize(DeviceState *dev, Error **errp)
> +{
> +    SDState *sd = SD_CARD(dev);
> +
> +    if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
> +            error_setg(errp, "Minimum spec for eMMC is v3.01");
> +            return;
> +    }
> +
> +    sd_realize(dev, errp);
> +}
> +
> +static void emmc_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    SDCardClass *sc = SD_CARD_CLASS(klass);
> +
> +    dc->desc = "eMMC";
> +    dc->realize = emmc_realize;
> +    sc->proto = &sd_proto_emmc;
> +}
> +
> +static const TypeInfo emmc_info = {
> +    .name = TYPE_EMMC,
> +    .parent = TYPE_SD_CARD,
> +    .class_init = emmc_class_init,
> + };
> +
>   static void sd_register_types(void)
>   {
>       type_register_static(&sd_info);
> +    type_register_static(&emmc_info);
>   }
>   
>   type_init(sd_register_types)
> diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
> index 0d94e1f346..e52436b7a5 100644
> --- a/include/hw/sd/sd.h
> +++ b/include/hw/sd/sd.h
> @@ -93,6 +93,9 @@ typedef struct {
>   #define TYPE_SD_CARD "sd-card"
>   OBJECT_DECLARE_TYPE(SDState, SDCardClass, SD_CARD)
>   
> +#define TYPE_EMMC "emmc"
> +DECLARE_INSTANCE_CHECKER(SDState, EMMC, TYPE_EMMC)
> +
>   struct SDCardClass {
>       /*< private >*/
>       DeviceClass parent_class;


