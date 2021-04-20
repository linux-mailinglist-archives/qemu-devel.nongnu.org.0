Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B201F365DFE
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 18:57:25 +0200 (CEST)
Received: from localhost ([::1]:43268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYtgi-0000kI-O0
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 12:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYteS-00082y-Qv
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 12:55:04 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:41978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYteP-000342-8i
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 12:55:04 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 o21-20020a1c4d150000b029012e52898006so10756461wmh.0
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 09:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=2rFNspsoasXSCSV+TGD60l6SR7cusnq8ANnhMLKQYck=;
 b=v2COgrpTkp8Bhtw2DwogHsEgyL6gpE9NIe7S+C/q2YftYQVTL2aT1n/r8/Yq6u1E+G
 +bQnhjIvynnQIxxgvTz+UQMpXXpZloD4+im0mOR2TjrXpcoXTBkn7p1INlMVSW/MizEn
 HqP6onqGh7L6MpZgwCB+Atz/gqKtUOVjyfZDnVbvwIDOza94HTP1rcIm1a4yjHgDQi5c
 LikTocXF89IBSl4gD9DCeSZcJ+wyEYJBLgV7nFSeMnQem1r8066kUAeMKu3n89qxZw9O
 72TLw+MT/pE0ozMuhAcno2l++uwn6dU5+ByiabfA+z5ryAztJ2aFmlGCMeMAA+ZtJg8x
 LIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=2rFNspsoasXSCSV+TGD60l6SR7cusnq8ANnhMLKQYck=;
 b=fKB+mZZ34RmsMe1I8P5pz70IXPUOqUHFabPJUD6bc6wpgHPZwDKUWBhIfsu7JmOzIo
 1CAuSFiGQ30SbJL4c3JVD2JP94U0QubCcol0ZoJyvFemCxqHLFCe/DOhuxZ6MxxO3n41
 UDIlLGVWhOB43glD64CAYnL9P5x9Emq//McfSuQQoyWo8BFICxY6/FYvDh5f/9sCCxuS
 +kzzCSwFCZIExGOjgpwzgSN8eHi3XrVqj1Vny0yxllC3QJr4pTYKu0qMYzcenQD+xD32
 LBpayjOScw/XapzWbdBN3yhh4ENEpjzXDXCZxiJvSz3/0FvhvFyqjkjWiYVPDVtMjkoD
 ivUg==
X-Gm-Message-State: AOAM530EbVJg0kpnLpw1OL62JUfRWPT6V2ojpmjIWaGlQtwWPxBUKXpo
 K5dBN2o+FKSfb82MvXu38A69Sg==
X-Google-Smtp-Source: ABdhPJyPblQJppsWr8HrGKEIiGjRIUYR4BJNdFDzO4qFVKAk/+PX4sXCYyMKigUH6CApz9vIZR/F/g==
X-Received: by 2002:a7b:c150:: with SMTP id z16mr5411819wmi.81.1618937698742; 
 Tue, 20 Apr 2021 09:54:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u11sm20920170wrt.72.2021.04.20.09.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 09:54:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D720A1FF7E;
 Tue, 20 Apr 2021 17:54:56 +0100 (BST)
References: <20210420013308.813323-1-matheus.ferst@eldorado.org.br>
 <20210420013308.813323-2-matheus.ferst@eldorado.org.br>
 <YH5RkjCx2Bk4mbop@yekko.fritz.box> <87eef587qc.fsf@linaro.org>
 <0558f25b-2329-c0fa-5b86-4e5b25428c86@eldorado.org.br>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Subject: Re: [PATCH 1/2] tests/docker: gcc-10 based images for ppc64{,
 le} tests
Date: Tue, 20 Apr 2021 17:53:10 +0100
In-reply-to: <0558f25b-2329-c0fa-5b86-4e5b25428c86@eldorado.org.br>
Message-ID: <87bla899r3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: gustavo.romero@protonmail.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, bruno.larsen@eldorado.org.br,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


"Matheus K. Ferst" <matheus.ferst@eldorado.org.br> writes:

> On 20/04/2021 09:20, Alex Benn=C3=A9e wrote:
>> David Gibson <david@gibson.dropbear.id.au> writes:
>>=20
>>> On Mon, Apr 19, 2021 at 10:33:07PM -0300, matheus.ferst@eldorado.org.br=
 wrote:
>>>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>>>
>>>> A newer compiler is needed to build tests for Power10 instructions. As
>>>> done for arm64 on c729a99d2701, a new '-test-cross' image is created f=
or
>>>> ppc64 and ppc64le. As done on 936fda4d771f, a test for compiler support
>>>> is added to verify that the toolchain in use has '-mpower10'.
>>>>
>>>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>>> ---
>>>>   tests/docker/Makefile.include                   |  2 ++
>>>>   .../debian-powerpc-test-cross.docker            | 17 +++++++++++++++=
++
>>>>   tests/tcg/configure.sh                          | 12 ++++++++----
>>>>   3 files changed, 27 insertions(+), 4 deletions(-)
>>>>   create mode 100644 tests/docker/dockerfiles/debian-powerpc-test-cros=
s.docker
>>>>
>>>> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.inc=
lude
>>>> index 9f464cb92c..f1dbcc639f 100644
>>>> --- a/tests/docker/Makefile.include
>>>> +++ b/tests/docker/Makefile.include
>>>> @@ -152,10 +152,12 @@ docker-image-debian-sparc64-cross: docker-image-=
debian10
>>>>   docker-image-debian-tricore-cross: docker-image-debian10
>>>>   docker-image-debian-all-test-cross: docker-image-debian10
>>>>   docker-image-debian-arm64-test-cross: docker-image-debian11
>>>> +docker-image-debian-power-test-cross: docker-image-debian11
>>>>     # These images may be good enough for building tests but not
>>>> for test builds
>>>>   DOCKER_PARTIAL_IMAGES +=3D debian-alpha-cross
>>>>   DOCKER_PARTIAL_IMAGES +=3D debian-arm64-test-cross
>>>> +DOCKER_PARTIAL_IMAGES +=3D debian-power-test-cross
>>>
>>> You add these "power" (as opposed to "powerpc" or "ppc64" or whatever)
>>> images here, but they don't seem to be referenced anywhere else.
>>>
>
> It's a typo. Probably worked on my machine because a correctly named image
> was created outside qemu build before. I'll nuke docker and test again.
>
>>>>   DOCKER_PARTIAL_IMAGES +=3D debian-hppa-cross
>>>>   DOCKER_PARTIAL_IMAGES +=3D debian-m68k-cross debian-mips64-cross
>>>>   DOCKER_PARTIAL_IMAGES +=3D debian-powerpc-cross debian-ppc64-cross
>> I was expecting the new debian-power-test-cross to replace both
>> debian-powerpc-cross and debian-ppc64-cross.
>>=20
>
> OK, I'll change for powerpc too.
>
>>>> diff --git a/tests/docker/dockerfiles/debian-powerpc-test-cross.docker=
 b/tests/docker/dockerfiles/debian-powerpc-test-cross.docker
>>>> new file mode 100644
>>>> index 0000000000..36b336f709
>>>> --- /dev/null
>>>> +++ b/tests/docker/dockerfiles/debian-powerpc-test-cross.docker
>>>> @@ -0,0 +1,17 @@
>>>> +#
>>>> +# Docker powerpc/ppc64/ppc64le cross-compiler target
>>>> +#
>>>> +# This docker target builds on the debian Bullseye base image.
>>>> +#
>>>> +FROM qemu/debian11
>>>> +
>>>> +RUN apt update && \
>>>> +    DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
>>>> +    apt install -y --no-install-recommends \
>>>> +        gcc-powerpc-linux-gnu \
>>>> +        libc6-dev-powerpc-cross \
>>>> +        gcc-10-powerpc64-linux-gnu \
>>>> +        libc6-dev-ppc64-cross \
>>>> +        gcc-10-powerpc64le-linux-gnu \
>>>> +        libc6-dev-ppc64el-cross
>>>
>>> I'm not really clear on what distinguishes a -cross.docker image and a
>>> -test-cross.docker image.
>> The normal cross image (debian-ppc64le-cross) can cross build QEMU.
>> The
>> -test-cross images are just used for building check-tcg test cases.
>>=20
>>>
>>>> diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
>>>> index fa1a4261a4..a0be066499 100755
>>>> --- a/tests/tcg/configure.sh
>>>> +++ b/tests/tcg/configure.sh
>>>> @@ -170,13 +170,13 @@ for target in $target_list; do
>>>>         ;;
>>>>       ppc64-*)
>>>>         container_hosts=3Dx86_64
>>>> -      container_image=3Ddebian-ppc64-cross
>>>> -      container_cross_cc=3Dpowerpc64-linux-gnu-gcc
>>>> +      container_image=3Ddebian-powerpc-test-cross
>>>> +      container_cross_cc=3Dpowerpc64-linux-gnu-gcc-10
>>>>         ;;
>>>>       ppc64le-*)
>>>>         container_hosts=3Dx86_64
>>>> -      container_image=3Ddebian-ppc64el-cross
>>>> -      container_cross_cc=3Dpowerpc64le-linux-gnu-gcc
>>>> +      container_image=3Ddebian-powerpc-test-cross
>>>> +      container_cross_cc=3Dpowerpc64le-linux-gnu-gcc-10
>>>
>>> Doesn't this remove all uses of the debian-pp64-cross and
>> Yes this should be removed.
>>=20
>
> Done.
>
>>> debian-ppc64el-cross images, in which case you could remove the
>>> matching docker files and so forth too, no?
>> Well I assume you still want to check cross building of QEMU.
>> Arguably
>> we could still use that for the test cases as well.
>>
>
> But then we have the old gcc that can't handle the new instructions, which
> is why I started the series :)

