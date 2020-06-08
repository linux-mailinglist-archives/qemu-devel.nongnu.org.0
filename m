Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D94A1F1C57
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jun 2020 17:43:42 +0200 (CEST)
Received: from localhost ([::1]:58296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiJw5-0006Z5-Gs
	for lists+qemu-devel@lfdr.de; Mon, 08 Jun 2020 11:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jiJtd-00049r-On
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 11:41:10 -0400
Received: from indium.canonical.com ([91.189.90.7]:44814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jiJtc-0003j2-Ax
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 11:41:09 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jiJta-0004Qd-Ei
 for <qemu-devel@nongnu.org>; Mon, 08 Jun 2020 15:41:06 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6760C2E8105
 for <qemu-devel@nongnu.org>; Mon,  8 Jun 2020 15:41:06 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2020 15:33:24 -0000
From: Eric Blake <1874073@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=philmd@redhat.com; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: eblake mliska philmd pmaydell
X-Launchpad-Bug-Reporter: Martin Liska (mliska)
X-Launchpad-Bug-Modifier: Eric Blake (eblake)
References: <158747496330.1952.6391008472811579405.malonedeb@chaenomeles.canonical.com>
 <20200608071409.17024-1-philmd@redhat.com>
Message-Id: <95f1d638-3921-ffdf-8f07-2f077d1d0cc9@redhat.com>
Subject: [Bug 1874073] Re: [PATCH] hw/openrisc/openrisc_sim: Add assertion to
 silent GCC warning
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ef9fc486e875d54078fa61cf91e898b895125d89";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 9b336a1c57938e582a6fc0c6bd79410aa3d01d41
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 11:30:42
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1874073 <1874073@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/20 2:14 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> When compiling with GCC 10 (Fedora 32) using CFLAGS=3D-O2 we get:

In the subject: s/silent/silence/

> =

>      CC      or1k-softmmu/hw/openrisc/openrisc_sim.o
>    hw/openrisc/openrisc_sim.c: In function =E2=80=98openrisc_sim_init=E2=
=80=99:
>    hw/openrisc/openrisc_sim.c:87:42: error: =E2=80=98cpu_irqs[0]=E2=80=99=
 may be used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
>       87 |         sysbus_connect_irq(s, i, cpu_irqs[i][irq_pin]);
>          |                                  ~~~~~~~~^~~
> =

> While humans can tell smp_cpus will always be in the [1, 2] range,
> (openrisc_sim_machine_init sets mc->max_cpus =3D 2), the compiler
> can't.
> =

> Add an assertion to give the compiler a hint there's no use of
> uninitialized data.
> =

> Buglink: https://bugs.launchpad.net/qemu/+bug/1874073
> Reported-by: Martin Li=C5=A1ka <mliska@suse.cz>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>   hw/openrisc/openrisc_sim.c | 1 +
>   1 file changed, 1 insertion(+)

Tested-by: Eric Blake <eblake@redhat.com>

With the typo fixed,
Reviewed-by: Eric Blake <eblake@redhat.com>

-- =

Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1874073

Title:
  openrisc_sim.c:87:42: error: 'cpu_irqs[0]' may be used uninitialized
  in this function [-Werror=3Dmaybe-uninitialized]

Status in QEMU:
  Confirmed

Bug description:
  I see the warning since gcc10:

  static void openrisc_sim_init(MachineState *machine):
  ...
      qemu_irq *cpu_irqs[2];
  ...

  =

      serial_mm_init(get_system_memory(), 0x90000000, 0, serial_irq,
                     115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);

  I would initialize cpu_irqs[2] with {}.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1874073/+subscriptions

