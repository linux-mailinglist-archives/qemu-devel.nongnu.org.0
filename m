Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA6F10CCF0
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Nov 2019 17:41:12 +0100 (CET)
Received: from localhost ([::1]:50848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iaMqs-0005V4-Iq
	for lists+qemu-devel@lfdr.de; Thu, 28 Nov 2019 11:41:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37095)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1iaMLa-0003Dd-QC
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 11:08:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1iaMLX-0007Um-4a
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 11:08:49 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:12888)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1iaMLU-0007NX-NF
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 11:08:45 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xASG7On5067534
 for <qemu-devel@nongnu.org>; Thu, 28 Nov 2019 11:08:37 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wjah6ps7u-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 28 Nov 2019 11:08:37 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Thu, 28 Nov 2019 16:08:34 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 28 Nov 2019 16:08:32 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xASG7pki42205610
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Nov 2019 16:07:51 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4CCF11C04C;
 Thu, 28 Nov 2019 16:08:30 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DBDA11C050;
 Thu, 28 Nov 2019 16:08:30 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.11.73])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 28 Nov 2019 16:08:30 +0000 (GMT)
Subject: Re: [PATCH 13/15] s390x: protvirt: Move diag 308 data over SIDAD
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20191120114334.2287-1-frankja@linux.ibm.com>
 <20191120114334.2287-14-frankja@linux.ibm.com>
 <6ad100b6-db72-4a21-6715-399a6ff69dc0@redhat.com>
From: Janosch Frank <frankja@linux.ibm.com>
Autocrypt: addr=frankja@linux.ibm.com; prefer-encrypt=mutual; keydata=
 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
Date: Thu, 28 Nov 2019 17:08:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <6ad100b6-db72-4a21-6715-399a6ff69dc0@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XWdBr1ZsnfiLU8FEXOGrg8PRgnCJrMolP"
X-TM-AS-GCONF: 00
x-cbid: 19112816-0016-0000-0000-000002CD79B4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112816-0017-0000-0000-0000332F600E
Message-Id: <bd8e5f4b-e09d-5fea-986a-6ac3f4c1b2d4@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-28_04:2019-11-28,2019-11-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911280136
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
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
Cc: pmorel@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, mihajlov@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XWdBr1ZsnfiLU8FEXOGrg8PRgnCJrMolP
Content-Type: multipart/mixed; boundary="TWCNZjLIz3hxNSyMv9Ei2xJJQTc7pKtHQ"

--TWCNZjLIz3hxNSyMv9Ei2xJJQTc7pKtHQ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11/28/19 3:40 PM, Thomas Huth wrote:
> On 20/11/2019 12.43, Janosch Frank wrote:
>> For protected guests the IPIB is written/read to/from the sattelite
>=20
> satellite
>=20
>> block, so we need to make those accesses virtual to make them go
>> through KBM mem ops.
>=20
> What's KBM ?

A totally new hypervisor that's much faster than KVM because b comes
before v in the alphabet.

