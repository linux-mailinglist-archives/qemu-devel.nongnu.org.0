Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307471076BA
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Nov 2019 18:49:15 +0100 (CET)
Received: from localhost ([::1]:53454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iYD3K-0005Ra-VS
	for lists+qemu-devel@lfdr.de; Fri, 22 Nov 2019 12:49:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58004)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1iYCWq-0000lQ-Pz
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 12:15:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1iYCWp-0007gh-Cp
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 12:15:32 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51242)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1iYCWp-0007fF-3U
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 12:15:31 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAMHF382136002
 for <qemu-devel@nongnu.org>; Fri, 22 Nov 2019 12:15:28 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wdv0w995b-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 22 Nov 2019 12:15:27 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Fri, 22 Nov 2019 17:15:25 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 22 Nov 2019 17:15:23 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAMHFM1U55640150
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Nov 2019 17:15:22 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6123211C058;
 Fri, 22 Nov 2019 17:15:22 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF75C11C050;
 Fri, 22 Nov 2019 17:15:21 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.73.27])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 22 Nov 2019 17:15:21 +0000 (GMT)
Subject: Re: [PATCH v2 4/5] s390x: Move clear reset
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20191122140002.42972-1-frankja@linux.ibm.com>
 <20191122140002.42972-5-frankja@linux.ibm.com>
 <13192666-7c97-f3fd-fa8d-84a037dae286@redhat.com>
From: Janosch Frank <frankja@linux.ibm.com>
Autocrypt: addr=frankja@linux.ibm.com; prefer-encrypt=mutual; keydata=
 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
Date: Fri, 22 Nov 2019 18:15:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <13192666-7c97-f3fd-fa8d-84a037dae286@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="cEXtcFRqD9YvLNcWOLnqh3BXit7n0SwAt"
X-TM-AS-GCONF: 00
x-cbid: 19112217-4275-0000-0000-00000384FD0E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112217-4276-0000-0000-000038987EF7
Message-Id: <34b86085-2de3-52b6-8353-574a258b5056@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-22_03:2019-11-21,2019-11-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 clxscore=1015 impostorscore=0 mlxscore=0 phishscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911220148
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, cohuck@redhat.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, mihajlov@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cEXtcFRqD9YvLNcWOLnqh3BXit7n0SwAt
Content-Type: multipart/mixed; boundary="T3I2FGvtTryO9bzO5DSyD2BpwHWODvnlo"

