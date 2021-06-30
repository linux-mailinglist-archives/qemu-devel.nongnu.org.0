Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE423B802E
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 11:40:17 +0200 (CEST)
Received: from localhost ([::1]:41974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyWhc-0007Oa-Da
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 05:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lyWgl-0006eM-0a
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 05:39:23 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lyWgi-0008K5-RQ
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 05:39:22 -0400
Received: by mail-wr1-x433.google.com with SMTP id a13so2767421wrf.10
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 02:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PoYAFNjNPoa0DQ2X808gA7OK7GlGVkZ9Ln6/fWQR/jo=;
 b=dzQSvgjXRgkesdd4CB5fUvxBOtbaZWf1m+dYYbDpQnV20aUl0Xv3RULqY6ykVLppzR
 +VNONSUUxtnt01kJZvOJbvS0KzkndRdWv9YYB6I/S91A7j7KkC99Hcbj1ikJve240cx8
 oFOWxxWYCHYz4I9/iJM3TmLi3peoGsRy99+yjLJXta2op0SdsuaqCLLfnOADtEeOaZSX
 z4qqBkhsSAPN7ZX+zOya6MWPn/CNGs68wrLBFBsLsDJ0Vop8877IApE5ns4cwqdfHuFy
 Yso/IwLJIm6pPmzJzo/TtvK26RSEC+ljy+L558qYLvO8ZPBg1+WKJi0fZjmB2aZSUp4Q
 fVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PoYAFNjNPoa0DQ2X808gA7OK7GlGVkZ9Ln6/fWQR/jo=;
 b=BnpaetvOmu+EeBEL2BF3MieGRWz12Lt0MxvnVjmPN7lSWMr0wmIi4YFsdSo02jIRyh
 ENhmkr2cQUE27ejuw6nMbIETOiGUK7dkUaFBBDJxjqkOjMxTfxglxmayWvK6a5XPcdYy
 hh3T4W8/zh1gsVyX2h8FN5VBKcAfQgPUpn+OAsaw58n9DWXolbG9jNzMr+r7kgmQFh0B
 ZqvN3BMiqy87SwnsiSTxOsfaUMvIVUXhmK6oAPvZDUamRzXIFhXSU+ga2REDReTtWTCj
 4BW+LlOrUuc3j7ig6PxM40JDpm6STNBDJstlsrWQ537IeSA67FAmDAuNrJ+E9BPtn5bt
 E4RQ==
X-Gm-Message-State: AOAM53110UjO3yN/5/5bMl13THxNeLg3YxdDbAoJ202cGl4rxp6Guqai
 ypsoUwnKk5KvaujJBZd7TpB0qw==
X-Google-Smtp-Source: ABdhPJywM5mke6n1YfnEuV7MExnqVQfdVst7T8HsA7CHKpM5RCFLQhdKCrDkHc76KK/uMg05b8Mrwg==
X-Received: by 2002:a5d:6b0e:: with SMTP id v14mr38362490wrw.297.1625045959127; 
 Wed, 30 Jun 2021 02:39:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t9sm19954134wmq.14.2021.06.30.02.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 02:39:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6D2D91FF7E;
 Wed, 30 Jun 2021 10:39:17 +0100 (BST)
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
 <1624881885-31692-21-git-send-email-gaosong@loongson.cn>
 <CAFEAcA_swZQG=XCGN4U4XfqrvK2poJw33oEC-5NDFtU3dT1ZuQ@mail.gmail.com>
 <5188a660-4bec-45bd-81bc-25dd3ba38f9c@loongson.cn>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: maobibo <maobibo@loongson.cn>
Subject: Re: [PATCH 20/20] target/loongarch: Add linux-user emulation support
Date: Wed, 30 Jun 2021 10:36:11 +0100
In-reply-to: <5188a660-4bec-45bd-81bc-25dd3ba38f9c@loongson.cn>
Message-ID: <87y2arpu7u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Huacai Chen <chenhuacai@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


maobibo <maobibo@loongson.cn> writes:

> =E5=9C=A8 2021=E5=B9=B406=E6=9C=8829=E6=97=A5 21:42, Peter Maydell =E5=86=
=99=E9=81=93:
>> On Mon, 28 Jun 2021 at 13:05, Song Gao <gaosong@loongson.cn> wrote:
>>>
>>> Add files to linux-user/loongarch64
>>> Add file to default-configs
>>> Add loongarch to target/meson.build
>>>
>>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>>> ---
>>>  MAINTAINERS                                        |   1 +
>>>  default-configs/targets/loongarch64-linux-user.mak |   4 +
>>>  include/elf.h                                      |   2 +
>>>  linux-user/elfload.c                               |  58 ++++
>>>  linux-user/loongarch64/cpu_loop.c                  | 177 ++++++++++++
>>>  linux-user/loongarch64/signal.c                    | 193 +++++++++++++
>>>  linux-user/loongarch64/sockbits.h                  |   1 +
>>>  linux-user/loongarch64/syscall_nr.h                | 307 +++++++++++++=
++++++++
>>>  linux-user/loongarch64/target_cpu.h                |  36 +++
>>>  linux-user/loongarch64/target_elf.h                |  14 +
>>>  linux-user/loongarch64/target_fcntl.h              |  12 +
>>>  linux-user/loongarch64/target_signal.h             |  28 ++
>>>  linux-user/loongarch64/target_structs.h            |  49 ++++
>>>  linux-user/loongarch64/target_syscall.h            |  46 +++
>>>  linux-user/loongarch64/termbits.h                  | 229 +++++++++++++=
++
>>>  linux-user/syscall_defs.h                          |   8 +-
>>>  meson.build                                        |   2 +-
>>>  qapi/machine-target.json                           |   4 +-
>>>  target/loongarch/meson.build                       |  19 ++
>>>  target/meson.build                                 |   1 +
>>>  20 files changed, 1185 insertions(+), 6 deletions(-)
>>=20
>> This is a massive patch that would benefit from being split up
>> into multiple smaller patches.
>>=20
>> I'm told by a kernel developer that loongarch hasn't yet been
>> accepted into the Linux kernel mainline. Until it has been, the
>> syscall ABI for it is not yet stable, so we won't be able to take
>> the linux-user patches for it yet. (We have been burned in the
>> past by taking linux-user architecture support patches without
>> realizing they weren't for a stable ABI, and then being out of
>> sync with the eventual upstream kernel ABI that was accepted.)
>>=20
>> We can certainly do code review in the meantime, though.
> Thanks for reviewing the big series patches. It is understandable that
> there should be linux kernel merged for one new architecture support
> firstly, and then there will be linux-user simulator later.
>
> We are planning to submit patch to linux kernel for LoongArch support,
> there is the link:
> https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson=
.git/log/?h=3Dloongarch-next
>
> And we will continueto  submit softmmu support for LoongArch. And is there
> any extra requirements for softmmu simulation for new architecture,
> such as gcc/binutils/bios?

Ideally if there are some pre-built toolchains either as part of a
distro (we've used Debian Sid before for some) or easily to install in a
docker container as binary tarballs (like we do for tricore) then we can
enable basic check-tcg functionality.

Going forward having stable URLs for test images of distros means we can
also enable check-acceptance tests.

>
> regards
> bibo, mao
>
>
>>=20
>> thanks
>> -- PMM
>>=20


--=20
Alex Benn=C3=A9e

