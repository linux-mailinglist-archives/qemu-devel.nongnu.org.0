Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2723C17129A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 09:33:39 +0100 (CET)
Received: from localhost ([::1]:55386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7Eby-00082b-74
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 03:33:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47236)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1j7Eac-00077M-RE
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 03:32:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1j7Eab-0007IM-5V
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 03:32:14 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53238
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1j7Eaa-0007HM-V3
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 03:32:13 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01R8UCJ3132045
 for <qemu-devel@nongnu.org>; Thu, 27 Feb 2020 03:32:11 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydqfvmycq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 27 Feb 2020 03:32:10 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Thu, 27 Feb 2020 08:32:09 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 27 Feb 2020 08:32:06 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 01R8V8bg46399938
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Feb 2020 08:31:08 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33E5EA405C;
 Thu, 27 Feb 2020 08:32:05 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF44EA4054;
 Thu, 27 Feb 2020 08:32:04 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.177.63])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Feb 2020 08:32:04 +0000 (GMT)
Subject: Re: [PATCH v5 00/18] s390x: Protected Virtualization support
To: Cornelia Huck <cohuck@redhat.com>
References: <20200226122038.61481-1-frankja@linux.ibm.com>
 <20200226210944.12feb012.cohuck@redhat.com>
From: Janosch Frank <frankja@linux.ibm.com>
Autocrypt: addr=frankja@linux.ibm.com; prefer-encrypt=mutual; keydata=
 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
Date: Thu, 27 Feb 2020 09:32:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200226210944.12feb012.cohuck@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CGkNVUUOKCZMSroAsOYnZXrDbEQDpfilM"
X-TM-AS-GCONF: 00
x-cbid: 20022708-4275-0000-0000-000003A5E7EF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022708-4276-0000-0000-000038BA2365
Message-Id: <164b079d-3606-b29f-5bd3-5ff298b8ab8a@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-27_02:2020-02-26,
 2020-02-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002270069
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CGkNVUUOKCZMSroAsOYnZXrDbEQDpfilM
Content-Type: multipart/mixed; boundary="dAJmrOgTBDUEp83VWKmEH1eR67ujhrjPW"

--dAJmrOgTBDUEp83VWKmEH1eR67ujhrjPW
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2/26/20 9:09 PM, Cornelia Huck wrote:
> On Wed, 26 Feb 2020 07:20:20 -0500
> Janosch Frank <frankja@linux.ibm.com> wrote:
>=20
>> Most of the QEMU changes for PV are related to the new IPL type with
>> subcodes 8 - 10 and the execution of the necessary Ultravisor calls to=

