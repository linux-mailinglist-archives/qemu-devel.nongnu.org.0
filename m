Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BAD5B86B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 11:54:01 +0200 (CEST)
Received: from localhost ([::1]:56620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hht0a-0001yf-Cm
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 05:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54452)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hhszV-0001WR-Ik
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 05:52:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hhszU-0002N8-Fu
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 05:52:53 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:41743)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hhszU-0002M6-8S
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 05:52:52 -0400
Received: by mail-ot1-x341.google.com with SMTP id o101so12540343ota.8
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 02:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MmNckSm2XAzvctbvhUpKbpJjd94dJV8ANtzR9spR1Aw=;
 b=hcwFyWPesn+zrRPnCPqmEuJFVymt7Gz+ESCL8yoKr7n8TArB3aYupgWapGxRgerYzG
 4XzefGMLd+tXiZWfYw+IzwSdvYIMqyTNMAakTnNFnu4f1SXuu8sOdsgJlpuneHLpPySd
 Ouywak1EzI3l77zuJRVrSCard+pgjLfLuZPyTUNwft+l7WWo9t++c2CeJLTML4P0zpA2
 ILjFT65RkIpMaQI2RYRD95rmODr4Ej5gd8q6JGHXvaoRmzam/FjsMAzOI7AXN3ZPaLdm
 PNPVhCVzs/ks7crj4R6hNtZ5dD+IQmT7cr8DZWocXlbN5MjVbOmk32Se09IMXN49YjVv
 hAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MmNckSm2XAzvctbvhUpKbpJjd94dJV8ANtzR9spR1Aw=;
 b=hGtl2rfFIvWrGPcxduiqFqmxWZ4yjozzZJknb9J5SETEKTgPtSUrroqo5bPVQ0gIEo
 0ajj9B9edXnDWEv/0CZnjrdwFzxCoHHaKhP0GDQyNYDlnRssBlRheSV5g7uCj2ohlKei
 +KF6TAAPpTmcATlNzG31qsN6/T/scuU9XgaYhJ+4yRjYzzBtvx821eYeS0d6OlkIn6UY
 Z15aW69NWw02a4S0Yp+abC9AikRICT+82ymWV//e6mxKaoOTI2PdGJoVcyJIWjxbx4Su
 ddqehpE8eoPNWFZhsEbOt5N/dmyD4eKTPUGHdnqGXWTswkDfy4cTHE1GRXoODRq1iMSY
 db/w==
X-Gm-Message-State: APjAAAXsv7l9MJfKr9+sG/nE3w9WAVlEWdqpSO8AJxUvhLA0rbmzuLxu
 gWoZkanQ7Zs9yVZnl5tRWD5Qj9gbUw/pdW1DUWFr2g==
X-Google-Smtp-Source: APXvYqyM7KjHPeoB44GH0tiE6V1Lu3WH298uslu6ifqfrB4ylAiVcLbTR3piTVYTgzGEcZM7iGvP34P9HZNJSh2tqdk=
X-Received: by 2002:a9d:4d81:: with SMTP id u1mr7924422otk.221.1561974770968; 
 Mon, 01 Jul 2019 02:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190624134337.10532-1-alex.bennee@linaro.org>
In-Reply-To: <20190624134337.10532-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 10:52:40 +0100
Message-ID: <CAFEAcA_VPcqxVjmSkRYoRRYS9TvM9KXU7e7pww9UofApp42O7Q@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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

On Mon, 24 Jun 2019 at 14:43, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit 474f3938d79ab36b9231c9ad3b5a9314c2aeac=
de:
>
>   Merge remote-tracking branch 'remotes/amarkovic/tags/mips-queue-jun-21-=
2019' into staging (2019-06-21 15:40:50 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-testing-next-240619-1
>
> for you to fetch changes up to e0fe22c3528773fcbfd135a0ef7f6b3c5d373bb9:
>
>   target/i386: fix feature check in hyperv-stub.c (2019-06-24 14:36:39 +0=
100)
>
> ----------------------------------------------------------------
> Various testing fixes:
>
>    - tests/vm updates and clean-ups
>    - tests/vm serial autobuild on host
>    - ensure MacOS builds do "brew update"
>    - ensure we test --static user builds
>    - fix hyperv compile failure
>
> This brings my testing back to green on all CI services.

The FreeBSD tests pass OK but the new output includes
some stuff that trips my "find error/warning messages grep:
con recv: /etc/rc: WARNING: $hostname is not set -- see rc.conf(5).
con recv: /etc/rc: WARNING: hostid: unable to figure out a UUID from
DMI data, generating a new one
pkg: Repository FreeBSD load error: access repo
file(/var/db/pkg/repo-FreeBSD.sqlite) failed: No such file or
directory
        p5-Error: 0.17027

There's also a new compile warning:
/home/qemu/qemu-test.r7G0Wv/src/migration/rdma.c:842:26: warning:
unused variable 'port_attr' [-Wunused-variable]
    struct ibv_port_attr port_attr;
                         ^
which I guess was not being flagged up by the old compiler/VM image.

OpenBSD also passes but has some output which my 'find warnings'
grep picks up:

con recv: WARNING: root is targeted by password guessing attacks,
pubkeys are safer.

thanks
-- PMM

