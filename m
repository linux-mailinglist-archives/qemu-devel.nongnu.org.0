Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 362F4418A94
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 20:56:52 +0200 (CEST)
Received: from localhost ([::1]:51210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUZKV-00006Y-9V
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 14:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mUZIe-0007qY-UA
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 14:54:56 -0400
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:36425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mUZIb-0005YN-Ui
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 14:54:55 -0400
Received: by mail-il1-x143.google.com with SMTP id q6so2742045ilm.3
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 11:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=sender:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=nVcU/W8dOFdMy8s7Ag8KeQl+TZrn2k8s/y55HAvQVBA=;
 b=L5qrJipGn4D0bYzqya3FABRvE19z2dCJber7GyIHDA4e/OG5iSX69XyWSyS3hvsdbS
 9qw2wwF6U/Z7RR4667IzYF5Qk5lCaqvre+F8FPIq24nB3/bbqxKl/ygMxt9Hkq7ikRcK
 yNwJkW5IK9wXoEispxjjsc3kShPrZZrHSPiE47IjPKgfqa3U8icnQaVTAo5TydQHsXXu
 mDGA673U7my1AHTOoJRWywaua65LTpQ5SsxTDcqZ7pky3cMtQ2PsnvXFc0iN8LVEDU1U
 isS4UeteZSmbEm0Ova7BcWHMSo60VrYMG2fyLkOlxVKkT3xTYyY4yiW9pTb6IcXx5gNO
 w8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:mime-version:subject:in-reply-to
 :date:cc:content-transfer-encoding:message-id:references:to;
 bh=nVcU/W8dOFdMy8s7Ag8KeQl+TZrn2k8s/y55HAvQVBA=;
 b=63pjbiR6vc+t9mF0KLj1z5B3efHd6Wpd67zBkO7pgxgmAjLSZuIKojcsPBrQotJKji
 o3W2rBD5bi/mAcP2opn80H9793M1B3BqLB0wtvovzBvv2ko+OXdm6zMbFIiSJals8EXZ
 q5eWP1/HX62u8JiguCVXUw57WHsLv81lufLDGPOvS0v3MaSEOdHIGDxnb8tz5AUhfRsz
 pdiaoNeZXr+ozpZobF8Bgt/xd8e8BgpZdtEEZA3i7lUD4FE5h9P9tFz1E3gMX2oJcMsQ
 33mUjU4QgYgdg8K2MOByvDYnUZMwxd02cSfjVJiLUvWuWP5+SO/O7SyfzrewQDYMrr5z
 1FUQ==
X-Gm-Message-State: AOAM531w4x0iqQ8buvv1zOoJfb54JGWEOSKTSXXWEe6fAYNOhOfH2Ovy
 gUgwSv/K9bCslIkrgI64yVqHbw==
X-Google-Smtp-Source: ABdhPJyV0y8rdGf1+F+TJGs/rubJ2u+eNV4xdUBnfZw/1tbB5LrCngdCr8ud+P1w/aHLYkBgLi1EBQ==
X-Received: by 2002:a92:cdab:: with SMTP id g11mr16600482ild.306.1632682492450; 
 Sun, 26 Sep 2021 11:54:52 -0700 (PDT)
Received: from ?IPv6:2603:300b:6:5100:5db1:402c:1fde:e959?
 ([2603:300b:6:5100:5db1:402c:1fde:e959])
 by smtp.gmail.com with ESMTPSA id m10sm3714487ila.13.2021.09.26.11.54.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 Sep 2021 11:54:51 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
X-Google-Original-From: Warner Losh <bsdimp@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PULL v3 00/44] tcg patch queue
In-Reply-To: <436fa0e3-ce97-1d9d-339e-828c9266563f@amsat.org>
Date: Sun, 26 Sep 2021 12:54:50 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <EAE0C077-66CD-410F-B3BC-25B4552B6A1E@gmail.com>
References: <20210914155342.1296339-1-richard.henderson@linaro.org>
 <CAFEAcA-f=n6XHp5Cj7=tH8NWO1GLA50i34=5GyaHrZELyr0bjw@mail.gmail.com>
 <436fa0e3-ce97-1d9d-339e-828c9266563f@amsat.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Received-SPF: none client-ip=2607:f8b0:4864:20::143;
 envelope-from=wlosh@bsdimp.com; helo=mail-il1-x143.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Sep 14, 2021, at 11:27 AM, Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org> wrote:
>=20
> On 9/14/21 7:13 PM, Peter Maydell wrote:
>> On Tue, 14 Sept 2021 at 16:53, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>>=20
>>> Version 3: Rebase and fix a minor patch conflict.
>>>=20
>>>=20
>>> r~
>>>=20
>>>=20
>>> The following changes since commit =
c6f5e042d89e79206cd1ce5525d3df219f13c3cc:
>>>=20
>>>  Merge remote-tracking branch =
'remotes/pmaydell/tags/pull-target-arm-20210913-3' into staging =
(2021-09-13 21:06:15 +0100)
>>>=20
>>> are available in the Git repository at:
>>>=20
>>>  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210914
>>>=20
>>> for you to fetch changes up to =
a5b759b6dca7daf87fa5007a7f5784bf22f3830f:
>>>=20
>>>  tcg/arm: More use of the TCGReg enum (2021-09-14 07:59:43 -0700)
>>>=20
>>> ----------------------------------------------------------------
>>> Fix translation race condition for user-only.
>>> Fix tcg/i386 encoding for VPSLLVQ, VPSRLVQ.
>>> Fix tcg/arm tcg_out_vec_op signature.
>>> Fix tcg/ppc (32bit) build with clang.
>>> Remove dupluate TCG_KICK_PERIOD definition.
>>> Remove unused tcg_global_reg_new.
>>> Restrict cpu_exec_interrupt and its callees to sysemu.
>>> Cleanups for tcg/arm.
>>=20
>> This throws up new warnings on FreeBSD:
>>=20
>> ../src/bsd-user/main.c:148:1: warning: function declared 'noreturn'
>> should not return [-Winvalid-noreturn]
>>=20
>> Unlike linux-user, where cpu_loop() is the direct implementation
>> of the target-specific main loop, on bsd-user cpu_loop() seems
>> to just call target_cpu_loop(). Since target_cpu_loop() isn't
>> marked noreturn, the compiler complains about cpu_loop() being
>> marked noreturn.
>=20
> Sorry, my bad. I ran this on Gitlab CI but now realize the
> FreeBSD job is marked as "allow to fail" so I missed it :(
>=20
>> Easy fix would be to just drop the bsd-user part of
>> "user: Mark cpu_loop() with noreturn attribute" I guess.
>> Otherwise you could try marking all the target_cpu_loop()
>> functions noreturn as well.
>=20
> Richard, can you drop the offending patch from your pull
> request?

Yes. I think that=E2=80=99s best. I=E2=80=99m wanting to reorg a bit =
here, but I have
a number of architectures to plow through to do that=E2=80=A6  I=E2=80=99l=
l pick it
up in my queue of things to do.  Sorry for the hassles that the
non-standard arrangement in bsd-user has. I=E2=80=99ll align them more
closely going forward.

Warner=

