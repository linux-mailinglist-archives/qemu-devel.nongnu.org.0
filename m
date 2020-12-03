Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8855E2CDBB4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 18:04:16 +0100 (CET)
Received: from localhost ([::1]:40510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kks1e-0001Uv-Ci
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 12:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kkrwo-0007dA-3P
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 11:59:15 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:35416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kkrwk-0002nN-Ax
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 11:59:13 -0500
Received: by mail-wm1-x32b.google.com with SMTP id e25so4655772wme.0
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 08:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=tAKqlVV2mvKUJt4KzFceQuO93xaoLxe7zFmxURNGBSU=;
 b=N1N5Mx9LB8GfBf17PRgcWHJcqHm2V0M9enbbkI8dzjPZwaHNqv95NeeSw/i24tvlzw
 nCxsNsKrSGirVp66FyPYEFAf4kdYSIikBj7blL0CxeVHQTV6fJo5kyurFm5/JC+bpw9m
 KoF0u7ohslTOmTLxV/SidbrtoQn1nyFX5vg4HpXcG8vebvvZHlYgTg3+C1qrQ0rJCYnR
 GouaB2IlnnJK7frWALbR+TaeYxht1bqvRvb8svAmH3aqDAPoiScERwQFnEOoXKrj8b+j
 ywj29EIRL6YM0+aOAm9EPqxwZ1E6TcU+7QMNtnrgmmSptxRWXGMMYBaM+68df1nfyoeI
 NOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=tAKqlVV2mvKUJt4KzFceQuO93xaoLxe7zFmxURNGBSU=;
 b=Fy19q+6vEEjBJZmuJ4HLS/kD6AR7wZWRul3c31egKJKOw1e5ZMzYSn4SQjcqL7yvKE
 PCo41OK9d5+8rTB2fsgcCmXFP51Ev2Duhy23hbTOMHfqQLvFpq5Ub1YCuvYYB3KQQz8J
 7DBJi0xPgtbhQlm/KcUFN/idwzSPXQsJg/rzlmujhRNSBLtP07aG1yq1lpw1HUyEqQk/
 1bvNHgXaUZondssfKdCrdOU61k5FIkt54DvhJPxeA5zxK7trp+4hCewRXsNcStbwLOVl
 ygB1QS4YSb0JyZ9g8bxlklTkmYgLECkEFrWuqi/cZATDUEB3mVCePv18FpqyLhYtCHHq
 aLBQ==
X-Gm-Message-State: AOAM532SwpNmlXYPsP1zCClUY9Fu/V65+jpAI7e2wolrmhxQ6P9flstX
 eTIzc//vrrjckvUsLmwQmbEGKg==
X-Google-Smtp-Source: ABdhPJzPVsFTgDBa/aSP0DP1sPcPuwkAdyfmIN++4GRqlePJF+tliLq5YlsErKp2iL588dPU4rHcjQ==
X-Received: by 2002:a1c:5402:: with SMTP id i2mr92084wmb.12.1607014746033;
 Thu, 03 Dec 2020 08:59:06 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s4sm23160wra.91.2020.12.03.08.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 08:59:04 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 310891FF7E;
 Thu,  3 Dec 2020 16:59:04 +0000 (GMT)
References: <19955b4e-f33a-a672-e9c6-3efdd640906a@suse.de>
 <48353514-8dde-0f4b-193d-fa71737d7c80@amsat.org>
 <871rghixhb.fsf@linaro.org> <6efbff12-a10b-8e55-908b-f2233fc8001e@suse.de>
 <87sg8xgyj7.fsf@linaro.org> <0264d8b0-9b29-f97b-7c6f-a9394066a5e2@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: help with a build-user and build-user-plugin failure
In-reply-to: <0264d8b0-9b29-f97b-7c6f-a9394066a5e2@suse.de>
Date: Thu, 03 Dec 2020 16:59:04 +0000
Message-ID: <87eek6su5j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> Hi all,
>
> and thanks for the help, after a lot of fiddling and applying your sugges=
tions (and a reboot !?)
> now things work.
>
> The only thing I am left seeing (also on master) is with check-tcg:
>
>
> Remote 'g' packet reply is too long (expected 312 bytes, got 560 bytes): =
000000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
000004000800431000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000001006300000000000=
1006340000000082009207000000000000000000000000000000000000000000000000
> Traceback (most recent call last):
>   File "/home/claudio/git/qemu/tests/tcg/multiarch/gdbstub/sha1.py", line=
 68, in <module>
>     if gdb.parse_and_eval('$pc') =3D=3D 0:
> gdb.error: No registers.
>
>
> a number of times during the test.

Hmm that is a mismatch between a broken multiarch gdb and the test. It
is indeed harmless (that's what the $pc test is for) but unfortunately
very noisy on the build. All distros seem to package things differently
but you can either install gdb-multiarch which configure will prefer
when detecting or build your own gdb and point at it with configure
--gdb=3D/path/to/gdb

>
> Seems not to break anything, but I wonder if it is expected or it
> would need suppressing?

I'm open to a clean way of skipping these tests when we don't have all
the parts we need to run.=20

>
> Thanks again,
>
> Claudio
>
>
> On 11/25/20 6:02 PM, Alex Benn=C3=A9e wrote:
>>=20
>> Claudio Fontana <cfontana@suse.de> writes:
>>=20
>>> Hi Alex,
>>>
>>> On 11/25/20 10:42 AM, Alex Benn=C3=A9e wrote:
>>>>
>>>> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>>>>
>>>>> On 11/24/20 12:04 PM, Claudio Fontana wrote:
>>>>>> Hi Alex,
>>>>>>
>>>>>> I am seeing build failures with build-user and build-user-plugin:
>>>>>>
>>>>>> https://gitlab.com/hw-claudio/qemu/-/pipelines/220245998
>>>>>>
>>>>>> and I am trying to start investigating.
>>>>>>
>>>>>> How do I reproduce this locally?
>>>>>>
>>>>>> I am trying to run locally the check-tcg rule, but I cannot get it t=
o work.
>>>>>> I managed to work around the problem of static libraries (disabled t=
hem),
>>>>>>
>>>>>> but then I get:
>>>>>>
>>>>>>   BUILD   TCG tests for x86_64-linux-user
>>>>>>   BUILD   x86_64-linux-user guest-tests with cc
>>>>>> /usr/lib64/gcc/x86_64-suse-linux/7/../../../../x86_64-suse-linux/bin=
/ld: /tmp/ccgqtAM9.o: in function `test_fops':
>>>>>> /dev/shm/cfontana/qemu/tests/tcg/i386/test-i386.c:759: undefined ref=
erence to `fmod'
>>>>>> /usr/lib64/gcc/x86_64-suse-linux/7/../../../../x86_64-suse-linux/bin=
/ld: /dev/shm/cfontana/qemu/tests/tcg/i386/test-i386.c:760: undefined refer=
ence to `sqrt'
>>>>>> /usr/lib64/gcc/x86_64-suse-linux/7/../../../../x86_64-suse-linux/bin=
/ld: /dev/shm/cfontana/qemu/tests/tcg/i386/test-i386.c:761: undefined refer=
ence to `sin'
>>>>>> /usr/lib64/gcc/x86_64-suse-linux/7/../../../../x86_64-suse-linux/bin=
/ld: /dev/shm/cfontana/qemu/tests/tcg/i386/test-i386.c:762: undefined refer=
ence to `cos'
>>>>>>
>>>>>> Have you seen it before?
>>>>>> Any suggestions? I'm on OpenSUSE Leap 15 SP2.
>>>>>
>>>>> Related to 3fc1aad3864 ("configure: remove unnecessary libm test")
>>>>> + tcg tests still not ported to Meson?
>>>>
>>>> Hmm so we certainly need libm for the testcase but I guess this is> fa=
iling with a local cross compiler rather than docker? I'm not sure the
>>>> global feature test should be relevant for testcases.
>>>>
>>>
>>> Probably it's my attempt to make it work with non-static libm that fail=
ed then,
>>>
>>> is it supposed to work?
>>>
>>> I see mention of BUILD_STATIC there, but it does not seem to actually w=
ork for me.
>>>
>>> If I use static libm, then it works.
>>> If I uninstall static libm, any attempt to build fails, regardless of
>>> whether I pass BUILD_STATIC=3D'n' or so.
>>=20
>> All the test cases themselves should be built as static although I see
>> we fall back for the case of using a local cross compiler. That normally
>> only covers the case where the host compiler can also build for 32 bit
>> for testcases.
>>=20
>>>
>>> Ciao and thanks,
>>>
>>> CLaudio
>>=20
>>=20


--=20
Alex Benn=C3=A9e

