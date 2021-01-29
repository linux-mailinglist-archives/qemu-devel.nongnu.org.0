Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE103089BD
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 16:09:48 +0100 (CET)
Received: from localhost ([::1]:59800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5VP9-0007ch-42
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 10:09:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1l5VNm-0006iX-NF
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:08:24 -0500
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:36013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1l5VNg-00034A-Ud
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:08:20 -0500
Received: by mail-qk1-x72f.google.com with SMTP id 19so8971265qkh.3
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 07:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:date:references
 :to:in-reply-to:message-id;
 bh=f0P4/wvx6Rppn5kbLWp75UpfnQYrzhu9bv0acjvmZxg=;
 b=jcovTkhuY+CSWhbsau5MATn4M/E8ZTYyOkxrhrKzYreg0VsZ3oQmkAcGSejKLrnzgS
 jADmlGuGPmqda/3wl5aD7qAO1N/dHjs75FZzsEkqyWfwAs7t987pVCG/qhBQbcHNlD0T
 exVHeEObndlLE0CYak0MEi+r4cYko5xHpASL6ZsMLZakL871zK60fmJEUaBil5BcoYmC
 f9NRD7068Mo/1xWWwteWWtJ/w9E/f5vK1VbzKrJUP/KKIv5Whb6KtoIi0OuvTxNC13yL
 WCu4+r5eTz2Obz4tqewhzA+6dCjZ6c9fFcNQM1rCqk8c8gYB1anSvYp1dCi9O1/Bxcze
 a4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:date:references:to:in-reply-to:message-id;
 bh=f0P4/wvx6Rppn5kbLWp75UpfnQYrzhu9bv0acjvmZxg=;
 b=lrO8HULSDJzOUkfGzxt8Z8EqownduHQFGIoEEKuOaFXF0hVxUQPHk5NGwNpiXqWhH4
 dOnciZVN1IbCh2CwBXhEb+ey5E1Y7a25jvDIKSo6Qfta043ROnqW8npJZVjAUACd3Q4T
 ejA6DPh6YeeJl3RPnbRW+vKcgrzRjnH9xt2NX2OIf8PGRS1TEtnytkRzxMK0U4IEOcCs
 ZvVPXF4pq77nInu/qkP1HJM50wOba9avUExgWQwph0PjoVgNJUq5JUDoph4Hq3oehPFK
 hyPOPLvHngsMy5+IITJGiJ6ASvchKqSbbsvPH78PioV9rmL7ZiYrt+gKpLqCCzQW2woL
 kxQg==
X-Gm-Message-State: AOAM530lXPYoCIv9OHwaL3zFnA2tY2KEj546XpJLQB0I+hY3L5B2gxus
 vo3T+QUhWa86O4YCF0mR6qLxsBgAjt0=
X-Google-Smtp-Source: ABdhPJzV/JNUjJ7Oy7bp8KoSy0lgYmTvaTCeS5HNJVQX1/5KoXje9ke/OPeIqcby0c9V2zMnZoJP8A==
X-Received: by 2002:a05:620a:2f7:: with SMTP id
 a23mr4548122qko.256.1611932895324; 
 Fri, 29 Jan 2021 07:08:15 -0800 (PST)
Received: from [192.168.0.16] (d149-67-30-58.try.wideopenwest.com.
 [67.149.58.30])
 by smtp.gmail.com with ESMTPSA id 11sm2278457qkm.25.2021.01.29.07.08.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Jan 2021 07:08:14 -0800 (PST)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: [Bug 1913505] Re: Windows XP slow on Apple M1
Date: Fri, 29 Jan 2021 10:08:13 -0500
References: <mailman.36363.1611901247.19110.qemu-devel@nongnu.org>
To: QEMU Developers <qemu-devel@nongnu.org>,
 1913505@bugs.launchpad.net
In-Reply-To: <mailman.36363.1611901247.19110.qemu-devel@nongnu.org>
Message-Id: <A6B43E75-ACEC-423D-BF4D-28F0139FD5B5@gmail.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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



> On Jan 29, 2021, at 1:20 AM, qemu-devel-request@nongnu.org wrote:
>=20
> Message: 14
> Date: Fri, 29 Jan 2021 06:06:41 -0000
> From: Thomas Huth <1913505@bugs.launchpad.net>
> To: qemu-devel@nongnu.org
> Subject: [Bug 1913505] Re: Windows XP slow on Apple M1
> Message-ID:
> 	=
<161190040137.32137.17544748693681218726.malone@chaenomeles.canonical.com>=

> =09
> Content-Type: text/plain; charset=3D"utf-8"
>=20
> Did you compile QEMU on your own? If so, which parameters did you use
> for the "configure" script?
>=20
> --=20
> You received this bug notification because you are a member of qemu-
> devel-ml, which is subscribed to QEMU.
> https://bugs.launchpad.net/bugs/1913505
>=20
> Title:
>  Windows XP slow on Apple M1
>=20
> Status in QEMU:
>  New
>=20
> Bug description:
>  Qemu installed by using brew install qemu -s on M1
>=20
>  QEMU emulator version 5.2.0
>  XP image from: https://archive.org/details/WinXPProSP3x86
>=20
>  Commands run:
>  $ qemu-img create -f qcow2 xpsp3.img 10G
>  $ qemu-system-i386 -m 512 -hda xpsp3.img -cdrom =
WinXPProSP3x86/en_windows_xp_professional_with_service_pack_3_x86_cd_vl_x1=
4-73974.iso -boot d
>=20
>  It's taken 3 days now with qemu running at around 94% CPU and
>  installation hasn't finished. The mouse pointer moves and =
occasionally
>  changes between the pointer and hourglass so it doesn't seem to have
>  frozen.
>=20
> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1913505/+subscriptions


Hi, I followed your directions on reproducing this issue. My times were =
very different from yours.=20

I used my own patch to make qemu-system-i386 on my M1 Mac running Mac OS =
11.1. It is on the list if you want to try it.

For Windows XP, I used my own copy. It was build 2600 and Service Pack =
3.=20

Installing Windows XP took about 23 minutes. After the installation was =
completed Windows tried to start up but probably crashed so I had to =
reboot the VM. After that it started up without problems.

Here are some benchmarks I did:

For my ARM-based QEMU I saw these start up times to the login screen: =
1:20, 1:19, 1:16, 1:18

For a QEMU binary I made a few years ago that is x86_64-based, I saw =
these times: 1:09, 1:09

The ARM-based QEMU is at version 5.2.50 (git commit =
9cd69f1a270235b652766f00b94114f48a2d603f).

The x86_64-based QEMU is at version 2.10.1.

I would have bet that the ARM-based QEMU would run circles around the =
x86_64 version, but the opposite happened.

These are my theories about what could be wrong:
- A patch somewhere made QEMU slow
  -- feature bloat
  -- bugs
  -- emulated hardware issues
- The ARM TCG isn't as good as the x86_64 version
- Non-optimal command-line options

Please let me know if you have any ideas or suggestions.

Thank you.






