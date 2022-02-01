Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDA94A56F8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 06:33:34 +0100 (CET)
Received: from localhost ([::1]:40838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nElnI-0003cF-K9
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 00:33:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nElkB-0002Hj-97
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 00:30:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nElk7-0007Hw-4U
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 00:30:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643693413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hQZr8gyGsura/jQ0STxR0Ud6oVr1JfOOlu2oUq7KaLc=;
 b=brdskkf0xTUmHNnce8ztKse3F3wOuP1JL0JaSYftFV32NjMbyUjSFjcdHwoiDBgl9/6ja5
 fqDbCHuwf4O5l8BqH2Il5jBCGpxu4nOalHlYyXheluqB+VJrxYAUUK6TlIR8WZvZPVGVHw
 GCNY1+iHYvI8ojjx9x3ab6GS+m6lYtg=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-3kf3fKmVMwWB_9p3y6FQ7w-1; Tue, 01 Feb 2022 00:30:08 -0500
X-MC-Unique: 3kf3fKmVMwWB_9p3y6FQ7w-1
Received: by mail-ua1-f69.google.com with SMTP id
 i25-20020ab03759000000b00308e68dcb1fso8571862uat.22
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 21:30:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hQZr8gyGsura/jQ0STxR0Ud6oVr1JfOOlu2oUq7KaLc=;
 b=Lo9eEg+QG6czN/vtuKZfv2foW7+BSFs/lA9wb9sDwfvuDKw4yIdC0q8nedHERfjCI4
 LzHY8E+kJ09d/3/ez3jL7qBtb1w80J2HoiUa9o0yVO9NROV0uOf14Dux5nX7WT9ywKV6
 PgPbn+aLZYQkYKtE4uOj3qgkla6VBOStbEejQERXQy46mJVRMrbq2w2qTQL5/SBZGn0+
 ufmU1Oeg80mzlp/2JTUx6GZSFXvswsJ3L0WmyZiOzv22a/9sxIDfuenThQnZNvra9nOw
 nV57ArGnVhZq+FHEIAKIg6uSIww3ArqDM2L+tB6wYQvd60u6DHWAQbMVjSR9UA2RiPQd
 JhLw==
X-Gm-Message-State: AOAM533JPix2JDDen4cT+hilYWZhRngh0DZ3cXnoG7b6BFcsxdvmz00W
 zOwxpVCBGpbe9t6qgkoejf9otYkNKw4bpu51qQxBUQRSM9x4V8DKI9RijWSg4efsKK8lRyOodUZ
 FEyhiP7inwEuyNvA5ojKna/uYXnZ2BI8=
X-Received: by 2002:a1f:20e:: with SMTP id 14mr9567946vkc.8.1643693407215;
 Mon, 31 Jan 2022 21:30:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynbZQ25UwUa+NBuqgClTZyHsNvMYvUaAp7wH5KnR/8c1lKHCScUXrVcZBsX3HE5ZOwCFkZ5/ikH0cH5c6sANM=
X-Received: by 2002:a1f:20e:: with SMTP id 14mr9567941vkc.8.1643693406956;
 Mon, 31 Jan 2022 21:30:06 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <CAFEAcA9_d5jw5-HOrZA6dsG1vMqxzqmrfHA7Jo0KsDcaEXmB_Q@mail.gmail.com>
 <6c90ca3d-eaec-d7e8-5941-4deb83b58fd0@redhat.com>
 <87zgnp4b32.fsf@dusky.pond.sub.org>
 <CAFEAcA_kxrCgyxWPFLw6VZ-rKx-res0C8L2BWRvfB81cR+keLg@mail.gmail.com>
 <875yqd6zib.fsf@linaro.org> <YerPk2ABMHQf/3QP@redhat.com>
In-Reply-To: <YerPk2ABMHQf/3QP@redhat.com>
From: Cleber Rosa <crosa@redhat.com>
Date: Tue, 1 Feb 2022 00:29:56 -0500
Message-ID: <CA+bd_6KgJ_tG9r9Nhn5p6bDsdiXKRckGiZ75srxTNZj4bdd2UA@mail.gmail.com>
Subject: Re: "make check-acceptance" takes way too long
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 21, 2022 at 10:22 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> On Fri, Jan 21, 2022 at 12:23:23PM +0000, Alex Benn=C3=A9e wrote:
> >
> > Peter Maydell <peter.maydell@linaro.org> writes:
> >
> > > On Fri, 21 Jan 2022 at 10:50, Markus Armbruster <armbru@redhat.com> w=
rote:
> > >> No objection, but it's no replacement for looking into why these tes=
ts
> > >> are so slow.
> > >>
> > >> The #1 reason for things being slow is not giving a damn :)
> > >
> > > See previous messages in the thread -- the test starts a
> > > full-fat guest OS including UEFI boot, and it takes forever to
> > > get to the login prompt because systemd is starting everything
> > > including the kitchen sink.
> >
> > There has to be a half-way house between booting a kernel until it fail=
s
> > to find a rootfs and running a full Ubuntu distro. Maybe just asking
> > systemd to reach "rescue.target" would be enough to show the disks are
> > up and userspace works.
>
> Booting up full OS distros is useful, but at the same time I feel it
> is too much as something to expect developers to do on any kind of
> regular basis.
>

Agreed.  The solution IMO can be as simple as having different "test
job profiles".

> Ideally some decent amount of acceptance testing could be a standard
> part of the 'make check', but that's impossible as long as we're
> downloading large disk images or booting things that are very slow,
> especially so with TCG.
>
> IMHO the ideal scenario would be for us to have a kernel, initrd
> containing just busybox tools for the key arch targets we care
> about. Those could be used with direct kernel boot or stuffed
> into a disk iamge. Either way, they would boot in ~1 second,
> even with TCG, and would be able to execute simple shell scripts
> to test a decent amount of QEMU functionality.
>

I see different use cases here:

A) Testing that QEMU can boot a full distro

