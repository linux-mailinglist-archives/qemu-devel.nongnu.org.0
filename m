Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB5766E3B5
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 17:36:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHowf-0002Om-8Q; Tue, 17 Jan 2023 11:36:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHowY-0002DJ-DV
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:36:14 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHowW-0007ko-GQ
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:36:14 -0500
Received: by mail-wm1-x329.google.com with SMTP id j17so4201096wms.0
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 08:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lYmJt58G9wkjH8jjc/IUabvY7Huv+soQLDGSWPxDJF4=;
 b=p9vVzqh4Xr1yCW0r1vkW5VjVZGbgN6a8Euasz0mRldIrZBHoFJFVjABm6RdzDZU6a6
 P6KxviGFqJ6hA1QbnR81/AFxXPDiux5EVvSPvyj94Ywg+ccDKCt5ox4WSfiy3SXl8pIy
 q795OHavlQZF+b2uKq2oD9cHsLQVdsezwLLgu6anAmQ2UewhJFQiHrj/3rzi8QN38u9A
 YXSM4uLspSjACvSz/9WwbXUONdXomloYGWy+cRDjUdCBRbWSHHwvK7VVu/ZqJypP9hrP
 7+ccdHwlBHeJH7BT2El/c6b2mRkGmtYpVWkfq9RUn7Eph1pBN8qMs+bmKr0UADTMwDgX
 aZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lYmJt58G9wkjH8jjc/IUabvY7Huv+soQLDGSWPxDJF4=;
 b=uTfcJ3JUy1nCVr3EwO3EgctZkHlMDmqYaW2rvQU8Hegng757yZt/dt0yibkueHLceN
 0PSTsvhUJuCVCw5hFiD6A0O+uHyVJFUn6c5diJjh6OjQel6MCabhZeHq/ecR/EAX1JVA
 HNVynVYcqzi83WOFeGMAl+nA2i2Wvatn3acKPozqQt3Zk86ir2I/XG7A8933Emz1xOwF
 RJgUlHiDxBvxyvgw8BAZwwqjz86GlQw57PLfiR/hJgfIUnOKkp12GZAcPn54pSKl8V3x
 vadlIyvWDewk8wm/CI4jaE0DTqwwphYlWjd7ffPxRr9MaXVut3g5rLFFLBYmws/rqIZc
 nqgQ==
X-Gm-Message-State: AFqh2ko/ZgB1Di5alf8UaJDS5M8yEhGEDsDWY+zpVXIvKI+lsiyeXlKb
 1LkGCE2zE8hqfWtBRpYxeTA1/g==
X-Google-Smtp-Source: AMrXdXttpP0DT2IqGsMtGmjvuMVvMjIcP4Hjph0TVQJ4WI8ksADQ/CYN3ToIQv9yJZmBdOqPdth7+w==
X-Received: by 2002:a05:600c:1c96:b0:3d9:e9a2:eea3 with SMTP id
 k22-20020a05600c1c9600b003d9e9a2eea3mr3561515wms.37.1673973370954; 
 Tue, 17 Jan 2023 08:36:10 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k5-20020a7bc405000000b003db0dbbea53sm904090wmi.30.2023.01.17.08.36.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 08:36:10 -0800 (PST)
Message-ID: <bafc45b7-f42a-a500-053f-65f057a14cc1@linaro.org>
Date: Tue, 17 Jan 2023 17:36:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v3 18/28] target/arm: Move common cpu code into cpu.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-19-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230113140419.4013-19-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 13/1/23 15:04, Fabiano Rosas wrote:
> The cpu_tcg.c file about to be moved into the tcg directory. Move the
> code that is needed for cpus that also work with KVM into cpu.c.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   target/arm/cpu.c     | 76 +++++++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu_tcg.c | 77 --------------------------------------------
>   2 files changed, 76 insertions(+), 77 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
[...]

TYPE_IDAU_INTERFACE is ARMv8-M specific, so TCG AFAIU.

> +static const TypeInfo idau_interface_type_info = {
> +    .name = TYPE_IDAU_INTERFACE,
> +    .parent = TYPE_INTERFACE,
> +    .class_size = sizeof(IDAUInterfaceClass),
> +};
> +
>   static void arm_cpu_register_types(void)
>   {
> +    type_register_static(&idau_interface_type_info);
>       type_register_static(&arm_cpu_type_info);
>   }
>   
> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c

> -static const TypeInfo idau_interface_type_info = {
> -    .name = TYPE_IDAU_INTERFACE,
> -    .parent = TYPE_INTERFACE,
> -    .class_size = sizeof(IDAUInterfaceClass),
> -};
> -
>   static void arm_tcg_cpu_register_types(void)
>   {
>       size_t i;
>   
> -    type_register_static(&idau_interface_type_info);
>       for (i = 0; i < ARRAY_SIZE(arm_tcg_cpus); ++i) {
>           arm_cpu_register(&arm_tcg_cpus[i]);
>       }


