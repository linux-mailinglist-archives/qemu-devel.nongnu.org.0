Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC79165CAA
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 12:22:40 +0100 (CET)
Received: from localhost ([::1]:40046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4juh-0004dN-PY
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 06:22:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40291)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1j4jtw-0004Ee-Q0
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 06:21:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1j4jtv-0004F2-5I
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 06:21:52 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59660)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1j4jtu-0004Ds-Or
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 06:21:51 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01KBLB4q020272
 for <qemu-devel@nongnu.org>; Thu, 20 Feb 2020 06:21:48 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y8ucmyjvs-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 20 Feb 2020 06:21:47 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Thu, 20 Feb 2020 11:21:43 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 20 Feb 2020 11:21:40 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01KBLdjg34013418
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Feb 2020 11:21:39 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9D38A4060;
 Thu, 20 Feb 2020 11:21:39 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56942A405B;
 Thu, 20 Feb 2020 11:21:39 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.185.143])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 20 Feb 2020 11:21:39 +0000 (GMT)
Subject: Re: [PATCH v3 05/17] s390x: protvirt: Support unpack facility
To: Cornelia Huck <cohuck@redhat.com>
References: <20200214151636.8764-1-frankja@linux.ibm.com>
 <20200214151636.8764-6-frankja@linux.ibm.com>
 <20200220113950.015984bf.cohuck@redhat.com>
From: Janosch Frank <frankja@linux.ibm.com>
Autocrypt: addr=frankja@linux.ibm.com; prefer-encrypt=mutual; keydata=
 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
Date: Thu, 20 Feb 2020 12:21:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200220113950.015984bf.cohuck@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Yc0DAZyvz3U8qr7p9KHpIYFbEpGchpmhS"
X-TM-AS-GCONF: 00
x-cbid: 20022011-0012-0000-0000-000003889454
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022011-0013-0000-0000-000021C52ACE
Message-Id: <ea7b2591-e805-7fe7-e862-331c41733a98@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_03:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002200085
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
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
Cc: qemu-s390x@nongnu.org, mihajlov@linux.ibm.com, qemu-devel@nongnu.org,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Yc0DAZyvz3U8qr7p9KHpIYFbEpGchpmhS
Content-Type: multipart/mixed; boundary="1GjQUpinkyAyixWtt3fgUrez5Yu16Db03"