For testing purposes, the more different subsystems the "boot" process
depends on, the better.  Currently the "boot_linux.py" tests require the en=
tire
guest boot to complete and have a networking configuration and interaction.

B) Using something as a base OS for scripts (tests) to run on it

Here's where there's the most benefit in having a more lightweight distro
(or kernel + initrd).  But, this requirement will also come in
different "optimal"
sizes for different people.  Some of the existing tests require not
only a Fedora
system, but a given version that has given capabilities.

For a sustainable, framework-like solution, tests should be able to determi=
ne
the guest they need with minimal setup from test writers[1].  If a Fedora-l=
ike
system is not needed, maybe a lightweight system like CirrOS[2] is enough.
CirrOS, unfortunately, can not be used Today as the distro in most of the
acceptance tests because the cloud-init mechanism used to configure the
networking is not currently supported, although there have been discussions
to consider implementing it[3].

> It wouldn't eliminate the need to test with full OS, but it
> would let us have some acceptance testing run as standard with
> 'make check' in a decently fast time.  It would then be less
> critical if the more thorough full OS tests were somewhat
> slower than we'd like. We could just leave those as a scheduled
> job to run overnight post-merge. If they do detect any problems
> post-merge, then write a dedicated test scenario to replicate it
> under the minimal kernel/initrd acceptance test so it'll be
> caught pre-merge in future.
>

Assuming this is about "Testing that QEMU can boot a full distro", I wouldn=
't
try to solve the problem by making the distro too slim to get to the
point of becoming
an unrealistic system.

IMO the deal breaker with regards to test time can be solved more cheaply b=
y
having and using KVM where these tests will run, and not running them by
default otherwise.  With the tagging mechanism we should be able to set a
condition such as: "If using TCG, exclude tests that boot a full blown dist=
ro.
If using KVM, do not criticize what gets booted".  Resulting in something
like:

$ avocado list -t accel:tcg,boots:-distro -t accel:kvm
~/src/qemu/tests/avocado/{boot_linux.py,boot_linux_console.py}
avocado-instrumented
/home/cleber/src/qemu/tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_i4=
40fx_kvm
avocado-instrumented
/home/cleber/src/qemu/tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_q3=
5_kvm
avocado-instrumented
/home/cleber/src/qemu/tests/avocado/boot_linux.py:BootLinuxAarch64.test_vir=
t_kvm
avocado-instrumented
/home/cleber/src/qemu/tests/avocado/boot_linux_console.py:BootLinuxConsole.=
test_aarch64_virt
avocado-instrumented
/home/cleber/src/qemu/tests/avocado/boot_linux_console.py:BootLinuxConsole.=
test_aarch64_xlnx_versal_virt
avocado-instrumented
/home/cleber/src/qemu/tests/avocado/boot_linux_console.py:BootLinuxConsole.=
test_arm_virt
avocado-instrumented
/home/cleber/src/qemu/tests/avocado/boot_linux_console.py:BootLinuxConsole.=
test_arm_emcraft_sf2
avocado-instrumented
/home/cleber/src/qemu/tests/avocado/boot_linux_console.py:BootLinuxConsole.=
test_arm_raspi2_uart0
avocado-instrumented
/home/cleber/src/qemu/tests/avocado/boot_linux_console.py:BootLinuxConsole.=
test_arm_exynos4210_initrd
avocado-instrumented
/home/cleber/src/qemu/tests/avocado/boot_linux_console.py:BootLinuxConsole.=
test_arm_cubieboard_initrd
avocado-instrumented
/home/cleber/src/qemu/tests/avocado/boot_linux_console.py:BootLinuxConsole.=
test_arm_cubieboard_sata
avocado-instrumented
/home/cleber/src/qemu/tests/avocado/boot_linux_console.py:BootLinuxConsole.=
test_arm_quanta_gsj
avocado-instrumented
/home/cleber/src/qemu/tests/avocado/boot_linux_console.py:BootLinuxConsole.=
test_arm_quanta_gsj_initrd
avocado-instrumented
/home/cleber/src/qemu/tests/avocado/boot_linux_console.py:BootLinuxConsole.=
test_arm_orangepi
avocado-instrumented
/home/cleber/src/qemu/tests/avocado/boot_linux_console.py:BootLinuxConsole.=
test_arm_orangepi_initrd
avocado-instrumented
/home/cleber/src/qemu/tests/avocado/boot_linux_console.py:BootLinuxConsole.=
test_arm_orangepi_sd

Does that sound like something appropriate?

BTW, on the topic of "Using something as a base OS for scripts (tests) to r=
un
on it", another possibility for using full blown OS would be to save
their initialized
state, and load it to memory for each test, saving the guest boot time.  Th=
is
should of course be done at the framework level and transparent to tests.

Best,
- Cleber.

[1] https://avocado-framework.readthedocs.io/en/94.0/guides/writer/libs/vmi=
mage.html#supported-images
[2] https://launchpad.net/cirros
[3] https://github.com/cirros-dev/cirros/issues/67


