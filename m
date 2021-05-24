Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 066F738F638
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 01:24:01 +0200 (CEST)
Received: from localhost ([::1]:48622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llJvT-0008HZ-J3
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 19:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1llJuW-0007YX-PZ
 for qemu-devel@nongnu.org; Mon, 24 May 2021 19:23:00 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:44770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1llJuU-0005qj-OG
 for qemu-devel@nongnu.org; Mon, 24 May 2021 19:23:00 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 h20-20020a17090aa894b029015db8f3969eso11450331pjq.3
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 16:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midokura.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mgPc+rTBeS6VWxr9ea9xmcvPBqDeyfyi1BlT6krx3zM=;
 b=uBFLIhpPTKHXdD3kLIK8af9dLuCOpVDkMokeStvuu+VUo+Pe0TQGb4Q95cDBPlLHhK
 lWVGS74CE3UaFq0KOoIAHy44WLRu0lQoMafGYc7pR9TvC2rgPn/TxVZrcuD1wKDxKc/r
 f8fHxj/eUd0zKjxcEhP/Bsrqdnk2Gj7uWEM7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mgPc+rTBeS6VWxr9ea9xmcvPBqDeyfyi1BlT6krx3zM=;
 b=W9x5NwdsJgzu+4h8obuxCdfcgSBr3B78+faYXNpxY1vKqJ2UJEf+vty5j1e0wW7Lyv
 72kTwNM6WfdBDyrDzueUlB6qi1aL9lSGwLQUwYMDCOd+aaDDRTyxFONIl20C0NLgifyG
 KbDgkf6/6c6pLBUSOp45nbqQTh30iX+ufJizkNjtxxFsC51jQ/ObZHoX1HklczpU0TMr
 s8i4AfW2ZUlLhcQjEusJZ9maKuC/8LLsLteWKxmVZg5cenifkGbzKtuvF6AYRXf6DoBF
 mJ3FAG8si8gduMVSL4aOENh3xCLPT4+rh9ghv4QxEmEXpJ0Nu3hJ08xiTjbVUBsdijt9
 R+NQ==
X-Gm-Message-State: AOAM533TXjD1418+wmrMAvPkTThbU2GwrRkwEXvs2c20mxWh2WiAeWsh
 eR2iEz7OOne8trUicsoUFbTNEb/qUe7GS0Y1KcJjyw==
X-Google-Smtp-Source: ABdhPJzUdSjWeOrx24rmlbCAmIw1q6XwphWlyb6o567T7lflmKLqTW0srYtcFuzs1tH6dq5DIFy2mnFRqs8fj3bCglA=
X-Received: by 2002:a17:90a:3ec3:: with SMTP id
 k61mr1636436pjc.48.1621898577077; 
 Mon, 24 May 2021 16:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210524045412.15152-1-yamamoto@midokura.com>
 <87cztg3tv0.fsf@linaro.org>
In-Reply-To: <87cztg3tv0.fsf@linaro.org>
From: Takashi Yamamoto <yamamoto@midokura.com>
Date: Tue, 25 May 2021 08:22:46 +0900
Message-ID: <CAH=wFzQjYJHN3xH1QhyxzZNDXGjQDw5UxhwH2NEiQoYjWcqh-g@mail.gmail.com>
Subject: Re: [PATCH 0/5] linux-user changes to run docker
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=yamamoto@midokura.com; helo=mail-pj1-x1029.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 25, 2021 at 2:49 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> YAMAMOTO Takashi <yamamoto@midokura.com> writes:
>
> > These patches, along with a few more hacks [1] I didn't include
> > in this patchset, allowed me to run arm64 and armv7 version of
> > dind image on amd64.
> >
> > [1] https://github.com/yamt/qemu/tree/linux-user-for-docker
>
> Might be worth posting those patches next time (even if they have a RFC
> or !MERGE in the title for now).

ok.

> I had a little noodle around with
> testing and quickly found a few holes. It would be nice if we could have
> a unit test to cover these various bits as I fear it will easily break
> again. Feel free to use the following as a basis if you want:

frankly, i feel it's enough to cover the cases which are actually used
by real apps.
is "/proc/./self/exe" etc used in the field?

>
>
>
> > You can find my test setup here:
> > https://github.com/yamt/garbage/tree/master/binfmt-aarch64-install
> >
> > YAMAMOTO Takashi (5):
> >   linux-user: handle /proc/self/exe for execve
> >   linux-uesr: make exec_path realpath
> >   linux-user: Fix the execfd case of /proc/self/exe open
> >   linux-user: dup the execfd on start up
> >   linux-user: Implement pivot_root
> >
> >  linux-user/main.c    | 14 +++++++++++++-
> >  linux-user/qemu.h    |  2 ++
> >  linux-user/syscall.c | 43 ++++++++++++++++++++++++++++++++++++++++---
> >  3 files changed, 55 insertions(+), 4 deletions(-)
>
> I also had a go at cleaning up is_proc_self and Daniel greatly
> simplified it.

thank you for the info.
unfortunately the approach seems incompatible with what i want to do
eventually. (handle non-self cases as well)

>
>
>
> --
> Alex Benn=C3=A9e

