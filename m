Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B5A475655
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:28:22 +0100 (CET)
Received: from localhost ([::1]:34176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxRWH-0004JY-UT
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:28:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxRU0-0001xa-Qp; Wed, 15 Dec 2021 05:26:00 -0500
Received: from [2a00:1450:4864:20::32c] (port=37421
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxRTv-0006K6-AL; Wed, 15 Dec 2021 05:25:59 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso18161086wms.2; 
 Wed, 15 Dec 2021 02:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+AA8L+lmPS4Y8CfZ5titB/nnVN7X7WdAbSVCwQErl50=;
 b=awIoh5lWFe7z+GHvRVpSKCrTnBYYuCLtv/GILR/UcmpVQGZU0i5JsVQVztEy3d7U3B
 DInxFOOZPX1wOmAMCToeI7wvqq5TvsTIYoNQe3qrBwzxiJjS79YSdh5xpYlOUHt9Pkgm
 qNwG7/c5rtTkpaMVqf50u7J/dzSHTYJi00Gve85j3loUUwmU/g90VxK4vY/LIIoZO/um
 grZj4s3MuMaqF1K5AO6ED66ZFUqaHMJBY7JD4bYnZOygzHp1i2wyJJ87rDxZ17SmZpCh
 qgruFpEW+X6+CULZcugrubJA1AXa1yJfHdlTsOC9i1s47SvEAnTa45JsMk6wo3VIxl1W
 pbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+AA8L+lmPS4Y8CfZ5titB/nnVN7X7WdAbSVCwQErl50=;
 b=08lWzP3emRp6yoaK+C19O7uX8y4mlheL/dJ9mu/iiRK8DC4gY5aX9kuPmeeso+mc1g
 VhkZt6krQ9JE9zWT9H4P3yqLBEr7PXaFF6oiY01ryorLDpVNRCpdmz5G0MRjjhqnaB1H
 gB6YOJ00xzpEoQj8wtU2Q8NkJOVoTPJDj52ExlaLGwBLf38kDguiscjtAI1jmpr7LfWV
 9zOQDl/5iqZdBwaF1k7xkEmAFbDpjGJkA/1V8t5Ct5UeizjBy0/Xs7WSWMBLFfhq+qxa
 AAG0PYJ/sqG38BPGyXlb33ImXP/DLBxyN6+6JD265YkVYO//SdOrmV0WbcRjS7uv+kWo
 +iUg==
X-Gm-Message-State: AOAM531BVT27+ebFjU2rABluqC4nByim3Y6z1nO2duxXXOU1rvOR0PM8
 po5Bf1WD4QgsVKLunsUK713gTKTA2cc=
X-Google-Smtp-Source: ABdhPJy7kvUX6dw/8YAh0wf79Rsn+bzKTrNspTJhIaz4VYLuxAKqeDbN+DgL9mdXz9IPHeGe1AjJeQ==
X-Received: by 2002:a1c:7908:: with SMTP id l8mr3917841wme.16.1639563952545;
 Wed, 15 Dec 2021 02:25:52 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id o12sm1246483wrv.76.2021.12.15.02.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:25:51 -0800 (PST)
Message-ID: <0b08d0ca-7a72-9332-ff3d-df8901416a94@amsat.org>
Date: Wed, 15 Dec 2021 11:25:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] hw/avr: Realize AVRCPU qdev object using qdev_realize()
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20211205224109.322152-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211205224109.322152-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.64,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laurent,

This patch is reviewed, can it go via your trivial tree?

On 12/5/21 23:41, Philippe Mathieu-Daudé wrote:
> TYPE_AVR_CPU inherits TYPE_CPU, which itself inherits TYPE_DEVICE.
> TYPE_DEVICE instances are realized using qdev_realize(), we don't
> need to access QOM internal values.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/avr/atmega.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
> index 0608e2d475e..a34803e6427 100644
> --- a/hw/avr/atmega.c
> +++ b/hw/avr/atmega.c
> @@ -233,7 +233,7 @@ static void atmega_realize(DeviceState *dev, Error **errp)
>  
>      /* CPU */
>      object_initialize_child(OBJECT(dev), "cpu", &s->cpu, mc->cpu_type);
> -    object_property_set_bool(OBJECT(&s->cpu), "realized", true, &error_abort);
> +    qdev_realize(DEVICE(&s->cpu), NULL, &error_abort);
>      cpudev = DEVICE(&s->cpu);
>  
>      /* SRAM */
> 