>=20
>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>> ---
>>  target/s390x/diag.c | 26 +++++++++++++++++++++++---
>>  1 file changed, 23 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/s390x/diag.c b/target/s390x/diag.c
>> index db6d79cef3..d96d8bdc6c 100644
>> --- a/target/s390x/diag.c
>> +++ b/target/s390x/diag.c
>> @@ -88,6 +88,7 @@ static int diag308_parm_check(CPUS390XState *env, ui=
nt64_t r1, uint64_t addr,
>>  void handle_diag_308(CPUS390XState *env, uint64_t r1, uint64_t r3, ui=
ntptr_t ra)
>>  {
>>      CPUState *cs =3D env_cpu(env);
>> +    S390CPU *cpu =3D S390_CPU(cs);
>>      uint64_t addr =3D  env->regs[r1];
>>      uint64_t subcode =3D env->regs[r3];
>>      IplParameterBlock *iplb;
>> @@ -118,14 +119,27 @@ void handle_diag_308(CPUS390XState *env, uint64_=
t r1, uint64_t r3, uintptr_t ra)
>>          if (diag308_parm_check(env, r1, addr, ra, false)) {
>>              return;
>>          }
>> +
>>          iplb =3D g_new0(IplParameterBlock, 1);
>> -        cpu_physical_memory_read(addr, iplb, sizeof(iplb->len));
>> +        if (!env->pv) {
>> +            cpu_physical_memory_read(addr, iplb, sizeof(iplb->len));
>> +        } else {
>> +            s390_cpu_virt_mem_read(cpu, 0, 0, iplb, sizeof(iplb->len)=
);
>> +            s390_cpu_virt_mem_handle_exc(cpu, ra);
>=20
> I'm looking forward to protected virt support in TCG ;-)

Who doesn't?

>=20
>> +        }
>> +
>>          if (!iplb_valid_len(iplb)) {
>>              env->regs[r1 + 1] =3D DIAG_308_RC_INVALID;
>>              goto out;
>>          }
>> =20
>> -        cpu_physical_memory_read(addr, iplb, be32_to_cpu(iplb->len));=

>> +        if (!env->pv) {
>> +            cpu_physical_memory_read(addr, iplb, be32_to_cpu(iplb->le=
n));
>> +        } else {
>> +            s390_cpu_virt_mem_read(cpu, 0, 0, iplb, be32_to_cpu(iplb-=
>len));
>> +            s390_cpu_virt_mem_handle_exc(cpu, ra);
>> +        }
>> +
>> =20
>>          if (!iplb_valid_ccw(iplb) && !iplb_valid_fcp(iplb) &&
>>              !(iplb_valid_se(iplb) && s390_ipl_pv_check_comp(iplb) >=3D=
 0)) {
>> @@ -149,7 +163,13 @@ out:
>>              iplb =3D s390_ipl_get_iplb();
>>          }
>>          if (iplb) {
>> -            cpu_physical_memory_write(addr, iplb, be32_to_cpu(iplb->l=
en));
>> +            if (!env->pv) {
>> +                cpu_physical_memory_write(addr, iplb, be32_to_cpu(ipl=
b->len));
>> +            } else {
>> +                s390_cpu_virt_mem_write(cpu, 0, 0, iplb,
>> +                                        be32_to_cpu(iplb->len));
>> +                s390_cpu_virt_mem_handle_exc(cpu, ra);
>> +            }
>>              env->regs[r1 + 1] =3D DIAG_308_RC_OK;
>>          } else {
>>              env->regs[r1 + 1] =3D DIAG_308_RC_NO_CONF;
>>
>=20
> I wonder whether we maybe want to have some wrapper functions for these=

> reads and writes, something like:

diag308 is currently the only instruction where we would need it.

sclp needs a new handler, because we can skip lots of checks if pv is
enabled.
IO instructions are already using logical addressing

>=20
> void s390_cpu_physical_memory_write(...)
> {
>     if (!env->pv) {
>         cpu_physical_memory_write(...);
>     } else {
>         s390_cpu_virt_mem_write(...);
>     }
> }
>=20
> ?
>=20
>  Thomas
>=20



--TWCNZjLIz3hxNSyMv9Ei2xJJQTc7pKtHQ--

--XWdBr1ZsnfiLU8FEXOGrg8PRgnCJrMolP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEwGNS88vfc9+v45Yq41TmuOI4ufgFAl3f8P0ACgkQ41TmuOI4
ufhSVA/9GM9Z7rqslgDnQVT4dJRNEx98jHJ7LnlU+QoF9H3uuV1HecK1vfEVRYDN
aPfVNqDlNu7/TaHk7Bdby/hCUGm7b3HU+Fem4wiK6qflU54y+YW/gt2GrJJ5jNP9
jg819/LwI39mbZ9hdKFFuq8oy9FOhbTBdy5wqh2IE43PUrGSge/mBRw/J3ksGuyq
9KsIUgUVLi6DTa/tF6ZXQXQrZz+Etb1Z2WEvutp/innNFloH+UKlmulnigoghh/U
vKIQZah3jXIl0U95ykV29Ud03J6O/wnWnKnDkVknPbC0amQq8tN3dpiZ0Th7oJdF
zFUBLBp/dnvChETU2RgpBdnql3Lpe7MCxEWsY4o/RAAYu5/0HcU1BriqpmKsrey+
Sjq6ksUYlnS1WTwuxDlY9NSx8NDiLpHUadU34sxGX2t9nDQ+QsY6dRPbbehhXiAe
EyxVrH6V5N1Bo63giUIcJmNfISnDUXPWxFIE4kbvJ1pVHdrS2taAmegc/jZ33QzX
+KPGqVzGblkB6jJ4r2pEzNhvbRhv/php9uVMTpby1B6KMEKdGExqCAR+qOfY47OA
5J5EOSCJWmzbDzpR8Crhp3CxW9Cx/eNBn6bbwGt5TmX7srMjpGpANARx+20XAnKB
TkPsTd8AX3S5tAagHlTcF8N/fYpgrgyLkfbnDAH3rF/VetX8pFY=
=H2YF
-----END PGP SIGNATURE-----

--XWdBr1ZsnfiLU8FEXOGrg8PRgnCJrMolP--


