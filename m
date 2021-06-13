Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAEE3A59BB
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 19:13:01 +0200 (CEST)
Received: from localhost ([::1]:53600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsTfP-0003go-Uu
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 13:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsTdv-0002jW-QZ
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 13:11:27 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:40777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsTdt-0005RQ-Tl
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 13:11:27 -0400
Received: by mail-ed1-x531.google.com with SMTP id t3so43382134edc.7
 for <qemu-devel@nongnu.org>; Sun, 13 Jun 2021 10:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l1aW0PYhlhlEzxYiz4jDaShjUugkFf3OWCdEaQXPgWA=;
 b=RqRXoLfwoxOf61ERBSStBoXhv5NIPD2k8GTJjme19dtg7jdgdNiSZ16rMwzD0yFego
 W0qTUv90CU90/CnqZUgaJTPZlwso1q60qLEzFl0lIP7EQrFyFByspchruSDGvB90uQ8i
 W0ODUtDONvwrooXC5Jm6CTWwVNCXSjoKwL28hropN6mJ+qTdoHS0JQ22cSyYi3BBLamO
 KBlSSl2zNWx98y4MJTiLFAtQE00CYAwmC5MDiy4m6MkL7Imy13RCw89do7VTQky9cxsp
 spmgw5DXTbxNHrorT1yj2Q7Z2a4DOFguWSYD6aIyMkHDb+8RgwBYKQ04Q43Iptu9WRkG
 3onw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l1aW0PYhlhlEzxYiz4jDaShjUugkFf3OWCdEaQXPgWA=;
 b=ErLkqJ3zadlnagAfVOVardi9H4IiC2ix5GC4JGX83lF9PGilW++/3u0chyvgocc1WJ
 7JSxXKutO0B+ff1d+vQxqaRnZVNuX0zlcwqsutnXCfa8dc18BFA6zciw2GAKXaHnB1JK
 LzgPkYfFhddv1zFSJ6YCAM0NZ11x9NIz41LmUQWG6vBkKKD/T36+NnNmMcP+0QILE4F4
 TAZ5HnqARfckQ15btkUNcnN2riM+mktq27p+35iTRVWzfRDDd2VX5gA34lFp/B/ZRc6b
 93n9LC93DK2JvDOnMgaehB7zZcgtrhEEkD5wgM+LJ+OAQjwhq0WmgHpVwQoXq/Al/YZj
 Jn4A==
X-Gm-Message-State: AOAM530jwutNcKUQVF+xu7BJ6nVO2/CkBTpIaU/I3+K61t7vnr51vxjF
 ofbp1Ar7kjQKovuqzflarSSd6CzQMseRIHKw80Ikug==
X-Google-Smtp-Source: ABdhPJyvIbTEDpnMKgrIKaSzPFGc/7V4iEfobDCIlIqaLf1rnwGeR0B1SeUFlT5i/Jx5IIomdXE6kY8KRSh8F04Sghk=
X-Received: by 2002:a50:a413:: with SMTP id u19mr13080812edb.251.1623604284271; 
 Sun, 13 Jun 2021 10:11:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210611234144.653682-1-richard.henderson@linaro.org>
 <CAFEAcA_k9B0-+jrKOCdtKpFjvym0Ng3POH2nRLfuoAikTJ8B0g@mail.gmail.com>
In-Reply-To: <CAFEAcA_k9B0-+jrKOCdtKpFjvym0Ng3POH2nRLfuoAikTJ8B0g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 13 Jun 2021 18:10:49 +0100
Message-ID: <CAFEAcA-bDmHFpDcqnyNR-oC3D=yOr2=D3ec2Rj57MzyFpcOMEg@mail.gmail.com>
Subject: Re: [PULL 00/34] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 13 Jun 2021 at 16:13, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 12 Jun 2021 at 00:47, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > This is mostly my code_gen_buffer cleanup, plus a few other random
> > changes thrown in.  Including a fix for a recent float32_exp2 bug.
> >
> >
> > r~
> >
> >
> > The following changes since commit 894fc4fd670aaf04a67dc7507739f914ff4bacf2:
> >
> >   Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-06-11 09:21:48 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210611
> >
> > for you to fetch changes up to 60afaddc208d34f6dc86dd974f6e02724fba6eb6:
> >
> >   docs/devel: Explain in more detail the TB chaining mechanisms (2021-06-11 09:41:25 -0700)
> >
> > ----------------------------------------------------------------
> > Clean up code_gen_buffer allocation.
> > Add tcg_remove_ops_after.
> > Fix tcg_constant_* documentation.
> > Improve TB chaining documentation.
> > Fix float32_exp2.
>
> Compile failure on OSX:
>
> ../../tcg/region.c:706:12: error: incompatible pointer to integer
> conversion assigning to 'mach_vm_address_t' (aka 'unsigned long long')
> from 'void *' [-Werror,-Wint-conversion]
>     buf_rw = region.start_aligned;
>            ^ ~~~~~~~~~~~~~~~~~~~~
> 1 error generated.

Also on x86-64 host, this failure in check-tcg:

make[2]: Leaving directory
'/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/hppa-linux-user'
make[2]: Entering directory
'/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/hppa-linux-user'
timeout --foreground 60
/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/qemu-hppa
 signals >  signals.out
timeout: the monitored command dumped core
Illegal instruction
../Makefile.target:156: recipe for target 'run-signals' failed
make[2]: *** [run-signals] Error 132
make[2]: Leaving directory
'/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/hppa-linux-user'
/home/petmay01/linaro/qemu-for-merges/tests/tcg/Makefile.qemu:102:
recipe for target 'run-guest-tests' failed

but I think this is a pre-existing intermittent.

-- PMM

