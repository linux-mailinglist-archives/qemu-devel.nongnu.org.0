Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F8C10D724
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Nov 2019 15:39:00 +0100 (CET)
Received: from localhost ([::1]:59778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iahQB-0002kS-97
	for lists+qemu-devel@lfdr.de; Fri, 29 Nov 2019 09:38:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38126)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1iagrL-0002Vs-Ce
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 09:03:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1iagrF-0004pO-6F
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 09:02:56 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:61582
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1iagrE-0004hs-0D
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 09:02:52 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xATE2QZV038438
 for <qemu-devel@nongnu.org>; Fri, 29 Nov 2019 09:02:50 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wk3c5at9f-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 29 Nov 2019 09:02:49 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Fri, 29 Nov 2019 14:02:47 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 29 Nov 2019 14:02:44 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xATE2hY134799928
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Nov 2019 14:02:43 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14FEFA4065;
 Fri, 29 Nov 2019 14:02:43 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 864F3A405B;
 Fri, 29 Nov 2019 14:02:42 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.188.128])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 29 Nov 2019 14:02:42 +0000 (GMT)
Subject: Re: [PATCH 00/15] s390x: Protected Virtualization support
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20191120114334.2287-1-frankja@linux.ibm.com>
 <20191129110820.GF2260471@redhat.com>
 <699bb3bc-f42a-2fcf-acb3-b91d783e7ce4@linux.ibm.com>
 <20191129123524.GI2260471@redhat.com>
From: Janosch Frank <frankja@linux.ibm.com>
Autocrypt: addr=frankja@linux.ibm.com; prefer-encrypt=mutual; keydata=
 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
Date: Fri, 29 Nov 2019 15:02:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191129123524.GI2260471@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="c2hc6hc1CCpwZrxb7RZkKNYNxLh4swlpv"
X-TM-AS-GCONF: 00
x-cbid: 19112914-0008-0000-0000-00000339EDA1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112914-0009-0000-0000-00004A58FDDB
Message-Id: <c2c4b71b-d42e-3487-01d8-ae4f5751748b@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-29_04:2019-11-29,2019-11-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911290123
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
Cc: thuth@redhat.com, Boris Fiuczynski <fiuczy@linux.ibm.com>,
 pmorel@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 mihajlov@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--c2hc6hc1CCpwZrxb7RZkKNYNxLh4swlpv
Content-Type: multipart/mixed; boundary="RHLkc79b2v7Mh1FUXeT2v9bspTAklrhKE"

--RHLkc79b2v7Mh1FUXeT2v9bspTAklrhKE
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11/29/19 1:35 PM, Daniel P. Berrang=C3=A9 wrote:
> On Fri, Nov 29, 2019 at 01:14:27PM +0100, Janosch Frank wrote:
>> On 11/29/19 12:08 PM, Daniel P. Berrang=C3=A9 wrote:
>>> On Wed, Nov 20, 2019 at 06:43:19AM -0500, Janosch Frank wrote:
>>>> Most of the QEMU changes for PV are related to the new IPL type with=

>>>> subcodes 8 - 10 and the execution of the necessary Ultravisor calls =
to
>>>> IPL secure guests. Note that we can only boot into secure mode from
>>>> normal mode, i.e. stfle 161 is not active in secure mode.
>>>>
>>>> The other changes related to data gathering for emulation and
>>>> disabling addressing checks in secure mode, as well as CPU resets.
>>>>
>>>> While working on this I sprinkled in some cleanups, as we sometimes
>>>> significantly increase line count of some functions and they got
>>>> unreadable.
>>>
>>> Can you give some guidance on how management applications including
>>> libvirt & layers above (oVirt, OpenStack, etc) would/should use this
>>> feature ?  What new command line / monitor calls are needed, and
>>> what feature restrictions are there on its use ?
>>
>> management applications generally do not need to know about this
>> feature. Most of the magic is in the guest image, which boots up in a
>> certain way to become a protected machine.
>>
>> The requirements for that to happen are:
>> * Machine/firmware support
>> * KVM & QEMU support
>> * IO only with iommu
>> * Guest needs to use IO bounce buffers
>> * A kernel image or a kernel on a disk that was prepared with special
>> tooling
>=20
> If the user has a guest image that's expecting to run in protected
> machine mode, presumably this will fail to boot if run on a host
> which doesn't support this feature ?

