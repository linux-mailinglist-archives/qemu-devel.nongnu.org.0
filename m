Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C986D399204
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 19:57:20 +0200 (CEST)
Received: from localhost ([::1]:36656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loV7H-0005T7-KB
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 13:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1loV5l-00047E-NW
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 13:55:45 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:40870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1loV5i-0003VY-LN
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 13:55:45 -0400
Received: by mail-qt1-x834.google.com with SMTP id i12so2456847qtr.7
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 10:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version; bh=X5AkO0X8sZGuBy1hlAgQEn2iABIuWhSmYCETlKtNlZk=;
 b=eM/nULHZfnoG3PbMN0AvwQeTktnjHSMrnKeAI5718vcUkTdN8AUj5zZQAOkSeJxnJf
 SrWNtxGK74aP6XmO0gyu8zvvg4Z2b37vuBZJEDgeWVHVYLsd8Hh4xiSD7UeBgMY1mtMy
 1lrSYp+gOGlt7Zk8PHD3zXuA7EDbvMZmlVBEZUzOXkpDfwTk8Zer0tDETVqZ57CtoMk4
 hSpfxDusNeCGLw/4tQ0izpObKgPhDqwp/zuatk5GLcZ8Al7+Rk88kb1Qz2jPkVInEmnw
 vT+q0LysOx0d6mpqA+0HH6Q6S0OmuOObmB7bt0KclbMpPNd21VO6mcfgnrT7+3glansh
 5ZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version;
 bh=X5AkO0X8sZGuBy1hlAgQEn2iABIuWhSmYCETlKtNlZk=;
 b=fPxvPfhR8aTw9ZhI+AOHavAXX+AeseRmAkI+x5kCvCtGkAbukV1gISXHr9T5p0FVJ2
 Aic1lMApzifdhO+pahNq2Nd0bqIlJorTFqCKXauqiVDvEmp23U1tL+RMQNvqzhLezFYo
 P4CioTKedUs4S4O2xJY8YjbCh7Npk8Mv/xv9EeatBzkE4dtBnCb3SJHoYAbuNOnXaEhA
 Wpj6uWjSzpTaIy9dHEI4ExaaJhE2+ZEcr9iwdju/neN01p/pX7ROFsDEyV1DxdbxTsA1
 /DuRwadg+ld2wqEAcCCmKeNjCvrfUZrAgmVT7l2RVkDm71G8jqaJsNwSfgiy6WwVXV1t
 GMzQ==
X-Gm-Message-State: AOAM533uql3IHJv94xOJMtRpPld8LzyjmXONZ7MegHwI5l+Ce3Mn72s5
 gr9XD5HwgAYpHgL41LLC2O8Ktg==
X-Google-Smtp-Source: ABdhPJwiefxuzUD3czzjbJaqquhhkTmTwtkWYwY4FLjqXWkA4g6iKkkzGfOC2F2I+/39cSVF/033AA==
X-Received: by 2002:ac8:4f4f:: with SMTP id i15mr2169583qtw.215.1622656540681; 
 Wed, 02 Jun 2021 10:55:40 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-21-142-114-142-78.dsl.bell.ca. [142.114.142.78])
 by smtp.gmail.com with ESMTPSA id 7sm300472qtu.38.2021.06.02.10.55.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 02 Jun 2021 10:55:39 -0700 (PDT)
Date: Wed, 2 Jun 2021 13:55:38 -0400
From: Shashi Mallela <shashi.mallela@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <2235C492-01C2-4925-BCD0-F57D5BD40777@getmailspring.com>
In-Reply-To: <CAFEAcA9wAnK11NNObOrqV8MMgf7h9=Q2nNarEe+GY0SNPPuneQ@mail.gmail.com>
References: <CAFEAcA9wAnK11NNObOrqV8MMgf7h9=Q2nNarEe+GY0SNPPuneQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] GICv3 LPI and ITS feature implementation
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="60b7c61a_4229d044_14ea"
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x834.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--60b7c61a_4229d044_14ea
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This is due to missing IORT acpi data,applicable with latest ITS changes.
Will be sharing a separate review with new files.

