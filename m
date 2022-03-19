Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98F54DE847
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Mar 2022 15:18:59 +0100 (CET)
Received: from localhost ([::1]:44932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVZv0-0001rX-NR
	for lists+qemu-devel@lfdr.de; Sat, 19 Mar 2022 10:18:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nVZs5-0008AL-M1
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 10:15:57 -0400
Received: from [2607:f8b0:4864:20::1034] (port=36581
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nVZs3-00019F-UL
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 10:15:57 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 kx5-20020a17090b228500b001c6ed9db871so417918pjb.1
 for <qemu-devel@nongnu.org>; Sat, 19 Mar 2022 07:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=28Nq1V8Wj+dr0X3Oy5MGNleOY4l+yba7s0shP/2PiqU=;
 b=Il3pvhmiA3SC3LXH9rWBQusListxwubMS60kYDIbEisn5kuYVetZ1vRiT1N2sqmhmQ
 99M9ILNDcPEv5zv0dLHKy+7O+o++BXdZwlIYKNFU43wR5WU8trvZrswwzy92tukKmoaP
 uacEqaYEnzn1blpLiqNutGNblHcR62D18Ne+mdXkNvCiAi9ARUKUP8y6btTmIYYKXj3c
 i2PzydnxdQ/jtn05YKuq7d6PY35K6sLxtxPwUBl9gzav1BFicrJO4MnueEsYFRNmxAFf
 NCjoAkA84GR9w8Sg6MhUlnd+vyeFxDp0SH/SA3VGauM5iIlk9vDriPLXVgoVCeXVHdRV
 s2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=28Nq1V8Wj+dr0X3Oy5MGNleOY4l+yba7s0shP/2PiqU=;
 b=6agrRN43QIw4u/3wTO3l/+FEveXpDj4pMlOtiP5E7weyqJx+YN0JMEErPVRhyrvGot
 OO+N0JtQO/sMxrHezeHlJ+xBg+gfiwvzqhhb+ckCPUN7nMpMkfxTGY42KRdJc6sxlkk/
 q6ZywzAEhPxSvUgGEKDYlezkM0v+qzbHqMoTgcPmenuQD3MPh5Q8EI0iRITKKEjOjGLj
 /0WSNWl2hBalyt9BDPzsbfBmq5FuosZIwsiNrLqQ7Dj+DF/d0e+dzKIOyO24sK40jHjm
 L3Hq0l8/p5Pu9LYFRp2Em3cTJ1eytlkpY+jtNRiE6FcVJL8dwMwUIqSlUys70pPvtdMI
 CbeA==
X-Gm-Message-State: AOAM530c2adBoTxqkQgVMfIaXFsya+zNPObEKMfzuK3AfVpuyLIfr0pN
 MotHnUPUbDfWOOzmtLEsorI=
X-Google-Smtp-Source: ABdhPJyTpzSQqgwW3N0LVOcyhjt4xNpLp9XZNELJLE+5tbbNBOY/nrfLcZIhk8dNtuTlhPnjTvUxuQ==
X-Received: by 2002:a17:90b:1b0f:b0:1c6:ed78:67ad with SMTP id
 nu15-20020a17090b1b0f00b001c6ed7867admr1139918pjb.41.1647699354507; 
 Sat, 19 Mar 2022 07:15:54 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 u41-20020a056a0009a900b004fa831fb240sm2512582pfg.6.2022.03.19.07.15.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Mar 2022 07:15:53 -0700 (PDT)
Message-ID: <67825229-6bca-1da8-7517-2d08e3e705cb@gmail.com>
Date: Sat, 19 Mar 2022 23:15:48 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH-for-7.0 v4 0/2] cocoa: run qemu_init in the main thread
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220317125534.38706-1-philippe.mathieu.daude@gmail.com>
 <342e06e6-8d38-d068-5686-eb13c70da93b@gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <342e06e6-8d38-d068-5686-eb13c70da93b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/03/19 22:56, Philippe Mathieu-Daudé wrote:
> Hi Akihiko, Paolo, Peter.
> 
> On 17/3/22 13:55, Philippe Mathieu-Daudé wrote:
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> Posting v4 in case someone want to iterate.
>>
>> Pending issue raised by Akihiko Odaki:
>>
>> * this actually breaks the "runas" option with ui/cocoa.
>>
>>    [+NSApplication sharedApplication] calls issetugid() to see if
>>    setgid() or setuid() is called before and calls exit() if it evaluates
>>    true. It does not evaluate true without this patch since setgid() and
>>    setuid() are called after [+NSApplication sharedApplication]. This
>>    patch, however, changes the order and triggers the check.
>>
>>    There are two options to solve the problem:
>>    1. Move setgid and setuid calls after [+NSApplication
>>    sharedApplication] to let NSApplication initialize as the original
>>    user.
> 
> Akihiko, could you send a patch?

Do you mean a patch for option 1?

> 
>>    2. Do: [[NSUserDefaults standardUserDefaults] setBool:YES
>>    forKey:@"_NSAppAllowsNonTrustedUGID"]
>>
>>    Option 2 would be preferred in terms of practicality since nobody
>>    would want to initialize NSApplication as the original user (usually
>>    superuser). However, _NSAppAllowsNonTrustedUGID is not documented by
>>    Apple.
> 
> What are your views on this problem for 7.0-rc1? Keep modifying cocoa
> UI? Disable block layer assertions? Only disable them for Darwin?

I think we should disable block layer assertions. It is not a change 
visible to user and its value is more apparent in development.
We can preserve most of its benefit if we restore the assertions 
immediately after 7.0 release and let them work during the next 
development cycle.

If it is not preferred, we can apply the following change as a 
less-intrusive alternative:
https://patchew.org/QEMU/20220307134946.61407-1-akihiko.odaki@gmail.com/

The change faced objections as it uses Cocoa APIs from iothread. It is 
still in accordance with Cocoa's API convention and the only negative 
effect is that it can confuse developers. It is not affecting users and 
we can also minimize the possibility of confusion by immediately 
following with this "qemu_init in the main thread" patch after 7.0 release.

Regards,
Akihiko Odaki

> 
>> * Oudated comment in main():
>>
>>   1970  /*
>>   1971   * Create the menu entries which depend on QEMU state (for 
>> consoles
>>   1972   * and removeable devices). These make calls back into QEMU 
>> functions,
>>   1973   * which is OK because at this point we know that the second 
>> thread
>>   1974   * holds the iothread lock and is synchronously waiting for us to
>>   1975   * finish.
>>   1976   */
>>
>> (https://marc.info/?l=qemu-devel&m=164752136410805)
>>
>> Since v3:
>> - Move qemu_event_init before cbowner alloc
>> - Reduce main_thread scope to applicationDidFinishLaunching
>> - Updated updateUIInfo() comment
>>    (s/cocoa_display_init/applicationDidFinishLaunching)
>>
>> Since v2:
>> - Extracted code movement in preliminary patch
>>
>> v3: 
>> https://lore.kernel.org/qemu-devel/20220317115644.37276-1-philippe.mathieu.daude@gmail.com/ 
>>
>> v2: 
>> https://lore.kernel.org/qemu-devel/20220316160300.85438-1-philippe.mathieu.daude@gmail.com/ 
>>
>> v1: 
>> https://lore.kernel.org/qemu-devel/20220307151004.578069-1-pbonzini@redhat.com/ 
>>
>>
>> Paolo Bonzini (1):
>>    ui/cocoa: run qemu_init in the main thread
>>
>> Philippe Mathieu-Daudé (1):
>>    ui/cocoa: Code movement
>>
>>   softmmu/main.c |  12 ++--
>>   ui/cocoa.m     | 161 ++++++++++++++++++++++---------------------------
>>   2 files changed, 79 insertions(+), 94 deletions(-)
>>
> 


