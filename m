Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4800459E4A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 16:56:04 +0200 (CEST)
Received: from localhost ([::1]:32806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgsIF-0003L0-Ah
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 10:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37930)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <lvivier@redhat.com>) id 1hgrel-0002G8-As
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 10:15:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lvivier@redhat.com>) id 1hgreh-00044w-FH
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 10:15:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44922)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lvivier@redhat.com>)
 id 1hgref-0003wz-Bm; Fri, 28 Jun 2019 10:15:11 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DDF0BC04B93D;
 Fri, 28 Jun 2019 14:14:56 +0000 (UTC)
Received: from [10.36.117.11] (ovpn-117-11.ams2.redhat.com [10.36.117.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 208826012D;
 Fri, 28 Jun 2019 14:14:50 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, peter.maydell@linaro.org
References: <20190312085502.8203-1-david@gibson.dropbear.id.au>
 <20190312085502.8203-13-david@gibson.dropbear.id.au>
 <b693da29-0d2a-e739-17fb-9fd78894fd9e@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=lvivier@redhat.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <8416add1-453a-b8f7-5b43-fc31bf8e8fca@redhat.com>
Date: Fri, 28 Jun 2019 16:14:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <b693da29-0d2a-e739-17fb-9fd78894fd9e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Fri, 28 Jun 2019 14:15:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PULL 12/62] target/ppc/spapr: Enable mitigations
 by default for pseries-4.0 machine type
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
Cc: clg@kaod.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/06/2019 13:27, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi,
>=20
> On 3/12/19 9:54 AM, David Gibson wrote:
>> From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
>>
>> There are currently 3 mitigations the availability of which is control=
led
>> by the spapr-caps mechanism, cap-cfpc, cap-sbbc, and cap-ibs. Enable t=
hese
>> mitigations by default for the pseries-4.0 machine type.
>>
>> By now machine firmware should have been upgraded to allow these
>> settings.
>>
>> Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
>> Message-Id: <20190301044609.9626-3-sjitindarsingh@gmail.com>
>> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>> ---
>>  hw/ppc/spapr.c | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index 37fd7a1411..946bbcf9ee 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -4307,9 +4307,9 @@ static void spapr_machine_class_init(ObjectClass=
 *oc, void *data)
>>      smc->default_caps.caps[SPAPR_CAP_HTM] =3D SPAPR_CAP_OFF;
>>      smc->default_caps.caps[SPAPR_CAP_VSX] =3D SPAPR_CAP_ON;
>>      smc->default_caps.caps[SPAPR_CAP_DFP] =3D SPAPR_CAP_ON;
>> -    smc->default_caps.caps[SPAPR_CAP_CFPC] =3D SPAPR_CAP_BROKEN;
>> -    smc->default_caps.caps[SPAPR_CAP_SBBC] =3D SPAPR_CAP_BROKEN;
>> -    smc->default_caps.caps[SPAPR_CAP_IBS] =3D SPAPR_CAP_BROKEN;
>> +    smc->default_caps.caps[SPAPR_CAP_CFPC] =3D SPAPR_CAP_WORKAROUND;
>> +    smc->default_caps.caps[SPAPR_CAP_SBBC] =3D SPAPR_CAP_WORKAROUND;
>> +    smc->default_caps.caps[SPAPR_CAP_IBS] =3D SPAPR_CAP_WORKAROUND;
>>      smc->default_caps.caps[SPAPR_CAP_HPT_MAXPAGESIZE] =3D 16; /* 64ki=
B */
>>      smc->default_caps.caps[SPAPR_CAP_NESTED_KVM_HV] =3D SPAPR_CAP_OFF=
;
>>      smc->default_caps.caps[SPAPR_CAP_LARGE_DECREMENTER] =3D SPAPR_CAP=
_ON;
>> @@ -4389,6 +4389,9 @@ static void spapr_machine_3_1_class_options(Mach=
ineClass *mc)
>>      mc->default_cpu_type =3D POWERPC_CPU_TYPE_NAME("power8_v2.0");
>>      smc->update_dt_enabled =3D false;
>>      smc->dr_phb_enabled =3D false;
>> +    smc->default_caps.caps[SPAPR_CAP_CFPC] =3D SPAPR_CAP_BROKEN;
>> +    smc->default_caps.caps[SPAPR_CAP_SBBC] =3D SPAPR_CAP_BROKEN;
>> +    smc->default_caps.caps[SPAPR_CAP_IBS] =3D SPAPR_CAP_BROKEN;
>>      smc->default_caps.caps[SPAPR_CAP_LARGE_DECREMENTER] =3D SPAPR_CAP=
_OFF;
>>  }
>=20
> While trying auto-bisection for LP#1834613 [*] I found this commit brea=
k
> clean bisection.
>=20
> ./configure --enable-debug
>=20
> $ qemu-system-ppc64 \
>  -kernel vmlinuz-vanilla \
>  -nographic -serial null
> qemu-system-ppc64: warning: TCG doesn't support requested feature,
> cap-cfpc=3Dworkaround
> qemu-system-ppc64: warning: TCG doesn't support requested feature,
> cap-sbbc=3Dworkaround
> qemu-system-ppc64: warning: TCG doesn't support requested feature,
> cap-ibs=3Dworkaround
> Opcode 13 10 10 00 (4c400420) leaked temporaries
>=20
> More verbose log:
>=20
> $ qemu-system-ppc64 \
>  -kernel vmlinuz-vanilla \
>  -nographic -append "console=3Dhvc0" \
>  -d guest_errors,in_asm
> qemu-system-ppc64: warning: TCG doesn't support requested feature,
> cap-cfpc=3Dworkaround
> qemu-system-ppc64: warning: TCG doesn't support requested feature,
> cap-sbbc=3Dworkaround
> qemu-system-ppc64: warning: TCG doesn't support requested feature,
> cap-ibs=3Dworkaround
>=20
>=20
> SLOF ******************************************************************=
****
> QEMU Starting
>  Build Date =3D Jan 14 2019 18:00:39
>  FW Version =3D git-a5b428e1c1eae703
>  Press "s" to enter Open Firmware.
> [...]
> --------------
> IN: __switch_to
> 0xc00000000001aac0:  60000000  nop
> 0xc00000000001aac4:  7f44d378  mr       r4, r26
> 0xc00000000001aac8:  7f23cb78  mr       r3, r25
> 0xc00000000001aacc:  4bff3235  bl       0xdd00

