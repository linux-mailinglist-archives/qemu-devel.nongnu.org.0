Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1838E681E7C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 23:55:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMd3j-0005ca-15; Mon, 30 Jan 2023 17:55:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMd3g-0005cQ-Pu
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 17:55:28 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMd3e-0002Sz-Tr
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 17:55:28 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 iv8-20020a05600c548800b003db04a0a46bso9537479wmb.0
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 14:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cJiJiKoTjo1qvvvVm8HToWKOs/vdrT+Pa+zqjxkkqzM=;
 b=R5uCH2bqrzhlMHZVQ334hr0D9Z4koZdaZC7giU2j7hUfK1O7U3ChR39PflLOsW5tqh
 NMEGGzt3M3qT/KrYEqcUqd9SaNdwDhBcLuI/mIvVI6rUp2Sa8OJyHhm2npjkMaIH5S0h
 lUPdCizq26bXxYTJGJOX5OtzenavpVCYzIDlggSDs87URySr/rkiJIA9oyHwymNNDG31
 WIJ2NPQZAl+NXUx4UvmQ0ptyf9G3wdvVRzZ5ZwaEN2OtgoH44NhxJYNUmxMZxtlpczWa
 Z6+9JK71SeQweFcWpCuqEqEf6RQ89jENs3Dzp9hlu4HipdkpT7WX/FFy9gbWs8Uufhn0
 /EvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cJiJiKoTjo1qvvvVm8HToWKOs/vdrT+Pa+zqjxkkqzM=;
 b=CXcYst06efO/9zgB+sC19S9IBJ1+T1Nl72bsupg2veWcovaIyx+MUNIa1pmbPbq6X1
 EYHpwn/9CS2v2UyL9PeysAn7UHwNQF25GenTPsPp3hNTsDGxj/GJvuHHqlWW91fcn0Ql
 +XCup5Wwj6hjiHd6j71yuT31yR7/FlNIIb6xI07EmzPJNJNclo0UbUXgY5eA8hOvmziX
 u5o0m5SoZW+7mC7d4waYWGWA3dEFw4ZdzNzcklGjJXrbiS4eC3jTssD5BVhcZEzdmzNM
 UIMKC0xJk0QHmf1PILLbdYNRzW/BDq685S+DwKoGRGHf4NV05f9Wqo+NJak/JVu+27/E
 PvYA==
X-Gm-Message-State: AO0yUKXxe1bW0/LehlVi1RvqwUCkj2mTPUFCwiJUbANPA+R37VW9g/X5
 Bsv+TznDf8ZQjFV7kbm/woImlQ==
X-Google-Smtp-Source: AK7set+AijYJn2JchHQVT2X9Y/Styy5r06+B7J//qRzkAPyd+JP9gLwTkIGkV8+pl4reTSzZMeRXdw==
X-Received: by 2002:a05:600c:21cf:b0:3dc:42e7:f626 with SMTP id
 x15-20020a05600c21cf00b003dc42e7f626mr12017848wmj.26.1675119323532; 
 Mon, 30 Jan 2023 14:55:23 -0800 (PST)
Received: from [192.168.1.4] ([41.141.105.34])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a5d56c8000000b002bf94527b9esm12777180wrw.85.2023.01.30.14.55.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 14:55:23 -0800 (PST)
Message-ID: <73c73f7a-f182-7892-162f-daa9f39be45a@linaro.org>
Date: Mon, 30 Jan 2023 23:55:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] hw/timer/hpet: Fix expiration time overflow
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexander Bulekov <alxndr@bu.edu>
References: <20230130135001.76841-1-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130135001.76841-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 30/1/23 14:50, Akihiko Odaki wrote:
> The expiration time provided for timer_mod() can overflow if a
> ridiculously large value is set to the comparator register. The
> resulting value can represent a past time after rounded, forcing the
> timer to fire immediately. If the timer is configured as periodic, it
> will rearm the timer again, and form an endless loop.
> 
> Check if the expiration value will overflow, and if it will, stop the
> timer instead of rearming the timer with the overflowed time.
> 
> This bug was found by Alexander Bulekov when fuzzing igb, a new
> network device emulation:
> https://patchew.org/QEMU/20230129053316.1071513-1-alxndr@bu.edu/
> 
> The fixed test case is:
> fuzz/crash_2d7036941dcda1ad4380bb8a9174ed0c949bcefd
> 
> Fixes: 16b29ae180 ("Add HPET emulation to qemu (Beth Kon)")
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/timer/hpet.c | 19 +++++++++++++------
>   1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
> index 9520471be2..3657d5f463 100644
> --- a/hw/timer/hpet.c
> +++ b/hw/timer/hpet.c
> @@ -352,6 +352,16 @@ static const VMStateDescription vmstate_hpet = {
>       }
>   };
>   
> +static void arm(HPETTimer *t, uint64_t ticks)

Could we rename as hpet_[re]arm() similarly to this file's other helpers?

> +{
> +    if (ticks < ns_to_ticks(INT64_MAX / 2)) {
> +        timer_mod(t->qemu_timer,
> +                  qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + ticks_to_ns(ticks));
> +    } else {
> +        timer_del(t->qemu_timer);
> +    }
> +}

