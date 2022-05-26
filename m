Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E66534D43
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 12:23:57 +0200 (CEST)
Received: from localhost ([::1]:37272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuAeq-0007Qi-NW
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 06:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nuAcr-0006dA-Fj
 for qemu-devel@nongnu.org; Thu, 26 May 2022 06:21:53 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:45832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nuAco-00049o-I3
 for qemu-devel@nongnu.org; Thu, 26 May 2022 06:21:52 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id l32so2094925ybe.12
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 03:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E70VgOgGMnwXlbQMGZvrpLxj3fECGdC6JZt9q7uQy7k=;
 b=aIa/rBOE3jRPWO7/gmHChg0f6jBjy+FeOkIX7v0IL2PP9eghujLL/rvqf7k6K+NW7V
 PXncnOSFeIU3zTxc4FV0R2I+vcdDZtLjQflg9P2GqVjUrdbynVKXI2cXxziy9rJGMs2g
 45IpfPG0FhbzjghBWSsEz7v5lcKbtfoYHPbgrK2MCv2qlS5trYmaPtBUUvnJn99Ilyzy
 nUmttqQozGcJ55kgoMtEG7Un4JuVrp8JDx/idWfnmwAkQNcGhW23rjc+kJ9wHpFnZ0RJ
 Rz0nHdVBZc+tl5o8iXxg+/0YFN06sLeAv7BLdxMSl0NAIGTPUGxqQcPzDsldDmmWPTIr
 +NXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E70VgOgGMnwXlbQMGZvrpLxj3fECGdC6JZt9q7uQy7k=;
 b=Awov5IoIoA+x6Kh9OBgSD4F7yCNT7hqlwrcMxKGVoqESbw3o9IYF76OplDa3HCaJDc
 Ia4YHCaDeETFn4I9iife3b4d4jKRMMXZDCgOMhpDAUXJa+NzrqigIhlfyb7A9SNpsE4V
 xi5FsLB0PR0as13AITGQ2Hzx9mQEwOM6UoqpeMNs6XVeTUnk89FRHpxAEDGcOWG6zjHp
 HcdSYx252Ob3qWQUXqMq5AEwhLn1Sa9oZWDyDOv+OASEMwpqKTfXU5apv+HWDVRcNGO6
 xj55AKdTAFM3x/BsXkXoc3/yW1uZmuugmtnHdMVXXNDHq131DDRAbzjBlE4JPYIKwr6x
 lMSA==
X-Gm-Message-State: AOAM530MBrTkREM9PAw+IjXrGnt4DkeBcgTqyKIaNZQ73adyEH2YLMZS
 8m42RYK+L7cr1flqj6aUq1ZvK055t8aHccjhf/yqhg==
X-Google-Smtp-Source: ABdhPJxzxKlfAZlISpDyygeapuajYuVmTReu+8rd5caCAzju/CYsTabXi6ZwrTbxvkCXi7HjnTOPcLkxy9Zf4H3cvVU=
X-Received: by 2002:a25:257:0:b0:64e:b1fd:2d54 with SMTP id
 84-20020a250257000000b0064eb1fd2d54mr34018923ybc.193.1653560509308; Thu, 26
 May 2022 03:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <AADD58D2-C3BE-40DF-8EE5-3A901F4F8F04@livius.net>
 <CAFEAcA-n4GMq1_SCdTDp6sQmHzyyzTk5hav4QqOY3-j3Sr86Jg@mail.gmail.com>
 <EA9AEE55-A416-4819-98FF-E51B2317390F@livius.net>
 <CAFEAcA_beHgi7pg+ByW4ufG5qfz5n7o4ZP22WuayTtdGSQ_EQQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_beHgi7pg+ByW4ufG5qfz5n7o4ZP22WuayTtdGSQ_EQQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 May 2022 11:21:38 +0100
Message-ID: <CAFEAcA981TZASA4g+Ggi1gmMnXYnu1xoaNdE8NmbC=6kDBBxpA@mail.gmail.com>
Subject: Re: AArch64 semihosting?
To: Liviu Ionescu <ilg@livius.net>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 May 2022 at 11:01, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 26 May 2022 at 09:32, Liviu Ionescu <ilg@livius.net> wrote:
> > > On 26 May 2022, at 11:20, Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > ... can you provide us with
> > > a reproduce case (eg the binary you used here)?
> >
> > Sure. I'll try to attach it to this message, it is only 64K.
> >
> > The command I used to run the test is in the previous message.
> >
> > Please confirm that you get the same behaviour on your machine.
>
> Yes, I can reproduce this. What seems to be happening is that
> QEMU decides to do semihosting via gdb, but then crashes because
> gdbserver_state.c_cpu is NULL (which in turn is probably because
> there is no GDB connected). This is strange given the 'target=native'
> in the command line. I'll investigate further...

The failure to honour the 'target=native' option is the result of a
commandline parsing weirdness/bug. It happens because your command
line specifies two separate '--semihosting-config x=y,x=y...' option
groups, and the code was not written to take account of that
possibility. So in qemu_semihosting_config_options() it looks for
"did the user specify target=something" with the default being 'auto'.
This function gets run twice, once per --semihosting-config option
you have. So the first time around we set semihosting.enabled
to true and semihosting.target to SEMIHOSTING_TARGET_NATIVE.
But then the second time around we say "oh, the user didn't
specify either enabled or target, so default them to true and
SEMIHOSTING_TARGET_AUTO", overwriting the value that got set up
by the first call.

We should fix this (as well as the bug it reveals in the use
of 'target=auto|gdb' when the gdbstub is initialized but no gdb
is connected), but in the meantime you can work around it
by always providing just one --semihosting-config option, like this:
 --semihosting-config enable=on,target=native,arg=sample-test,arg=one,arg=two

I don't think any of this ought to be target-specific, so perhaps
the command line you use for 32-bit arm is slightly different
and avoided the bug by good fortune ?

thanks
-- PMM

