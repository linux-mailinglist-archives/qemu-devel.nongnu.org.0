Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C64E418ABA
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 21:15:53 +0200 (CEST)
Received: from localhost ([::1]:37416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUZct-000292-MP
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 15:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUZat-0000ly-Un
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 15:13:47 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:43002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUZas-0004F0-Aw
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 15:13:47 -0400
Received: by mail-oi1-f175.google.com with SMTP id x124so22584992oix.9
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 12:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Bqxz+O/JsbdJSBIGfhiRZHaZnW8a1p0CexsNCbI1JjA=;
 b=leemH1MGmDx/fi7dDrsx8B1X0tmrJZ4KVLOlJynTZjFD78LGbWBRaiypWDWqt7iwbA
 DblGySz/aS6CDJDIuJl7vMBBBUymBVg16W5EInG4DRSK5Qm8GE1P5MwIXwgVbwDvb5uc
 S2Vsj/VPS1HRg6u5OYa2LPYLUAIGwE8Smk3DClvEFxrIi5kfPt/oQ1gQbQnqAzhZqHmS
 BejEvxCazYppPezU7U+L9H0Jq6EjhFmnOQz31k7AuuBkvr5EAPSHwj8ax7rak/7C5sd5
 sBSawZTYyxzcwq4jHux/GIHf40gJ+v6QxecrdWiHLEI6UljCB/60irDEIjCY80Zv5Hnm
 1VLA==
X-Gm-Message-State: AOAM532gZckrofAPZoucRNQckId9xQ7tRyL30A6aSCVpmfZUi3MjxWjt
 EFt2DEj9Hrb2l9lhm2CqlkxOVUj0bsMeU7BYV54=
X-Google-Smtp-Source: ABdhPJzx1Q5wu8s4TCDXzr4VMngVBFT4pGJ+qsVacNEIujTQVtG/rURQAy1LtqWVYbDZss3l3EdtmVztIz9cnTPHEAY=
X-Received: by 2002:a05:6808:cf:: with SMTP id
 t15mr1713663oic.46.1632683624342; 
 Sun, 26 Sep 2021 12:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-15-imp@bsdimp.com>
 <1f21d9a3-fe08-22e7-45f9-27dae0c1c6ba@linaro.org>
 <CANCZdfpdy9EFgr-ushGeEnPZFEPD2_sOc4vii+2by9ksbC3YVg@mail.gmail.com>
 <CAAdtpL7bsDbd9GeSqBgJyr6JnBdF9vi01qk9z582Tuwv8-MpBA@mail.gmail.com>
 <CANCZdfpDRVv2WcLyBrVd=YXwEW-cuGMW4QUpx8kkfC9B2xoRHQ@mail.gmail.com>
In-Reply-To: <CANCZdfpDRVv2WcLyBrVd=YXwEW-cuGMW4QUpx8kkfC9B2xoRHQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sun, 26 Sep 2021 21:13:33 +0200
Message-ID: <CAAdtpL5HxOD4Ve6Re2vH9RvzTV1Ky0Eh6tAz8+SGt0-3JtddQw@mail.gmail.com>
Subject: Re: [PATCH 14/14] bsd-user/signal: Create a dummy signal queueing
 function
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.175;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f175.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 26, 2021 at 9:00 PM Warner Losh <imp@bsdimp.com> wrote:
> On Sun, Sep 26, 2021 at 12:34 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org> wrote:
>> On Sun, Sep 26, 2021 at 8:14 PM Warner Losh <imp@bsdimp.com> wrote:
>> > On Fri, Sep 24, 2021 at 6:00 AM Richard Henderson <richard.henderson@l=
inaro.org> wrote:
>> >> On 9/21/21 11:14 PM, Warner Losh wrote:
>> >> > Create dummy signal queueing function so we can start to integrate =
other
>> >> > architectures (at the cost of signals remaining broken) to tame the
>> >> > dependency graph a bit and to bring in signals in a more controlled
>> >> > fashion.
>> >> >
>> >> > Signed-off-by: Warner Losh <imp@bsdimp.com>
>> >> > ---
>> >> >   bsd-user/qemu.h   | 1 +
>> >> >   bsd-user/signal.c | 8 ++++++++
>> >> >   2 files changed, 9 insertions(+)
>>
>> >> > +int queue_signal(CPUArchState *env, int sig, target_siginfo_t *inf=
o)
>> >> > +{
>> >> > +    return 1;
>> >> > +}
>> >>
>> >> Both here and in linux-user, there are no error conditions.  We shoul=
d change the return
>> >> to void.
>> >
>> >
>> > In this stubbed out version, there's no errors. But bsd-user can retur=
n -EAGAIN when
>> > alloc_sigqueue fails (which it can if there are no free qemu_sigqueue =
structures in
>> > the preallocated list0. However, having said that, nothing checks the =
return value
>> > so it's as if it is void... So I'll change it to void here...
>>
>> kinda related:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg836833.html
>
>
> Not sure how I missed this... too many filters I guess.
>
> I've sent a reply, but the right thing to do is to eliminate *that* wart =
too. I'm always
> torn between 'oh, linux-user went in a different direction that I like be=
tter' for something
> and adopting it and 'oh, more churn in upstreaming, I'll never get done a=
nd how do I make
> sure I don't break anything'...

Oh no worry. I have in my TODO to clean this, but got delayed by the
has_work() refactor series.

