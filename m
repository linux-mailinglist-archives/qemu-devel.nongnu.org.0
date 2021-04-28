Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B1736DF26
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 20:45:44 +0200 (CEST)
Received: from localhost ([::1]:58506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbpBu-0001Y5-RZ
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 14:45:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1lbp9a-0000ev-HB
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 14:43:19 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:46904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1lbp9U-0000hH-Sf
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 14:43:18 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 k4-20020a7bc4040000b02901331d89fb83so9377996wmi.5
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 11:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m7rMLAXHbifvAINuFrG9HyWanFi4z0HdPohH1Howljg=;
 b=VDJk69JQRkqlV6N4S2wkoTbFhtBijhyAjIhL4mQyaIAbWkFW8nlmVWLjdk/MjQVpFC
 /2a4hxCK7zPi4lP12DKw6vIQks5E6zu5iGnGvl5XqDnmzzLXuiFt3nYubHsa6zLykoG4
 bVLCR9fY6uyEmTx7BXaTRlb651S1Gk06vsT1jZ73xzIz6OyfvG4zxJx0nsnlkP6v946/
 UoceHTUU1vs4po4+Fj1IYKsxA+crcHQN74nBtaZcLD8ygWmgX4cKtvsQzM9omy72yBk2
 t4fFg+Avkb/y5H+SXtzZjjyaTBqGNP/1eNyJskZGV/2S/PmJgMxnrq+Yd+ZHgD9LbDtB
 0W9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m7rMLAXHbifvAINuFrG9HyWanFi4z0HdPohH1Howljg=;
 b=uCdOJpYK+1KfVxtO1GOFDFP4hqnnCUVCBoV6adsZp5+y9D9xQW4HxkdDrvjXzCrCrQ
 kiHzpiIq/XUqHnwqRPNBp7a6EC0gBqtfMcuYvsLbKrJgC/mPInSkchwC/Mg1QbsMqNM4
 dVFM1bhUJaJp8yGpiyUmWiEdnSSbl73FChq9rWSzZLsNYmKO2c3Odo3v9Cbo1nABKMzd
 tzx5B12nCeM636Llu7ot4h+ENB8hWAQpyezGjwRXwNHstGkeYCTZdUD+NhwDxYzLe2Z6
 zVn1h4RwfP7uQIDobvP6Za3jYNmiPJC8145jZpyb8EtfLug4D+i8/8F/pPAdKmC3IFly
 8ydw==
X-Gm-Message-State: AOAM531xn7urZzuE3+gaI5iShVQPTeY0h72K5C/k+QIVGwtA7FpAJU5c
 ylLhtRkzIfvTAYZz5deZ9iUJ5DEGu1wtsw==
X-Google-Smtp-Source: ABdhPJxTRc2QXz/rRei+6tgn1Z74JseWOcPj4vdJvReLWON00mzsV6taTa1VJz3wGSLbyYO3IdkhFQ==
X-Received: by 2002:a1c:7215:: with SMTP id n21mr33544395wmc.61.1619635391244; 
 Wed, 28 Apr 2021 11:43:11 -0700 (PDT)
Received: from localhost.localdomain
 (lfbn-tou-1-1482-80.w90-89.abo.wanadoo.fr. [90.89.5.80])
 by smtp.gmail.com with ESMTPSA id j13sm1092944wrd.81.2021.04.28.11.43.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 11:43:10 -0700 (PDT)
Subject: Re: [RFC] AVR watchdog
To: Michael Rolnik <mrolnik@gmail.com>
References: <20b7f194-066f-c3bf-a830-deb1cde8f1be@adacore.com>
 <CAK4993h7rBLi9AymaAyzGXSG3LKWa364OpZaaU85sMuE7iMNnQ@mail.gmail.com>
From: Fred Konrad <konrad@adacore.com>
Message-ID: <389277b9-678e-3118-4a50-d4e2e043f14a@adacore.com>
Date: Wed, 28 Apr 2021 20:43:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAK4993h7rBLi9AymaAyzGXSG3LKWa364OpZaaU85sMuE7iMNnQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=konrad@adacore.com; helo=mail-wm1-x335.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Le 4/28/21 à 8:17 PM, Michael Rolnik a écrit :
> Hi Fred.
> 
> How can I reproduce it?
> Thank you.
> Michael Rolnik
> 

Hi Michael,

First sorry for the patchew noise, I didn't meant to sent a patch just an
inlined diff.

For the reproducer, that's pretty straight-forward with v6.0.0-rc5:

$ cat > foo.S << EOF
 > __start:
 >     wdr
 > EOF

$ avr-gcc -nostdlib -nostartfiles -mmcu=avr6 foo.S -o foo.elf
$ xxx/qemu-system-avr -serial mon:stdio -nographic -no-reboot -M mega \
   -bios foo.elf -d in_asm --singlestep
IN:
0x00000000:  WDR

Segmentation fault (core dumped)

Note that I put "--singlestep" here to avoid translating NOPs after the WDR,
it breaks without as well.

Fred

