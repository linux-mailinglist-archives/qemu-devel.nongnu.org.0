Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2572DAFE4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:18:43 +0100 (CET)
Received: from localhost ([::1]:50722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpC66-0005eB-3Y
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:18:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpC4i-0004dw-17; Tue, 15 Dec 2020 10:17:16 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpC4g-0001lg-Cw; Tue, 15 Dec 2020 10:17:15 -0500
Received: by mail-wm1-x342.google.com with SMTP id v14so17198170wml.1;
 Tue, 15 Dec 2020 07:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K7wiNA9gRrZBuhWyInSErztbGgYmZ7mqFItBrxYEAIg=;
 b=im9CoPG3EMBkig94KTF44Ky6Q5eUByNYv/mR/ASYvELgIyPg7KRF0P2+GVE394xIXY
 kmYgbTntYPJ3RINLNLB+iA5fYT11N/P44YcptUoX5EthPi9KB13sq/7wNVBg7iifi3VU
 +ZqH595/n6hEtcMYIC3vc9jz563pIbEpmkBsNyTsyhyxSQvyEdOpAeranK0bJUGNoqSq
 EYnw0jLTBZ0HPosLFJYvjpaOIRw/4WMKKwLv0+Nm1jYpyqYrhpFc+xGM2TW/OMjws0Sw
 ny6PBXJJrKgg2cMZRAATq2vUoY2d0x6qdhAZdbRXkEvynITVzuX9fNYIGZxHPlr+MZre
 KfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K7wiNA9gRrZBuhWyInSErztbGgYmZ7mqFItBrxYEAIg=;
 b=Xz1OPbFRPLxm85bTWVqXsrVKXV+XDARCgh5wgOtKFcU2SywDqlX73SnJtvKVldUWRY
 ZKYRk2NFK29Z4qreNDJO3gULjir6RjfDdQ0sNB5czdYqovKswybh8wlGmfSd2doYyHFU
 i3u+8dBM/2Mf6oJvVVyXAgSdA1EP9g9WQqU+oXa3c6tBE2+5adzwR+ouOjj0+a9q/MzJ
 X7iLAdoPlYhz6tk6amPk05yzsc2ej3wh/MCXPoSkJr5ZCh9YQ8mdj89U+v7w067R8IZ4
 /kSg4S0VbT1vi5wJDpZ8ak7q2Ij/F/cABFwqqrpWPPB8RGSJe+3tJh+fYLgL7/DzNa35
 wiLg==
X-Gm-Message-State: AOAM531+G40vinKMWINXnWxmeAGyMokPAb+17IylcEGZwk0VvjnbhAGx
 tfaSPUb18BRNrG4f6TwouUE=
X-Google-Smtp-Source: ABdhPJwZJeX/A6oXA5zV3l4fKUCULsN8qve5Fvg97dpYGPbylJdn6quyBZDK7kLXSeU8hVxj6UwRSA==
X-Received: by 2002:a1c:bd43:: with SMTP id n64mr33585907wmf.169.1608045432586; 
 Tue, 15 Dec 2020 07:17:12 -0800 (PST)
Received: from [192.168.43.238] (65.red-95-127-157.staticip.rima-tde.net.
 [95.127.157.65])
 by smtp.gmail.com with ESMTPSA id i11sm35992054wmd.47.2020.12.15.07.17.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 07:17:11 -0800 (PST)
Subject: Re: [PATCH v3 0/5] Additional NPCM7xx devices
To: Hao Wu <wuhaotsh@google.com>, peter.maydell@linaro.org
References: <20201215001312.3120777-1-wuhaotsh@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b356d726-4b6c-ab4b-237a-c31dd658c5b2@amsat.org>
Date: Tue, 15 Dec 2020 16:17:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201215001312.3120777-1-wuhaotsh@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: minyard@acm.org, venture@google.com, qemu-devel@nongnu.org,
 hskinnemoen@google.com, kfting@nuvoton.com, f4bug@armsat.org,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 1:13 AM, Hao Wu via wrote:
> This patch series include a few more NPCM7XX devices including
> 
> - Analog Digital Converter (ADC)
> - Pulse Width Modulation (PWM)
> 
> We also modified the CLK module to generate clock values using qdev_clock.
> These clocks are used to determine various clocks in NPCM7XX devices.
> 
> Thank you for your review.

The list is still rewriting your author ident.

Maybe try 'git-format-patch --from' next time to force it
on each patch?

Regards,

Phil.

