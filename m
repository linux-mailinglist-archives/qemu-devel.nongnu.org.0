Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3B41F4389
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 19:54:34 +0200 (CEST)
Received: from localhost ([::1]:56040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiiSH-0000Gy-9s
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 13:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jiiOg-0003Uv-D4
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 13:50:50 -0400
Received: from indium.canonical.com ([91.189.90.7]:51808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jiiOc-0007Aj-BJ
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 13:50:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jiiOZ-0003xM-0y
 for <qemu-devel@nongnu.org>; Tue, 09 Jun 2020 17:50:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C6E452E810C
 for <qemu-devel@nongnu.org>; Tue,  9 Jun 2020 17:50:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2020 17:44:09 -0000
From: Laurent Vivier <1874073@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=philmd@redhat.com; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: eblake laurent-vivier mliska philmd pmaydell
X-Launchpad-Bug-Reporter: Martin Liska (mliska)
X-Launchpad-Bug-Modifier: Laurent Vivier (laurent-vivier)
References: <158747496330.1952.6391008472811579405.malonedeb@chaenomeles.canonical.com>
 <20200608160611.16966-1-philmd@redhat.com>
Message-Id: <667551f6-96fb-19a3-828c-c8d0e1c41fb9@vivier.eu>
Subject: [Bug 1874073] Re: [PATCH v2] hw/openrisc/openrisc_sim: Add assertion
 to silence GCC warning
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ef9fc486e875d54078fa61cf91e898b895125d89";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 5c07896bee7c7960c41382de896f436806a71476
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 10:15:37
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

Le 08/06/2020 =C3=A0 18:06, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit=C2=A0:
> When compiling with GCC 10 (Fedora 32) using CFLAGS=3D-O2 we get:
> =

>     CC      or1k-softmmu/hw/openrisc/openrisc_sim.o
>   hw/openrisc/openrisc_sim.c: In function =E2=80=98openrisc_sim_init=E2=
=80=99:
>   hw/openrisc/openrisc_sim.c:87:42: error: =E2=80=98cpu_irqs[0]=E2=80=99 =
may be used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
>      87 |         sysbus_connect_irq(s, i, cpu_irqs[i][irq_pin]);
>         |                                  ~~~~~~~~^~~
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
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Tested-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v2: Fixed typo in subject (eblake)
> Supersedes: <20200608071409.17024-1-philmd@redhat.com>
> ---
>  hw/openrisc/openrisc_sim.c | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> index d08ce61811..02f5259e5e 100644
> --- a/hw/openrisc/openrisc_sim.c
> +++ b/hw/openrisc/openrisc_sim.c
> @@ -134,6 +134,7 @@ static void openrisc_sim_init(MachineState *machine)
>      int n;
>      unsigned int smp_cpus =3D machine->smp.cpus;
>  =

> +    assert(smp_cpus >=3D 1 && smp_cpus <=3D 2);
>      for (n =3D 0; n < smp_cpus; n++) {
>          cpu =3D OPENRISC_CPU(cpu_create(machine->cpu_type));
>          if (cpu =3D=3D NULL) {
> =


Applied to my trivial-patches branch.

Thanks,
Laurent

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

