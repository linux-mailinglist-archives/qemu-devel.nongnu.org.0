Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D18E14908B9
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 13:31:24 +0100 (CET)
Received: from localhost ([::1]:54800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9RAL-0005MB-4D
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 07:31:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9R6m-0002dx-6i; Mon, 17 Jan 2022 07:27:36 -0500
Received: from [2a00:1450:4864:20::32c] (port=50902
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9R6k-0007se-Az; Mon, 17 Jan 2022 07:27:35 -0500
Received: by mail-wm1-x32c.google.com with SMTP id w26so19974707wmi.0;
 Mon, 17 Jan 2022 04:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GnX53MrZvincwz9JdkrvjmI09MWRx1r078gan7qeNjI=;
 b=koWFFzax93kXsPc2+nL86gOJV8HUj1Bd5Lbt7RFpUeYEuCk82bgvlTTrarWF9o6Xpw
 CI/TWRBQw2MIKD5RpxzjTvM+v3Mmo7u8YqIuItZpGp6RGFqXkSwWk5RBCk8QRBaD8WyX
 VBu47VGT5ZPoM3mgizxcNzTlJpFcQmi9Ct+0N8VCUB2o0WVjTqz7O1FpGVqC9SFi7VLa
 GBUN0FI1JDQT3sJQTlAHOTFAihs1D/S4D+YO+R5wh0fnBaOcRMo8jsattGaTW26Rv9/v
 HdiX5VvKWojoAN8ZhjE5vN1YsEB0319HCHIgLwDpTuDzm/Qp1AgVS5pxMK84hvjAVWMH
 bcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GnX53MrZvincwz9JdkrvjmI09MWRx1r078gan7qeNjI=;
 b=JVivt/2SX9nsJinm309EP/Sxi6+Te0JDNq4dTZwlX9yv/rT9fA1sqfvCdnftpkkkF4
 2nyEcZO9dffVXLYonBRJ7HgOJs+9PFCCgvW5ovhmmYeh2BWlCdcDWloByWP+P+AcW0b5
 kYAEYk+PDpB1MJ7Iugcfgonc+KAGaTGYGvjDzIBRpODAJ0ztxuo0ia/1b0L7/lquxJlt
 iwFSD3dv8j/Yo0Z05XKbsueij5EpKpql8esEd7Ufde609UYALnrez1GT9axT3/wdes+h
 /gZ3wahDE3pWqYGLfv5QT/yTHBtIRfc0f1BpmTpboKlwuL6aFMIyjJn/mBUsp1DOxlwE
 JTpA==
X-Gm-Message-State: AOAM533akva3VBHYXlrJvlAynN9NMExxZV3ZOoYhMtYyk9Q8PTjOAdVl
 U+7yw/ATJbAdFToDWhsxjhY=
X-Google-Smtp-Source: ABdhPJz87um2sYJ6OvTM0/OvuPq/Y6Pabx25ClP+1GFk/rVn/hPvcO0awHGT1xCd/axZbJEwB+qx4w==
X-Received: by 2002:a05:600c:154c:: with SMTP id
 f12mr24083041wmg.126.1642422452597; 
 Mon, 17 Jan 2022 04:27:32 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id i11sm12892722wrn.59.2022.01.17.04.27.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 04:27:32 -0800 (PST)
Message-ID: <4918a992-3903-6b78-c43e-76a487b651f5@amsat.org>
Date: Mon, 17 Jan 2022 13:27:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH 3/6] hw/arm: wire-up memory from the Pico board and
 the SoC
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20220110175104.2908956-1-alex.bennee@linaro.org>
 <20220110175104.2908956-4-alex.bennee@linaro.org>
In-Reply-To: <20220110175104.2908956-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/10/22 18:51, Alex Bennée wrote:
> All the memory aside from the external flash is a feature of the SoC
> itself. However the flash is part of the board and different RP2040
> boards can choose to wire up different amounts of it.
> 
> For now add unimplemented devices for all the rp2040 peripheral
> blocks. Before we can boot more of the ROM we will need to model at
> least the SIO and CLOCKS blocks.
> 
> For now CPU#1 starts disabled as it needs a working CPUID register so
> it can identify itself before sleeping.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/hw/arm/rp2040.h |   9 +++-
>  hw/arm/raspi_pico.c     |  20 +++++++
>  hw/arm/rp2040.c         | 113 ++++++++++++++++++++++++++++++++++++++--
>  3 files changed, 137 insertions(+), 5 deletions(-)

> +static Property rp2040_soc_properties[] = {
> +    DEFINE_PROP_LINK("memory", RP2040State, memory, TYPE_MEMORY_REGION,
> +                     MemoryRegion *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  static void rp2040_class_init(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(oc);
> @@ -61,14 +167,13 @@ static void rp2040_class_init(ObjectClass *oc, void *data)
>  
>      bc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m0");
>      dc->realize = rp2040_realize;
> -    /* any props? */
> +    device_class_set_props(dc, rp2040_soc_properties);
>  };
>  
>  static const TypeInfo rp2040_types[] = {
>      {
>          .name           = TYPE_RP2040,
> -        /* .parent         = TYPE_SYS_BUS_DEVICE, */
> -        .parent         = TYPE_DEVICE,
> +        .parent         = TYPE_SYS_BUS_DEVICE,
>          .instance_size  = sizeof(RP2040State),
>          .instance_init  = rp2040_init,
>          .class_size     = sizeof(RP2040Class),

Squash that in patch #1 without any MemoryRegion property?

