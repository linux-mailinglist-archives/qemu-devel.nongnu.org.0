Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 510B810CE15
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Nov 2019 18:49:48 +0100 (CET)
Received: from localhost ([::1]:51484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iaNvG-0006KB-Le
	for lists+qemu-devel@lfdr.de; Thu, 28 Nov 2019 12:49:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41855)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1iaMNe-0004Vb-P2
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 11:10:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1iaMNY-0004R0-Aq
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 11:10:54 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:5142
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1iaMNV-0004N0-KL
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 11:10:51 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xASGAkCB004799
 for <qemu-devel@nongnu.org>; Thu, 28 Nov 2019 11:10:47 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wjf1v5hua-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 28 Nov 2019 11:10:47 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Thu, 28 Nov 2019 16:10:43 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 28 Nov 2019 16:10:41 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xASGAdsk34472112
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Nov 2019 16:10:39 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6790111C054;
 Thu, 28 Nov 2019 16:10:39 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E60F611C050;
 Thu, 28 Nov 2019 16:10:38 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.11.73])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 28 Nov 2019 16:10:38 +0000 (GMT)
Subject: Re: [PATCH 14/15] s390x: protvirt: Disable address checks for PV
 guest IO emulation
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20191120114334.2287-1-frankja@linux.ibm.com>
 <20191120114334.2287-15-frankja@linux.ibm.com>
 <db581b32-2b84-683c-0e7e-b6ee908eb701@redhat.com>
From: Janosch Frank <frankja@linux.ibm.com>
Autocrypt: addr=frankja@linux.ibm.com; prefer-encrypt=mutual; keydata=
 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
Date: Thu, 28 Nov 2019 17:10:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <db581b32-2b84-683c-0e7e-b6ee908eb701@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="T9brDe3ybvRIDTr4sFpReSa5CdEhh34vF"
X-TM-AS-GCONF: 00
x-cbid: 19112816-0020-0000-0000-00000390335E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112816-0021-0000-0000-000021E74236
Message-Id: <be2aece1-8879-d3d3-81ff-7bbbb8052548@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-28_04:2019-11-28,2019-11-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 impostorscore=0 phishscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911280136
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
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
Cc: pmorel@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, mihajlov@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--T9brDe3ybvRIDTr4sFpReSa5CdEhh34vF
Content-Type: multipart/mixed; boundary="nG34m5zyuX4tSXi0IgFqyiCPN7Zw4O2LA"

