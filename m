Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9F2189C08
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Mar 2020 13:35:40 +0100 (CET)
Received: from localhost ([::1]:50156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEXv9-0000dK-66
	for lists+qemu-devel@lfdr.de; Wed, 18 Mar 2020 08:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44040)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1jEXu8-0008V4-Jg
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 08:34:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1jEXu7-0000dR-AC
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 08:34:36 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:23068)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1jEXu7-0000cz-2W
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 08:34:35 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02ICWf7A166701
 for <qemu-devel@nongnu.org>; Wed, 18 Mar 2020 08:34:34 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu8ad600n-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 18 Mar 2020 08:34:31 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Wed, 18 Mar 2020 12:34:16 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 18 Mar 2020 12:34:15 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02ICYEnG58130564
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Mar 2020 12:34:14 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A815BA4068;
 Wed, 18 Mar 2020 12:34:14 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54F34A4060;
 Wed, 18 Mar 2020 12:34:14 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.78.199])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 18 Mar 2020 12:34:14 +0000 (GMT)
Subject: Re: [PATCH v9 14/15] docs: Add protvirt docs
To: Cornelia Huck <cohuck@redhat.com>
References: <20200311132151.172389-1-frankja@linux.ibm.com>
 <20200311132151.172389-15-frankja@linux.ibm.com>
 <20200318122546.4285aec0.cohuck@redhat.com>
From: Janosch Frank <frankja@linux.ibm.com>
Autocrypt: addr=frankja@linux.ibm.com; prefer-encrypt=mutual; keydata=
 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
Date: Wed, 18 Mar 2020 13:34:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200318122546.4285aec0.cohuck@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="W7VuIvXy0q2j3rtMsMffTMabVta6MlS4E"
X-TM-AS-GCONF: 00
x-cbid: 20031812-0016-0000-0000-000002F32FDC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031812-0017-0000-0000-00003356B4C6
Message-Id: <3de42810-965e-ad83-eed5-8407e7352a79@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_05:2020-03-18,
 2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003180059
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--W7VuIvXy0q2j3rtMsMffTMabVta6MlS4E
Content-Type: multipart/mixed; boundary="QjByX9Jje6E7q8n207Z2ru2aG4HLelM3D"

--QjByX9Jje6E7q8n207Z2ru2aG4HLelM3D
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 3/18/20 12:25 PM, Cornelia Huck wrote:
> On Wed, 11 Mar 2020 09:21:50 -0400
> Janosch Frank <frankja@linux.ibm.com> wrote:
>=20
>> Lets add some documentation for the Protected VM functionality.
>=20
> s/Lets/Let's/ :)
>=20
>>
>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>> ---
>>  docs/system/index.rst    |  1 +
>>  docs/system/protvirt.rst | 56 +++++++++++++++++++++++++++++++++++++++=
+
>>  2 files changed, 57 insertions(+)
>>  create mode 100644 docs/system/protvirt.rst
>>
> (...)
>> diff --git a/docs/system/protvirt.rst b/docs/system/protvirt.rst
>> new file mode 100644
>> index 0000000000000000..6c8cf0f7910eae86
>> --- /dev/null
>> +++ b/docs/system/protvirt.rst
>> @@ -0,0 +1,56 @@
>> +Protected Virtualization on s390x
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +The memory and most of the registers of Protected Virtual Machines
>> +(PVMs) are encrypted or inaccessible to the hypervisor, effectively
>> +prohibiting VM introspection when the VM is running. At rest, PVMs ar=
e
>> +encrypted and can only be decrypted by the firmware, represented by a=
n
>> +entity called Ultravisor, of specific IBM Z machines.
>=20
> Is that specific _generations_ or specific _machines_ (i.e. those with
> an appropriate key)? If the latter, maybe add a note that a specific
> image is bound to (a) specific machine(s)?
>=20
>=20
>> +
>> +
>> +Prerequisites
>> +-------------
>=20
> Also, maybe add
>=20
> "Running PVMs requires using the KVM hypervisor."
>=20
> ?
>=20
>> +
>> +To run PVMs a machine with the Protected Virtualization feature
>> +which is indicated by the Ultravisor Call facility (stfle bit
>=20
> maybe s/which is/as/ ?
>=20
>> +158) is required. The Ultravisor needs to be initialized at boot by
>> +setting `prot_virt=3D1` on the kernel command line.
>> +
>> +If those requirements are met, the capability `KVM_CAP_S390_PROTECTED=
`
>> +will indicate that KVM can support PVMs on that LPAR.
>> +
>> +
>> +QEMU Settings
>> +-------------
>> +
>> +To indicate to the VM that it can transition into protected mode, the=

