Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92582258C7C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 12:13:25 +0200 (CEST)
Received: from localhost ([::1]:49998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD3I4-00053n-Mi
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 06:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kD3GP-0002RC-IZ
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 06:11:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:57458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kD3GE-00067c-8U
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 06:11:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kD3GC-0005g5-Iz
 for <qemu-devel@nongnu.org>; Tue, 01 Sep 2020 10:11:28 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8E7BB2E8041
 for <qemu-devel@nongnu.org>; Tue,  1 Sep 2020 10:11:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2020 10:04:05 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1892540@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: sparc testcase
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gson laurent-vivier mark-cave-ayland mst-0 philmd
X-Launchpad-Bug-Reporter: Andreas Gustafsson (gson)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <159803735569.2614.10182276398047269277.malonedeb@chaenomeles.canonical.com>
 <20200822142127.1316231-1-f4bug@amsat.org>
 <20200830021257-mutt-send-email-mst@kernel.org>
Message-Id: <2656bffb-9717-2d41-29d2-98334c0a8180@amsat.org>
Subject: Re: [Bug 1892540] [RFC PATCH v2] hw/display/tcx: Allow 64-bit
 accesses to framebuffer stippler and blitter
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="195cbfa84cb75815472f69dd83d46f006869050b"; Instance="production"
X-Launchpad-Hash: 51163f395c5651a82b0a2040a603ce96de3edb9b
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 03:58:46
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1892540 <1892540@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/30/20 8:18 AM, mst@redhat.com wrote:
> On Sat, Aug 22, 2020 at 02:21:27PM -0000, Philippe Mathieu-Daud=C3=83=C6=
=92=C3=86=E2=80=99=C3=83=E2=80=9A=C3=82=C2=A9 wrote:
>> The S24/TCX datasheet is listed as "Unable to locate" on [1].
>>
>> However the NetBSD revision 1.32 of the driver introduced
>> 64-bit accesses to the stippler and blitter [2]. It is safe
>> to assume these memory regions are 64-bit accessible.
>> QEMU implementation is 32-bit, so fill the 'impl' fields.
>>
>> [1] http://web.archive.org/web/20111209011516/http://wikis.sun.com/displ=
ay/FOSSdocs/Home
>> [2] http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/dev/sbus/tcx.c.diff?r1=
=3D1.31&r2=3D1.32
>>
>> Reported-by: Andreas Gustafsson <gson@gson.org>
>> Buglink: https://bugs.launchpad.net/bugs/1892540
>> Fixes: 55d7bfe2293 ("tcx: Implement hardware acceleration")
>> Signed-off-by: Philippe Mathieu-Daud=C3=83=C6=92=C3=86=E2=80=99=C3=83=E2=
=80=9A=C3=82=C2=A9 <f4bug@amsat.org>
> =

> Philippe, did you submit the patch on the mailing list
> normally too? I don't seem to see it there.

Yes, Message-id: <20200822142127.1316231-1-f4bug@amsat.org>
https://www.mail-archive.com/qemu-devel@nongnu.org/msg732515.html

> =

> the patch seems to work for me:
> =

> Tested-by: Michael S. Tsirkin <mst@redhat.com>

Thanks!

> =

> =

> CC Nathan who reported a similar failure.
> =

> Nathan, does the patch below fix the issue for you?
> =

>> ---
>> Since v1:
>> - added missing uncommitted staged changes... (tcx_blit_ops)
>> ---
>  hw/display/tcx.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> =

> diff --git a/hw/display/tcx.c b/hw/display/tcx.c
> index 1fb45b1aab8..96c6898b149 100644
> --- a/hw/display/tcx.c
> +++ b/hw/display/tcx.c
> @@ -548,20 +548,28 @@ static const MemoryRegionOps tcx_stip_ops =3D {
>      .read =3D tcx_stip_readl,
>      .write =3D tcx_stip_writel,
>      .endianness =3D DEVICE_NATIVE_ENDIAN,
> -    .valid =3D {
> +    .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> +    .valid =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 8,
> +    },
>  };
>  =

>  static const MemoryRegionOps tcx_rstip_ops =3D {
>      .read =3D tcx_stip_readl,
>      .write =3D tcx_rstip_writel,
>      .endianness =3D DEVICE_NATIVE_ENDIAN,
> -    .valid =3D {
> +    .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> +    .valid =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 8,
> +    },
>  };
>  =

>  static uint64_t tcx_blit_readl(void *opaque, hwaddr addr,
> @@ -650,10 +658,14 @@ static const MemoryRegionOps tcx_rblit_ops =3D {
>      .read =3D tcx_blit_readl,
>      .write =3D tcx_rblit_writel,
>      .endianness =3D DEVICE_NATIVE_ENDIAN,
> -    .valid =3D {
> +    .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> +    .valid =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 8,
> +    },
>  };
>  =

>  static void tcx_invalidate_cursor_position(TCXState *s)
> =

> =

> -----------------------------------------------------------
> =

> I think you shouldn't specify .min_access_size in impl, since
> that also allows 1 and 2 byte accesses from guest.
> =

> =

> =

>> -- =

>> 2.26.2
>>
>> -- =

>> You received this bug notification because you are subscribed to the bug
>> report.
>> https://bugs.launchpad.net/bugs/1892540
>>
>> Title:
>>   qemu can no longer boot NetBSD/sparc
>>
>> Status in QEMU:
>>   New
>>
>> Bug description:
>>   Booting NetBSD/sparc in qemu no longer works.  It broke between qemu
>>   version 5.0.0 and 5.1.0, and a bisection identified the following as
>>   the offending commit:
>>
>>     [5d971f9e672507210e77d020d89e0e89165c8fc9] memory: Revert "memory:
>>   accept mismatching sizes in memory_region_access_valid"
>>
>>   It's still broken as of 7fd51e68c34fcefdb4d6fd646ed3346f780f89f4.
>>
>>   To reproduce, run
>>
>>     wget http://ftp.netbsd.org/pub/NetBSD/NetBSD-9.0/images/NetBSD-9.0-s=
parc.iso
>>     qemu-system-sparc -nographic -cdrom NetBSD-9.0-sparc.iso -boot d
>>
>>   The expected behavior is that the guest boots to the prompt
>>
>>     Installation medium to load the additional utilities from:
>>
>>   The observed behavior is a panic:
>>
>>     [   1.0000050] system[0]: trap 0x29: pc=3D0xf0046b14 sfsr=3D0xb6 sfv=
a=3D0x54000000
>>     [   1.0000050] cpu0: data fault: pc=3D0xf0046b14 addr=3D0x54000000 s=
fsr=3D0xb6<PERR=3D0x0,LVL=3D0x0,AT=3D0x5,FT=3D0x5,FAV,OW>
>>     [   1.0000050] panic: kernel fault
>>     [   1.0000050] halted
>>
>> To manage notifications about this bug go to:
>> https://bugs.launchpad.net/qemu/+bug/1892540/+subscriptions
> =

>

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1892540

Title:
  qemu can no longer boot NetBSD/sparc

Status in QEMU:
  New

Bug description:
  Booting NetBSD/sparc in qemu no longer works.  It broke between qemu
  version 5.0.0 and 5.1.0, and a bisection identified the following as
  the offending commit:

    [5d971f9e672507210e77d020d89e0e89165c8fc9] memory: Revert "memory:
  accept mismatching sizes in memory_region_access_valid"

  It's still broken as of 7fd51e68c34fcefdb4d6fd646ed3346f780f89f4.

  To reproduce, run

    wget http://ftp.netbsd.org/pub/NetBSD/NetBSD-9.0/images/NetBSD-9.0-spar=
c.iso
    qemu-system-sparc -nographic -cdrom NetBSD-9.0-sparc.iso -boot d

  The expected behavior is that the guest boots to the prompt

    Installation medium to load the additional utilities from:

  The observed behavior is a panic:

    [   1.0000050] system[0]: trap 0x29: pc=3D0xf0046b14 sfsr=3D0xb6 sfva=
=3D0x54000000
    [   1.0000050] cpu0: data fault: pc=3D0xf0046b14 addr=3D0x54000000 sfsr=
=3D0xb6<PERR=3D0x0,LVL=3D0x0,AT=3D0x5,FT=3D0x5,FAV,OW>
    [   1.0000050] panic: kernel fault
    [   1.0000050] halted

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1892540/+subscriptions

