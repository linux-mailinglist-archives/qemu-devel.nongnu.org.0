Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7454817020B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 16:13:40 +0100 (CET)
Received: from localhost ([::1]:45600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6yNX-0005ko-I2
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 10:13:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41794)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1j6yMf-0005J6-29
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 10:12:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1j6yMd-0000ct-WC
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 10:12:45 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:17570)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1j6yMd-0000WB-OJ
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 10:12:43 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01QFCQ7s009363
 for <qemu-devel@nongnu.org>; Wed, 26 Feb 2020 10:12:42 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydq6h1n6n-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 26 Feb 2020 10:12:37 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Wed, 26 Feb 2020 15:11:44 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 26 Feb 2020 15:11:42 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 01QFAi4P20381998
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Feb 2020 15:10:44 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6211AE05F;
 Wed, 26 Feb 2020 15:11:40 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98190AE04D;
 Wed, 26 Feb 2020 15:11:40 +0000 (GMT)
Received: from dyn-9-152-224-212.boeblingen.de.ibm.com (unknown
 [9.152.224.212])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 26 Feb 2020 15:11:40 +0000 (GMT)
Subject: Re: [PATCH v5 06/18] s390x: protvirt: Handle diag 308 subcodes 0,1,3,4
To: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org
References: <20200226122038.61481-1-frankja@linux.ibm.com>
 <20200226122038.61481-7-frankja@linux.ibm.com>
 <7cf0c871-0107-23a9-0420-44ef5d5af015@de.ibm.com>
From: Janosch Frank <frankja@linux.ibm.com>
Autocrypt: addr=frankja@linux.ibm.com; prefer-encrypt=mutual; keydata=
 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
Date: Wed, 26 Feb 2020 16:11:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <7cf0c871-0107-23a9-0420-44ef5d5af015@de.ibm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9AJW2DjlbrDsb4P2JyIlXCFyzg3Xu6C8v"
X-TM-AS-GCONF: 00
x-cbid: 20022615-0028-0000-0000-000003DE351D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022615-0029-0000-0000-000024A3514E
Message-Id: <a534092c-84b3-13e1-3e64-24ffa937f900@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-26_05:2020-02-26,
 2020-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 spamscore=0 impostorscore=0 suspectscore=3 bulkscore=0 mlxlogscore=977
 clxscore=1015 priorityscore=1501 malwarescore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002260109
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
Cc: qemu-s390x@nongnu.org, cohuck@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9AJW2DjlbrDsb4P2JyIlXCFyzg3Xu6C8v
Content-Type: multipart/mixed; boundary="joBpDyUMzykwrEYxJMW6dCb8JG6dkID70"

--joBpDyUMzykwrEYxJMW6dCb8JG6dkID70
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2/26/20 4:00 PM, Christian Borntraeger wrote:
>=20
>=20
> On 26.02.20 13:20, Janosch Frank wrote:
>> As we now have access to the protection state of the cpus, we can
>> implement special handling of diag 308 subcodes for cpus in the
>> protected state.
>>
>> For subcodes 0 and 1 we need to unshare all pages before continuing,
>> so the guest doesn't accidentally expose data when dumping.
>>
>> For subcode 3/4 we tear down the protected VM and reboot into
>> unprotected mode. We do not provide a secure reboot.
>>
>> Before we can do the unshare calls, we need to mark all cpus as
>> stopped.
>>
>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>> ---
>>  hw/s390x/s390-virtio-ccw.c | 37 ++++++++++++++++++++++++++++++++++---=

>>  target/s390x/diag.c        |  4 ++++
>>  2 files changed, 38 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>> index 79f472c309..9983165b05 100644
>> --- a/hw/s390x/s390-virtio-ccw.c
>> +++ b/hw/s390x/s390-virtio-ccw.c
>> @@ -335,6 +335,7 @@ static void s390_machine_unprotect(S390CcwMachineS=
tate *ms)
>>          }
>>          ms->pv =3D false;
>>      }
>> +    migrate_del_blocker(pv_mig_blocker);
>>  }
>> =20
>=20
> and that part into patch 5?
>=20
>=20

Already fixed in the branch :-)


--joBpDyUMzykwrEYxJMW6dCb8JG6dkID70--

--9AJW2DjlbrDsb4P2JyIlXCFyzg3Xu6C8v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEwGNS88vfc9+v45Yq41TmuOI4ufgFAl5WiqwACgkQ41TmuOI4
ufgZDhAArpyRU63NCZ5fFJw+zG0X0SfodzvDLk/Dxzi5oa+MhTcsP+wBOKpTJAZn
lm8C0NZINyHqt36HZlyPxwBmdpPc9fV9AC8SI0/V9uvO6GI4Y/PUd3X7r5p7jIby
tx2HSHNGrdN73JmygqOKHmQ704l2De/GgmzEA7eudMShUrs5upB4EGPKsTy661ey
HY72wp12CWekSbrTY+fqXL3yGL5jNIWdzwZgigQJzeMJVqXIA0mtvvAqcOBWb7OI
9BcYidERQILfxiLv6+iqxj3oHqLAQEbeLuN5MBeAoZ8ZrPpeXUZQiMCEGgr6VwVZ
jo6Fa0QnYeKcjOvIFEPFhsc8oOG8KBDSx3+bASnoCziPZsXSkPibjGYHoTqbjFbc
Lv/QLo07rInImbMsC/OTieFLy5LLXVdzPvvvtd3W9hzVizZPYtL73YZLjghqQpay
S1xfbJrdXaV8pXqryZKefTUP4hxH/HufMzvc2ld3rrLWD5Qx32nRW7fsFVG/LBnW
ODoxU5e/EJggBWL9vd8+lrBw3KbhNIP0KX6at/PSw/HAyX/x5P+VL1SVXIXCOr3j
7+Y1QuCdmYElAeAPqFZMFHiMrXaZqlRfwLAP1OtTbJWvK4C9MvYot89UhtNGwbFB
s2i1tgwKAL0XlYhLZHkTObuWvhMEyYatXPqjmwzPo1pSfgDOtxo=
=I37b
-----END PGP SIGNATURE-----

--9AJW2DjlbrDsb4P2JyIlXCFyzg3Xu6C8v--