Yes, the guest will lack stfle facility 161 and KVM will report a
specification exception on the diagnose subcode 8 - 10.

>=20
> As a mgmt app I think there will be a need to be able to determine
> whether a host + QEMU combo is actually able to support protected
> machines. If the mgmt app is given an image and the users says it
> required protected mode, then the mgmt app needs to know which
> host(s) are able to run it.
>=20
> Doing version number checks is not particularly desirable, so is
> there a way libvirt can determine if QEMU + host in general supports
> protected machines, so that we can report this feature to mgmt apps ?

I thought that would be visible via the cpu model by checking for the
unpack facility (161)?
Time for somebody else to explain that.


@Viktor @Boris: This one's for you.

>=20
>=20
> If a guest has booted & activated protected mode is there any way
> for libvirt to query that status ? This would allow the mgmt app
> to know that the guest is not going to be migratable thereafter.

Currently not

>=20
> Is there any way to prevent a guest from using protected mode even
> if QEMU supports it ?  eg the mgmt app may want to be able to
> guarantee that all VMs are migratable, so don't want a guest OS
> secretly activating protected mode which blocks migration.

Not enabling facility 161 is enough.

>=20
>> Such VMs are started like any other VM and run a short "normal" stub
>> that will prepare some things and then requests to be protected.
>>
>> Most of the restrictions are memory related and might be lifted in the=

>> future:
>> * No paging
>> * No migration
>=20
> Presumably QEMU is going to set a migration blocker when a guest
> activates protected mode ?

Well, that's stuff I still need to figure out :)

>=20
>> * No huge page backings
>> * No collaborative memory management
>=20
>> There are no monitor changes or cmd additions currently.
>> We're trying to insert protected VMs into the normal VM flow as much a=
s
>> possible. You can even do a memory dump without any segfault or
>> protection exception for QEMU, however the guest's memory content will=

>> be unreadable because it's encrypted.
>=20
> Is there any way to securely acquire a key needed to interpret this,
> or is the memory dump completely useless ?

It's part of the design, but not yet implemented.

>=20
> Regards,
> Daniel
>=20



--RHLkc79b2v7Mh1FUXeT2v9bspTAklrhKE--

--c2hc6hc1CCpwZrxb7RZkKNYNxLh4swlpv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEwGNS88vfc9+v45Yq41TmuOI4ufgFAl3hJQIACgkQ41TmuOI4
ufiPrQ/8Cn0Hw78Cj+Wu+YNQz4TXOLRomTGxG0SmS/gR+dACvmd9pvVr83zWDK9W
EJtiR+Jlqp63qcFWh6hxd/vi08fEBgpAAzKsRmaIysQFl2/BTaVbnnCdhju41YJe
/fkT92UR+iTuwXi2B+YfWweKZsH/9KynZrgOPItq05dk6AzbhRXJzXhAlY9xjjsf
YGjL94GlEj1ddxMavF9DBnPG4yea/lM74x96Q/5J1Rov4xaxLivnTWbyjcIdaJgq
4XPTYPPUMDwYIUcaYPdTsyZQAaPB+ei+asjbVId6/+qHkkFLmtRKp+rKiVh5LYAj
ZYcwEi1a36sTTIENd+t7HpOuhzvqaf4u5qp5Rk5BgGreDrILooFnUPymdaWkVnnN
ESwdGALmcnNXIBK7wCRrFaZXqQY7drDR8UT5/j6psvWqpBBYN0iA2/9A4POHKr24
WR5B4j32cdl86rdss4NGIPXEKQXhyqEoTLpO8buOgxOJhSCVaBZKmKsjjcmw29ih
Bh8fa5IydRpn+qdzgwLq6XP6jT0BwsEvOPPERl8VfFXmncY/Zg2gcDegBEYNipFt
bkDHUnBUb/HDJSn52jCAW2PbTCZBJE4pb1ooAznl7UkCME1MoEHsT9HjlliwsAW4
fv6PjqqboPqzYIqxqxwuf181SPcxyxjPvwx557Z2O9Bp13KrirQ=
=gBK9
-----END PGP SIGNATURE-----

--c2hc6hc1CCpwZrxb7RZkKNYNxLh4swlpv--