Oh right - yes switch to the test-cross... ;-)

>
>>>
>>>>         ;;
>>>>       riscv64-*)
>>>>         container_hosts=3Dx86_64
>>>> @@ -280,6 +280,10 @@ for target in $target_list; do
>>>>                  -mpower8-vector -o $TMPE $TMPC; then
>>>>                   echo "CROSS_CC_HAS_POWER8_VECTOR=3Dy" >> $config_tar=
get_mak
>>>>               fi
>>>> +            if do_compiler "$target_compiler" $target_compiler_cflags=
 \
>>>> +               -mpower10 -o $TMPE $TMPC; then
>>>> +                echo "CROSS_CC_HAS_POWER10=3Dy" >> $config_target_mak
>>>> +            fi
>>>>           ;;
>>>>           i386-linux-user)
>>>>               if do_compiler "$target_compiler" $target_compiler_cflag=
s \
>>=20
>
> Oh, about nesting "ppc64-*" and "ppc64le-*" in tests/tcg/configure.sh:
>
>>>> +# Specify the cross prefix for this image (see tests/docker/common.rc)
>>>> +#ENV QEMU_CONFIGURE_OPTS --cross-prefix=3Dpowerpc64le-linux-gnu-
>>>> +#ENV DEF_TARGET_LIST
>     ppc64-softmmu,ppc64-linux-user,ppc64abi32-linux-user
>>>> diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
>>>> index fa1a4261a4..5f5db91a01 100755
>>>> --- a/tests/tcg/configure.sh
>>>> +++ b/tests/tcg/configure.sh
>>>> @@ -170,13 +170,13 @@ for target in $target_list; do
>>>>        ;;
>>>>      ppc64-*)
>>>>        container_hosts=3Dx86_64
>>>> -      container_image=3Ddebian-ppc64-cross
>>>> -      container_cross_cc=3Dpowerpc64-linux-gnu-gcc
>>>> +      container_image=3Ddebian-ppc64-test-cross
>>>> +      container_cross_cc=3Dpowerpc64-linux-gnu-gcc-10
>>>>        ;;
>>>>      ppc64le-*)
>>>>        container_hosts=3Dx86_64
>>>> -      container_image=3Ddebian-ppc64el-cross
>>>> -      container_cross_cc=3Dpowerpc64le-linux-gnu-gcc
>>>> +      container_image=3Ddebian-ppc64el-test-cross
>>>> +      container_cross_cc=3Dpowerpc64le-linux-gnu-gcc-10
>>>>        ;;
>>>
>> I don't know if it's possible to nest the cases but if it's not too
>> ugly bringing all the cases into one place and just differentiating the
>> container_cross_cc would be nice.
>
> We could do something like:
>> ppc64*-|ppc64le-*)
>>     container_hosts=3Dx86_64
>>     container_image=3Ddebian-powerpc-test-cross
>>     container_cross_cc=3D${target%%-*}-linux-gnu-gcc-10
>>     container_cross_cc=3Dpowerpc${container_cross_cc#ppc}
> But I think it's kind of ugly to repeat container_cross_cc line. If we do
> that, we can bring ppc-* too, but another line would be needed to handle
> ppc64abi32-*...

Lets not over complicate it - but the ppc64/ppc64le in the same
container looks fair enough doesn't it?


--=20
Alex Benn=C3=A9e