>> +`Unpack facility` (stfle bit 161 represented by the feature
>> +`S390_FEAT_UNPACK`) needs to be part of the cpu model of the VM.
>> +
>> +All I/O devices need to use the IOMMU.
>> +Passthrough (vfio) devices are currently not supported.
>> +
>> +Host huge page backings are not supported. However guests can use hug=
e
>> +pages as indicated by its facilities.
>> +
>> +
>> +Boot Process
>> +------------
>> +
>> +A secure guest image can either be loaded from disk or supplied on th=
e
>> +QEMU command line. Booting from disk is done by the unmodified
>> +s390-ccw BIOS. I.e., the bootmap is interpreted, multiple components
>> +are read into memory and control is transferred to one of the
>> +components (zipl stage3). Stag3 does some fixups and then transfers
>=20
> s/Stag3/Stage3/
>=20
>> +control to some program residing in guest memory, which is normally
>> +the OS kernel. The secure image has another component prepended
>> +(stage3a) that uses the new diag308 subcodes 8 and 10 to trigger the
>> +transition into secure mode.
>> +
>> +Booting from the image supplied via the QEMU command line requires
>> +that the file passed via -kernel has the same memory layout as would
>> +result from the disk boot. This memory layout includes the encrypted
>> +components (kernel, initrd, cmdline), the stage3a loader and
>> +metadata. In case this boot method is used, the command line
>> +options -initrd and -cmdline are ineffective. The preparation of a PV=
M
>> +image is done by genprotimg of the s390-tools package.
>=20
> "is done via the `genprotimg` tool from the s390-tools collection"
>=20
> ?

Too many cooks :)
Ack to all



--QjByX9Jje6E7q8n207Z2ru2aG4HLelM3D--

--W7VuIvXy0q2j3rtMsMffTMabVta6MlS4E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEwGNS88vfc9+v45Yq41TmuOI4ufgFAl5yFUUACgkQ41TmuOI4
ufiQxRAAj/tmSJGqLuF94uPiUO+x94goWJTb87Bd8Ir+p+AuoC9D0vr0PqY+oM2k
V6VGgDhxDiXckO8gm+SE4zYteqJaZS3BG/GkHAK9JjMkP2NMqlcH1NyeX5rz7JwG
W2fOmjzo5/8HkCG65aQJg5snw6ezlsGjV4jI0KIVczoqy9RuxMWVtVJmxb38+hKH
ujgkkOqnRn1udRWvFljAbKzVcaPjOzHtOyBHOtAuK7SFO1i6wuUrpU0jLyFUboKQ
d2B4T5QItbfP/4LLSW1nMZ5huI/7MnsA5nNyYrX0T5j1qEaOw9QHYum7dP71W811
D0hg9S6QqUEzFP8UwkNJOi/UCyI6UmkRj4eOREgwsbdOyXpfiuUkYc6S+r4xG6EP
FNnSAd+6SRo/sRlzLulA1fMCMetcuTC+J/1GkhLJjV6YrjTBhvfi6C4t054K/SmD
VkSNR7XHxLTAKSP4Wcyd3Hf+FtuciDx2SckxZOxFvEKe7XDIKnf1IhhBVcOALWR7
RRDI9qXEsltLzdix0LWT210gCixSbhl39CAOkHTWvtjeyGhH+l632jqY6qlJ0QrU
mkMNIPzj1FOLnykFDr8lvGGaeVIPs2/9Pk6VpUc4WwJxuaRHI9Y/E9fu+0UWtk8g
2HuqJ4jNnn1tJaJwB0U+NBfqoCkg57kDmP6tRm1RiIZH0xV4SNs=
=pohI
-----END PGP SIGNATURE-----

--W7VuIvXy0q2j3rtMsMffTMabVta6MlS4E--


