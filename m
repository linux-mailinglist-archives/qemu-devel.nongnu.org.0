Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0986B333EE
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 17:51:46 +0200 (CEST)
Received: from localhost ([127.0.0.1]:37060 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXpFQ-0001lU-Vx
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 11:51:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hXpEO-00011N-Io
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 11:50:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hXpEN-0002cT-AK
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 11:50:40 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:39712)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hXpEL-0002XF-FY
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 11:50:37 -0400
Received: by mail-wm1-x333.google.com with SMTP id z23so11623812wma.4
	for <qemu-devel@nongnu.org>; Mon, 03 Jun 2019 08:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:subject:in-reply-to:date:message-id
	:mime-version:content-transfer-encoding;
	bh=KiH1+CO5I7XpmpwSbjM6Q+EqoJzOEQidVc5ME4UCOYs=;
	b=ypWajMjKERaGgUT+642lbWEVMODlXzhbbIyWndSpr5MNfcI12Tkhonh6FY2UtFmHT4
	rWhbBLHjJnZ+kWOBiVfMbPuEcHQSU4NPhNVLCSbgTDwKHcbLTGe9vMMP4paZsncNy+be
	jlFTOAKCF9wUUnD/QUIb/e5wShCMR7vmmKZ5t0gjquAEdesjbcId7Y13Vubbdq6FR45Z
	lHhOBWK01X8yKqUgrKnezH2AqsBigInj0jeGH328ywdQF3xwmj8ooPw50AGXZ6mezwfw
	lpKYrsNlTuVGc8EdZvjAEtatYWHi+ueIkdDxGYBcQx3N1JmGyutzkWT+t2epU/8FSS6f
	UemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=KiH1+CO5I7XpmpwSbjM6Q+EqoJzOEQidVc5ME4UCOYs=;
	b=rB0Uet8c/4cwK6xAltNDPDxBZgL6Z7BV96J5mDr6ThgvNfjPg9nm61RMFwRCRhVibr
	kmLN+ma4y7DLSrb8c3zOL1GSJrDJ98LQ9GOxZgfMrK6uqYLdWCQ/KCrzfLkfVnroM2q1
	rItsS+5MQCq7yF/7kHEekHAiTNqx6wEBGamjmaLNNkDG48qQrHMJFjQ7JFKDOkpq/fTu
	s9J+81vzX9Sj+2E6Ba8/UirLOvSnMCaBAiQMmUBcfgc0y+3e9iXBzOiu/xw6/8F2OCJ1
	TJWKy1CPzJUbuEeFdL7670fg2rM/vVmufwBFLChOXozYsWx33mZEjJzCRaMJE7GO/pq/
	fMgQ==
X-Gm-Message-State: APjAAAXJGhSOZxsZ1kyFW/dV1eHY9Or2dVYJtH7vFipDwGKIxxmJmOWm
	6zf4zH1Fg0mrwnWBYAw5Ts5Cm6Nb8VI=
X-Google-Smtp-Source: APXvYqxmJOrn8cmOvxVxH8UloXB5WJO/aXmpxTZyZG7DVR873OF9cTWJ2/jdLzgvm4pSKg/saFmCyw==
X-Received: by 2002:a1c:6545:: with SMTP id z66mr2839084wmb.77.1559577034980; 
	Mon, 03 Jun 2019 08:50:34 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	x11sm9465177wmg.23.2019.06.03.08.50.34 for <qemu-devel@nongnu.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 03 Jun 2019 08:50:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E5B6B1FF87
	for <qemu-devel@nongnu.org>; Mon,  3 Jun 2019 16:50:33 +0100 (BST)
References: <201906010603.23645.randrianasulu@gmail.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
In-reply-to: <201906010603.23645.randrianasulu@gmail.com>
Date: Mon, 03 Jun 2019 16:50:33 +0100
Message-ID: <871s0abrcm.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::333
Subject: Re: [Qemu-devel] "accel/tcg: demacro cputlb" break
 qemu-system-x86_64
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Andrew Randrianasulu <randrianasulu@gmail.com> writes:

> Hello!
>
> I was compiling latest qemu git, and was surprized to find qemu-system-x8=
6_64
> (compiled for 32-bit x86 machine) can't boot any 64-bit kernel anymore.
>
> 32-bit kernels and kvm were fine.

Can you test with:

  Subject: [RFC PATCH] cputlb: use uint64_t for interim values for unaligne=
d load
  Date: Mon,  3 Jun 2019 16:01:20 +0100
  Message-Id: <20190603150120.29255-1-alex.bennee@linaro.org>


> So, I run git bisect
>
> ./configure --target-list=3Dx86_64-softmmu --disable-werror
>
> make -j 5
>
> x86_64-softmmu/qemu-system-x86_64 -kernel /boot/bzImage-4.12.0-x64 -accel=
 tcg
