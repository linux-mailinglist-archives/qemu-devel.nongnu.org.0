Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5BF5BF2C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 17:12:10 +0200 (CEST)
Received: from localhost ([::1]:59852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhxyU-0000u0-5z
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 11:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35932)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hhxu8-0006ZV-PD
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 11:07:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hhxu7-00051N-HS
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 11:07:40 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:35619)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hhxu7-0004zx-Ab
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 11:07:39 -0400
Received: by mail-wr1-x442.google.com with SMTP id c27so6570871wrb.2
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 08:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=b+1xuwGx58g5YOKqPiVPL5nsNXXGrzLbA+IC/0+QE4s=;
 b=tVeu/he5oLZDMODJ18ic08yaLarHX5Ec5uL5zm+on565LA/5qzIWt81Vrd7faEUPMe
 3dVfnfJOZdZ+nN7jRLijDTeX/QtnkTdYjtZb+guMSXawEY9o0upJHdAqeSamrv5hFt3s
 YZpJm/nLYt2t+vRlH37MN0fUlF72/GTsrf1p3fWjlyvSD9hIvpygFq5WX9JUrxh36sKo
 xAC7ei6NuTeLPhw/TgrGMwkFL15u/W43+c35JvtKfwWDMbB8LgP/mueQOlIrOigig+IM
 WQt0804JXH4o6/+pwc4glvS32OSjBHKTyj8xLGUjUE4grwzNa+8f6806vtoWyRhIdZN3
 fN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=b+1xuwGx58g5YOKqPiVPL5nsNXXGrzLbA+IC/0+QE4s=;
 b=pwXXNdSs/ah7+6gF+YnhL1Oo7gOLbWFiEdAtSsI0PoGb38khIeK6Bo8zobDp51CVJT
 UQOJVFsRmWgPoBicfw8LQ5geyHyK+9ZpXFbJE/g0DwMfSGFtrkQE1eoY8JyVYdw3W/oq
 sDInH3O8RXg1xhw35THFoKiCDrhTF29AV5r5Jv1LOBWCz89Z3deycz8FRjn/AgUzLw27
 ErRwrctMrwJekq57elnWYE6Ki4yNaZ1o6JwJUb59eDMFr8r4gXq4nT9B7ynMXbpeUUCV
 60JTjs5m6HUU3l3C1FubwQBLydRKJ5Rm0BoR69IxJhzn3hZM5xfnqvkTVGDS8VstxOHK
 kGMw==
X-Gm-Message-State: APjAAAVeY0l5owt+3mmtqizBcIBy79gyfxQPMPpWSJ9bDIqBV8shXcXr
 QbJnz+l6KEahPvQZ9P2DrgQOBg==
X-Google-Smtp-Source: APXvYqwUHBv1t9yBzgszPB5G3GJBfkxtjPZEJj/9ZSUsA+zjDo5rmBf07iRD2egJduxWbjd7Zub0cQ==
X-Received: by 2002:adf:fbd0:: with SMTP id d16mr18129255wrs.341.1561993656987; 
 Mon, 01 Jul 2019 08:07:36 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id j7sm14941443wru.54.2019.07.01.08.07.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 08:07:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E70A01FF87;
 Mon,  1 Jul 2019 16:07:35 +0100 (BST)
References: <20190624134337.10532-1-alex.bennee@linaro.org>
 <CAFEAcA_VPcqxVjmSkRYoRRYS9TvM9KXU7e7pww9UofApp42O7Q@mail.gmail.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
In-reply-to: <CAFEAcA_VPcqxVjmSkRYoRRYS9TvM9KXU7e7pww9UofApp42O7Q@mail.gmail.com>
Date: Mon, 01 Jul 2019 16:07:35 +0100
Message-ID: <875zolssi0.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-devel] [PULL 00/19] testing/next (tests/vm,
 Travis and hyperv build fix)
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


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 24 Jun 2019 at 14:43, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> The following changes since commit 474f3938d79ab36b9231c9ad3b5a9314c2aea=
cde:
>>
>>   Merge remote-tracking branch 'remotes/amarkovic/tags/mips-queue-jun-21=
-2019' into staging (2019-06-21 15:40:50 +0100)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/stsquad/qemu.git tags/pull-testing-next-240619-1
>>
>> for you to fetch changes up to e0fe22c3528773fcbfd135a0ef7f6b3c5d373bb9:
>>
>>   target/i386: fix feature check in hyperv-stub.c (2019-06-24 14:36:39 +=
0100)
>>
>> ----------------------------------------------------------------
>> Various testing fixes:
>>
>>    - tests/vm updates and clean-ups
>>    - tests/vm serial autobuild on host
>>    - ensure MacOS builds do "brew update"
>>    - ensure we test --static user builds
>>    - fix hyperv compile failure
>>
>> This brings my testing back to green on all CI services.
>
> The FreeBSD tests pass OK but the new output includes
> some stuff that trips my "find error/warning messages grep:
> con recv: /etc/rc: WARNING: $hostname is not set -- see rc.conf(5).
> con recv: /etc/rc: WARNING: hostid: unable to figure out a UUID from
> DMI data, generating a new one

These are artefacts of setting up a new system - we have no hostname
until we've been through the setup. It won't occur on installed systems.

> pkg: Repository FreeBSD load error: access repo
> file(/var/db/pkg/repo-FreeBSD.sqlite) failed: No such file or
> directory
>         p5-Error: 0.17027

That seems to be a transient fault I haven't been able to replicate.

>
> There's also a new compile warning:
> /home/qemu/qemu-test.r7G0Wv/src/migration/rdma.c:842:26: warning:
> unused variable 'port_attr' [-Wunused-variable]
>     struct ibv_port_attr port_attr;

Fixed.

>                          ^
> which I guess was not being flagged up by the old compiler/VM image.
>
> OpenBSD also passes but has some output which my 'find warnings'
> grep picks up:
>
> con recv: WARNING: root is targeted by password guessing attacks,
> pubkeys are safer.

Looking at this now.

>
> thanks
> -- PMM

--
Alex Benn=C3=A9e

