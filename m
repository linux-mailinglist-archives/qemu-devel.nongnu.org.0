Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE3531911A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 18:33:39 +0100 (CET)
Received: from localhost ([::1]:58836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAFqT-0000BB-IP
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 12:33:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAFm9-0005uT-P8
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:29:09 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:52223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAFm4-0000Qu-SI
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:29:09 -0500
Received: by mail-wm1-x331.google.com with SMTP id u16so2615852wmq.1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 09:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=XacojJwChwCgCh7d4wMZPRO+Bqw1FgMihSrdTu+hTF8=;
 b=uL2UKux2MfYegmryNYHL8xOe5o/jfd9Fp8H3ToMm+DiuZx2tLKa7bhxiphUYJhT3RW
 QWY4IzuOBuWsYwppn7GMP7Qm4Z6/kbJhAcCW2mxRgGFzScVo6frDpHH0pGVPqv5Za2X3
 PG7APlkwfYHOGq0tMdloNjWW53IfylEwxMYFW/LHNUo1tUYshW5SPgkXSUKTvnUe2nNe
 yVepfrVNsNKHKFlcLEoSVfnZmSOm3iX5rrea33YaCt5dksfq8LNfAu3ZhNd/Jc9TX40B
 a5qG2v0dHSnyZp7SLzQMCM9FlbFPKoHt69BPTaH4dqwghT5xrbviaHg0zcZJvF2kBQ3P
 zYPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=XacojJwChwCgCh7d4wMZPRO+Bqw1FgMihSrdTu+hTF8=;
 b=YuQRB9d+LQZNMh9Nm2/Hbg+xWm+i2HTD4rdyp1Jp0WDoAUJy+ZiTkkrDZRz+keGRHk
 q2cdw1noEjND5JrmdG0ESiKmNzKCd6Fxk0yGOTv03XTzFHK9EUmo1hdqjcbjp3T5sXVc
 +8pq5TOqa3CFdVE1EAEWRdWGwHuB24Mvkda6XZRif6BLEBIvECXz5tfUsOhDFAfQKl9/
 N3bt1g2dpOZoPhRtiDUiD6Lgr5gZE+DRnvgEPLWIuPN+hRxoJ190X/eGXlp8GmQqYXLn
 sFX8q+99+I7rc1y56Wc9FsufqWjeoacuSxPZo/ewjeG+Qy83ElNVDsYVN6Fbr/rk1yz5
 9mMw==
X-Gm-Message-State: AOAM533IvY04vepiTcZUM4v0snw9cV6HXotzEciEmr92aAMucnGptiGG
 GVsy7J5woeJ7uZgx8I9+sJdoPA==
X-Google-Smtp-Source: ABdhPJxQRYmchdZ8cs2uRkNIcWDkzR/gyPOLkNbi+v5moB5Md4625qWw4rfjKcuKBmDpExLAjuhi7g==
X-Received: by 2002:a7b:c852:: with SMTP id c18mr6207990wml.118.1613064542480; 
 Thu, 11 Feb 2021 09:29:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u14sm6467850wro.10.2021.02.11.09.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 09:29:01 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6CD881FF7E;
 Thu, 11 Feb 2021 17:29:00 +0000 (GMT)
References: <YBTRSK4/F5KLH+FZ@strawberry.localdomain>
 <YBxnlZFkp7YA9PXL@strawberry.localdomain> <871rdupw3h.fsf@linaro.org>
 <YB1VljlPQPRRZUvc@strawberry.localdomain> <87v9b6o8bu.fsf@linaro.org>
 <YB1nf/M613d0B+Pm@strawberry.localdomain>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: Detecting Faulting Instructions From Plugins
Date: Thu, 11 Feb 2021 17:27:35 +0000
In-reply-to: <YB1nf/M613d0B+Pm@strawberry.localdomain>
Message-ID: <87k0resecj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: cota@braap.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> On Feb 05 15:03, Alex Benn=C3=A9e wrote:
>> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
>> > Assuming you're right that TCG is detecting "a io_readx/io_writex when
>> > ->can_do_io is not true", could we detect this case when it occurs and
>> > omit the instruction callbacks for the re-translation of the single
>> > instruction (allow the initial callback to stand instead of trying to
>> > turn back time, in a way, to prevent it)? Maybe there would have be so=
me
>> > bookkeeping in the plugin infrastructure side rather than entirely
>> > omitting the callbacks when re-translating, in case that translation g=
ot
>> > re-used in a case which didn't hit the same behavior and shouldn't be
>> > skipped?
>>=20
>> They are happening in two separate phases. The translation phase has no
>> idea what the runtime condition will be. Once we get to runtime it's too
>> late - and we trigger a new translation phase.
>
> I believe I understand why we can't catch the initial translation. To
> make sure I'm communicating well, my current understanding is that the
> timeline for this case goes something like:
>
> 1) translate large block of instructions, including ldr
> 2) attempt to execute ldr, calling instruction callback
> 3) notice that access is to IO, trigger re-translation of single
>    ldr instruction
> 4) execute block with single ldr instruction to completion, calling both
>    instruction and memory callbacks
>
> I was wondering if it would be possible to inform the re-translation in
> step 3 that it's for a re-translated IO access so that it could
> ultimately cause the second of the duplicate instruction callbacks to be
> omitted during execution in 4.

This is what I've done - re-executed blocks are compiled with CF_NOINSTR
which skips any instrumentation. If you could test the series I posted and
confirm the problem is solved that would be great:

  Subject: [PATCH  v2 00/21] plugins/next pre-PR (hwprofile, regression fix=
es, icount count fix)
  Date: Wed, 10 Feb 2021 22:10:32 +0000
  Message-Id: <20210210221053.18050-1-alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

