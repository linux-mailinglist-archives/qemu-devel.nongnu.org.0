Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E33F9494EC4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 14:18:31 +0100 (CET)
Received: from localhost ([::1]:47340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAXKe-0006Hx-Qe
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 08:18:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nAUhG-00008f-GU
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 05:29:38 -0500
Received: from [2a00:1450:4864:20::336] (port=53962
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nAUhD-0003YD-Jd
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 05:29:37 -0500
Received: by mail-wm1-x336.google.com with SMTP id n8so11017772wmk.3
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 02:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=g3jiygw/I9MgVOPUZaDvBjMZYb/oDMmXtIrgezjep+4=;
 b=OEf+Yp6Omktftd3v0SwTBoXgMUkW84CrxrOisTiPvxlrNwPX+xv56sn5GGwa/H05ro
 NKjxxA8NDULEGGhtmJFej1koTBfm1CKozxQFjOdS1ItCupoxqt42QUJ508brHh7fbOwf
 bl9HZAbTmPChP8GqP+23GalRjqjbj0UuA9tdX8kNmd96CiDpRDk62dbRdby9oJu5Q/Tv
 +GaVBHypjzKlI/nlCTx1IBKpJ7weHsD3hcAisyAp0yLnR8yLrfYKMugBpQ9grtzd0JvN
 J9Mqen+/CO232FadpVJNPl/HtYZrbJF7Hu+FrCMam/pDgpMztOQ+XVvsyEMYE/zTUiqP
 j38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=g3jiygw/I9MgVOPUZaDvBjMZYb/oDMmXtIrgezjep+4=;
 b=hYM8HUFRvQ/wjsiIozA7lCg5ZxhKR+IuugX1g1VQ2UkGjdnWp0Mfl5kdBEzcucuBdG
 dU6vLCIcDD8zoYufLnMWZqOoMyyBPl9t5pCrrarLhnto1GDP9TNJo+IXgG1h6M14uJOP
 eeyDuJZpyYo7Dq5M786wgo1xunirmOr+jX/dGMr2uciXPTPkSVLO53yazbqJEpG7YHX1
 jIOHt4viG11AxyZEbLd++joXd3AOHeW4PeoTbzCSPAe3DQ7CfnJH0315wDbPXZTCZ7Vo
 mcyft3unB4v9Q1ZsI9rQS2/Q5gtxOt3y+xWPSgCvAz44bQpTFcxSBYManwmjhhzA7Z2b
 bGRg==
X-Gm-Message-State: AOAM533PIrfudaqLAl1NU+OaIi8XovcaStmDjxwSZNr0QprK4RxDgb4J
 GHj3pyKtKqlI4kSL4dlXOHsR4Q==
X-Google-Smtp-Source: ABdhPJwroy+AY2gVR9YHHjj8ePA52c+Nt999y2GA0I2fUWtRScPs0dHS64adfvgjsQsc8hX7L5k0uA==
X-Received: by 2002:a5d:4343:: with SMTP id u3mr31630009wrr.504.1642674574035; 
 Thu, 20 Jan 2022 02:29:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a18sm2593786wrw.5.2022.01.20.02.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 02:29:32 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 547601FFB7;
 Thu, 20 Jan 2022 10:29:32 +0000 (GMT)
References: <CAK7rcp9rnggAvaDxRV4m_KcR1afmquJsR+=khKw4B1UG1+V7yw@mail.gmail.com>
 <87czkn8rzp.fsf@linaro.org>
 <CAK7rcp84B0MXfeGsPnd9oM6cqxGUUSNL0GmLiWYwZzPhLkvfxw@mail.gmail.com>
 <CAK7rcp-jCvvf2HdzOgsrkTEDM+x_nYi61Gz+K5At5MwKBZAdSg@mail.gmail.com>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Kenneth Adam Miller <kennethadammiller@gmail.com>
Subject: Re: Cross Architecture Kernel Modules?
Date: Thu, 20 Jan 2022 10:18:46 +0000
In-reply-to: <CAK7rcp-jCvvf2HdzOgsrkTEDM+x_nYi61Gz+K5At5MwKBZAdSg@mail.gmail.com>
Message-ID: <878rva8zub.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Kenneth Adam Miller <kennethadammiller@gmail.com> writes:

> Would it be possible somehow to save the TCG cache, as with user binaries=
, but for a kernel module, before then loading that kernel
> module into memory the target architecture whether in or outside of
> QEMU?

OK let me stop you right there - TCG generated code needs a bunch of
runtime support from QEMU itself and is not designed to be run
standalone. All the existing issues with binary kernel modules get
multiplied once you have to account for architecture differences. Even
on the same architecture you can run into problems if the modules use
kernel structures that have changed between releases. Even if the kernel
was compiled for the exact same kernel release you are trying to run it
in changes in fields, padding and layout are going to be an issue.

In short this is not the solution you are looking for. Your time would
be better spent reverse engineering the proprietary module and writing a
open source version of it than trying to get something like this to
work.

Sorry.


>
> On Wed, Jan 19, 2022 at 2:42 PM Kenneth Adam Miller <kennethadammiller@gm=
ail.com> wrote:
>
>  The source for it isn't available in order that it be compiled to the de=
sired architecture.
>
>  What 3rd party forks take this approach?
>
>  On Wed, Jan 19, 2022 at 2:06 PM Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>
>  Kenneth Adam Miller <kennethadammiller@gmail.com> writes:
>
>  > Hello all,
>  >
>  > I just want to pose the following problem:=20
>  >
>  > There is a kernel module for a non-native architecture, say, arch 1. F=
or performance reasons, the rest of all of the software
>  needs to run
>  > natively on a different arch, arch 2. Is there any way to perhaps run =
multiple QEMU instances for the different architectures in
>  such a way
>  > to minimize the cross architecture performance penalty? For example, I=
 would like the kernel module in one (non-native) QEMU
>  instance to
>  > be made available, literally equivalently, in the second (native) QEMU=
 instance. Would there be any API or way to map across
>  the QEMU
>  > instances so that the non native arch kernel module could be mapped to
>  > the native QEMU instance?
>
>  What you are describing sounds like heterogeneous system modelling which
>  QEMU only supports in a very limited way (all vCPUs must be the same
>  base architecture). You can link QEMU's together by way of shared memory
>  but there is no other wiring together done in that case although some
>  3rd party forks take this approach.
>
>  The kernel module sounds confusing - why would you have a kernel module
>  that wasn't the same architecture as the kernel you are running?
>
>  --=20
>  Alex Benn=C3=A9e


--=20
Alex Benn=C3=A9e