--T3I2FGvtTryO9bzO5DSyD2BpwHWODvnlo
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11/22/19 3:30 PM, David Hildenbrand wrote:
> On 22.11.19 15:00, Janosch Frank wrote:
>> Let's also move the clear reset function into the reset handler.
>>
>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>> ---
>>  target/s390x/cpu-qom.h |  1 +
>>  target/s390x/cpu.c     | 50 ++++++++---------------------------------=
-
>>  2 files changed, 10 insertions(+), 41 deletions(-)
>>
>> diff --git a/target/s390x/cpu-qom.h b/target/s390x/cpu-qom.h
>> index 6f0a12042e..dbe5346ec9 100644
>> --- a/target/s390x/cpu-qom.h
>> +++ b/target/s390x/cpu-qom.h
>> @@ -37,6 +37,7 @@ typedef struct S390CPUDef S390CPUDef;
>>  typedef enum cpu_reset_type {
>>      S390_CPU_RESET_NORMAL,
>>      S390_CPU_RESET_INITIAL,
>> +    S390_CPU_RESET_CLEAR,
>>  } cpu_reset_type;
>> =20
>>  /**
>> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
>> index 1f423fb676..017181fe4a 100644
>> --- a/target/s390x/cpu.c
>> +++ b/target/s390x/cpu.c
>> @@ -94,6 +94,9 @@ static void s390_cpu_reset(CPUState *s, cpu_reset_ty=
pe type)
>>      s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
>> =20
>>      switch (type) {
>> +    case S390_CPU_RESET_CLEAR:
>> +        memset(env, 0, offsetof(CPUS390XState, start_initial_reset_fi=
elds));
>=20
> I think the preferred term in QEMU is "fall through".
>=20
>> +        /* Fallthrough */
>>      case S390_CPU_RESET_INITIAL:
>>          /* initial reset does not clear everything! */
>>          memset(&env->start_initial_reset_fields, 0,
>> @@ -121,46 +124,6 @@ static void s390_cpu_reset(CPUState *s, cpu_reset=
_type type)
>>      }
>>  }
>> =20
>> -/* CPUClass:reset() */
>> -static void s390_cpu_full_reset(CPUState *s)
>> -{
>> -    S390CPU *cpu =3D S390_CPU(s);
>> -    S390CPUClass *scc =3D S390_CPU_GET_CLASS(cpu);
>> -    CPUS390XState *env =3D &cpu->env;
>> -
>> -    scc->parent_reset(s);
>> -    cpu->env.sigp_order =3D 0;
>> -    s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
>> -
>> -    memset(env, 0, offsetof(CPUS390XState, end_reset_fields));
>> -
>> -    /* architectured initial values for CR 0 and 14 */
>> -    env->cregs[0] =3D CR0_RESET;
>> -    env->cregs[14] =3D CR14_RESET;
>> -
>> -#if defined(CONFIG_USER_ONLY)
>> -    /* user mode should always be allowed to use the full FPU */
>> -    env->cregs[0] |=3D CR0_AFP;
>> -    if (s390_has_feat(S390_FEAT_VECTOR)) {
>> -        env->cregs[0] |=3D CR0_VECTOR;
>> -    }
>> -#endif
>=20
> Huh, what happened to that change?

Btw., wouldn't we need that for both initial and clear reset?

>=20
> Note that we now also do "env->bpbc =3D false" - is that ok?
>=20



--T3I2FGvtTryO9bzO5DSyD2BpwHWODvnlo--

--cEXtcFRqD9YvLNcWOLnqh3BXit7n0SwAt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEwGNS88vfc9+v45Yq41TmuOI4ufgFAl3YF6kACgkQ41TmuOI4
ufhETRAAhurWs+sdr5klmq12nz1poH17BoI68GcoSr0vafy6Es2tPrtnKX9YxUkI
w4Ld08KmSxPlp9oDPQGcnoe8QX+tmfmfZfKIKCQY07iE7ftJR71PQuAwFtePqFqV
PnvjgemxhtvusQ8yTTZH24mxqDc/SEsX4TRQ9EwuO8lgI15pmXe+qimF4Tx24hMm
4n3CuPtDGGeoqd7/9ErHnkf7dui4ZxT5KeNZ1yQdsYVGooRvH5Gt7PoHErh+2+je
+TPA22bkuC69Vvr3gF7AIPpfxxoxvwB6ZoOYlepRsGsSWvJv2dCTprjZPHnnf94m
HvL46ffSjN8m6o0VYekW5k7o9LAeVflCOfgi/MY+XQd6JVMMEAznNpEW2tKngfOv
ZjhXQErWhGFp8KQ3ks+zhhJazZYtGfVqt/DVNEN/5wbhYaChFawddKxxzP7l0Lwf
QkuddpYb45UmrYygK7zGqmfuFCg6SWTYRDVn/mB8knpWQ8zyGlLm66luygcQMNiY
yMw308zY4tNZtoZrI4pv6eMzlq0XZHm7wscFiH7mevZjytw14iRiRSx27axPiR8p
FbGx/xqwareL7GJktxs+skP4qvzCpnuTWIMaF9HvUXFFjMDPq99X0adkFRlWCSv5
ekSj9uly3rCAYsp75/yj8uY0O1L36zqo2b1o7OYO3r+bOtZL0cg=
=n1DE
-----END PGP SIGNATURE-----

--cEXtcFRqD9YvLNcWOLnqh3BXit7n0SwAt--


