Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CDB1D781F
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 14:08:47 +0200 (CEST)
Received: from localhost ([::1]:59632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jaeZa-00057x-1L
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 08:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1jaeYR-0004gE-1x; Mon, 18 May 2020 08:07:35 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51096
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1jaeYP-00042J-SI; Mon, 18 May 2020 08:07:34 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04IC4sAn163758; Mon, 18 May 2020 08:07:31 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 313pm85ttm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 08:07:31 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04IC7UIc169111;
 Mon, 18 May 2020 08:07:30 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 313pm85suj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 08:07:22 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04IBu0XP001298;
 Mon, 18 May 2020 12:02:46 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3127t5m2d7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 12:02:46 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04IC2ilc58916926
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 May 2020 12:02:44 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E99D2A405F;
 Mon, 18 May 2020 12:02:43 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91387A405B;
 Mon, 18 May 2020 12:02:43 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.44.214])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 18 May 2020 12:02:43 +0000 (GMT)
Subject: Re: [PATCH v2 1/9] pc-bios: s390x: cio.c cleanup and compile fix
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20200514123729.156283-1-frankja@linux.ibm.com>
 <20200514123729.156283-2-frankja@linux.ibm.com>
 <48adae20-487d-adb1-de0c-9470e3f6292d@redhat.com>
From: Janosch Frank <frankja@linux.ibm.com>
Autocrypt: addr=frankja@linux.ibm.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <1d32cfb2-7898-0a65-3c9d-fa16f7806a7a@linux.ibm.com>
Date: Mon, 18 May 2020 14:02:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <48adae20-487d-adb1-de0c-9470e3f6292d@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="v0RPaYkaGDg61JEatXpIz85RiCCvSl54d"
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-18_05:2020-05-15,
 2020-05-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 priorityscore=1501 cotscore=-2147483648 clxscore=1015 mlxlogscore=999
 phishscore=0 suspectscore=0 mlxscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005180105
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 08:07:32
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--v0RPaYkaGDg61JEatXpIz85RiCCvSl54d
Content-Type: multipart/mixed; boundary="bZfZHPyYrJuSEwNGXZgYNAPllGgrk28tx"

--bZfZHPyYrJuSEwNGXZgYNAPllGgrk28tx
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 5/18/20 1:52 PM, David Hildenbrand wrote:
> On 14.05.20 14:37, Janosch Frank wrote:
>> Let's initialize the structs at the beginning to ease reading and also=

