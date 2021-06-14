Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08853A697B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:02:12 +0200 (CEST)
Received: from localhost ([::1]:49272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lso6N-0007gz-GT
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lso4v-0006dn-Cg
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:00:41 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:42633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lso4t-0003t0-82
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:00:40 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso164481wms.1
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wl7+M+hf9QcotkG9TG7NXK9PasZj/9DybGyEKa4oat8=;
 b=jcZOs1bky7lOeLgwuNKJNhyzelRZXgU4LqoovkafNWCYt/rjAi65T+ap3A5yCUWDwk
 0Nk5/tsM431Aqg4AnjIJCaTO8vqft1YtHUCG2ub8h3p+JA9qUhPu/wVq+IOlBD/18a5+
 bnaIyOV6oAhDLRzpP751mZdYQ/OSt+1pEPhAgwBAfrke1MX4TkCcOh0Dw6DjZivH8Ame
 dVL16AcwpLd/vqAiQOAAaHzvsiR5WjWFh1AFNhG2FoO6g5+Hf0eAaaP7s61o/qFsNxxR
 /NAEE5+hmnzkKSI3VdfI7KbeV6Hf9rAxVGr2+jV4qGH1TqFuFwPNqoGV7U3iJiNHWDma
 k57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wl7+M+hf9QcotkG9TG7NXK9PasZj/9DybGyEKa4oat8=;
 b=EjO+2c/y75YkP1rwc1DyvO2c+z7kubycGFul1w1FbJaOc5VSnMJXPwxo1KLOgj/ker
 tRQfBihp04swdjUh452ywyV4UvbZLveZpjNAQYv6KVo3iIN4xZHoJyGphhbM2nX/yiAf
 z1ZNSFt745UhrC6mL0HhIVgx3Z8A8C9mjETBrHcTzc+SfYVzO0DkxIl3OamC0jt+BvvV
 Sptqib3epCQklq+bgzJG8ENzxkWJUBZoGOcWsW9DAgWk9VhsfDQtw+fQkP0assMKnsIu
 47tSxFQh9befTOizBA8yZZSbirGhPR0EamKJPzXxDJYvRghXv7jG8jbWlJr0chd4b/Zc
 Ebug==
X-Gm-Message-State: AOAM5330hP/Fga5MWMF76ROtxkiXqQCyfllf36sZyqXJ1OkYcKH+uUQL
 UI4pih1F4Af+bZehgspFvtbC17tESKmbjg==
X-Google-Smtp-Source: ABdhPJxKvGN31r1zqawVNpDqDYLQtTcaQOIabDst9U6csczKpT+gEEuc98lSCWL6myQ7LklSP2X5cQ==
X-Received: by 2002:a1c:b403:: with SMTP id d3mr16859146wmf.79.1623682836790; 
 Mon, 14 Jun 2021 08:00:36 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id g205sm20639083wme.6.2021.06.14.08.00.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 08:00:35 -0700 (PDT)
Subject: Re: [PULL 00/34] tcg patch queue
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
 <CAFEAcA_k9B0-+jrKOCdtKpFjvym0Ng3POH2nRLfuoAikTJ8B0g@mail.gmail.com>
 <CAFEAcA-bDmHFpDcqnyNR-oC3D=yOr2=D3ec2Rj57MzyFpcOMEg@mail.gmail.com>
 <f2cbc18c-7bde-6f6b-ff69-7df40d3101e3@linaro.org> <87o8c8kctl.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5e762b11-cbb5-6587-9572-297508f7c795@amsat.org>
Date: Mon, 14 Jun 2021 17:00:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87o8c8kctl.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.489,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 11:35 AM, Alex Bennée wrote:
> Richard Henderson <richard.henderson@linaro.org> writes:
>> On 6/13/21 10:10 AM, Peter Maydell wrote:
>>> Also on x86-64 host, this failure in check-tcg:
>>> make[2]: Leaving directory
>>> '/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/hppa-linux-user'
>>> make[2]: Entering directory
>>> '/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/hppa-linux-user'
>>> timeout --foreground 60
>>> /home/petmay01/linaro/qemu-for-merges/build/all-linux-static/qemu-hppa
>>>   signals >  signals.out
>>> timeout: the monitored command dumped core
>>> Illegal instruction
>>> ../Makefile.target:156: recipe for target 'run-signals' failed
>>> make[2]: *** [run-signals] Error 132
>>> make[2]: Leaving directory
>>> '/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/hppa-linux-user'
>>> /home/petmay01/linaro/qemu-for-merges/tests/tcg/Makefile.qemu:102:
>>> recipe for target 'run-guest-tests' failed
>>> but I think this is a pre-existing intermittent.
>>
>> Interesting.  I've never seen this one before.
>> Do you recall if this is only intermittent with -static?
> 
> It's about a 1% failure rate for static builds only - I have yet to
> catch and keep a core dump.

The s390x Tracis-CI runners crash from time to time:
https://travis-ci.org/github/qemu/qemu/jobs/774523480

Maybe you could try to run the signals test in loop there
until getting a coredump?