On May 18 2021, at 10:46 am, Peter Maydell <peter.maydell@linaro.org> wrote:
> On Fri, 30 Apr 2021 at 00:42, Shashi Mallela <shashi.mallela@linaro.org> wrote:
> >
> > This patchset implements qemu device model for enabling physical
> > LPI support and ITS functionality in GIC as per GICv3 specification.
> > Both flat table and 2 level tables are implemented.The ITS commands
> > for adding/deleting ITS table entries,trigerring LPI interrupts are
> > implemented.Translated LPI interrupt ids are processed by redistributor
> > to determine priority and set pending state appropriately before
> > forwarding the same to cpu interface.
> > The ITS feature support has been added to sbsa-ref platform as well as
> > virt platform,wherein the emulated functionality co-exists with kvm
> > kernel functionality.
> >
> > Changes in v3:
> > - review comments addressed
> >
> > Shashi Mallela (8):
> > hw/intc: GICv3 ITS initial framework
> > hw/intc: GICv3 ITS register definitions added
> > hw/intc: GICv3 ITS command queue framework
> > hw/intc: GICv3 ITS Command processing
> > hw/intc: GICv3 ITS Feature enablement
> > hw/intc: GICv3 redistributor ITS processing
> > hw/arm/sbsa-ref: add ITS support in SBSA GIC
> > hw/arm/virt: add ITS support in virt GIC
>
> Something in here breaks "make check":
> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=./qemu-img
> G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-from-laptop/qemu/tests/dbus-vmstate-daemon.sh
> QTEST_QEMU_BINARY=./qemu-system-aarch64 tests/qtest/bios-tables-test
> --tap -k
>
> Looking for expected file 'tests/data/acpi/virt/FACP'
> Using expected file 'tests/data/acpi/virt/FACP'
> Looking for expected file 'tests/data/acpi/virt/APIC'
> Using expected file 'tests/data/acpi/virt/APIC'
> Looking for expected file 'tests/data/acpi/virt/GTDT'
> Using expected file 'tests/data/acpi/virt/GTDT'
> Looking for expected file 'tests/data/acpi/virt/MCFG'
> Using expected file 'tests/data/acpi/virt/MCFG'
> Looking for expected file 'tests/data/acpi/virt/SPCR'
> Using expected file 'tests/data/acpi/virt/SPCR'
> Looking for expected file 'tests/data/acpi/virt/IORT'
> **
> ERROR:../../tests/qtest/bios-tables-test.c:385:load_expected_aml:
> assertion failed: (exp_sdt.aml_file)
> ERROR qtest-aarch64/bios-tables-test - Bail out!
> ERROR:../../tests/qtest/bios-tables-test.c:385:load_expected_aml:
> assertion failed: (exp_sdt.aml_file)
>
> (and then it hangs)
> -- PMM
--60b7c61a_4229d044_14ea
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>This is due to missing IORT acpi data,applicable with latest ITS cha=
nges.</div><div>Will be sharing a separate review with&nbsp; new files.</=
div><br><div class=3D=22gmail=5Fquote=5Fattribution=22>On May 18 2021, at=
 10:46 am, Peter Maydell &lt;peter.maydell=40linaro.org&gt; wrote:</div><=
blockquote><div><div>On =46ri, 30 Apr 2021 at 00:42, Shashi Mallela &lt;s=
hashi.mallela=40linaro.org&gt; wrote:</div><div>&gt;</div><div>&gt; This =
patchset implements qemu device model for enabling physical</div><div>&gt=
; LPI support and ITS functionality in GIC as per GICv3 specification.</d=
iv><div>&gt; Both flat table and 2 level tables are implemented.The ITS c=
ommands</div><div>&gt; for adding/deleting ITS table entries,trigerring L=
PI interrupts are</div><div>&gt; implemented.Translated LPI interrupt ids=
 are processed by redistributor</div><div>&gt; to determine priority and =
set pending state appropriately before</div><div>&gt; forwarding the same=
 to cpu interface.</div><div>&gt; The ITS feature support has been added =
to sbsa-ref platform as well as</div><div>&gt; virt platform,wherein the =
emulated functionality co-exists with kvm</div><div>&gt; kernel functiona=
lity.</div><div>&gt;</div><div>&gt; Changes in v3:</div><div>&gt; - revie=
w comments addressed</div><div>&gt;</div><div>&gt; Shashi Mallela (8):</d=
iv><div>&gt; hw/intc: GICv3 ITS initial framework</div><div>&gt; hw/intc:=
 GICv3 ITS register definitions added</div><div>&gt; hw/intc: GICv3 ITS c=
ommand queue framework</div><div>&gt; hw/intc: GICv3 ITS Command processi=
ng</div><div>&gt; hw/intc: GICv3 ITS =46eature enablement</div><div>&gt; =
hw/intc: GICv3 redistributor ITS processing</div><div>&gt; hw/arm/sbsa-re=
f: add ITS support in SBSA GIC</div><div>&gt; hw/arm/virt: add ITS suppor=
t in virt GIC</div><br><div>Something in here breaks =22make check=22:</d=
iv><br><div>MALLOC=5FPERTURB=5F=3D=24=7BMALLOC=5FPERTURB=5F:-=24(( =24=7B=
RANDOM:-0=7D % 255 + 1))=7D</div><div>QTEST=5FQEMU=5FIMG=3D./qemu-img</di=
v><div>G=5FTEST=5FDBUS=5FDAEMON=3D/home/petmay01/linaro/qemu-from-laptop/=
qemu/tests/dbus-vmstate-daemon.sh</div><div>QTEST=5FQEMU=5FBINARY=3D./qem=
u-system-aarch64 tests/qtest/bios-tables-test</div><div>--tap -k</div><br=
><div>Looking for expected file 'tests/data/acpi/virt/=46ACP'</div><div>U=
sing expected file 'tests/data/acpi/virt/=46ACP'</div><div>Looking for ex=
pected file 'tests/data/acpi/virt/APIC'</div><div>Using expected file 'te=
sts/data/acpi/virt/APIC'</div><div>Looking for expected file 'tests/data/=
acpi/virt/GTDT'</div><div>Using expected file 'tests/data/acpi/virt/GTDT'=
</div><div>Looking for expected file 'tests/data/acpi/virt/MC=46G'</div><=
div>Using expected file 'tests/data/acpi/virt/MC=46G'</div><div>Looking f=
or expected file 'tests/data/acpi/virt/SPCR'</div><div>Using expected fil=
e 'tests/data/acpi/virt/SPCR'</div><div>Looking for expected file 'tests/=
data/acpi/virt/IORT'</div><div>**</div><div>ERROR:../../tests/qtest/bios-=
tables-test.c:385:load=5Fexpected=5Faml:</div><div>assertion failed: (exp=
=5Fsdt.aml=5Ffile)</div><div>ERROR qtest-aarch64/bios-tables-test - Bail =
out=21</div><div>ERROR:../../tests/qtest/bios-tables-test.c:385:load=5Fex=
pected=5Faml:</div><div>assertion failed: (exp=5Fsdt.aml=5Ffile)</div><br=
><div>(and then it hangs)</div><br><div>-- PMM</div></div></blockquote>
--60b7c61a_4229d044_14ea--


