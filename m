Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EFF3A9CA6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 15:51:19 +0200 (CEST)
Received: from localhost ([::1]:53578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltVws-0008Ds-7E
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 09:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltVvg-0007IV-RO
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:50:04 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltVve-00076o-E7
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:50:03 -0400
Received: by mail-wr1-x42e.google.com with SMTP id v9so2785584wrx.6
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 06:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=VA3Ehj8fKL4F5Jl5dL9WEV83+ZcZu0jPcgTCppg0OfE=;
 b=OdOHsPhYYYyU3didXJslzqIVwtfH64T7cxW4ejd4oCsoqJv3aV/I6h+qXZ920FFoVI
 BKeAEPiPrb86G/ECmIxYG6j5YxYW+GAR03AyQsqT+q8ljZs/NLsbuAnjgycZABoStMoC
 guOj+FLuG3kTIgZgnSevTxjI/aJUibIJAZoPzBfl+6vffYun9ejyOAKA97T4f7Wyp0VF
 933lphoKZjBsE9kfCCOrc6AVglCA7bANaoZcIQ8YnJ+btyDpA1mTI/D7SSe41uj85rPv
 nMPX43tq2YfnHp0EPaNQ7gal2h+Y1OGNkOYzYDPOZernYG0BhvFfeVSJGw8nWefETFV2
 CUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version:content-transfer-encoding;
 bh=VA3Ehj8fKL4F5Jl5dL9WEV83+ZcZu0jPcgTCppg0OfE=;
 b=APckFd8UZL+7W1xAkL89EDMiBqHFnFQvp2cJsoKuaPc0Q1Xac1TX6hT3ePovrjxbDg
 N9QmxJy0SxmoYGVtjK+hpT97J0k4ehTzrH8VRaiq7bPtKh1P3pdDZXSjJaSDzUSiSDzC
 yHVUc5RGMeyOzJZLfqwTKQ/vDG0oPAx8Zd6/rHB7cDuL4Qn6FLT+wam+57IGVsmnaBzN
 fNqxKlTKsK10V2Vzdk20+bgYQ2K0p/0tDZxjrhxYEwdRxXymvR3js0DYuXVHyNY4RGZo
 DLK4cobqjiBdmfnutqh8m0+2X6PZ/3xbnV6G0McXy4DJ6gXPyGOIAS4qyYGXZziQh7BA
 WivQ==
X-Gm-Message-State: AOAM531Sf0oImSYKKALPlj0UvVEahWz/bZAXfHab96k8XcpJinheYwZM
 exIgapMz1gVS5LcZcrh5RYeArA==
X-Google-Smtp-Source: ABdhPJzq6+qNTJFj0VaivcOj7j/24hMPYwr3WX+yAFxAbdi9siOQXu/rPv06y6mkLqGqv1+Z6yi4Wg==
X-Received: by 2002:adf:df87:: with SMTP id z7mr5620148wrl.56.1623851400983;
 Wed, 16 Jun 2021 06:50:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l16sm4857889wmq.28.2021.06.16.06.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 06:50:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6E7F01FF7E;
 Wed, 16 Jun 2021 14:49:59 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 04/21] linux-user/arm: Implement setup_sigtramp
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <20210616011209.1446045-5-richard.henderson@linaro.org>
 <87y2b9gbx7.fsf@linaro.org>
Date: Wed, 16 Jun 2021 14:49:59 +0100
In-Reply-To: <87y2b9gbx7.fsf@linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Wed, 16 Jun 2021 14:46:12 +0100")
Message-ID: <87tulxgbqw.fsf@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Richard Henderson <richard.henderson@linaro.org> writes:
>
>> ARM is more complicated than the others, in that we also
>> have trampolines for using SA_RESTORER with FDPIC, and
>> we need to create trampolines for both ARM and Thumb modes.
>>
>> Cc: qemu-arm@nongnu.org
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  linux-user/arm/target_signal.h |   2 +
>>  linux-user/arm/signal.c        | 170 +++++++++++++++++++--------------
>>  2 files changed, 100 insertions(+), 72 deletions(-)
>>
>> +
>> +    /* ARM sigframe */
>> +    _Static_assert(SIGFRAME_FDPIC_OFS <=3D 0xfff);
>> +    __put_user(0xe59d9000 | SIGFRAME_FDPIC_OFS, &tramp[i++]);
>> +    __put_user(0xe8998200, &tramp[i++]);
>
> Erm is this based on your c11 series?

