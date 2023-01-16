Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C8766C885
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 17:40:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHSWM-0001N8-PN; Mon, 16 Jan 2023 11:39:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHSWK-0001Mu-Fh
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:39:40 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHSWI-0003VN-9o
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:39:39 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 z1-20020a17090a66c100b00226f05b9595so16471703pjl.0
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 08:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=++TqEL4wTX0Rvoy7+IpvtxClPn97Sot1SBzL5cTJWMU=;
 b=MXnBIWjLySF05pJwVuecrEKKUFSVIUPqRdqb+VYZtFfn8T99HtLS55rdMTeL5mPE+V
 aMSAMXrfo/E85Tel3bJl55MLZ0JxW4LtgBFlwLWrWoTfRpVnP5wMP38cmLm9diMpP45o
 lxAYC1n3uOB0JYwlLYhlB3gFPrFBcEyBeqSxabru8mFCoKN5/+s0vzs9Sgz460Q4ZXmD
 gW6MDtUuRwyPWk+TncdJWtw/Kd0LbdqZVlxPE4qrMQMDkyRXoiQH+OnAurkXrquLqklw
 IIZSWvYak6a2g/4RQ08HmLZkSycvWoq6UFxBcfNMb1cZH6r0Hk4sAf5E+FNrJziGts2u
 OB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=++TqEL4wTX0Rvoy7+IpvtxClPn97Sot1SBzL5cTJWMU=;
 b=YfFX2m2WTiKLupSHiyOMF2Q09MpTLKrzgQvAhRH+rpArEeqmI2bRpmKG2dDq9zRXsj
 EuIwbZ5clxGD+Dij1cZFlWoHvpmXjcUh0G4aM0P+HjTdw1KlPsTRHLkv7vHpMuibn/1Y
 9wpGTgNMaUIlggRdwggiS2/HFolk7swvTe5eaUe4YAI33XZiKKM4TVLQ/agDc7iBaSqO
 9Geih1JWzYE7SijvOR1x0XB9oz2ncOm+21zr4kf2j8xvJ65LtSNhdMS78xPYo7TmR53B
 ZmwxBVZZDCbdVxl3ZQObR+4613tt/6HJk4VECwzZHoPgScYFzi1QbkRjpf360OOIxpmn
 pSDw==
X-Gm-Message-State: AFqh2koSAQC2kY9DCtGV9+/7BeMK7HkYtbho7G3gyJpTT5YiVk4ge06o
 bvUwBVU0TH5M5kfCIhI/plpE9q2tYVVtNFHlbPoEXA==
X-Google-Smtp-Source: AMrXdXvr6yb8MUG/nlA+9pbwrTyk8KyoS/S9eoBT8RdzQYPIZnCF0Zo0qqKburLqcenD2mQ5T7nEmcEs4WklkWGSHws=
X-Received: by 2002:a17:90a:f50b:b0:229:2631:e8 with SMTP id
 cs11-20020a17090af50b00b00229263100e8mr959566pjb.215.1673887176667; Mon, 16
 Jan 2023 08:39:36 -0800 (PST)
MIME-Version: 1.0
References: <20230106102018.20520-1-eiakovlev@linux.microsoft.com>
 <CAFEAcA-z7+X9-c43EmhoRBTrOYC9RtyHc5sgPamGRd_o+-tT_Q@mail.gmail.com>
 <871qo7pszr.fsf@linaro.org>
 <CAFEAcA_9db5ijSTW1JBiC7kLUe+E=+OCAHg0xaoa-0p09Wbt3g@mail.gmail.com>
 <f2182772-661a-c021-061e-642ef3aea942@linux.microsoft.com>
 <CAFEAcA_TWOxz52q0EY0Bfvpwmg9bkVD1pSndiyQhfOtXOrtDMA@mail.gmail.com>
 <1e5c8643-e756-9110-70f1-a83e301cca03@linux.microsoft.com>