>
> git bisect log
> git bisect start
> # bad: [60905286cb5150de854e08279bca7dfc4b549e91] Merge remote-tracking b=
ranch 'remotes/dgibson/tags/ppc-for-4.1-20190529' into staging
> git bisect bad 60905286cb5150de854e08279bca7dfc4b549e91
> # good: [32a1a94dd324d33578dca1dc96d7896a0244d768] Update version for v3.=
1.0 release
> git bisect good 32a1a94dd324d33578dca1dc96d7896a0244d768
> # good: [32a1a94dd324d33578dca1dc96d7896a0244d768] Update version for v3.=
1.0 release
> git bisect good 32a1a94dd324d33578dca1dc96d7896a0244d768
> # good: [9403bccfe3e271f04e12c8c64d306e0cff589009] Merge remote-tracking =
branch 'remotes/pmaydell/tags/pull-target-arm-20190228-1' into staging
> git bisect good 9403bccfe3e271f04e12c8c64d306e0cff589009
> # good: [9403bccfe3e271f04e12c8c64d306e0cff589009] Merge remote-tracking =
branch 'remotes/pmaydell/tags/pull-target-arm-20190228-1' into staging
> git bisect good 9403bccfe3e271f04e12c8c64d306e0cff589009
> # good: [a39286dd61e455014694cb6aa44cfa9e5c86d101] nbd: Tolerate some ser=
ver non-compliance in NBD_CMD_BLOCK_STATUS
> git bisect good a39286dd61e455014694cb6aa44cfa9e5c86d101
> # bad: [bab1671f0fa928fd678a22f934739f06fd5fd035] tcg: Manually expand IN=
DEX_op_dup_vec
> git bisect bad bab1671f0fa928fd678a22f934739f06fd5fd035
> # bad: [bab1671f0fa928fd678a22f934739f06fd5fd035] tcg: Manually expand IN=
DEX_op_dup_vec
> git bisect bad bab1671f0fa928fd678a22f934739f06fd5fd035
> # good: [956fe143b4f254356496a0a1c479fa632376dfec] target/arm: Implement =
VLLDM for v7M CPUs with an FPU
> git bisect good 956fe143b4f254356496a0a1c479fa632376dfec
> # good: [df06df4f412a67341de0fbb075e74c4dde3c8972] Merge remote-tracking =
branch 'remotes/ericb/tags/pull-nbd-2019-05-07' into staging
> git bisect good df06df4f412a67341de0fbb075e74c4dde3c8972
> # good: [e5a0a6784a63a15d5b1221326fe5c258be6b5561] vvfat: Replace bdrv_{r=
ead,write}() with bdrv_{pread,pwrite}()
> git bisect good e5a0a6784a63a15d5b1221326fe5c258be6b5561
> # bad: [01807c8b0e9f5da6981c2e62a3c1d8f661fb178e] Merge remote-tracking b=
ranch 'remotes/armbru/tags/pull-misc-2019-05-13' into staging
> git bisect bad 01807c8b0e9f5da6981c2e62a3c1d8f661fb178e
> # bad: [04d6556c5c91d6b00c70df7b85e1715a7c7870df] Merge remote-tracking b=
ranch 'remotes/stsquad/tags/pull-demacro-softmmu-100519-1' into staging
> git bisect bad 04d6556c5c91d6b00c70df7b85e1715a7c7870df
> # good: [c9ba36ff2f56a95dec0ee47f4dab0b22a0a01f86] Merge remote-tracking =
branch 'remotes/kevin/tags/for-upstream' into staging
> git bisect good c9ba36ff2f56a95dec0ee47f4dab0b22a0a01f86
> # bad: [fc1bc777910dc14a3db4e2ad66f3e536effc297d] cputlb: Drop attribute =
flatten
> git bisect bad fc1bc777910dc14a3db4e2ad66f3e536effc297d
> # bad: [f1be36969de2fb9b6b64397db1098f115210fcd9] cputlb: Move TLB_RECHEC=
K handling into load/store_helper
> git bisect bad f1be36969de2fb9b6b64397db1098f115210fcd9
> # bad: [eed5664238ea5317689cf32426d9318686b2b75c] accel/tcg: demacro cput=
lb
> git bisect bad eed5664238ea5317689cf32426d9318686b2b75c
> # first bad commit: [eed5664238ea5317689cf32426d9318686b2b75c] accel/tcg:=
 demacro cputlb
>
> Not sure how many people test qemu-system-x86_64 on 32-bit x86 hosts....
>
>  gcc --version
> gcc (GCC) 5.5.0
>
> commit log says
>
> -------------
> accel/tcg: demacro cputlb
>
>     Instead of expanding a series of macros to generate the load/store
>     helpers we move stuff into common functions and rely on the compiler
>     to eliminate the dead code for each variant.
> --------------
>
> May be gcc 5.5.0 was not really good in this case ...


--
Alex Benn=C3=A9e

