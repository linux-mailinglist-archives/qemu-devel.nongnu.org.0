Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A76489F2A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 19:24:42 +0100 (CET)
Received: from localhost ([::1]:34018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6zLV-00074s-FB
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 13:24:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1n6zHc-0000Wm-Vx; Mon, 10 Jan 2022 13:20:41 -0500
Received: from [2607:f8b0:4864:20::1032] (port=44980
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1n6zHa-0003Ti-Ch; Mon, 10 Jan 2022 13:20:40 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 n30-20020a17090a5aa100b001b2b6509685so1120545pji.3; 
 Mon, 10 Jan 2022 10:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OhtoHWiAhEeMLzqClvr2ISwqqU8JKvzsI+5xIdZzVPs=;
 b=Db8vh/dFy18ojejSttYm0P8t7XjH2842KnRGTZQWNPu9Da4hJjbHAmKs26GyvyVNQp
 uQsqXP+sXpyRiJeEgGTvF4zF4u7YxYyEfoMM4tRv0kjje9Tf58NIFbD3BsCm+3G9Y54V
 mqYSf2hW3bWMufU6C27gtDjz7VvgTIfT+60F8Ump+2gi7yLpBHupca2xKD5hV0t1+i6B
 9f6tcc5QOOZHSn6oLMZfOCZ6fdkr+hJGo/bpZi1AIJQAH8rTgKy6y07sQFjMk6SXKB6n
 26jqzfKQj9B+UYpGkf40Dt+Kpi4bzg69efhYT1EVGJzaI4JspZ+5xongOq3EquLcchXS
 1G7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OhtoHWiAhEeMLzqClvr2ISwqqU8JKvzsI+5xIdZzVPs=;
 b=f79Oph9CzOAbVEnEGLDAYAByZcmd1L3fYXsPKTlIgTE3J3bd3AiOfr+Yfl5BTrabcd
 X08U+YrmEDmIkiSzXIcDK0tH2JJEdLvGEEd2F+VLSbyjs0MoHv7R4oQ4/PbNkYrgzAyN
 EbvJieecyZCzvLeG4Lfot7cwR0gyca9ywyApnDIyMu8b92407XZyIoGhpCL1Xwe9SziD
 YrCLV5G1AhOAtCxIA/B/zVqr6jJ8zVEZIW5ikzBUWzyBy5DZq8KBZA5V0lptuv7uNkby
 jVM4RdrfJnXWAhPuFh0L8M4KelbZLgjzu1BSuzDzhqxxsKlunT/XM8AZcWDXU+HVr4Jt
 vrvg==
X-Gm-Message-State: AOAM532Fg04Ll3e4a8Q2ptEFgDZxGupjkI0VDpT/kgeE+PQyp6G/rBrr
 uwZA6IhMENkoi7tcCu72jOw=
X-Google-Smtp-Source: ABdhPJyDxkzSTYAwdVmWGtmgyIfNTZujwsVtLw8siftmxJ8SpkOzXAjxookWpjWqXgUJIxRjE4yE7A==
X-Received: by 2002:a17:902:9894:b0:149:8a72:98ae with SMTP id
 s20-20020a170902989400b001498a7298aemr698866plp.132.1641838819921; 
 Mon, 10 Jan 2022 10:20:19 -0800 (PST)
Received: from [192.168.64.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 f20sm1178186pfc.108.2022.01.10.10.20.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 10:20:19 -0800 (PST)
Message-ID: <9c016476-6679-5d23-296a-6546930087cd@gmail.com>
Date: Tue, 11 Jan 2022 03:20:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v2 2/6] audio/coreaudio: Remove a deprecation warning
 on macOS 12
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
References: <20220109170612.574104-1-f4bug@amsat.org>
 <742a1bca-1150-c277-c498-3815ef956f58@amsat.org>
 <4993ab11-570b-2bd7-a9b9-c6ddc9af5802@amsat.org> <2147921.xlN1UyrzLN@silver>
 <CAFEAcA94iQ_-dkNaQD62qSb_5emY5mq=OvR8jAbDkcW0YwUoeA@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CAFEAcA94iQ_-dkNaQD62qSb_5emY5mq=OvR8jAbDkcW0YwUoeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/01/10 22:22, Peter Maydell wrote:
> On Mon, 10 Jan 2022 at 13:14, Christian Schoenebeck
> <qemu_oss@crudebyte.com> wrote:
>> I'd suggest to use:
>>
>> #if !defined(MAC_OS_VERSION_12_0) ||
>>      (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_VERSION_12_0)
>> #define kAudioObjectPropertyElementMain kAudioObjectPropertyElementMaster
>> #endif
> 
> This is also how we do this for existing checks of this sort,
> like the one in osdep.h for qemu_thread_jit_execute().
> 
> -- PMM

If I understand correctly, Many macOS-specific codes already no longer 
complies with GCC because they depend on modern features GCC doesn't 
provide. The most problematic construction is block; it is extensively 
used by Apple's ABI and API and you cannot avoid using it even if you try.

Also, note that MAC_OS_X_VERSION_MAX_ALLOWED defines the upper bound of 
the supported version. The lower bound should be preferred here because 
the usage of the new identifier is applied regardless of the version of 
the host system. It is in contrary to the usage of 
MAC_OS_X_VERSION_MAX_ALLOWED in osdep.h where the new interfaces are 
used only for the newer versions. The lower bound is defined as 
MAC_OS_X_VERSION_MIN_REQUIRED. Practically there is no difference of the 
two macros because they have the same value in QEMU and 
kAudioObjectPropertyElementMain is a constant resolved compile-time, but 
it is still nice to have the code semantically correct.

Regards,
Akihiko Odaki