In-Reply-To: <1e5c8643-e756-9110-70f1-a83e301cca03@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Jan 2023 16:39:25 +0000
Message-ID: <CAFEAcA_NjWaN3xbgkcZ1SJipu-SRN5br+d28dbT=W5xjG_ZXrQ@mail.gmail.com>
Subject: Re: [PATCH v2] semihosting: add O_BINARY flag in host_open for NT
 compatibility
To: eiakovlev@linux.microsoft.com
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, bmeng.cn@gmail.com, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 16 Jan 2023 at 15:56, <eiakovlev@linux.microsoft.com> wrote:
>
>
>
> On 1/6/23 7:58 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> > On Fri, 6 Jan 2023 at 18:22, Evgeny Iakovlev
> > <eiakovlev@linux.microsoft.com> wrote:
> > >
> > >
> > > On 1/6/2023 17:28, Peter Maydell wrote:
> > >> On Fri, 6 Jan 2023 at 15:44, Alex Benn=C3=A9e <alex.bennee@linaro.or=
g> wrote:
> > >>> Peter Maydell <peter.maydell@linaro.org> writes:
> > >> I think the theory when the semihosting API was originally designed
> > >> decades ago was basically "when the guest does fopen(...) this
> > >> should act like it does on the host". So as a bit of portable
> > >> guest code you would say whether you wanted a binary or a text
> > >> file, and the effect would be that if you were running on Windows
> > >> and you output a text file then you'd get \r\n like the user
> > >> probably expected, and if on Linux you get \n.
> >
> > > If SYS_OPEN is supposed to call fopen (i didn't actually know that..)
> > > then it does make more sense for binary/text mode to be propagated fr=
om
> > > guest.
> >
> > It's not required to literally call fopen(). It just has to
> > give the specified semantics for when the guest passes it a
> > mode integer, which is defined in terms of the ISO C
> > fopen() string semantics for "r", "rb", "r+", "r+b", etc.
> >
> > > Qemu's implementation calls open(2) though, which is not correct
> > > at all then. Well, as long as qemu does that, there is no
> > > posix-compliant way to tell open(2) if it should use binary or text
> > > mode, there is no notion of that as far as posix (and most
> > > implementations) is concerned.
> >
> > QEMU doesn't have to be pure POSIX compliant: we know what our
> > supported host platforms are and we can freely use extensions
> > they provide. If we want to achieve the semantics that semihosting
> > asks for then we can do that with open(), by passing O_BINARY when
> > the mode integer from the guest corresponds to a string with "b" in it.

> Thanks Peter, i think i see your point. However, if you ask me, i feel li=
ke advertising a feature to guest code and only implementing it on 1 platfo=
rm that supports it just because it has a non-standard POSIX implementation=
 will only confuse the issue further.

Huh? We can implement it, if we want, on *all* hosts that
we support:
 * On Windows hosts, plumb the binary indication from the
   semihosting SYS_OPEN call through to whether we pass O_BINARY
   to open(2)
 * On all other hosts, do nothing: on these hosts, text and
   binary files are identical so there is nothing to do

Note that semihosting is not an API that QEMU has specified:
it's an external one provided by multiple platforms. We do
not "advertise" the existence of the 'binary' flag to SYS_OPEN:
it is part of the pre-existing decades-old specification we
implement.

> Guest code doesn't want to care whether or not an emulator is
> running on Linux or Windows, there is no notion of that leaking
> to guest code. What it cares about is being able to consistently
> use a certain feature in their code.

The trouble here is that we have two different choices
about how to be consistent:

(1) Consistently have guests that use semihosting to open
a file in text mode get the text-mode file that they asked for,
regardless of the host operating system and its definition of
what a text file is
(2) Consistently have guest code produce a binary-identical
output file regardless of host operating system

It is not possible to have both; we have to pick one.

On balance, I agree with Alex that option (2) is probably
better, especially with the file-I/O-via-gdbstub part of it;
but we are genuinely giving up property (1) in the process.

thanks
-- PMM