>> IPL secure guests. Note that we can only boot into secure mode from
>> normal mode, i.e. stfle 161 is not active in secure mode.
>>
>> The other changes related to data gathering for emulation and
>> disabling addressing checks in secure mode, as well as CPU resets.
>>
>> v5:
>> 	* Added balloon inhibition
>> 	* Moved docs into docs/system
>> 	* Some more enable/disable changes
>> 	* Moved enablement/disablement of pv in separate functions
>> 	* Some review fixes
>>
>> v4:
>> 	* Sync with KVM changes
>> 	* Review changes
>>
>> V3:
>> 	* Use dedicated functions to access SIDA
>> 	* Smaller cleanups and segfault fixes
>> 	* Error reporting for Ultravisor calls
>> 	* Inject of RC of diag308 subcode 10 fails
>>
>> V2:
>> 	* Split out cleanups
>> 	* Internal PV state tracking
>> 	* Review feedback
>>
>>
>> Christian Borntraeger (1):
>>   s390x: Add unpack facility feature to GA1
>>
>> Janosch Frank (17):
>>   s390x: Use constant for ESA PSW address
>>   Sync pv
>>   s390x: protvirt: Add diag308 subcodes 8 - 10
>>   s390x: protvirt: Support unpack facility
>>   s390x: protvirt: Add migration blocker
>>   s390x: protvirt: Handle diag 308 subcodes 0,1,3,4
>>   s390x: protvirt: Inhibit balloon when switching to protected mode
>>   s390x: protvirt: KVM intercept changes
>>   s390x: Add SIDA memory ops
>>   s390x: protvirt: Move STSI data over SIDAD
>>   s390x: protvirt: SCLP interpretation
>>   s390x: protvirt: Set guest IPL PSW
>>   s390x: protvirt: Move diag 308 data over SIDAD
>>   s390x: protvirt: Disable address checks for PV guest IO emulation
>>   s390x: protvirt: Move IO control structures over SIDA
>>   s390x: protvirt: Handle SIGP store status correctly
>>   docs: Add protvirt docs
>>
>>  docs/system/index.rst               |   1 +
>>  docs/system/protvirt.rst            |  57 +++++++++++
>>  hw/s390x/Makefile.objs              |   1 +
>>  hw/s390x/ipl.c                      |  82 +++++++++++++++-
>>  hw/s390x/ipl.h                      |  33 +++++++
>>  hw/s390x/pv.c                       | 106 +++++++++++++++++++++
>>  hw/s390x/pv.h                       |  34 +++++++
>>  hw/s390x/s390-virtio-ccw.c          | 143 +++++++++++++++++++++++++++=
-
>>  hw/s390x/sclp.c                     |  17 ++++
>>  include/hw/s390x/s390-virtio-ccw.h  |   1 +
>>  include/hw/s390x/sclp.h             |   2 +
>>  linux-headers/linux/kvm.h           |  45 ++++++++-
>>  target/s390x/cpu.c                  |  27 ++++--
>>  target/s390x/cpu.h                  |   9 +-
>>  target/s390x/cpu_features_def.inc.h |   1 +
>>  target/s390x/diag.c                 |  61 ++++++++++--
>>  target/s390x/gen-features.c         |   1 +
>>  target/s390x/helper.c               |   4 +
>>  target/s390x/ioinst.c               | 113 +++++++++++++++-------
>>  target/s390x/kvm.c                  |  54 ++++++++++-
>>  target/s390x/kvm_s390x.h            |   2 +
>>  target/s390x/mmu_helper.c           |  14 +++
>>  target/s390x/sigp.c                 |   1 +
>>  23 files changed, 744 insertions(+), 65 deletions(-)
>>  create mode 100644 docs/system/protvirt.rst
>>  create mode 100644 hw/s390x/pv.c
>>  create mode 100644 hw/s390x/pv.h
>>
>=20
> I guess this is on top of my published s390-next branch? (At least I
> can apply it there...)

Yes, you can also pick from here:
https://github.com/frankjaa/qemu/commits/protvirt

>=20
> When I try to build the result on x86 with clang, I get

I forgot to add static inline to the non kvm functions...
The latest github branch state has that fixed

>=20
> In file included from /home/cohuck/git/qemu/hw/s390x/ipl.c:36:
> /home/cohuck/git/qemu/hw/s390x/pv.h:25:5: error: no previous prototype =
for
>       function 's390_pv_vm_enable' [-Werror,-Wmissing-prototypes]
> int s390_pv_vm_enable(void) { return 0; }
>     ^
> /home/cohuck/git/qemu/hw/s390x/pv.h:26:6: error: no previous prototype =
for
>       function 's390_pv_vm_disable' [-Werror,-Wmissing-prototypes]
> void s390_pv_vm_disable(void) {}
>      ^
> /home/cohuck/git/qemu/hw/s390x/pv.h:27:5: error: no previous prototype =
for
>       function 's390_pv_set_sec_parms' [-Werror,-Wmissing-prototypes]
> int s390_pv_set_sec_parms(uint64_t origin, uint64_t length) { return 0;=
 }
>     ^
> /home/cohuck/git/qemu/hw/s390x/pv.h:28:5: error: no previous prototype =
for
>       function 's390_pv_unpack' [-Werror,-Wmissing-prototypes]
> int s390_pv_unpack(uint64_t addr, uint64_t size, uint64_t tweak) { retu=
rn 0; }
>     ^
> /home/cohuck/git/qemu/hw/s390x/pv.h:29:6: error: no previous prototype =
for
>       function 's390_pv_perf_clear_reset' [-Werror,-Wmissing-prototypes=
]
> void s390_pv_perf_clear_reset(void) {}
>      ^
> /home/cohuck/git/qemu/hw/s390x/pv.h:30:5: error: no previous prototype =
for
>       function 's390_pv_verify' [-Werror,-Wmissing-prototypes]
> int s390_pv_verify(void) { return 0; }
>     ^
> /home/cohuck/git/qemu/hw/s390x/pv.h:31:6: error: no previous prototype =
for
>       function 's390_pv_unshare' [-Werror,-Wmissing-prototypes]
> void s390_pv_unshare(void) {}
>      ^
>=20
> and

