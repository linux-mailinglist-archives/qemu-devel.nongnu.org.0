Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD844F5007
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 16:41:31 +0100 (CET)
Received: from localhost ([::1]:56482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT6OA-0004pk-Mv
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 10:41:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52067)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lvivier@redhat.com>) id 1iT6HK-00058X-At
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 10:34:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lvivier@redhat.com>) id 1iT6HH-0004Mw-6W
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 10:34:24 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34108
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lvivier@redhat.com>) id 1iT6HH-0004Mo-2p
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 10:34:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573227262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=H2mhJa25MibqxM7OZO3z4eQZjMwL/i2yRkAP1JQo2vw=;
 b=JOwcsQjX4Nwl8YTM066thTogqcgv42Uwwj/NG8oHwyCNUmjiQc9uyy0h5E00Eu2lmeUa8V
 vQUnQyo5IjENixTxydt2cT9GYQVzUKhE2ppWKhKMeDkQAUeP2S9PRb1LqRAtzcMtuOsk1P
 xKqh+H/19Vg+IeG4Bq3+B+mqQP90fZQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-w402fKTTN5uH2LNd4c52Cw-1; Fri, 08 Nov 2019 10:34:20 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D3B1800C72;
 Fri,  8 Nov 2019 15:34:13 +0000 (UTC)
