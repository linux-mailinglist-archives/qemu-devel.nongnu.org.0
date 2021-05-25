Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13BA38FCE6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 10:33:54 +0200 (CEST)
Received: from localhost ([::1]:49694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llSVd-0004N1-Q4
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 04:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llSU6-0001fl-LN
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:32:20 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:45948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llSU4-0002YO-P2
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:32:18 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so12322120wmh.4
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 01:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uASaa2ZJHwVXc/uKzf92/VdRtTvXvxhE7ktyzz808BE=;
 b=HwUfAXH3DAL/tQd013KaddrC6L7jv0vTExk5FP++hosqi8yvpg7VlXkGIy41/MjX1S
 KKFF02HNMgbWbfCCxSbs9nblmaY30HFed5Rk6D638PgjYqiMPFzTTnwHgloQ7HxDJVe2
 /w54eWyL84XRuZhqt67KLgRtiwubkZcq5uLavVlPoBp6j0GfuPYTE1g5pqT0qZJzb5Oi
 A/WjuFKMGNSrvUJnAyQcLOk8RxAZuEYUhMXciyNGms/xfdDs/Jj5i3BV1JwAFVCy9vKa
 4aSHMGNpNlw1KLIjahzGxaP0+TMs2ln7kgYa39BOHYVhAqwDcR6/T8giSJntKRyFCdS/
 Vi5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uASaa2ZJHwVXc/uKzf92/VdRtTvXvxhE7ktyzz808BE=;
 b=DUl6VvD0WmL4yF3SssUQOl8Y47xHNTllTMONvSB3SNly6Nn3C/zrc8VKV7Kj0/sW+d
 T+dEhOUakX9oV0hhKjcvthZccmXcqp3l7IHJ3LpwdtpwxVYfylru4sfEY1X4TrsDY+DY
 YvYaBvlnFwzgRtI1HmYWzsRvvNuUCzBLmtPvyC9vUf0pInmEdxCPe9u6dm71hGiJ2W0N
 ml50IwDQk9dKJPeucwYyOYN8gog0L+0lRyi8iOdsGemGYUWGh5ycyyd3L5mMHb610dtq
 dv2GEkIvrLe9H8yDh50PS/3l4QuH52BqyVKcenB0c3xdB2sYhKdOUfNRkxyn47I2RFz2
 J3nQ==
X-Gm-Message-State: AOAM5331OO9sTzzPOjAbYQqvZAkAg0VRtA1VyKhEG6lgQuYgKCkPM7YQ
 Ww8eh0kGvH3rCkdTHPX2Y9A=
X-Google-Smtp-Source: ABdhPJzXpHd+SAnCSYrcEPHDW4WyCQDJjU/60uqlUmnLxPplToVQ2OzKPfErNLnAAqWuF3VoFj6uaA==
X-Received: by 2002:a1c:9a05:: with SMTP id c5mr9132683wme.121.1621931535388; 
 Tue, 25 May 2021 01:32:15 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id v3sm15107381wrr.19.2021.05.25.01.32.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 01:32:14 -0700 (PDT)
Subject: Re: [PATCH] target/m68k: Remove unused variable in ABCD/SBCD memory
 opcodes
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210505160344.1394843-1-f4bug@amsat.org>
 <4c67e219-8698-5855-909b-21fb1c45a385@vivier.eu>
 <ab11d44e-e0bd-d684-cadf-cbe641cb8be1@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <482f902d-d06e-ed89-b609-50257bb931b2@amsat.org>
Date: Tue, 25 May 2021 10:32:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ab11d44e-e0bd-d684-cadf-cbe641cb8be1@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/21 12:29 PM, Laurent Vivier wrote:
> Le 05/05/2021 à 18:43, Laurent Vivier a écrit :
>> Le 05/05/2021 à 18:03, Philippe Mathieu-Daudé a écrit :
>>> The ABCD / SBCD memory opcodes (introduced in commit fb5543d8200)
>>> don't use their "addr" variable.
>>>
>>> Remove the unused variable and pass a NULL argument instead to
>>> gen_ea_mode(). This fixes warnings generated when building with
>>> CFLAGS=-O3 (using GCC 10.2.1 20201125):
>>>
>>>   target/m68k/translate.c: In function ‘disas_sbcd_mem’:
>>>   target/m68k/translate.c:897:13: warning: ‘addr’ may be used uninitialized in this function [-Wmaybe-uninitialized]
>>>     897 |             delay_set_areg(s, reg0, tmp, false);
>>>         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>   target/m68k/translate.c:1866:21: note: ‘addr’ was declared here
>>>    1866 |     TCGv src, dest, addr;
>>>         |                     ^~~~
>>>
>>>   target/m68k/translate.c: In function ‘disas_abcd_mem’:
>>>   target/m68k/translate.c:897:13: warning: ‘addr’ may be used uninitialized in this function [-Wmaybe-uninitialized]
>>>     897 |             delay_set_areg(s, reg0, tmp, false);
>>>         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>   target/m68k/translate.c:1829:21: note: ‘addr’ was declared here
>>>    1829 |     TCGv src, dest, addr;
>>>         |                     ^~~~
>>>
>>
>> It's really strange because ABCD and SBCD support indirect predecrement (mode 4, "-(Ay),-(Ax)"), and
>> if you look into gen_ea_mode() &addr (addrp) is used with mode 4, it is initialized on EA_LOADU to
>> be reused on EA_STORE.
>>
>> The bug is somewhere else...
>>
> 
> I think I see what is the problem: as the mode is indirect pre-decrement, the register doesn't need
> to be updated and thus the addr is not needed.
> 
> But if we replace addrp by NULL, gen_lea_mode() will be called twice and the register will be
> decremented twice (on load and store, rather than only on load).

Ah OK I see. Well, I guess I'll let you have a look, you clearly have
better understanding :P Would it help if I fill a GitLab issue?