--1GjQUpinkyAyixWtt3fgUrez5Yu16Db03
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2/20/20 11:39 AM, Cornelia Huck wrote:
> On Fri, 14 Feb 2020 10:16:24 -0500
> Janosch Frank <frankja@linux.ibm.com> wrote:
>=20
>> When a guest has saved a ipib of type 5 and call diagnose308 with
>=20
> s/call/calls/
>=20
>> subcode 10, we have to setup the protected processing environment via
>> Ultravisor calls. The calls are done by KVM and are exposed via an API=
=2E
>>
>> The following steps are necessary:
>> 1. Create a VM (register it with the Ultravisor)
>> 2. Create secure CPUs for all of our current cpus
>> 3. Forward the secure header to the Ultravisor (has all information on=

>> how to decrypt the image and VM information)
>> 4. Protect image pages from the host and decrypt them
>> 5. Verify the image integrity
>>
>> Only after step 5 a protected VM is allowed to run.
>>
>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com> [Changes=

>> to machine]
>> ---
>>  hw/s390x/Makefile.objs              |   1 +
>>  hw/s390x/ipl.c                      |  32 ++++++
>>  hw/s390x/ipl.h                      |   2 +
>>  hw/s390x/pv.c                       | 154 +++++++++++++++++++++++++++=
+
>>  hw/s390x/pv.h                       |  38 +++++++
>>  hw/s390x/s390-virtio-ccw.c          |  79 ++++++++++++++
>>  include/hw/s390x/s390-virtio-ccw.h  |   1 +
>>  target/s390x/cpu.c                  |   4 +
>>  target/s390x/cpu.h                  |   1 +
>>  target/s390x/cpu_features_def.inc.h |   1 +
>>  10 files changed, 313 insertions(+)
>>  create mode 100644 hw/s390x/pv.c
>>  create mode 100644 hw/s390x/pv.h
>=20
> (...)
>=20
>> diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
>> new file mode 100644
>> index 0000000000..5b6a26cba9
>> --- /dev/null
>> +++ b/hw/s390x/pv.c
>> @@ -0,0 +1,154 @@
>> +/*
>> + * Secure execution functions
>> + *
>> + * Copyright IBM Corp. 2019
>=20
> Update the year?

ack.

>=20
>> + * Author(s):
>> + *  Janosch Frank <frankja@linux.ibm.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or=
 (at
>> + * your option) any later version. See the COPYING file in the top-le=
vel
>> + * directory.
>> + */
>=20
> (...)
>=20
>> +void s390_pv_vm_destroy(void)
>> +{
>> +     s390_pv_cmd_exit(KVM_PV_VM_DESTROY, NULL);
>=20
> Why does this exit()? Should Never Happen?

Yes, and we can't recover from this.

>=20
>> +}
>> +
>> +int s390_pv_vcpu_create(CPUState *cs)
>> +{
>> +    int rc;
>> +
>> +    rc =3D s390_pv_cmd_vcpu(cs, KVM_PV_VCPU_CREATE, NULL);
>> +    if (!rc) {
>> +        S390_CPU(cs)->env.pv =3D true;
>> +    }
>> +
>> +    return rc;
>> +}
>> +
>> +void s390_pv_vcpu_destroy(CPUState *cs)
>> +{
>> +    s390_pv_cmd_vcpu_exit(cs, KVM_PV_VCPU_DESTROY, NULL);
>=20
> dito
>=20
>> +    S390_CPU(cs)->env.pv =3D false;
>> +}
>=20
> (...)
>=20
>> +void s390_pv_perf_clear_reset(void)
>> +{
>> +    s390_pv_cmd_exit(KVM_PV_VM_PREP_RESET, NULL);
>=20
> And here. Or is that because the machine should not be left around in
> an undefined state?

If it failed, we could only try again, there's no fixing the problem.
So I chose to rather exit instead of looping around something which most
likely will never recover after the first error.

>=20
>> +}
>> +
>> +int s390_pv_verify(void)
>> +{
>> +    return s390_pv_cmd(KVM_PV_VM_VERIFY, NULL);
>> +}
>> +
>> +void s390_pv_unshare(void)
>> +{
>> +    s390_pv_cmd_exit(KVM_PV_VM_UNSHARE_ALL, NULL);
>> +}
>> diff --git a/hw/s390x/pv.h b/hw/s390x/pv.h
>> new file mode 100644
>> index 0000000000..7d20bdd12e
>> --- /dev/null
>> +++ b/hw/s390x/pv.h
>> @@ -0,0 +1,38 @@
>> +/*
>> + * Protected Virtualization header
>> + *
>> + * Copyright IBM Corp. 2019
>=20
> Year++
>=20
>> + * Author(s):
>> + *  Janosch Frank <frankja@linux.ibm.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or=
 (at
>> + * your option) any later version. See the COPYING file in the top-le=
vel
>> + * directory.
>> + */
>> +
>> +#ifndef HW_S390_PV_H
>> +#define HW_S390_PV_H
>> +
>> +#ifdef CONFIG_KVM
>> +int s390_pv_vm_create(void);
>> +void s390_pv_vm_destroy(void);
>> +void s390_pv_vcpu_destroy(CPUState *cs);
>> +int s390_pv_vcpu_create(CPUState *cs);
>> +int s390_pv_set_sec_parms(uint64_t origin, uint64_t length);
>> +int s390_pv_unpack(uint64_t addr, uint64_t size, uint64_t tweak);
>> +void s390_pv_perf_clear_reset(void);
>> +int s390_pv_verify(void);
>> +void s390_pv_unshare(void);
>> +#else
>> +int s390_pv_vm_create(void) { return 0; }
>=20
> I'm wondering why you return 0 here (and below). These function should
> not be called for !KVM, but just to help catch logic error, use -EINVAL=

