Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB80105457
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 15:27:25 +0100 (CET)
Received: from localhost ([::1]:41242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXnQa-0001kH-0o
	for lists+qemu-devel@lfdr.de; Thu, 21 Nov 2019 09:27:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39422)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1iXnNe-0007iZ-Rc
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 09:24:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1iXnNd-0004S6-Ke
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 09:24:22 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:6876)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1iXnNd-0004Ru-Bi
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 09:24:21 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xALEMGbg081217
 for <qemu-devel@nongnu.org>; Thu, 21 Nov 2019 09:24:20 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wd5s202tp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 21 Nov 2019 09:24:20 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Thu, 21 Nov 2019 14:24:17 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 21 Nov 2019 14:24:14 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xALEOD9h5439938
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Nov 2019 14:24:13 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65181AE055;
 Thu, 21 Nov 2019 14:24:13 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE9DEAE045;
 Thu, 21 Nov 2019 14:24:12 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.70.129])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 21 Nov 2019 14:24:12 +0000 (GMT)
Subject: Re: [PATCH 09/15] s390x: protvirt: SCLP interpretation
To: Cornelia Huck <cohuck@redhat.com>
References: <20191120114334.2287-1-frankja@linux.ibm.com>
 <20191120114334.2287-10-frankja@linux.ibm.com>
 <20191121151118.4caa8523.cohuck@redhat.com>
From: Janosch Frank <frankja@linux.ibm.com>
Autocrypt: addr=frankja@linux.ibm.com; prefer-encrypt=mutual; keydata=
 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
Date: Thu, 21 Nov 2019 15:24:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191121151118.4caa8523.cohuck@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="BjMmfdvJN9MGZbEXHqri4inDm9VjZTDSf"
X-TM-AS-GCONF: 00
x-cbid: 19112114-0012-0000-0000-0000036A58FE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112114-0013-0000-0000-000021A5ED83
Message-Id: <509daeba-7c4f-0514-6122-fadbe65776a1@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-21_03:2019-11-21,2019-11-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=848
 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911210131
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, david@redhat.com,
 qemu-devel@nongnu.org, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 mihajlov@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BjMmfdvJN9MGZbEXHqri4inDm9VjZTDSf
Content-Type: multipart/mixed; boundary="lhcrAMKWzzP27OvdpCeuewpBup7iHayEI"

--lhcrAMKWzzP27OvdpCeuewpBup7iHayEI
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11/21/19 3:11 PM, Cornelia Huck wrote:
> On Wed, 20 Nov 2019 06:43:28 -0500
> Janosch Frank <frankja@linux.ibm.com> wrote:
>=20
>> SCLP for a protected guest is done over the SIDAD, so we need to use
>> the s390_cpu_virt_mem_* functions to access the SIDAD instead of guest=

