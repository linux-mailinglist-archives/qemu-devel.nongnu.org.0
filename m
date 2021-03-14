Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D3633A8E8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 00:44:56 +0100 (CET)
Received: from localhost ([::1]:51358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLaPo-000715-1J
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 19:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaNp-0005U7-07
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:42:54 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaNl-000165-WB
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:42:52 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so19223252wml.2
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 16:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aTyb4gQiT3FTFVATsIDgXIIDMpO98hYrbv/cYbeiy68=;
 b=Pruo1S0MRg7NUNytCfl1+UQg/l7z8KpJjp6XqvdKywu5J4NZfxH30NrkpIFzjXxLZV
 8SBBIG2JBkqUUYnuyTfxc5tDqNwkX4VP6/8AAH4nt4t2cldTyQVtkNn1SFQGhOB9YiR+
 2aEWZ1csxmFEzlnA6Fgg2i1TlIaB3f6+MGt5DjYqR8aa1+QHLuhXAOO23jmxSyEVCys+
 j8T2el35wJDHQwMEPV3IGpEs4smkH2tpRA0lRb57gnBnWb97jNfztCZL68gZ21rZnA5+
 9r4N8/CMwTJGb9qGxVqacq1nsjzfVCTcGaW1Cp/t9N3UWMFTj/srmHnQ/5YNbuFoRpfl
 ksgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aTyb4gQiT3FTFVATsIDgXIIDMpO98hYrbv/cYbeiy68=;
 b=ZfXwNw/EdCRB/eFIBgMsVS5KnzSFNupWwo9kQVl71xi1R5DE2yIg19E+Gvae00JJyf
 GKhh0mVbb8pnk8HUOp2lOz5cnFf6Nnn+IVtLD3M/ZKMXaroMNOzCpKb4KNBEEOUA8jRF
 gk2akYMACNL0LPoYwQUGUXGD5HhBALcYnm7q/K3tgFdCsX0GR18mCZv1q3u8raS4lTrM
 tq+Jf5yMDJ0Bz5esH09V2rXPq9TJotf9VS80aU1uhu6VgBnfooE3LVdBKRD7eSrFQiok
 m/oofW2ww31sWxfqXlK1hjzs7HunqdjnrBBD5LlUGHumqvORHCde7kPPYnYpqS6HsLO8
 QgIQ==
X-Gm-Message-State: AOAM532+O2LsE4a28kqWQIKzG5349qmqnyIIM/qvyzoS26ZRgDgaVSdZ
 RjM0+KGlG14qH719FvRuLAUL7NajX7v58A==
X-Google-Smtp-Source: ABdhPJx98w0cbWU6anYXVieAXRbwFYMmMgCCSG/hxU/6sHZW7rZdhvhaGz7zIGchKhNOM1XPUsG/Lg==
X-Received: by 2002:a7b:c442:: with SMTP id l2mr23484118wmi.34.1615765368699; 
 Sun, 14 Mar 2021 16:42:48 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id q19sm17356377wrg.80.2021.03.14.16.42.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Mar 2021 16:42:48 -0700 (PDT)
Subject: Re: [PATCH 00/11] AVR patch queue for QEMU 6.0
To: qemu-devel@nongnu.org
References: <20210313165445.2113938-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cd80f9d6-bd86-20b0-225a-fecb59b2f2c4@amsat.org>
Date: Mon, 15 Mar 2021 00:42:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210313165445.2113938-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: Thomas Huth <huth@tuxfamily.org>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/21 5:54 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> This series contains all the AVR patches I could find on the list.
> 
> Niteesh, I fixed minor issues. Do you mind reviewing on top?
> 
> Pull request planned for Monday if no problem arises.
> 
> Thanks,
> 
> Phil.
> 
> G S Niteesh Babu (2):
>   hw/gpio/avr_gpio: Add tracing for reads and writes
>   hw/avr/arduino: Add D13 LED
> 
> Heecheol Yang (1):
>   hw/avr: Add limited support for avr gpio registers
> 
> Ivanov Arkasha (1):
>   target/avr: Fix interrupt execution
> 
> Lichang Zhao (1):
>   target/avr: Fix some comment spelling errors
> 
> Philippe Mathieu-Daudé (6):
>   hw/misc/led: Add yellow LED
>   hw/avr/arduino: List board schematic links
>   hw/gpio/avr_gpio: Add migration VMstate
>   hw/gpio/avr_gpio: Add 'id' field in AVRGPIOState
>   hw/gpio/avr_gpio: Simplify avr_gpio_write_port using extract32()
>   hw/avr/arduino: Replace magic number by gpio_port_index() call
> 
>  hw/avr/atmega.h            |   2 +
>  include/hw/gpio/avr_gpio.h |  54 ++++++++++++
>  include/hw/misc/led.h      |   1 +
>  hw/avr/arduino.c           |  44 +++++++++-
>  hw/avr/atmega.c            |   8 +-
>  hw/gpio/avr_gpio.c         | 173 +++++++++++++++++++++++++++++++++++++
>  hw/misc/led.c              |   1 +
>  target/avr/helper.c        |  10 ++-
>  hw/avr/Kconfig             |   2 +
>  hw/gpio/Kconfig            |   3 +
>  hw/gpio/meson.build        |   1 +
>  hw/gpio/trace-events       |   5 ++
>  12 files changed, 294 insertions(+), 10 deletions(-)
>  create mode 100644 include/hw/gpio/avr_gpio.h
>  create mode 100644 hw/gpio/avr_gpio.c

Patches 1, 2, 10, 11 queued to avr-next.

