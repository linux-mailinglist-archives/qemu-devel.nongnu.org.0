Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B733AF5C8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 21:03:46 +0200 (CEST)
Received: from localhost ([::1]:53584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvPCy-00087F-L1
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 15:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvP9p-0005Ea-5G; Mon, 21 Jun 2021 15:00:29 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvP9n-00010y-6t; Mon, 21 Jun 2021 15:00:28 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 f16-20020a05600c1550b02901b00c1be4abso140788wmg.2; 
 Mon, 21 Jun 2021 12:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mp/7C6gJIlopFlSsUOSBSkCJRTI2SFidp+JXyaaIBpg=;
 b=BHDr5SvsnP2u5I06nhbe0xclw2OOR45sxetBq0z0Kj9OYcjYMykBrzp6LJjufRb90I
 M8N/xXZWcbghRgQyNENvHg/W11ekR8kGVJG/chnlXy7Ng60YLo8aZoRI9jRmToKjXEIq
 VkBqIGx7uqt79HHWmBKpVk22vfWzeFhU5yj3+/Q4VsD0JArflWwfRUaWorH5Onq9Uz/S
 muL38LNmXPIkgzESligbUDauUSlcM7YboQFdEBcW+ooU6ZYXPKlET5ra+wEB/GxacOFS
 mXyEDjaOquQX8TMTDk1oZ+Qmla1qox2TaIZo41UUJe01vYzJo4vpktNXoxbpsSUNt3EI
 UkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mp/7C6gJIlopFlSsUOSBSkCJRTI2SFidp+JXyaaIBpg=;
 b=JssF/JB3Mwfxb/O3zScuDurWNitQLFJQnnqzeuyS9sPVrEIX9M7jMIXrFAogwy5Tr0
 616i8iispb0F6NaPmgm0dZWKsRt2xVcI/vdZgP4XaPj4WfcQtEKVA+Sui+Xrbs82Lr3F
 34C6t0Io9jnisHyC/Lzm84R3xWOFNaIFmdbKxxtew52FD7/KrjR9YQv0DghM9uS9mMuW
 N5MnXaPWXHeOUxonsFl1qh2+QDXrzySv7juCWZyy0YAKGuNf0mCIUU670S1419ImM4p9
 zbuQemf3FKUDoukOF708jIo9o7ZmxyeGz9IYGrnfkbOEK+9fFf4KSe5fcuHEw2LQLSHl
 ZRrg==
X-Gm-Message-State: AOAM530bwHvSygUYd/y4vR3/Z+LfDqQ65RseKWfJiMik9L3lsG8CQ0dK
 Pg+34ZaHXeIwuBaUr8/eSWY=
X-Google-Smtp-Source: ABdhPJwdNPsGg3SKZXcHdV7lbAykCfDR7E0ZxVzxFGzeAZkvXtdDJIDZEbvGGRQS2TIcmFA/aYDmhA==
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr29069758wmb.142.1624302025642; 
 Mon, 21 Jun 2021 12:00:25 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id b9sm2358223wrt.55.2021.06.21.12.00.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 12:00:24 -0700 (PDT)
Subject: Re: [PATCH v1 2/5] hw/arm: add dependency on OR_IRQ for XLNX_VERSAL
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210621152120.4465-1-alex.bennee@linaro.org>
 <20210621152120.4465-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d6012d09-a9c9-d7f2-9640-80f368a48ec0@amsat.org>
Date: Mon, 21 Jun 2021 21:00:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210621152120.4465-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/21 5:21 PM, Alex Bennée wrote:
> We need this functionality due to:
> 
>     /* XRAM IRQs get ORed into a single line.  */
>     object_initialize_child(OBJECT(s), "xram-irq-orgate",
>                             &s->lpd.xram.irq_orgate, TYPE_OR_IRQ);
> 

Fixes: a55b441b2ca ("hw/arm: versal: Add support for the XRAMs")

> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  hw/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