Received: from [10.36.117.0] (unknown [10.36.117.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D902B5DA82;
 Fri,  8 Nov 2019 15:34:03 +0000 (UTC)
Subject: Re: [PULL 06/28] spapr: Set VSMT to smp_threads by default
To: David Gibson <david@gibson.dropbear.id.au>
References: <20191024081813.2115-1-david@gibson.dropbear.id.au>
 <20191024081813.2115-7-david@gibson.dropbear.id.au>
 <9aebac7e-8ea3-0c16-30ca-251bcddd7699@redhat.com>
 <20191108142610.GM2461@umbus.Home>
From: Laurent Vivier <lvivier@redhat.com>
Autocrypt: addr=lvivier@redhat.com; prefer-encrypt=mutual; keydata=
 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
 D+Ofp0T3KOr1RUHvCZoLURfFhSQ=
Message-ID: <adcda0b1-7c5b-2d0c-9c5e-8ff74defb5c1@redhat.com>
Date: Fri, 8 Nov 2019 16:34:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191108142610.GM2461@umbus.Home>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: w402fKTTN5uH2LNd4c52Cw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org, Juan Quintela <quintela@redhat.com>,
 groug@kaod.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/11/2019 15:26, David Gibson wrote:
> On Fri, Nov 08, 2019 at 02:11:03PM +0100, Laurent Vivier wrote:
>> On 24/10/2019 10:17, David Gibson wrote:
>>> From: Greg Kurz <groug@kaod.org>
>>>
>>> Support for setting VSMT is available in KVM since linux-4.13. Most dis=
tros
>>> that support KVM on POWER already have it. It thus seem reasonable enou=
gh
>>> to have the default machine to set VSMT to smp_threads.
>>>
>>> This brings contiguous VCPU ids and thus brings their upper bound down =
to
>>> the machine's max_cpus. This is especially useful for XIVE KVM devices,
>>> which may thus allocate only one VP descriptor per VCPU.
>>>
>>> Signed-off-by: Greg Kurz <groug@kaod.org>
>>> Message-Id: <157010411885.246126.12610015369068227139.stgit@bahia.lan>
>>> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>>> ---
>>>  hw/ppc/spapr.c         | 7 ++++++-
>>>  include/hw/ppc/spapr.h | 1 +
>>>  2 files changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>>> index 4eb97d3a9b..428b834f30 100644
>>> --- a/hw/ppc/spapr.c
>>> +++ b/hw/ppc/spapr.c
>>> @@ -2496,6 +2496,7 @@ static CPUArchId *spapr_find_cpu_slot(MachineStat=
e *ms, uint32_t id, int *idx)
>>>  static void spapr_set_vsmt_mode(SpaprMachineState *spapr, Error **errp=
)
>>>  {
>>>      MachineState *ms =3D MACHINE(spapr);
>>> +    SpaprMachineClass *smc =3D SPAPR_MACHINE_GET_CLASS(spapr);
>>>      Error *local_err =3D NULL;
>>>      bool vsmt_user =3D !!spapr->vsmt;
>>>      int kvm_smt =3D kvmppc_smt_threads();
>>> @@ -2522,7 +2523,7 @@ static void spapr_set_vsmt_mode(SpaprMachineState=
 *spapr, Error **errp)
>>>              goto out;
>>>          }
>>>          /* In this case, spapr->vsmt has been set by the command line =
*/
>>> -    } else {
>>> +    } else if (!smc->smp_threads_vsmt) {
>>>          /*
>>>           * Default VSMT value is tricky, because we need it to be as
>>>           * consistent as possible (for migration), but this requires
>>> @@ -2531,6 +2532,8 @@ static void spapr_set_vsmt_mode(SpaprMachineState=
 *spapr, Error **errp)
>>>           * overwhelmingly common case in production systems.
>>>           */
>>>          spapr->vsmt =3D MAX(8, smp_threads);
>>> +    } else {
>>> +        spapr->vsmt =3D smp_threads;
>>>      }
>>> =20
>>>      /* KVM: If necessary, set the SMT mode: */
>>> @@ -4438,6 +4441,7 @@ static void spapr_machine_class_init(ObjectClass =
*oc, void *data)
>>>      smc->irq =3D &spapr_irq_dual;
>>>      smc->dr_phb_enabled =3D true;
>>>      smc->linux_pci_probe =3D true;
>>> +    smc->smp_threads_vsmt =3D true;
>>>  }
>>> =20
>>>  static const TypeInfo spapr_machine_info =3D {
>>> @@ -4505,6 +4509,7 @@ static void spapr_machine_4_1_class_options(Machi=
neClass *mc)
>>> =20
>>>      spapr_machine_4_2_class_options(mc);
>>>      smc->linux_pci_probe =3D false;
>>> +    smc->smp_threads_vsmt =3D false;
>>>      compat_props_add(mc->compat_props, hw_compat_4_1, hw_compat_4_1_le=
n);
>>>      compat_props_add(mc->compat_props, compat, G_N_ELEMENTS(compat));
>>>  }
>>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>>> index cbd1a4c9f3..2009eb64f9 100644
>>> --- a/include/hw/ppc/spapr.h
>>> +++ b/include/hw/ppc/spapr.h
>>> @@ -122,6 +122,7 @@ struct SpaprMachineClass {
>>>      bool broken_host_serial_model; /* present real host info to the gu=
est */
>>>      bool pre_4_1_migration; /* don't migrate hpt-max-page-size */
>>>      bool linux_pci_probe;
>>> +    bool smp_threads_vsmt; /* set VSMT to smp_threads by default */
>>> =20
>>>      void (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
>>>                            uint64_t *buid, hwaddr *pio,=20
>>>
>>
>> This patch breaks tests/migration-test on P8 host with kernel older than
>> 4.3 because it tries by default to set the VSMT to 1.
>>
>> qemu-system-ppc64: Failed to set KVM's VSMT mode to 1 (errno -22)
>> On PPC, a VM with 1 threads/core on a host with 8 threads/core requires
>> the use of VSMT mode 1.
>> This KVM seems to be too old to support VSMT.
>>
>> As this is clearly intentional, is there a way to fix migration-test?
>=20
> Hrm.  I believe the argument for this was that the broken kernels were
> old enough we didn't care.  What platform are you testing on where
> you're hitting this?
>=20

I'm going to propose a patch to fix this problem.
(it was on RHEL7)

Thanks,
Laurent