>> zeroing all other fields. This also makes the compiler stop
>> compalining about sense_id_ccw.flags being ored into when it's not
>=20
> s/compalining/complaining/
>=20
>> initialized.
>>
>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>> Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>  pc-bios/s390-ccw/cio.c | 36 ++++++++++++++++++------------------
>>  1 file changed, 18 insertions(+), 18 deletions(-)
>>
>> diff --git a/pc-bios/s390-ccw/cio.c b/pc-bios/s390-ccw/cio.c
>> index 339ec5fbe7..63301ebb58 100644
>> --- a/pc-bios/s390-ccw/cio.c
>> +++ b/pc-bios/s390-ccw/cio.c
>> @@ -49,13 +49,13 @@ void enable_subchannel(SubChannelId schid)
>> =20
>>  uint16_t cu_type(SubChannelId schid)
>>  {
>> -    Ccw1 sense_id_ccw;
>>      SenseId sense_data;
>> -
>> -    sense_id_ccw.cmd_code =3D CCW_CMD_SENSE_ID;
>> -    sense_id_ccw.cda =3D ptr2u32(&sense_data);
>> -    sense_id_ccw.count =3D sizeof(sense_data);
>> -    sense_id_ccw.flags |=3D CCW_FLAG_SLI;
>> +    Ccw1 sense_id_ccw =3D {
>> +        .cmd_code =3D CCW_CMD_SENSE_ID,
>> +        .count =3D sizeof(sense_data),
>> +        .flags =3D CCW_FLAG_SLI,
>> +        .cda =3D ptr2u32(&sense_data),
>> +    };
>> =20
>>      if (do_cio(schid, CU_TYPE_UNKNOWN, ptr2u32(&sense_id_ccw), CCW_FM=
T1)) {
>>          panic("Failed to run SenseID CCw\n");
>> @@ -67,13 +67,13 @@ uint16_t cu_type(SubChannelId schid)
>>  int basic_sense(SubChannelId schid, uint16_t cutype, void *sense_data=
,
>>                   uint16_t data_size)
>>  {
>> -    Ccw1 senseCcw;
>> +    Ccw1 senseCcw =3D {
>> +        .cmd_code =3D CCW_CMD_BASIC_SENSE,
>> +        .count =3D data_size,
>> +        .cda =3D ptr2u32(sense_data),
>> +    };
>>      Irb irb;
>> =20
>> -    senseCcw.cmd_code =3D CCW_CMD_BASIC_SENSE;
>> -    senseCcw.cda =3D ptr2u32(sense_data);
>> -    senseCcw.count =3D data_size;
>> -
>>      return __do_cio(schid, ptr2u32(&senseCcw), CCW_FMT1, &irb);
>>  }
>> =20
>> @@ -314,7 +314,13 @@ static void print_irb_err(Irb *irb)
>>   */
>>  static int __do_cio(SubChannelId schid, uint32_t ccw_addr, int fmt, I=
rb *irb)
>>  {
>> -    CmdOrb orb =3D {};
>> +    CmdOrb orb =3D {
>> +        .fmt =3D fmt,
>> +        .pfch =3D 1,	/* QEMU's cio implementation requires prefetch *=
/
>> +        .c64 =3D 1,	/* QEMU's cio implementation requires 64-bit idaw=
s */
>=20
> Maybe just document this on top (all comments combined)
>=20
> /*
>  * QEMU's CIO implementation requires prefetch and 64-bit idaws. We
>  * allow all paths.
>  */
>=20
> Or get rid of the tabs ;)
>=20
> Reviewed-by: David Hildenbrand <david@redhat.com>

Will do, thanks!



--bZfZHPyYrJuSEwNGXZgYNAPllGgrk28tx--

--v0RPaYkaGDg61JEatXpIz85RiCCvSl54d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEwGNS88vfc9+v45Yq41TmuOI4ufgFAl7CeWIACgkQ41TmuOI4
ufgluBAAhmGekuXl1UB96nYDNG8MOvv2omWbQQ0A/Hw5Ujsxv2ioiJ+C0a21pCAp
td8++5TgACqlX7MXzY+RM5IVDCk9y45EkYpMbmfOn5OQYaRFhXfrc0XZD4+eW16b
9gRxAwRhlXRL2qwbs/1OvVATFZrCjhVNfjSoj9193dCuq5KvwXSOGyiO/rvEhVDU
tr7kpKTvZl29EHzC++UQ/iQJngewvUioVOKkSbMazVoA0AJn0go6Ihnr5N5RyONW
CL4xFaFQGkDuHeAma2XUjYCZBbmWIIoBIZmNkvtoTrbQbmg1T6SmTdA4tagAiJiS
lfIf8Eh6dAHCnuXMYXgJx83rgOvVvGYXlIoMfreVavGNahcoFi4T3c9c49QOvL3O
CDpw6M3owgZ0iKjSF5naTtRr0H8McCGd4VXObXPjPhMvuSr5HU5kLN1sR45VoEua
vcKLsn7WAHQ0QjuRXis0VOjnBbzLAyv96aJbvnDmCM6eDw5F8vV4gQvNI1uiDJ9j
MVa246RpsKmSnSeE8BV0fLuj99AB5hGZTlv7ETrRDHhHwY145Yp2WFWhM+YcU2/w
A0pE8dJsusYzW1rDI8lfRpQWiQx2vIYydA4A5djTDnQq+RYLQSGWaOOVf3wEyljm
sL8HD+gHZfySHnvx3iHGIpZjnIuijHI6T2ZXeSzx+bE0vjaOWbQ=
=aQlH
-----END PGP SIGNATURE-----

--v0RPaYkaGDg61JEatXpIz85RiCCvSl54d--


