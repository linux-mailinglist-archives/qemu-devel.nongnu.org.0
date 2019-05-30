Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B97363056B
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 01:19:47 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60258 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWUKo-0004Kw-NJ
	for lists+qemu-devel@lfdr.de; Thu, 30 May 2019 19:19:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46728)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.m.mail@gmail.com>) id 1hWUJX-00042B-Qb
	for qemu-devel@nongnu.org; Thu, 30 May 2019 19:18:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.m.mail@gmail.com>) id 1hWUJW-0001R6-Ki
	for qemu-devel@nongnu.org; Thu, 30 May 2019 19:18:27 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:40785)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
	id 1hWUJW-0001QL-Bu
	for qemu-devel@nongnu.org; Thu, 30 May 2019 19:18:26 -0400
Received: by mail-oi1-x242.google.com with SMTP id r136so6321909oie.7
	for <qemu-devel@nongnu.org>; Thu, 30 May 2019 16:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=96l73FnALMu6Bl88Udii/cN1qV0Gnk8VFiNzlfJ/zf4=;
	b=auF2WPw1tXs63/9o1rkk6Y996CX1My/oEKSXuXdunMnDM1OgxJDymjG7mRsJ/p5QEJ
	J5VihCMtFgKgpl3L4tzITyTv64Ke+moV941OQM71Mr+SkB2t6Rm9KYow01a5+neNVoPM
	rd0UrEaEMRG6ck6I+mDkwiqlrxOHKFh3HpnM7VYH0OnLIky7wCafZUa5zLykxSHsKeG9
	2zWvGA3B8YcAbSdhPQP+7Cqng8VNKWbzeDwImtpzLK/dAICUsTDzSDHvjPn90XTHy+t0
	z/r+QnvZFmOMCcvDRU5vreN7D+HMq17V+96uY1ioVQttCQJyrSUZmyA8nU1igMoevcNk
	RpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=96l73FnALMu6Bl88Udii/cN1qV0Gnk8VFiNzlfJ/zf4=;
	b=RICwzk32G3afV9/gbwmY37AEwA5nHnQ3oOBo/Yj+oQNHpEFmto5fe8S3TIvXBcAsKy
	joZtlIZzkVtz3WJbdVxh0quuLMqagTDROOZlASye+KE7diG40DA+tCTadDwieXDYaizS
	9686aT2RRQH9kD40OfgqVFIZOlZ5Hwgd6pUeLoK6uQNXz6gJwF3omu0ed2ldzWOGWodB
	zICnaH6sVPta/CEiH9pr6leUXz4vXKxRLLkP952NZBjwE/t+PhHjHZl/DFmAlRM++LSk
	YKI7+WDjDsVqMmUjfb+PLoptlGogwWI7tF7r35d344pLezK1Cf0uR6BOq0LtGh+dqjvG
	LXCw==
X-Gm-Message-State: APjAAAUVE4sL+m48dmjhNwEQKdwNH6acZB8gNryxysGoT5F2NEoG76wM
	5tL19sqjU4DRMI/zCBDuPuH1xM36f4WfS3FzdEQ=
X-Google-Smtp-Source: APXvYqxG5VQsA4bOiHKPHpwsm58k06oB/jaGNhIoqlub+vXqUjtEjUwDnMifnKP6VWSdjA5R3k5iiUnykhrUAbuDnCk=
X-Received: by 2002:aca:1916:: with SMTP id l22mr4320991oii.136.1559258304914; 
	Thu, 30 May 2019 16:18:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7212:0:0:0:0:0 with HTTP; Thu, 30 May 2019 16:18:24
	-0700 (PDT)
Received: by 2002:a9d:7212:0:0:0:0:0 with HTTP; Thu, 30 May 2019 16:18:24
	-0700 (PDT)
In-Reply-To: <ce9444ea-b046-28b6-cb92-12e93b368caa@linaro.org>
References: <20190522222821.23850-1-richard.henderson@linaro.org>
	<20190522222821.23850-9-richard.henderson@linaro.org>
	<CAFEAcA9MTBqd5GO58hywGhYYGdbbvqiASwCvuKRBE+CVqVZTig@mail.gmail.com>
	<ecf35f19-ac1e-4964-8c9a-5cab000c6627@linaro.org>
	<CAL1e-=i6ee0YqGMOFBeiyPsiSzfF55CHePL6Gm_0pM17ZcG-PQ@mail.gmail.com>
	<ce9444ea-b046-28b6-cb92-12e93b368caa@linaro.org>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 31 May 2019 01:18:24 +0200
Message-ID: <CAL1e-=jF=nrC+_6EE=+yS3yj05tJwjb539Y5jSdeRbSs_j=ZmQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PULL 08/16] tcg/i386: Support vector comparison
 select value
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On May 30, 2019 7:45 PM, "Richard Henderson" <richard.henderson@linaro.org>
wrote:
>
> On 5/30/19 9:54 AM, Aleksandar Markovic wrote:
> >
> > On May 30, 2019 2:50 PM, "Richard Henderson" <
richard.henderson@linaro.org
> > <mailto:richard.henderson@linaro.org>> wrote:
> >>
> >> On 5/30/19 6:26 AM, Peter Maydell wrote:
> >> >> -#define TCG_TARGET_HAS_cmpsel_vec       0
> >> >> +#define TCG_TARGET_HAS_cmpsel_vec       -1
> >> >
> >> > This is the only place where we define a TCG_TARGET_HAS_* macro
> >> > to something other than 0 or 1, which means that Coverity
> >> > complains (CID 1401702) when we use it in a logical boolean
expression
> >> >   return have_vec && TCG_TARGET_HAS_cmpsel_vec;
> >> > later on.
> >> >
> >> > Should it really be -1, or is this a typo for 1 ?
> >>
> >> It really should be -1.
> >> See commit 25c012b4009256505be3430480954a0233de343e,
> >> which contains the rationale.
> >>
> >
> > How about extending commit message so that it contains explanation for
-1
> > introduced in this very patch allowing future developers not to need to
reverse
> > engineer whole git history to (maybe) find the explanation?
>
> No.
>
> There seems to be no point at which you would stop, and not include the
entire
> git history of the project into each and every commit message.
>
> I will not be drawn into such a discussion further.

Your commit messages are often disconnected with the content of the code
change, sometimes even look like cryptic puzzles. You can do much better
job there, and not look for what is good and clear for you, but what is
good and clear for others.

Regards,
Aleksandar

>
> r~
