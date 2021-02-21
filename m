Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E62320E11
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 22:55:26 +0100 (CET)
Received: from localhost ([::1]:54560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDwhG-0006mg-Lk
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 16:55:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDwgH-0006FO-Cw; Sun, 21 Feb 2021 16:54:21 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDwgF-0006qM-TP; Sun, 21 Feb 2021 16:54:21 -0500
Received: by mail-wm1-x329.google.com with SMTP id a207so12670527wmd.1;
 Sun, 21 Feb 2021 13:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QPww5r1T4XI+qEcVNNxkG8FMrcgKJd45rDh2ns6Lp28=;
 b=VO2e41hPi6H7KgMBmLh6cr0gZ/CZ1VTyYk6hWS5WLUwUkny6j3qnskGciaxFG4Bu4n
 tzHDsUDAsgZPknzoPqdHCoHSfjkAxVlttthbAmvf4Ymg++FKqhs09RCbAYrJngPD9I0Z
 ZObtXdbSUIQbqk4P+qG75JylOVekcRakXsXtSl8YhR/YRyvnKGawc1RwW+MwiyM9pwWm
 Xisv6Bc3oXkuTKwYzsMiFvjXFPm2OvQCK91EEwdbIT++EVfpycY1Mij1IOqNHc167vGE
 B9lgmXlS6jl56X40qaNq+LC+iYuTd+C7rCOxJQv4QsbpmIRGjUQeyWd7jBA+2cuIha7Q
 FLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QPww5r1T4XI+qEcVNNxkG8FMrcgKJd45rDh2ns6Lp28=;
 b=GX3k9YnmhT6Zfu0OElkInCMTISMvAGWgLOyOL4banvTRwkFu/fKM8qph8sL6CP9kCk
 rw1XuDhAH1rVLjJ+fgG17rB4q3sDS1N7w8Df4/wNQvrNwHSgetDMlirAW/oQYup1vAP1
 ie8kLM7LgHfnZ//nco7xQ9JQPF++5AIVxph34qvrsKsKzt3E3y6A7I9cy48zm+MDp48a
 rze+f8SgrpWOETFtInTEIzDo+Atk0EthQwim3BNwDr4zfK4USFKZ4rUn7E+Nwv0MAPqr
 eAhCXEKmesf7P2fvghw4UDAeGPcZavcy6RLN7yIKtHawMmEh5AXfXPMAwzkfY2G+Q4ol
 f+Aw==
X-Gm-Message-State: AOAM532Qj/25NHo+HMu6oc7MLrcOuaZ443J662AO+S4TaVZFFRyMSIdM
 i/KctDRs9y6bngmDzD9jy8o=
X-Google-Smtp-Source: ABdhPJwUzofX7+U3xOikZZwM3A2KMgyeYOjQXFUkZIV725Kn0GMucwFKVTTna8bCe7gNIj/ZRgRZKw==
X-Received: by 2002:a7b:c157:: with SMTP id z23mr14380217wmi.176.1613944457856; 
 Sun, 21 Feb 2021 13:54:17 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x11sm26204393wrv.83.2021.02.21.13.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 13:54:17 -0800 (PST)
Subject: Re: [PATCH v2 7/8] hw/pci-host: Introduce SH_PCI Kconfig entry
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210221200249.2536247-1-f4bug@amsat.org>
 <20210221200249.2536247-8-f4bug@amsat.org>
 <CAFEAcA-2z7uVVyes4v76DvoG9ZjOzngZMt96obpNo9xAHKOzEQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <94172198-f11b-23d2-962b-949eab1a964b@amsat.org>
Date: Sun, 21 Feb 2021 22:54:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-2z7uVVyes4v76DvoG9ZjOzngZMt96obpNo9xAHKOzEQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Qemu-block <qemu-block@nongnu.org>, Magnus Damm <magnus.damm@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/21 9:49 PM, Peter Maydell wrote:
> On Sun, 21 Feb 2021 at 20:03, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> We want to be able to use the 'SH4' config for architecture
>> specific features. Add more fine-grained selection by adding
>> a CONFIG_SH_PCI selector for the SH4 PCI controller.
>> Move the file with the other PCI host devices in hw/pci-host
>> and add its missing MAINTAINERS entries.
>>
>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/{sh4 => pci-host}/sh_pci.c | 0
>>  MAINTAINERS                   | 1 +
>>  hw/pci-host/meson.build       | 1 +
>>  hw/sh4/Kconfig                | 1 +
>>  hw/sh4/meson.build            | 1 -
>>  5 files changed, 3 insertions(+), 1 deletion(-)
>>  rename hw/{sh4 => pci-host}/sh_pci.c (100%)
> 
> Don't we need a hw/pci-host/Kconfig change to add
> the "config SH_PCI" section ?

Oops sorry...

