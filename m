Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 367C636D481
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 11:06:54 +0200 (CEST)
Received: from localhost ([::1]:36104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbg9l-0002Px-Ag
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 05:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1lbg8N-0001xO-PH
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 05:05:27 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1lbg8L-00039V-Cj
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 05:05:27 -0400
Received: by mail-wr1-x42f.google.com with SMTP id h4so53151189wrt.12
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 02:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nn/NHPqnxAetQqES2AeTF8N6lv/vJYqFMVwWFP7NXAg=;
 b=aPjvCZ6iF+2NPNNemnwOYvSOJm4e1onfVyT4UUbpNFl+jk9nTBoWBEHw/PUK0T/Oy/
 H/2TlwC61RbGBSrM2SnkG0NkOxvNDtYieK5urS9SXCcCqycVmzTCPmwnXyQuGvtlTXho
 3ApeTmkSWH5x6XhFxrVv22NdAblXvbmjgkuyEPetMILfcMlBF6eCHwpj9Ea99nPRgfzs
 8cevGmoHKdVdrob4YWqU6hrv6LOZW8uJgNcsi8+v35BlCnsFivt9GNAWEM1ZBnhzeTry
 hMe/nFj6V2YNIpq9jCLYwVcsHFqldpAwb1/yePCH/9gFqwBIE3vlPkGi0P+xot96ceHa
 FGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nn/NHPqnxAetQqES2AeTF8N6lv/vJYqFMVwWFP7NXAg=;
 b=YPPXHMp6Rzr1zt8cdRP7+Mrsj8AiEEBx8dEsr5+UVD5i9hr3zta6P/Z+tZwDpC/Oam
 je5nA7CXCYR+0K5B3qkc4RlcNck2IMFnE0xSXDo8zTN/qgUVKhPyEwBfLF1HlqJP2pMq
 QwURConzw6vQDAzFtkTDecDXa1NypLZ4ykDw9MIgMNdKFFKaGVFe0me7A+axjq3sBukZ
 pggVQF+Uc9FWImg3uO9wIhEaSBkNRfAmpvZ95pHnqGDsgJGP3erERFN/2klZu3YTTSVp
 XFRAFY8+8OdIdIaIGqs+tf8P5wWSH/NzDoUFAqodwteIitIEV7YXuVAg6vWsOei44ave
 yAfQ==
X-Gm-Message-State: AOAM532TtDI4Zczvwb8rbAaD2m8BSXiXihpWDLqZ7Fm+WbBbXMOfjaXA
 HM8y11DoYQWPZXFQFd5hFpSfEg==
X-Google-Smtp-Source: ABdhPJxcoWY15yy3jZEcML49akQrrJSnL5j4CPlx1ZIdDnpTb9JjudV8pTtVeJfBcWOjup+5NcyGtA==
X-Received: by 2002:adf:f84e:: with SMTP id d14mr25962382wrq.342.1619600722820; 
 Wed, 28 Apr 2021 02:05:22 -0700 (PDT)
Received: from localhost.localdomain
 (lfbn-tou-1-1482-80.w90-89.abo.wanadoo.fr. [90.89.5.80])
 by smtp.gmail.com with ESMTPSA id u14sm7117074wrq.65.2021.04.28.02.05.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 02:05:22 -0700 (PDT)
Subject: Re: [PATCH 0/2] hw/sparc: Kconfig fixes to build with/without the
 leon3 machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210427192658.266933-1-f4bug@amsat.org>
From: Fred Konrad <konrad@adacore.com>
Message-ID: <8367c951-d068-c87d-1171-df0548591767@adacore.com>
Date: Wed, 28 Apr 2021 11:05:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210427192658.266933-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=konrad@adacore.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Le 4/27/21 à 9:26 PM, Philippe Mathieu-Daudé a écrit :
> This series fixes link failure when building either the leon3
> machine or the sun4m ones.
> 
> The problem is we have hardware specific code in the architectural
> translation code. Move this code to hw/sparc/.
> 
> The link failures can be reproduced doing:
> 
>    $ echo CONFIG_LEON3=y > default-configs/devices/sparc-softmmu.mak
>    $ configure --without-default-devices
>    $ ninja qemu-system-sparc

Indeed:

libqemu-sparc-softmmu.fa.p/target_sparc_win_helper.c.o: \
In function `cpu_put_psr':
xxx/qemu/build/../target/sparc/win_helper.c:91: \
   undefined reference to `cpu_check_irqs'
collect2: error: ld returned 1 exit status
ninja: build stopped: subcommand failed.

>    $ ./qemu-system-sparc -M leon3 -S
> 
> or:
> 
>    $ echo CONFIG_SUN4M=y > default-configs/devices/sparc-softmmu.mak
> 
> Philippe Mathieu-Daudé (2):
>    hw/sparc: Allow building the leon3 machine stand-alone
>    hw/sparc: Allow building without the leon3 machine
> 
>   target/sparc/cpu.h          |  6 ----
>   hw/sparc/irq.c              | 61 +++++++++++++++++++++++++++++++++++++
>   hw/sparc/leon3.c            | 37 +++++++++++++++++++++-
>   hw/sparc/sun4m.c            | 32 -------------------
>   target/sparc/int32_helper.c | 37 ----------------------
>   hw/sparc/meson.build        |  1 +
>   hw/sparc/trace-events       |  2 ++
>   target/sparc/trace-events   |  4 ---
>   8 files changed, 100 insertions(+), 80 deletions(-)
>   create mode 100644 hw/sparc/irq.c
> 

