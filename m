Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 746CF2E968F
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 15:02:37 +0100 (CET)
Received: from localhost ([::1]:47668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwQRQ-0004bF-6h
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 09:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwQOs-0003UG-I3
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 08:59:59 -0500
Received: from mail-oi1-f182.google.com ([209.85.167.182]:35981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwQOn-0006fn-QY
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 08:59:55 -0500
Received: by mail-oi1-f182.google.com with SMTP id 9so32183916oiq.3
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 05:59:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FGtSzbeGMVyvl292OocVFgzsUa3QiTN4aRUpoo++Nkk=;
 b=P/63Fp+vYpqi+8O8J+gP2OWlaU1W12ffI1sQWWN5mKjGst8oi5zYnn+dPZtocFkxrV
 XIqyxGM9grjeCpDFNKj9ggZNJ7B+GyEXZb0JMwTTwkNrCzxRN0EHQXVNnny92RXf5VkC
 WBIUVxYCilk6FB4JIrk7GuEm63PEqx4OvN/Zo2XUB9Mge+N9IHLZy8KBsxOeed5R7xO4
 i1C+nvag+fHWT9MCSo9jRKIU27UwPvJtf3GpGAo+aBKTVSDxzlsTzbKaFPR8Bq3i8HNh
 S3cLm/Mf5VvUTAEmDrynU0GrGaFT/IiJl1hX/IXr6wEUWVYa3ctmXCgUfgWzWK1sTDUK
 awlA==
X-Gm-Message-State: AOAM531lQ38+NTzsqryA9jvNrTpDLw0XyTbrQJ3IIdxJ8jy13MMb11z3
 Ui52hg8+2OruScryltLok8hpJrdvhN0lABKx4eU=
X-Google-Smtp-Source: ABdhPJzIOcayY41s/QJTldfnTdohX9wLbv105xXjgfPwRka6sw7avcJpC0u14nzNgxXJ7rDx0kbKqFBYwD1Xww6XTg4=
X-Received: by 2002:aca:58d6:: with SMTP id
 m205mr17714690oib.121.1609768792666; 
 Mon, 04 Jan 2021 05:59:52 -0800 (PST)
MIME-Version: 1.0
References: <20210103205021.2837760-1-f4bug@amsat.org>
 <CAFEAcA--dkcqBJr=b1LcNpLtctYJewuT8Yvx9Uo47YC6JGgR-Q@mail.gmail.com>
 <CAFEAcA-HXHrXwGywi0MkxFhCCW3fk91Xr4yHA1--tiSqN2_HWQ@mail.gmail.com>
 <790b031a-2be6-82d0-565d-f7595e95c077@amsat.org>
In-Reply-To: <790b031a-2be6-82d0-565d-f7595e95c077@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 4 Jan 2021 14:59:41 +0100
Message-ID: <CAAdtpL53Ngj3zc0ZtxEvHed0hAxYN0RZ7G2eiL_izuTSWBMM2A@mail.gmail.com>
Subject: Re: [PULL 00/35] MIPS patches for 2021-01-03
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.182;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f182.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, Jan 4, 2021 at 2:53 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Hi Peter,
>
> On 1/4/21 12:50 PM, Peter Maydell wrote:
> > On Mon, 4 Jan 2021 at 11:41, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> >>
> >> On Sun, 3 Jan 2021 at 20:53, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> >>>
> >>> The following changes since commit 83734919c408ba02adb6ea616d68cd1a72=
837fbe:
> >>>
> >>>   Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-2020=
1222' into staging (2021-01-01 18:19:44 +0000)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>   https://gitlab.com/philmd/qemu.git tags/mips-20210103
> >>>
> >>> for you to fetch changes up to 9c592996981fcb37fef011d7e9603cb31f8ef2=
9f:
> >>>
> >>>   tests/acceptance: Test boot_linux_console for fuloong2e (2021-01-03=
 21:41:03 +0100)
> >>>
> >>> ----------------------------------------------------------------
> >>> MIPS patches queue
> >>>
> >>> - Use PCI macros (Philippe Mathieu-Daud=C3=A9)
> >>> - Clean up VT82C686B south bridge (BALATON Zoltan)
> >>> - Introduce clock_ticks_to_ns() (Peter Maydell)
> >>> - Add Loongson-3 machine (Huacai Chen)
> >>> - Make addresses used by bootloader unsigned (Jiaxun Yang)
> >>> - Clean fuloong2e PROM environment (Jiaxun Yang)
> >>> - Add integration test of fuloong2e booting Linux (Jiaxun Yang)
> >>
> >>
> >> This fails 'make check' (consistently) on the aarch32-chroot-on-aarch6=
4
> >> host:
> >>
> >> PASS 51 qtest-mips64el/qmp-cmd-test /mips64el/qmp/query-command-line-o=
ptions
> >> PASS 52 qtest-mips64el/qmp-cmd-test /mips64el/qmp/query-acpi-ospm-stat=
us
> >> PASS 53 qtest-mips64el/qmp-cmd-test /mips64el/qmp/object-add-failure-m=
odes
> >> MALLOC_PERTURB_=3D${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> >> QTEST_QEMU_IMG=3D./qemu-img
> >> G_TEST_DBUS_DAEMON=3D/home/peter.maydell/qemu/tests/dbus-vmstate-daemo=
n.sh
> >> QTEST_QEMU_BINARY=3D./qemu-system-mips64el tests/qtest/qom-test --tap =
-k
> >> double free or corruption (out)
> >> ../../tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from
> >> signal 6 (Aborted)
> >> ERROR qtest-mips64el/qom-test - too few tests run (expected 8, got 0)
> >> Makefile.mtest:2249: recipe for target 'run-test-279' failed
> >> make: *** [run-test-279] Error 1
> >
> > Also on OSX, likely the same bug:
> >
> > Broken pipe
> > ../../tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from
> > signal 11 (Segmentation fault: 11)
> > ERROR qtest-mips64el/qom-test - too few tests run (expected 8, got 1)
>
> Thanks. I am using the ubuntu-i386-guestcan not reproduce with the

I just discovered some magic combination of keys send an email without
asking for confirmation =3D)

So, I am using the ubuntu-i386 VM for 32-bit guest testing, and can not
reproduce (this tag, or /staging - 42a37b6289d - with ehabkost patches).

I don't have access to OSX host. I'll see to install an aarch32 chroot and
keep testing (not sure what can differ from an i386 guest).
If I can't find anything I'll resend the same series without the Loongson-3
machine, which is the single part adding QOM objects.

Thanks,

Phil.