I'll look into it

>=20
> /home/cohuck/git/qemu/hw/s390x/s390-virtio-ccw.c:355:9: error: variable=
 'rc' is
>       used uninitialized whenever 'if' condition is true
>       [-Werror,-Wsometimes-uninitialized]
>     if (local_err) {
>         ^~~~~~~~~
> /home/cohuck/git/qemu/hw/s390x/s390-virtio-ccw.c:391:12: note: uninitia=
lized use
>       occurs here
>     return rc;
>            ^~
> /home/cohuck/git/qemu/hw/s390x/s390-virtio-ccw.c:355:5: note: remove th=
e 'if' if
>       its condition is always false
>     if (local_err) {
>     ^~~~~~~~~~~~~~~~
> /home/cohuck/git/qemu/hw/s390x/s390-virtio-ccw.c:347:11: note: initiali=
ze the
>       variable 'rc' to silence this warning
>     int rc;
>           ^
>            =3D 0
> /home/cohuck/git/qemu/hw/s390x/s390-virtio-ccw.c:396:26: error: incompl=
ete
>       definition of type 'struct kvm_run'
>     int r1 =3D (cs->kvm_run->s390_sieic.ipa & 0x00f0) >> 4;
>               ~~~~~~~~~~~^
> /home/cohuck/git/qemu/include/hw/core/cpu.h:265:8: note: forward declar=
ation of
>       'struct kvm_run'
> struct kvm_run;
>        ^
>=20



--dAJmrOgTBDUEp83VWKmEH1eR67ujhrjPW--

--CGkNVUUOKCZMSroAsOYnZXrDbEQDpfilM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEwGNS88vfc9+v45Yq41TmuOI4ufgFAl5XfoQACgkQ41TmuOI4
ufhxMg/+IZtVohDE5qCey1tIAbWEUNnWzzqevZQktdj0ioKcrH0XgVfDPFD2fOWb
oAdArbUTGnnpjBBl0brF8trZpfYgpCAWg4pu5eyxWR2gp1foCgyx/lNrBhw6T4to
VQerQKlhXfVJyk/PFtew/cczlOYtjobtnI43nZCTyI/G1K2lgP57pXThk80waReH
uOKFSIl488Eb0A5EGi4Z4Edkf4cTzc5bmqJJ+s/wZTZl35GSTv8Soj43aBI4UErp
d2xHTG2JWmbmPvsXI4b/PL6S9QRm9k6MaxoYLwdnGY0XN0dwUFlm+8h6mVjAagjm
3uWsiYXlPKoSAmG2V4LVmj0rZZFQ/pdDu7SjPWqoFsLwN8rsg4fQO1zq3BD4pvhI
h1nUFggcD8KcIfpMqgnOODidfkrwSHErozcb2N/QurlxvZEiQGmpRuA4yYNqhyjs
jtd+ySzjqiYvbLFtRyDMjEQZV+01MZOSnhJ8gK3p5/n69GCgJPDAU2emS5mErU7T
tRWhSzyIXdjHxLpgOKUfaRZnBzoCFhB5p2uu9CIn+Ff+iMMU8TTXFgPcgWCyUDvE
Ty214vRVQ6RNMMaAQ5G4thuVtOe5YNd7bzxpuAIVwGXbrX1RcqyeN9hOB8TgKJc+
+kFJaVTYFpMe2KHLftg2bQqIBBTn6CXN6qeCayUd6ItBjrLzz0Y=
=lCTu
-----END PGP SIGNATURE-----

--CGkNVUUOKCZMSroAsOYnZXrDbEQDpfilM--