Actually it's merged already so I'm seeing the following on hackbox:

  FAILED: libqemu-armeb-linux-user.fa.p/linux-user_arm_signal.c.o
  cc -Ilibqemu-armeb-linux-user.fa.p -I. -I../.. -Itarget/arm -I../../targe=
t/arm -I../../linux-user/host/x86_64 -Ilinux-user -I../../linux-user -Ilinu=
x-user/arm -I../../linux-
  user/arm -I../../capstone/include/capstone -Itrace -Iqapi -Iui/shader -I/=
usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -fdiagnos=
tics-color=3Dauto -pipe -Wa
  ll -Winvalid-pch -Werror -std=3Dgnu99 -O2 -g -isystem /home/alex.bennee/l=
src/qemu.git/linux-headers -isystem linux-headers -iquote . -iquote /home/a=
lex.bennee/lsrc/qemu.git -i
  quote /home/alex.bennee/lsrc/qemu.git/include -iquote /home/alex.bennee/l=
src/qemu.git/disas/libvixl -iquote /home/alex.bennee/lsrc/qemu.git/tcg/i386=
 -pthread -U_FORTIFY_SOUR
  CE -D_FORTIFY_SOURCE=3D2 -m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D=
64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrit=
e-strings -Wmissing-prototype
  s -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration -Wold-=
style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -=
Wignored-qualifiers -Wemp
  ty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wimplicit=
-fallthrough=3D2 -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-p=
sabi -fstack-protector-stro
  ng -isystem../../linux-headers -isystemlinux-headers -DNEED_CPU_H '-DCONF=
IG_TARGET=3D"armeb-linux-user-config-target.h"' '-DCONFIG_DEVICES=3D"armeb-=
linux-user-config-devices.h"'
   -MD -MQ libqemu-armeb-linux-user.fa.p/linux-user_arm_signal.c.o -MF libq=
emu-armeb-linux-user.fa.p/linux-user_arm_signal.c.o.d -o libqemu-armeb-linu=
x-user.fa.p/linux-user_ar
  m_signal.c.o -c ../../linux-user/arm/signal.c
  ../../linux-user/arm/signal.c: In function =E2=80=98setup_sigtramp=E2=80=
=99:
  ../../linux-user/arm/signal.c:847:47: error: expected =E2=80=98,=E2=80=99=
 before =E2=80=98)=E2=80=99 token
       _Static_assert(SIGFRAME_FDPIC_OFS <=3D 0xfff);
                                                 ^
  ../../linux-user/arm/signal.c:852:51: error: expected =E2=80=98,=E2=80=99=
 before =E2=80=98)=E2=80=99 token
       _Static_assert(SIGFRAME_FDPIC_OFS <=3D 0xff << 2);
                                                     ^
  ../../linux-user/arm/signal.c:853:49: error: expected =E2=80=98,=E2=80=99=
 before =E2=80=98)=E2=80=99 token
       _Static_assert((SIGFRAME_FDPIC_OFS & 3) =3D=3D 0);
                                                   ^
  ../../linux-user/arm/signal.c:858:50: error: expected =E2=80=98,=E2=80=99=
 before =E2=80=98)=E2=80=99 token
       _Static_assert(RT_SIGFRAME_FDPIC_OFS <=3D 0xfff);
                                                    ^
  ../../linux-user/arm/signal.c:863:54: error: expected =E2=80=98,=E2=80=99=
 before =E2=80=98)=E2=80=99 token
       _Static_assert(RT_SIGFRAME_FDPIC_OFS <=3D 0xff << 2);
                                                        ^
  ../../linux-user/arm/signal.c:864:52: error: expected =E2=80=98,=E2=80=99=
 before =E2=80=98)=E2=80=99 token
       _Static_assert((RT_SIGFRAME_FDPIC_OFS & 3) =3D=3D 0);

--=20
Alex Benn=C3=A9e

