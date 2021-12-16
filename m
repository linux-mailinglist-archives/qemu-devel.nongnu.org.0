Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48417476D58
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 10:26:19 +0100 (CET)
Received: from localhost ([::1]:33848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxn1l-000455-99
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 04:26:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxn0A-0002wV-Km
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:24:38 -0500
Received: from [2a00:1450:4864:20::435] (port=36737
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxmzv-0004EA-CC
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:24:38 -0500
Received: by mail-wr1-x435.google.com with SMTP id u17so42986125wrt.3
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 01:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=63O7xheXemm91Ma165GS9nqAUZCpFN3pwCREnLc6vhY=;
 b=A26/jsVWdJqO+y0WFi4qwrgGg7RjFe3xhGjB2Ay36bvbUgYkmszW7oVe4znmmhCkNj
 Md+Sc07z1P9WAW4jVecoESxSUPzylJVmHpLNStftOZEbe0nFN+TyU6YVDWCVVAah83re
 gQJC1qi5lsBWdEgktLNFHnzkAT+/dnDde9xhQ7rms5UQ1wR9i2tFlGbIP9xUkLdiq37S
 WeRX3H3o9eLpVa/Ew4DQG5Zw/IRlDOjcIG696cOrMkrQzRkiogxcAjPamQVPADejmKtp
 wuZvIVyKa3vsjEc3Uc+whWEY7uu7JvB2fqq3mU9NwONE+ajIOkXmwrEo5ePuFP8kRFhi
 gp8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=63O7xheXemm91Ma165GS9nqAUZCpFN3pwCREnLc6vhY=;
 b=LoNPPlk9EmPo/Z9p4R7q6ftwhnLBwxnZuy8TUouDYQYSjBssxAA3m+qcd4wdOvwITG
 QGgEoBRBlmnJzKUVfaZxKy704fYAq7ObEUYZNJTpvyNNm2Iez0ushscthbyHnUlmO83h
 bH+M6wvKj0dMcVO5gtTOAmq4ly+MLQ26uGuFI6rOOw+AsF0sYBZRQ4cHJZvRClNlXfSW
 70Oi5al3kEm4kbTjbHQm9a4lf4gLv4nkL7nKeh0LRJCHvye15hiN4VKIsDP5v5QtOv7Y
 XtwfqUKNqj5iq1vbdci4MxD6eARZsQPmu8Q+BCUQrnpWvYWDwCu1YH1DsyTfkxgmmFcl
 Gmlw==
X-Gm-Message-State: AOAM5304CpWbxtU8rQAY2Mi04COWOBFV7GXNUicKSliygNVaH8zNW50c
 WV0bwNAg5IdfvUwkV9OdBSY=
X-Google-Smtp-Source: ABdhPJxYEAXqDKmFUyuE0v/Q6vCBehgmLThkd9CTcxlGp+/jLROsXfuIedTeWBDZHw8yANQ7PA4N8A==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr8082110wrd.346.1639646659072; 
 Thu, 16 Dec 2021 01:24:19 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id e3sm4126524wrp.8.2021.12.16.01.24.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 01:24:18 -0800 (PST)
Message-ID: <43bdc6a6-ea29-0f45-8ab0-764ec862a3fd@amsat.org>
Date: Thu, 16 Dec 2021 10:24:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH 0/6] Introduce GPIO transmitter and connect to NPCM7xx
Content-Language: en-US
To: Joe Komlodi <komlodi@google.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20211216015417.1234812-1-komlodi@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211216015417.1234812-1-komlodi@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.034,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, kfting@nuvoton.com, hskinnemoen@google.com,
 venture@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Marc-André (chardev) & Dave

On 12/16/21 02:54, Joe Komlodi wrote:
> Hi all,
> 
> This series introduces a GPIO transmitter, which allows the transmission
> of GPIO controller pin state over chardev, and attaches it to the NPCM7xx
> GPIO controller.
> 
> The GPIO transmitter takes in a GPIO controller number and a bitfield
> containing the GPIO state of that controller, then formats a packet and
> sends it via chardev to whomever is listening for it.
> The purpose of this is for external software to receive the packet and
> interpret it so it can do any actions it needs to, based on GPIO state.
> 
> For example, in our use case, we have a VM manager managing an x86 guest
> and an ARM (NPCM7xx) guest. On real hardware, the ARM SoC is a BMC which
> has some power control over the x86 SoC.
> Because of this, we need to relay GPIO power events from the BMC to the
> x86 machine (i.e. reset, power off, etc), so we have software read in
> the GPIO transmitter packets, keep track of what power state the x86
> machine is in based on the GPIO state of the BMC, and notify the VM
> manager of any important changes.
> The VM manager can then power up/down and reset the x86 machine as
> needed.
> 
> Thanks!
> Joe
> 
> Joe Komlodi (6):
>   hw/gpio/gpio_transmitter: Add Device
>   hw/gpio/gpio_transmitter: Add allowlist
>   hw/gpio/npcm7xx: Number controllers
>   hw/arm/npcm7xx: gpio: Add GPIO transmitter
>   hw/gpio/npcm7xx: init GPIO transmitter allowlist
>   qtests/gpio_transmitter: Add test
> 
>  hw/arm/Kconfig                            |   1 +
>  hw/arm/npcm7xx.c                          |   8 +
>  hw/gpio/Kconfig                           |   3 +
>  hw/gpio/google_gpio_transmitter.c         | 249 ++++++++++++++++++++++
>  hw/gpio/meson.build                       |   1 +
>  hw/gpio/npcm7xx_gpio.c                    |  25 +++
>  include/hw/arm/npcm7xx.h                  |   2 +
>  include/hw/gpio/google_gpio_transmitter.h |  66 ++++++
>  include/hw/gpio/npcm7xx_gpio.h            |   4 +
>  tests/qtest/google_gpio_tx-test.c         | 216 +++++++++++++++++++
>  tests/qtest/meson.build                   |   1 +
>  11 files changed, 576 insertions(+)
>  create mode 100644 hw/gpio/google_gpio_transmitter.c
>  create mode 100644 include/hw/gpio/google_gpio_transmitter.h
>  create mode 100644 tests/qtest/google_gpio_tx-test.c
> 


