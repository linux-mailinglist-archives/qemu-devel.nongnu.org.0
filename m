Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA83A31B8C5
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:10:22 +0100 (CET)
Received: from localhost ([::1]:56304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBchp-00041I-Pi
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:10:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBcRY-0000sQ-GT; Mon, 15 Feb 2021 06:53:32 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBcRW-0004RF-RB; Mon, 15 Feb 2021 06:53:32 -0500
Received: by mail-wr1-x42f.google.com with SMTP id n4so5530200wrx.1;
 Mon, 15 Feb 2021 03:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BJhumdusHtFHBzsbOG/jymVEW3RVs2aWMPqbq1gytTg=;
 b=W953dX4hXxjrdJnxJ5cPi6CrVl8VwRnlpzv4+KOCOe5kirQkFwIWloUyJ3RtCIDoik
 LWgQyPtaMf82BaJX8sycxIrzTiGYEoIn+eiSG25mgr1L9P9gAOv8T8Fh27iPyJDtf9uC
 hJvSQXePlFV1C+voTnxN+SxAl6L6FdPCpBx+F1jng4p+Bna41heqsO6sX39+Gr7RngkO
 52+r4P+AAUJKe5tQGaE2FiYUwXcBD3wz7JL+vIEJGYc1OEYURB8O3QV9dPfYS1lW/hNY
 nf0/qBFk+Ixt84s5T8/GR8tUU/P++W/f7NWS2Vs1ig46/CUGMe5uWmYneFZmzoXANatK
 Yocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BJhumdusHtFHBzsbOG/jymVEW3RVs2aWMPqbq1gytTg=;
 b=na2GKTGSMFRStPHKhtN0er21/K8CeqotlX6tSbbjfpbZL2IWl7NlbKJCtqOCeEXf5z
 N3q2MelxTxS0Vmp0egReGNi8+BVHEV4ZYghcQx6ayEPwAJf2ijo+bAW7AyNOe+WF1RR1
 dL7Kf5cT7GxN9LMkGxtc8OsP7GTFRVA9m6a1xMlfT+lEI9gejyzdlZ/hqx5O6LTbblt3
 jiA1ONacdEuxXMOSxsPNrAk5KgQtr56NY8VmLebcpi70bJe1JzCUzhCNjHklhSL2HvCR
 9KUcuXsq1pwIz0LOm/NPM0/y5beXUdUdMlDdhJb+fupnNQQRPei838Yvy2GtEPJtecTI
 Wp4w==
X-Gm-Message-State: AOAM530/214bFu8aAzEBFm+h4uNnZElSwwnqYe7Ts+qGMP5DIgj2eULw
 08cNjhGqYt1Zwecfa6Hb6ejcW3KTjYY=
X-Google-Smtp-Source: ABdhPJycocVoXtIO2IACis3Xu8oAddtFdBxNiLkq2c+sxLWfT9EzsEHUYv39pYdo2b8DML7b/J2RdQ==
X-Received: by 2002:adf:ea48:: with SMTP id j8mr18416632wrn.197.1613390008663; 
 Mon, 15 Feb 2021 03:53:28 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 64sm27620857wrc.50.2021.02.15.03.53.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 03:53:28 -0800 (PST)
Subject: Re: [PATCH v2 11/12] spitz: put some Spitz-family devices into the
 correct category
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org
References: <20201130083630.2520597-1-ganqixin@huawei.com>
 <20201130083630.2520597-12-ganqixin@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1b09bc1a-7765-150c-1568-a9f3b2eb5c78@amsat.org>
Date: Mon, 15 Feb 2021 12:53:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20201130083630.2520597-12-ganqixin@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, thuth@redhat.com,
 zhang.zhanghailiang@huawei.com, qemu-trivial@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 11/30/20 9:36 AM, Gan Qixin wrote:
> Some Spitz-family devices have no category, put them into the correct category.
> 
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/spitz.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
> index 32bdeacfd3..0e5e8a4634 100644
> --- a/hw/arm/spitz.c
> +++ b/hw/arm/spitz.c
> @@ -1218,6 +1218,7 @@ static void corgi_ssp_class_init(ObjectClass *klass, void *data)
>      k->realize = corgi_ssp_realize;
>      k->transfer = corgi_ssp_transfer;
>      dc->vmsd = &vmstate_corgi_ssp_regs;
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);

OK.

>  }
>  
>  static const TypeInfo corgi_ssp_info = {
> @@ -1247,6 +1248,7 @@ static void spitz_lcdtg_class_init(ObjectClass *klass, void *data)
>      k->realize = spitz_lcdtg_realize;
>      k->transfer = spitz_lcdtg_transfer;
>      dc->vmsd = &vmstate_spitz_lcdtg_regs;
> +    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);

This is not a display device, but a regulator to
control the display backlight. DEVICE_CATEGORY_MISC
seems more appropriate.

>  }
>  
>  static const TypeInfo spitz_lcdtg_info = {
> 

Regards,

Phil.

