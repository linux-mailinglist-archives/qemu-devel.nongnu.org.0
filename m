Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC24C4908A3
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 13:24:48 +0100 (CET)
Received: from localhost ([::1]:45636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9R43-00074X-7H
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 07:24:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9R1C-0005jH-68; Mon, 17 Jan 2022 07:21:50 -0500
Received: from [2a00:1450:4864:20::335] (port=55261
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9R1A-00078x-La; Mon, 17 Jan 2022 07:21:49 -0500
Received: by mail-wm1-x335.google.com with SMTP id p18so19893657wmg.4;
 Mon, 17 Jan 2022 04:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rK9Fe1fH7RSzwBZFU+10CX2jXM+Nqy46itEBsEjO1Aw=;
 b=FmhbTD0eT+2xV4/TmGf++4f3LETUvpoQgXvSId3fErMQ9RlS5nSrYFO//cnmzFMZxo
 I99tURXQo7n048dkyS2cn6rRF6Ig3HGOOp680gaIuxIXrD6aPgQH6d7CYng2H+WPYPCw
 NzMghbjsnu7hoVlDjz1sxaFEuwSL1+gP+bP8imYE9bzjpYE9w8OytlJp80FyZ1Ck9SXg
 tgAlqjFRcG+kcCGWk7NWheHZORmOMGxJxn32uatXZ7BhemZQYSJ2dzrud3i6QqedKmfl
 MKMtWX8fexFmov3oGuANemD10pImC2TyqBwSPC8cr9dUk7JLCwbOJcwnHpQ9hfCio8Ec
 /tgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rK9Fe1fH7RSzwBZFU+10CX2jXM+Nqy46itEBsEjO1Aw=;
 b=hcjOYsJm2Dv1a01G6hhHTXvOBfn6Du3wuJdraFA23LPxR38XcsBX1UYoyOuplpLZ85
 vFJBRUSra7hFcquaMoVixX5tg+3gEPrqdxXF//axANTaYaw+nVMq+DIh1Y2a4DduYc1J
 n36T9u6eaLWEBGd19qCG9DF9P53S2HyHvm2bQoEB9C+mW2VuYce8ttzlYF2syQI2ZbzO
 vzHegkrK08uSunhZGPBtvT5eCI6VKD1wsMhetcnu3OofIDJH4S8xWbxlkVC0YFjnwmGa
 gVquQcH0xjQ38CTk5Xfo4b+fSUtaftd/d/yyQ8QbweKIJLkoFuxJKDrUXenIDi6Lk9bH
 cxIw==
X-Gm-Message-State: AOAM5331OOe+7c3mk+q0tsUIRj35zuiSQqLezb9pQy7P0ILom4FyCJcz
 DZ7g5gDO6t99i05zJ+i6b98=
X-Google-Smtp-Source: ABdhPJxE6jfL3Oggewo+M/AR9DQ1ixElG1rH6NlXoFQK6BoSp/kBkOdXy+qX+O9ZScvtHvFGDygFRg==
X-Received: by 2002:a1c:f613:: with SMTP id w19mr26746922wmc.58.1642422106918; 
 Mon, 17 Jan 2022 04:21:46 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id a24sm13186756wrc.114.2022.01.17.04.21.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 04:21:46 -0800 (PST)
Message-ID: <f0d75702-1ebf-f896-335f-9bbbd8dbfbfd@amsat.org>
Date: Mon, 17 Jan 2022 13:21:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH 1/6] hw/arm: arm initial boilerplate for RP2040 SoC
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20220110175104.2908956-1-alex.bennee@linaro.org>
 <20220110175104.2908956-2-alex.bennee@linaro.org>
In-Reply-To: <20220110175104.2908956-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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

On 1/10/22 18:50, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  configs/devices/arm-softmmu/default.mak |  1 +
>  include/hw/arm/rp2040.h                 | 32 ++++++++++
>  hw/arm/rp2040.c                         | 79 +++++++++++++++++++++++++
>  hw/arm/Kconfig                          |  3 +
>  hw/arm/meson.build                      |  1 +
>  5 files changed, 116 insertions(+)
>  create mode 100644 include/hw/arm/rp2040.h
>  create mode 100644 hw/arm/rp2040.c

> +static void rp2040_realize(DeviceState *dev, Error **errp)
> +{
> +    RP2040State *s = RP2040(dev);
> +    Object *obj = OBJECT(dev);
> +    int n;
> +
> +    for (n = 0; n < RP2040_NCPUS; n++) {
> +        Object *cpuobj = OBJECT(&s->armv7m[n]);
> +        if (!sysbus_realize(SYS_BUS_DEVICE(cpuobj), errp)) {
> +            return;

Could we ever have the first CPU initialized and the 2nd failing?
Because the error path wouldn't be clean (leaking CPU#0). Maybe
ignore errp and use error_fatal?

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +        }
> +    }
> +}