>> memory when reading/writing SCBs.
>>
>> To not confuse the sclp emulation, we set 0x42000 as the address, but
>> ignore it for reading/writing the SCCB.
>>
>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>> ---
>>  hw/s390x/sclp.c         | 16 ++++++++++++++++
>>  include/hw/s390x/sclp.h |  2 ++
>>  target/s390x/kvm.c      |  8 +++++++-
>>  3 files changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
>> index f57ce7b739..00d08adc7f 100644
>> --- a/hw/s390x/sclp.c
>> +++ b/hw/s390x/sclp.c
>> @@ -193,6 +193,22 @@ static void sclp_execute(SCLPDevice *sclp, SCCB *=
sccb, uint32_t code)
>>      }
>>  }
>> =20
>> +int sclp_service_call_protected(CPUS390XState *env, uint64_t sccb,
>> +                                uint32_t code)
>> +{
>> +    SCLPDevice *sclp =3D get_sclp_device();
>> +    SCLPDeviceClass *sclp_c =3D SCLP_GET_CLASS(sclp);
>> +    SCCB work_sccb;
>> +    hwaddr sccb_len =3D sizeof(SCCB);
>> +
>> +    s390_cpu_virt_mem_read(env_archcpu(env), 0, 0, &work_sccb, sccb_l=
en);
>> +    sclp_c->execute(sclp, &work_sccb, code);
>> +    s390_cpu_virt_mem_write(env_archcpu(env), 0, 0, &work_sccb,
>> +                            be16_to_cpu(work_sccb.h.length));
>> +    sclp_c->service_interrupt(sclp, sccb);
>> +    return 0;
>> +}
>> +
>>  int sclp_service_call(CPUS390XState *env, uint64_t sccb, uint32_t cod=
e)
>>  {
>>      SCLPDevice *sclp =3D get_sclp_device();
>> diff --git a/include/hw/s390x/sclp.h b/include/hw/s390x/sclp.h
>> index c54413b78c..c0a3faa37d 100644
>> --- a/include/hw/s390x/sclp.h
>> +++ b/include/hw/s390x/sclp.h
>> @@ -217,5 +217,7 @@ void s390_sclp_init(void);
>>  void sclp_service_interrupt(uint32_t sccb);
>>  void raise_irq_cpu_hotplug(void);
>>  int sclp_service_call(CPUS390XState *env, uint64_t sccb, uint32_t cod=
e);
>> +int sclp_service_call_protected(CPUS390XState *env, uint64_t sccb,
>> +                                uint32_t code);
>> =20
>>  #endif
>> diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
>> index 58251c0229..0f2458b553 100644
>> --- a/target/s390x/kvm.c
>> +++ b/target/s390x/kvm.c
>> @@ -1172,7 +1172,13 @@ static int kvm_sclp_service_call(S390CPU *cpu, =
struct kvm_run *run,
>>      sccb =3D env->regs[ipbh0 & 0xf];
>>      code =3D env->regs[(ipbh0 & 0xf0) >> 4];
>> =20
>> -    r =3D sclp_service_call(env, sccb, code);
>> +    if (run->s390_sieic.icptcode =3D=3D ICPT_PV_INSTR ||
>> +        run->s390_sieic.icptcode =3D=3D ICPT_PV_INSTR_NOT) {
>> +        r =3D sclp_service_call_protected(env, 0x42000, code);
>=20
> I fear that confuses the reader instead of the emulation :)
>=20
> Especially as you end up passing that value to
> sclp_c->service_interrupt()...

Pierre has some more opinions on that, so I'll let him present his
planned changes to this patch :)

>=20
>> +    } else {
>> +        r =3D sclp_service_call(env, sccb, code);
>> +    }
>> +
>>      if (r < 0) {
>>          kvm_s390_program_interrupt(cpu, -r);
>>      } else {
>=20



--lhcrAMKWzzP27OvdpCeuewpBup7iHayEI--

--BjMmfdvJN9MGZbEXHqri4inDm9VjZTDSf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEwGNS88vfc9+v45Yq41TmuOI4ufgFAl3WngwACgkQ41TmuOI4
ufgGUQ//Ywq8H82Ff0nnL0VhbVZu7gw+LoTbMwRd551ohcWZP3UyCS/wx/mqEKoI
f0xi3VwrYbufd8zzduDQfYPcARrwGS1Xg/lCOTHIEgOkefzyjfhR6gMz43Uz+9jO
c6R3/7LNA3ApR6DcEcJuuat/ZYXeA3XOlu80W8E8vBgf4ihQxkhOS5iohdL4tc3H
+kSRh3XxEvvszJ8ReK5Qe6lXlvKLjhJBKAny1joy8oxTOdeCDl1x6+JWkusU69Cx
cxaF9EgwbCYHcgxk+HFtQM18Uw5hgWxqnKMyiGz39HvySwafPcW1i1TRccImlDZ9
fNzwzOyypQT6by9CP52bsGEj+zVxRA259NHwUy0RjCIrGcPMhVaclStQYUD5Mka3
hHqTvTwjgl8+lmyNxEfH3zmukanH4mJJYLga/v63lFYOdO4ZVE8dm/6HaQ0ton6A
fYAsJ06uVGo/eMp+b3gLbwVHg7pFukjeGViQYjRQ4dhN9qqA7MP5j/wwyZdVwsnF
rpQT/alJSlMsYBPifvbzPHu5A7YV8TM221qas6YWxYWgwX5JjHPJSQ8WUdjtWt/3
n1Ptlxl2IfNqotLZZX77WaFkVy2OXpq7SjoeBtew8p4Ikx32cTqn0YensnMF+tZt
4DRrg4RQdlmUNG9/XKGYH1vIkoNfhj7cio2S+llcSkevDXp7YyU=
=BufN
-----END PGP SIGNATURE-----

--BjMmfdvJN9MGZbEXHqri4inDm9VjZTDSf--