--nG34m5zyuX4tSXi0IgFqyiCPN7Zw4O2LA
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11/28/19 4:28 PM, Thomas Huth wrote:
> On 20/11/2019 12.43, Janosch Frank wrote:
>> IO instruction data is routed through SIDAD for protected guests, so
>> adresses do not need to be checked, as this is kernel memory.
>>
>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>> ---
>>  target/s390x/ioinst.c | 46 +++++++++++++++++++++++++++---------------=
-
>>  1 file changed, 29 insertions(+), 17 deletions(-)
>>
>> diff --git a/target/s390x/ioinst.c b/target/s390x/ioinst.c
>> index c437a1d8c6..d3bd422ddd 100644
>> --- a/target/s390x/ioinst.c
>> +++ b/target/s390x/ioinst.c
>> @@ -110,11 +110,13 @@ void ioinst_handle_msch(S390CPU *cpu, uint64_t r=
eg1, uint32_t ipb, uintptr_t ra)
>>      int cssid, ssid, schid, m;
>>      SubchDev *sch;
>>      SCHIB schib;
>> -    uint64_t addr;
>> +    uint64_t addr =3D 0;
>>      CPUS390XState *env =3D &cpu->env;
>> -    uint8_t ar;
>> +    uint8_t ar =3D 0;
>> =20
>> -    addr =3D decode_basedisp_s(env, ipb, &ar);
>> +    if (!env->pv) {
>> +        addr =3D decode_basedisp_s(env, ipb, &ar);
>> +    }
>>      if (addr & 3) {
>>          s390_program_interrupt(env, PGM_SPECIFICATION, ra);
>>          return;
>> @@ -167,11 +169,13 @@ void ioinst_handle_ssch(S390CPU *cpu, uint64_t r=
eg1, uint32_t ipb, uintptr_t ra)
>>      int cssid, ssid, schid, m;
>>      SubchDev *sch;
>>      ORB orig_orb, orb;
>> -    uint64_t addr;
>> +    uint64_t addr =3D 0;
>>      CPUS390XState *env =3D &cpu->env;
>> -    uint8_t ar;
>> +    uint8_t ar =3D 0;
>> =20
>> -    addr =3D decode_basedisp_s(env, ipb, &ar);
>> +    if (!env->pv) {
>> +        addr =3D decode_basedisp_s(env, ipb, &ar);
>> +    }
>>      if (addr & 3) {
>>          s390_program_interrupt(env, PGM_SPECIFICATION, ra);
>>          return;
>> @@ -198,12 +202,14 @@ void ioinst_handle_ssch(S390CPU *cpu, uint64_t r=
eg1, uint32_t ipb, uintptr_t ra)
>>  void ioinst_handle_stcrw(S390CPU *cpu, uint32_t ipb, uintptr_t ra)
>>  {
>>      CRW crw;
>> -    uint64_t addr;
>> +    uint64_t addr =3D 0;
>>      int cc;
>>      CPUS390XState *env =3D &cpu->env;
>> -    uint8_t ar;
>> +    uint8_t ar =3D 0;
>> =20
>> -    addr =3D decode_basedisp_s(env, ipb, &ar);
>> +    if (!env->pv) {
>> +        addr =3D decode_basedisp_s(env, ipb, &ar);
>> +    }
>>      if (addr & 3) {
>>          s390_program_interrupt(env, PGM_SPECIFICATION, ra);
>>          return;
>> @@ -228,13 +234,15 @@ void ioinst_handle_stsch(S390CPU *cpu, uint64_t =
reg1, uint32_t ipb,
>>  {
>>      int cssid, ssid, schid, m;
>>      SubchDev *sch;
>> -    uint64_t addr;
>> +    uint64_t addr =3D 0;
>>      int cc;
>>      SCHIB schib;
>>      CPUS390XState *env =3D &cpu->env;
>> -    uint8_t ar;
>> +    uint8_t ar =3D 0;
>> =20
>> -    addr =3D decode_basedisp_s(env, ipb, &ar);
>> +    if (!env->pv) {
>> +        addr =3D decode_basedisp_s(env, ipb, &ar);
>> +    }
>>      if (addr & 3) {
>>          s390_program_interrupt(env, PGM_SPECIFICATION, ra);
>>          return;
>> @@ -294,16 +302,18 @@ int ioinst_handle_tsch(S390CPU *cpu, uint64_t re=
g1, uint32_t ipb, uintptr_t ra)
>>      int cssid, ssid, schid, m;
>>      SubchDev *sch;
>>      IRB irb;
>> -    uint64_t addr;
>> +    uint64_t addr =3D 0;
>>      int cc, irb_len;
>> -    uint8_t ar;
>> +    uint8_t ar =3D 0;
>> =20
>>      if (ioinst_disassemble_sch_ident(reg1, &m, &cssid, &ssid, &schid)=
) {
>>          s390_program_interrupt(env, PGM_OPERAND, ra);
>>          return -EIO;
>>      }
>>      trace_ioinst_sch_id("tsch", cssid, ssid, schid);
>> -    addr =3D decode_basedisp_s(env, ipb, &ar);
>> +    if (!env->pv) {
>> +        addr =3D decode_basedisp_s(env, ipb, &ar);
>> +    }
>>      if (addr & 3) {
>>          s390_program_interrupt(env, PGM_SPECIFICATION, ra);
>>          return -EIO;
>=20
> Would it make sense to hide all these changes in decode_basedisp_s()
> instead? ... so that decode_basedisp_s() returns 0 if env->pv =3D=3D tr=
ue ?
> ... or are there still cases where we need real values from
> decode_basedisp_s() in case of env->pv=3D=3Dtrue?

I'd like to keep decode_basedisp_s() as is, but how about a static
function in ioinst.c called something like get_address_from_regs()?

It'll call decode_basedisp_s() or return 0.


>=20
> Anyway,
> Reviewed-by: Thomas Huth <thuth@redhat.com>
>=20

Thanks!



--nG34m5zyuX4tSXi0IgFqyiCPN7Zw4O2LA--

--T9brDe3ybvRIDTr4sFpReSa5CdEhh34vF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEwGNS88vfc9+v45Yq41TmuOI4ufgFAl3f8X4ACgkQ41TmuOI4
ufijvQ//WMc6N6dN/51SbnDjW4YuzuJEpp1kafXxFEo5yyVS0JIbGhJtJ1YlDyym
FWoNDO8H5WW2fr5+RAXr1B4DdDu2Zh47n+8DAb7Ch7S/NvogNSSMHnhDQY4S6ln4
xbsiCJCOEgsFxeHXlSjR/tzCDPVm7VQpcDZEkbcwcwFntLt/RoduBNFIe4AQ5vVR
ujR+dLKZKh4nHi/A0s8s83/fa5wZRkELnPtuScNp7M1STrz28eCMS3tA/PyqQmgO
B0Pq5cKiB32r+GKS0wt1a60beSJBguwTEd70LQBVBu+ngktNxK2E7KsioOuSoW4n
uaDIFqehPzjFMfgzTP0hzeCvGpQyy+NAG4t1VWW8f+89xOlG9CCVyJFY20E/bnmj
GU+8WNONMePymcO523x3aUDAH+b6Hg1m9EvFizXq2eyHVKm7l8EVxVwgTOlH4pbj
UnRtYjTtMj0kcEpb1qrTr27jo/Wj4zgrVAnFRTbD5JOT1ZbNg2IxowrKsNPJXt0c
L6WWQDY/eTf7xW0py7lavQNhy8KHI45v8tPmZEDN9m9buxcYk5Orc8nZjO+ScPoA
xqhdsNOMy/QVRmOWM862U4cx6cFu34Nm2vX5GWXLh8L519UtwJjnNn9v6rqgvSSq
KLnUKS1r+ohlVlLeDmVzeV7ltjJzIHdlXaPW9JvNL31z+SQIcGw=
=msu8
-----END PGP SIGNATURE-----

--T9brDe3ybvRIDTr4sFpReSa5CdEhh34vF--