> or so?
>=20
>> +void s390_pv_vm_destroy(void) {}
>> +void s390_pv_vcpu_destroy(CPUState *cs) {}
>> +int s390_pv_vcpu_create(CPUState *cs) { return 0; }
>> +int s390_pv_set_sec_parms(uint64_t origin, uint64_t length) { return =
0; }
>> +int s390_pv_unpack(uint64_t addr, uint64_t size, uint64_t tweak) { re=
turn 0: }
>> +void s390_pv_perf_clear_reset(void) {}
>> +int s390_pv_verify(void) { return 0; }
>> +void s390_pv_unshare(void) {}
>> +#endif
>> +
>> +#endif /* HW_S390_PV_H */
>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>> index e759eb5f83..5fa4372083 100644
>> --- a/hw/s390x/s390-virtio-ccw.c
>> +++ b/hw/s390x/s390-virtio-ccw.c
>> @@ -41,6 +41,7 @@
>>  #include "hw/qdev-properties.h"
>>  #include "hw/s390x/tod.h"
>>  #include "sysemu/sysemu.h"
>> +#include "hw/s390x/pv.h"
>> =20
>>  S390CPU *s390_cpu_addr2state(uint16_t cpu_addr)
>>  {
>> @@ -240,9 +241,11 @@ static void s390_create_sclpconsole(const char *t=
ype, Chardev *chardev)
>>  static void ccw_init(MachineState *machine)
>>  {
>>      int ret;
>> +    S390CcwMachineState *ms =3D S390_CCW_MACHINE(machine);
>>      VirtualCssBus *css_bus;
>>      DeviceState *dev;
>> =20
>> +    ms->pv =3D false;
>=20
> I'm wondering why you need to init this to false - isn't it already
> zeroed out?
>=20
>>      s390_sclp_init();
>>      /* init memory + setup max page size. Required for the CPU model =
*/
>>      s390_memory_init(machine->ram_size);
>> @@ -318,10 +321,58 @@ static inline void s390_do_cpu_ipl(CPUState *cs,=
 run_on_cpu_data arg)
>>      s390_cpu_set_state(S390_CPU_STATE_OPERATING, cpu);
>>  }
>> =20
>> +static int s390_machine_pv_secure(S390CcwMachineState *ms)
>> +{
>> +    CPUState *t;
>> +    int rc;
>> +
>> +    /* Create SE VM */
>> +    rc =3D s390_pv_vm_create();
>> +    if (rc) {
>> +        return rc;
>> +    }
>> +
>> +    CPU_FOREACH(t) {
>> +        rc =3D s390_pv_vcpu_create(t);
>> +        if (rc) {
>> +            return rc;
>=20
> No need to undo something on error?

There have been changes in this area anyway, since Christian switched to
one create/destroy instead of separate for vm and vcpu.

I'll update the error handling in the new state and send out the patches
ssonish.


>=20
>> +        }
>> +    }
>> +
>> +    ms->pv =3D true;
>> +
>> +    /* Set SE header and unpack */
>> +    rc =3D s390_ipl_prepare_pv_header();
>> +    if (rc) {
>> +        return rc;
>=20
> Also here.
>=20
>> +    }
>> +
>> +    /* Decrypt image */
>> +    rc =3D s390_ipl_pv_unpack();
>> +    if (rc) {
>> +        return rc;
>=20
> And here.
>=20
>> +    }
>> +
>> +    /* Verify integrity */
>> +    rc =3D s390_pv_verify();
>> +    return rc;
>=20
> And here.
>=20
>> +}
>=20
> (...)
>=20
>> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
>> index 8da1905485..1dbd84b9d7 100644
>> --- a/target/s390x/cpu.c
>> +++ b/target/s390x/cpu.c
>> @@ -37,6 +37,8 @@
>>  #include "sysemu/hw_accel.h"
>>  #include "hw/qdev-properties.h"
>>  #ifndef CONFIG_USER_ONLY
>> +#include "hw/s390x/s390-virtio-ccw.h"
>> +#include "hw/s390x/pv.h"
>>  #include "hw/boards.h"
>>  #include "sysemu/arch_init.h"
>>  #include "sysemu/sysemu.h"
>> @@ -191,6 +193,7 @@ static void s390_cpu_realizefn(DeviceState *dev, E=
rror **errp)
>> =20
>>  #if !defined(CONFIG_USER_ONLY)
>>      MachineState *ms =3D MACHINE(qdev_get_machine());
>> +    S390CcwMachineState *ccw =3D S390_CCW_MACHINE(ms);
>=20
> I find the variable name a bit confusing... maybe ccw_ms?
>=20
>>      unsigned int max_cpus =3D ms->smp.max_cpus;
>>      if (cpu->env.core_id >=3D max_cpus) {
>>          error_setg(&err, "Unable to add CPU with core-id: %" PRIu32
>> @@ -205,6 +208,7 @@ static void s390_cpu_realizefn(DeviceState *dev, E=
rror **errp)
>>          goto out;
>>      }
>> =20
>> +    cpu->env.pv =3D ccw->pv;
>=20
> So, if you add a cpu, it will inherit the pv state of the machine...
> doesn't it need any setup?
>=20
>>      /* sync cs->cpu_index and env->core_id. The latter is needed for =
TCG. */
>>      cs->cpu_index =3D cpu->env.core_id;
>>  #endif
>=20
> (...)
>=20



--1GjQUpinkyAyixWtt3fgUrez5Yu16Db03--

--Yc0DAZyvz3U8qr7p9KHpIYFbEpGchpmhS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEwGNS88vfc9+v45Yq41TmuOI4ufgFAl5Oa8IACgkQ41TmuOI4
ufiV2g//V0e3b+oS5HukcX2Ha7QL5f4ih3vB1d9VdBhYJ3mFOKA+Xf23b8ba9Gxv
MzxoZ2r4wd6lyy/jXs35f0A169riyxBSeRp6kO8ThZhAD8cyp24n1CtOCYUqOENP
eq+a3tAJnppRJP7rzoFTtiy7PlCZzfYxfKPH0SbXC/OgtdNuGTH/OVqPH8gHy8v7
d0h7P4JTCva8fmDG9hVBRE+M2qRhY8Ubpwwr26O6Pa0BJoxb0Zwj1HuR2un+NuNM
AlY3+w4hPSaWmTnNyivQPEDI1W85cY2CYdxsmWNzvjHZ36RW6WXH2OoAI1IUzFjX
AJDD+0VA8DZSqA7Uo+VWYZmwZOfSk2X/j+8Q4SfHc6dC5onro/tw9rxROlueZgBp
XOafGhBFqHVr0QRlcMQbFDQ32DqUh610d9keSP2gbLAZ1/CqeTPXwfrx2noTx8fz
nFj97uFuMic7AownFgdQQv3NJQiKljNjllHZc/duScIgtIdBsSkkz2tLYKeYaY55
E+SORp4FCljj4Mxz572NDZGKl5dOqhFmHYB90lX/IdIEP+SDAgcz6ASLmwxb6ohE
v9xkgZ/Ytj+Y75uMqisuW5dsVVF3AX9M5n9UqsYGyVM2PyvfAuXkO9MHEvk5Ah4s
+4g6hppitc7phKgC1yAkMjjCR4xlzcnIwC4JhPI5jdauUJ3utvc=
=7D4l
-----END PGP SIGNATURE-----

--Yc0DAZyvz3U8qr7p9KHpIYFbEpGchpmhS--


