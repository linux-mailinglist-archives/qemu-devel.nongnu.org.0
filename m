Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D552D2CD7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 15:15:59 +0100 (CET)
Received: from localhost ([::1]:48424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmdmY-0005y0-EQ
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 09:15:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmdl0-0005K2-SY
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 09:14:22 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:52444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmdkw-0002TO-Tp
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 09:14:22 -0500
Received: by mail-wm1-x32a.google.com with SMTP id a6so2190863wmc.2
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 06:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Gy8ZvMJIkkbX1w0Ng1vN5MoXlJsZbWCS4FmMkcrpfJM=;
 b=jtYA7rSMqCP19pk71panjmQ/fEtsxIlXFsRPttorUVFKWnJut4uMbxQlJ3sttJHyNN
 l+U3IPkXYY6YGGFbu+w0RD2bu77byfOL5MJ/g4NiLFXdQ1SExLiwNZshzIUeyZq/5QTs
 hxSAISN3Ap4eEl/qq9MIgHc20nZVnA2XXxV955a3WL6mRh6GCXRduGUFCwZCwU4NopH0
 wMHRkswbwyCpnbFuKDHeqB1zutl47uEg+9dGYIYlDMogtbQMagHljDJJdX4Sy2+NIPae
 SpPpSLrAOXZV9ojqrsaOxTGNZb9fXoH++/Yof3m+Wb7u/dylsRnZNK7B226+btWgyY4c
 yeLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Gy8ZvMJIkkbX1w0Ng1vN5MoXlJsZbWCS4FmMkcrpfJM=;
 b=q9liB2AlEciuNeO7Ne0ROYMNXQP1PZf8GrfJqQLGxxKnOXUBcKkJ3dSkjpTrAwQxmT
 ZZcPlNmFs/VuXE7yZj1vFKuN5saNWyHNaCz4j8yPhe7yBX1euhfhXDJz10TXE4KcmGvA
 aJIqzoQEpK51axLzlG3E5lf5P8SAD3TOmOpzAQOuXbS3RJaOiTNZQ9icRrckUsgo4lPs
 4EwHd1/gQvQPt9vDoTjCu30vE/TqHPAh0hg9dBR4pqdzDnGQc90UCSN2dJsaoG9/NZMQ
 r9NiN9+SfvnHEzVZR6HZ+lkiv69XxHNU2tLFcoZCE6FwAfkJrEqaY8roV00+Ipi7wfvq
 +bdQ==
X-Gm-Message-State: AOAM5331f1VMs0VqX7MEU0WNXpTAPZiZxepCqYvpbHG6Y1hgRMkK5I9f
 bn/Z/gaww+V5PTXOVCuH34qnYg==
X-Google-Smtp-Source: ABdhPJyDXPrSyNzbmlWMcOmooaFDnnqbTqfsK5iEFgy/anYuHHzkAx32o29dDPuMqv5tDfBcdEMVFA==
X-Received: by 2002:a7b:ca47:: with SMTP id m7mr4020726wml.33.1607436855639;
 Tue, 08 Dec 2020 06:14:15 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d187sm3803083wmd.8.2020.12.08.06.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 06:14:14 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 880471FF7E;
 Tue,  8 Dec 2020 14:14:13 +0000 (GMT)
References: <3333301.iIbC2pHGDl@basile.remlab.net>
 <2747838.e9J7NaK4W3@basile.remlab.net>
 <CAFEAcA8j9ZPLt95ObzMGF=yei_FLzduMSnFyS9MoDgQYPvGrhQ@mail.gmail.com>
 <2120950.iZASKD2KPV@basile.remlab.net>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?R=C3=A9mi?= Denis-Courmont <remi.denis.courmont@huawei.com>
Subject: Re: [PATCHv3 00/17] ARMv8.4 Secure EL2
Date: Tue, 08 Dec 2020 14:11:15 +0000
In-reply-to: <2120950.iZASKD2KPV@basile.remlab.net>
Message-ID: <874kkwgzbe.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com> writes:

> 	Hi,
>
> Le tiistaina 1. joulukuuta 2020, 20.23.46 EET Peter Maydell a =C3=A9crit :
>> > The base tests fail without the patchset seem to assume an US American
>> > locale, which is frankly infuriatingly culturally insensitive.
>>=20
>> I run them with en_GB.UTF-8, which works fine for me, but it's a bug
>> in the test suite if something's locale dependent and not ensuring
>> it is set correctly.
>
> For a start, it seems to be barfing on strsignal() localisation by the sh=
ell,=20
> printing French instead of "Killed" on SIGKILL.
>
> % locale
> LANG=3Dfr_FR.UTF-8
> LANGUAGE=3Dfr:en_GB:fi
> LC_CTYPE=3D"fi_FI.UTF-8"
> ...
>
>> > As for the acceptance tests fail equally early without the patchset wi=
th a
>> > completely helpless diagnostic about unresolved references. Wiki does =
not
>> > help either.
>>=20
>> I just run "make -C my-build-dir check-acceptance"; I don't know anything
>> about the internals. It would help if you quoted the error messages
>> you see.
>
>  AVOCADO tests/acceptance
> Unable to resolve reference(s) 'tests/acceptance' with plugins(s) 'file',=
=20
> 'tap', 'external', try running 'avocado list -V tests/acceptance' to see =
the=20
> details.
> make: *** [/home/remi/dev/qemu/tests/Makefile.include:125 : check-accepta=
nce]=20
> Erreur 2
>
> % avocado list -V tests/acceptance
> bash: avocado : commande introuvable
>
> % tests/venv/bin/avocado list -V tests/acceptance
> usage: avocado list [-h] [--loaders [LIST.LOADERS ...]]
>
> Wiki implies that dependencies are automatically installed, but I
> guess not?

They should be in the venv that is built when you run the test the first
time. Running the above command without the -V which it doesn't
recognise gives me a list:

  14:12:25 [alex@zen:~/l/q/b/all] xen/guest-loader-and-arm-build-cleanups-v=
2|=E2=9C=9A3=E2=80=A6(+5/-5) + ./tests/venv/bin/avocado list tests/acceptan=
ce/ | head -n 10
  INSTRUMENTED tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx=
_tcg
  INSTRUMENTED tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx=
_kvm
  INSTRUMENTED tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_q35_tcg
  INSTRUMENTED tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_q35_kvm
  INSTRUMENTED tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg
  INSTRUMENTED tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kv=
m_gicv2
  INSTRUMENTED tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kv=
m_gicv3
  INSTRUMENTED tests/acceptance/boot_linux.py:BootLinuxPPC64.test_pseries_t=
cg
  INSTRUMENTED tests/acceptance/boot_linux.py:BootLinuxS390X.test_s390_ccw_=
virtio_tcg
  INSTRUMENTED tests/acceptance/boot_linux_console.py:BootLinuxConsole.test=
_x86_64_pc
  Exception ignored in: <_io.TextIOWrapper name=3D'<stdout>' mode=3D'w' enc=
oding=3D'UTF-8'>
  BrokenPipeError: [Errno 32] Broken pipe

I wonder are you running an in-tree build?

>
> Br,


--=20
Alex Benn=C3=A9e