The kernel logs are:

[    0.044473] Oops: Exception in kernel mode, sig: 4 [#1]
[    0.044899] BE PAGE_SIZE=3D64K MMU=3DRadix MMU=3DHash SMP NR_CPUS=3D20=
48 NUMA pSeries
[    0.045191] Modules linked in:
[    0.045504] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.1.0-rc4-00058-=
g582549e3fbe1-dirty #11
[    0.045646] NIP:  c00000000000be00 LR: c00000000000e168 CTR: 000000000=
0007fff
[    0.045747] REGS: c0000000011bb770 TRAP: 0700   Not tainted  (5.1.0-rc=
4-00058-g582549e3fbe1-dirty)
[    0.045808] MSR:  8000000002089032 <SF,VEC,EE,ME,IR,DR,RI>  CR: 240288=
22  XER: 00000000
[    0.045971] CFAR: c00000000000bde4 IRQMASK: 1=20
[    0.045971] GPR00: c00000000001f390 c0000000011bba00 c0000000011bf800 =
c0000000010db830=20
[    0.045971] GPR04: c00000001e4041b0 0000000000000000 0000000000000000 =
00000000028a5d7a=20
[    0.045971] GPR08: 0000000000000000 0000000000007fff 0000000000000000 =
fffffffffffffffd=20
[    0.045971] GPR12: 0000000024028828 c0000000013b0000 000000001dc5ff00 =
00000000011d8e18=20
[    0.045971] GPR16: 00000000011d89e0 fffffffffffffffd 000000001dc5ff00 =
0000000000000014=20
[    0.045971] GPR20: 000000001daf0000 c0000000010da4e0 000000001eef0000 =
0000000024028822=20
[    0.045971] GPR24: c0000000010db830 c00000001e4041b0 000000001eef0000 =
c000000000ff5598=20
[    0.045971] GPR28: c0000000010db830 c0000000010d9d00 c00000001e402680 =
c0000000010d9d00=20
[    0.046505] NIP [c00000000000be00] flush_count_cache+0x120/0x2420
[    0.046561] LR [c00000000000e168] ._switch+0x68/0x180
[    0.046696] Call Trace:
[    0.046865] [c0000000011bba00] [c0000000011bba90] init_stack+0x3a90/0x=
4000 (unreliable)
[    0.046970] [c0000000011bbbe0] [c00000000001f390] .__switch_to+0x280/0=
x490
[    0.047031] [c0000000011bbc90] [c000000000b62b5c] .__schedule+0x2bc/0x=
ae0
[    0.047075] [c0000000011bbd80] [c000000000b633c8] .schedule+0x48/0xb0
[    0.047140] [c0000000011bbdf0] [c000000000b63918] .schedule_preempt_di=
sabled+0x18/0x30
[    0.047187] [c0000000011bbe60] [c00000000001065c] .rest_init+0xcc/0xf0
[    0.047233] [c0000000011bbee0] [c000000000f04584] .start_kernel+0x604/=
0x648
[    0.047276] [c0000000011bbf90] [c00000000000b260] start_here_common+0x=
1c/0x53c
[    0.047409] Instruction dump:
[    0.047647] 48000005 48000005 48000005 48000005 48000005 4800001c 6000=
0000 60000000=20
[    0.047744] 60000000 60000000 60000000 60000000 <7d2803a6> 39207fff 7d=
2903a6 4c400420=20
[    0.048410] ---[ end trace 523b05d3a02887f6 ]---
[    0.048523]=20


This is fixed by:

commit fa200c95f7f99ce14b8af25ea0be478c722d3cec
Author: Greg Kurz <groug@kaod.org>
Date:   Fri Mar 22 19:03:46 2019 +0100

    target/ppc: Enable "decrement and test CTR" version of bcctr
   =20
    Even if all ISAs up to v3 indeed mention:
   =20
        If the "decrement and test CTR" option is specified (BO2=3D0), th=
e
        instruction form is invalid.
   =20
    The UMs of all existing 64-bit server class processors say:
   =20
        If BO[2] =3D 0, the contents of CTR (before any update) are used =
as the
        target address and for the test of the contents of CTR to resolve=
 the
        branch. The contents of the CTR are then decremented and written =
back
        to the CTR.
   =20
    The linux kernel has spectre v2 mitigation code that relies on a
    BO[2] =3D 0 variant of bcctr, which is now activated by default on
    spapr, even with TCG. This causes linux guests to panic with
    the default machine type under TCG.
   =20
    Since any CPU model can provide its own behaviour for invalid forms,
    we could possibly introduce a new instruction flag to handle this.
    In practice, since the behaviour is shared by all 64-bit server
    processors starting with 970 up to POWER9, let's reuse the
    PPC_SEGMENT_64B flag. Caveat: this may have to be fixed later if
    POWER10 introduces a different behaviour.
   =20
    The existing behaviour of throwing a program interrupt is kept for
    all other CPU models.
   =20
    Signed-off-by: Greg Kurz <groug@kaod.org>
    Message-Id: <155327782604.1283071.10640596307206921951.stgit@bahia.la=
n>
    Tested-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
    Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

Thanks,
Laurent

