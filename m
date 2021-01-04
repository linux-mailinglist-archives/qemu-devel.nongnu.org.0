Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9A72E944F
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 12:52:03 +0100 (CET)
Received: from localhost ([::1]:60494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwOP4-0000wa-Cd
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 06:52:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwONQ-0008SX-Qj
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 06:50:20 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:40544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwONM-0004qG-Ip
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 06:50:20 -0500
Received: by mail-ed1-x530.google.com with SMTP id h16so26997285edt.7
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 03:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GOUc1G7tjjwzFCQu7l0p6Div9woDb+jD0srYl3Qdkx4=;
 b=Yvr7NAQnoSAPWL3MpP489JtGkuadjKPJSUzK3uSKXsZi2MFUVR27xMj6W2JB8I23yR
 9cYfuapNkl40ard99BqVFiGsLnNP2LGZKc3j6XHiuMAZpVCWQZrFsgRCK5Mkxth9tUSX
 xI6gEnSUKoKuFBMvlr1aOPweyyg7DC6UYDc6wNPOtZURHe/aVCCa0Z5f3t6HMvLeO42T
 HWvkfG8rQO8b+29wtD0OuBNu/K/iVfY9AVtLqbuTltZc7sDbOHaEvmgyJlxX4dfPODSV
 sJTPpZvlNqjVOGVt5zSbfXTtiAHRNtvWBTVhIHqbbtH9cKxRoqJ4vRyA/9FnUyCllmPn
 kUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GOUc1G7tjjwzFCQu7l0p6Div9woDb+jD0srYl3Qdkx4=;
 b=MvCj3f1Gl49rPSMQzRGbg7EMDd+GsxkvEthdufT0DjsuRE1G/D6j3hqDcMYrSQVq4e
 V2vrGydTAmdHZPysCJPNuwqcOJPyBa00/2EeV5hbnU6iXLaQuzwqI/4IABUoY963TmjY
 UeVG1NNR9S8JOUiCX5VU9pn7azw31mTGOYwBSmC0prOJPbNgyYWon28z7bwiiSK6PD5k
 03VJHgGcDkSwNVxE7PXwzU+r0Sk2Jtcu0eRbMvdVE7LjXxeVp9LLlIqMCBPDJnvTkPGK
 2v2tk7QzfQfNcuF1nAnVEwF3kqpuAJn40z1DNXsWXeh8f317S8VEiFWUFcD7xRIQ3TPw
 DNHQ==
X-Gm-Message-State: AOAM533Z2Xsz6AViB0iSTreInIZpb43GGRmM/pfyR3WEBH0lShZPDIa7
 a08T9Pcawzu/KWDta/0Ruok7SEiSjOnzb20suUWhYmHR54Xs9A==
X-Google-Smtp-Source: ABdhPJz3m2+zSfpkb5jPRHAtscS1tEuRaDiMhSmk9iI7I0BirsDPi0vQwPIEBIgHd0HvnRHIgv/XF6Dr9n6ooxXg9W4=
X-Received: by 2002:aa7:d915:: with SMTP id a21mr18721814edr.251.1609761015054; 
 Mon, 04 Jan 2021 03:50:15 -0800 (PST)
MIME-Version: 1.0
References: <20210103205021.2837760-1-f4bug@amsat.org>
 <CAFEAcA--dkcqBJr=b1LcNpLtctYJewuT8Yvx9Uo47YC6JGgR-Q@mail.gmail.com>
In-Reply-To: <CAFEAcA--dkcqBJr=b1LcNpLtctYJewuT8Yvx9Uo47YC6JGgR-Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jan 2021 11:50:04 +0000
Message-ID: <CAFEAcA-HXHrXwGywi0MkxFhCCW3fk91Xr4yHA1--tiSqN2_HWQ@mail.gmail.com>
Subject: Re: [PULL 00/35] MIPS patches for 2021-01-03
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 4 Jan 2021 at 11:41, Peter Maydell <peter.maydell@linaro.org> wrote=
:
>
> On Sun, 3 Jan 2021 at 20:53, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> >
> > The following changes since commit 83734919c408ba02adb6ea616d68cd1a7283=
7fbe:
> >
> >   Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-202012=
22' into staging (2021-01-01 18:19:44 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/philmd/qemu.git tags/mips-20210103
> >
> > for you to fetch changes up to 9c592996981fcb37fef011d7e9603cb31f8ef29f=
:
> >
> >   tests/acceptance: Test boot_linux_console for fuloong2e (2021-01-03 2=
1:41:03 +0100)
> >
> > ----------------------------------------------------------------
> > MIPS patches queue
> >
> > - Use PCI macros (Philippe Mathieu-Daud=C3=A9)
> > - Clean up VT82C686B south bridge (BALATON Zoltan)
> > - Introduce clock_ticks_to_ns() (Peter Maydell)
> > - Add Loongson-3 machine (Huacai Chen)
> > - Make addresses used by bootloader unsigned (Jiaxun Yang)
> > - Clean fuloong2e PROM environment (Jiaxun Yang)
> > - Add integration test of fuloong2e booting Linux (Jiaxun Yang)
>
>
> This fails 'make check' (consistently) on the aarch32-chroot-on-aarch64
> host:
>
> PASS 51 qtest-mips64el/qmp-cmd-test /mips64el/qmp/query-command-line-opti=
ons
> PASS 52 qtest-mips64el/qmp-cmd-test /mips64el/qmp/query-acpi-ospm-status
> PASS 53 qtest-mips64el/qmp-cmd-test /mips64el/qmp/object-add-failure-mode=
s
> MALLOC_PERTURB_=3D${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=3D./qemu-img
> G_TEST_DBUS_DAEMON=3D/home/peter.maydell/qemu/tests/dbus-vmstate-daemon.s=
h
> QTEST_QEMU_BINARY=3D./qemu-system-mips64el tests/qtest/qom-test --tap -k
> double free or corruption (out)
> ../../tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from
> signal 6 (Aborted)
> ERROR qtest-mips64el/qom-test - too few tests run (expected 8, got 0)
> Makefile.mtest:2249: recipe for target 'run-test-279' failed
> make: *** [run-test-279] Error 1

Also on OSX, likely the same bug:

Broken pipe
../../tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from
signal 11 (Segmentation fault: 11)
ERROR qtest-mips64el/qom-test - too few tests run (expected 8, got 1)

thanks
-- PMM

