Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D956165CC5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 12:28:10 +0100 (CET)
Received: from localhost ([::1]:40122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4k01-0008N3-GY
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 06:28:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40727)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1j4jxD-0005or-6a
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 06:25:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1j4jxB-0006dQ-Qo
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 06:25:14 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26962)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1j4jxB-0006ZZ-C5
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 06:25:13 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01KBK1Z6069453
 for <qemu-devel@nongnu.org>; Thu, 20 Feb 2020 06:25:11 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y8ubx42nb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 20 Feb 2020 06:25:11 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Thu, 20 Feb 2020 11:25:09 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 20 Feb 2020 11:25:06 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01KBP5KQ34996248
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Feb 2020 11:25:05 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10864A4060;
 Thu, 20 Feb 2020 11:25:05 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B70D5A4054;
 Thu, 20 Feb 2020 11:25:04 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.185.143])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 20 Feb 2020 11:25:04 +0000 (GMT)
Subject: Re: [PATCH v3 09/17] s390: protvirt: Move STSI data over SIDAD
To: Cornelia Huck <cohuck@redhat.com>
References: <20200214151636.8764-1-frankja@linux.ibm.com>
 <20200214151636.8764-10-frankja@linux.ibm.com>
 <20200220115401.50658d2c.cohuck@redhat.com>
From: Janosch Frank <frankja@linux.ibm.com>
Autocrypt: addr=frankja@linux.ibm.com; prefer-encrypt=mutual; keydata=
 mQINBFubpD4BEADX0uhkRhkj2AVn7kI4IuPY3A8xKat0ihuPDXbynUC77mNox7yvK3X5QBO6
 qLqYr+qrG3buymJJRD9xkp4mqgasHdB5WR9MhXWKH08EvtvAMkEJLnqxgbqf8td3pCQ2cEpv
 15mH49iKSmlTcJ+PvJpGZcq/jE42u9/0YFHhozm8GfQdb9SOI/wBSsOqcXcLTUeAvbdqSBZe
 zuMRBivJQQI1esD9HuADmxdE7c4AeMlap9MvxvUtWk4ZJ/1Z3swMVCGzZb2Xg/9jZpLsyQzb
 lDbbTlEeyBACeED7DYLZI3d0SFKeJZ1SUyMmSOcr9zeSh4S4h4w8xgDDGmeDVygBQZa1HaoL
 Esb8Y4avOYIgYDhgkCh0nol7XQ5i/yKLtnNThubAcxNyryw1xSstnKlxPRoxtqTsxMAiSekk
 0m3WJwvwd1s878HrQNK0orWd8BzzlSswzjNfQYLF466JOjHPWFOok9pzRs+ucrs6MUwDJj0S
 cITWU9Rxb04XyigY4XmZ8dywaxwi2ZVTEg+MD+sPmRrTw+5F+sU83cUstuymF3w1GmyofgsU
 Z+/ldjToHnq21MNa1wx0lCEipCCyE/8K9B9bg9pUwy5lfx7yORP3JuAUfCYb8DVSHWBPHKNj
 HTOLb2g2UT65AjZEQE95U2AY9iYm5usMqaWD39pAHfhC09/7NQARAQABtCVKYW5vc2NoIEZy
 YW5rIDxmcmFua2phQGxpbnV4LmlibS5jb20+iQI3BBMBCAAhBQJbm6Q+AhsjBQsJCAcCBhUI
 CQoLAgQWAgMBAh4BAheAAAoJEONU5rjiOLn4p9gQALjkdj5euJVI2nNT3/IAxAhQSmRhPEt0
 AmnCYnuTcHRWPujNr5kqgtyER9+EMQ0ZkX44JU2q7OWxTdSNSAN/5Z7qmOR9JySvDOf4d3mS
 bMB5zxL9d8SbnSs1uW96H9ZBTlTQnmLfsiM9TetAjSrR8nUmjGhe2YUhJLR1v1LguME+YseT
 eXnLzIzqqpu311/eYiiIGcmaOjPCE+vFjcXL5oLnGUE73qSYiujwhfPCCUK0850o1fUAYq5p
 CNBCoKT4OddZR+0itKc/cT6NwEDwdokeg0+rAhxb4Rv5oFO70lziBplEjOxu3dqgIKbHbjza
 EXTb+mr7VI9O4tTdqrwJo2q9zLqqOfDBi7NDvZFLzaCewhbdEpDYVu6/WxprAY94hY3F4trT
 rQMHJKQENtF6ZTQc9fcT5I3gAmP+OEvDE5hcTALpWm6Z6SzxO7gEYCnF+qGXqp8sJVrweMub
 UscyLqHoqdZC2UG4LQ1OJ97nzDpIRe0g6oJ9ZIYHKmfw5jjwH6rASTld5MFWajWdNsqK15k/
 RZnHAGICKVIBOBsq26m4EsBlfCdt3b/6emuBjUXR1pyjHMz2awWzCq6/6OWs5eANZ0sdosNq
 dq2v0ULYTazJz2rlCXV89qRa7ukkNwdBSZNEwsD4eEMicj1LSrqWDZMAALw50L4jxaMD7lPL
 jJbauQINBFubpD4BEADAcUTRqXF/aY53OSH7IwIK9lFKxIm0IoFkOEh7LMfp7FGzaP7ANrZd
 cIzhZi38xyOkcaFY+npGEWvko7rlIAn0JpBO4x3hfhmhBD/WSY8LQIFQNNjEm3vzrMo7b9Jb
 JAqQxfbURY3Dql3GUzeWTG9uaJ00u+EEPlY8zcVShDltIl5PLih20e8xgTnNzx5c110lQSu0
 iZv2lAE6DM+2bJQTsMSYiwKlwTuv9LI9Chnoo6+tsN55NqyMxYqJgElk3VzlTXSr3+rtSCwf
 tq2cinETbzxc1XuhIX6pu/aCGnNfuEkM34b7G1D6CPzDMqokNFbyoO6DQ1+fW6c5gctXg/lZ
 602iEl4C4rgcr3+EpfoPUWzKeM8JXv5Kpq4YDxhvbitr8Dm8gr38+UKFZKlWLlwhQ56r/zAU
 v6LIsm11GmFs2/cmgD1bqBTNHHcTWwWtRTLgmnqJbVisMJuYJt4KNPqphTWsPY8SEtbufIlY
 HXOJ2lqUzOReTrie2u0qcSvGAbSfec9apTFl2Xko/ddqPcZMpKhBiXmY8tJzSPk3+G4tqur4
 6TYAm5ouitJsgAR61Cu7s+PNuq/pTLDhK+6/Njmc94NGBcRA4qTuysEGE79vYWP2oIAU4Fv6
 gqaWHZ4MEI2XTqH8wiwzPdCQPYsSE0fXWiYu7ObeErT6iLSTZGx4rQARAQABiQIfBBgBCAAJ
 BQJbm6Q+AhsMAAoJEONU5rjiOLn4DDEP/RuyckW65SZcPG4cMfNgWxZF8rVjeVl/9PBfy01K
 8R0hajU40bWtXSMiby7j0/dMjz99jN6L+AJHJvrLz4qYRzn2Ys843W+RfXj62Zde4YNBE5SL
 jJweRCbMWKaJLj6499fctxTyeb9+AMLQS4yRSwHuAZLmAb5AyCW1gBcTWZb8ON5BmWnRqeGm
 IgC1EvCnHy++aBnHTn0m+zV89BhTLTUal35tcjUFwluBY39R2ux/HNlBO1GY3Z+WYXhBvq7q
 katThLjaQSmnOrMhzqYmdShP1leFTVbzXUUIYv/GbynO/YrL2gaQpaP1bEUEi8lUAfXJbEWG
 dnHFkciryi092E8/9j89DJg4mmZqOau7TtUxjRMlBcIliXkzSLUk+QvD4LK1kWievJse4mte
 FBdkWHfP4BH/+8DxapRcG1UAheSnSRQ5LiO50annOB7oXF+vgKIaie2TBfZxQNGAs3RQ+bga
 DchCqFm5adiSP5+OT4NjkKUeGpBe/aRyQSle/RropTgCi85pje/juYEn2P9UAgkfBJrOHvQ9
 Z+2Sva8FRd61NJLkCJ4LFumRn9wQlX2icFbi8UDV3do0hXJRRYTWCxrHscMhkrFWLhYiPF4i
 phX7UNdOWBQ90qpHyAxHmDazdo27gEjfvsgYMdveKknEOTEb5phwxWgg7BcIDoJf9UMC
Date: Thu, 20 Feb 2020 12:25:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200220115401.50658d2c.cohuck@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9L7ZATFZSSWMOASmbMhvKXrY3o55RnY3p"
X-TM-AS-GCONF: 00
x-cbid: 20022011-4275-0000-0000-000003A3C1DC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022011-4276-0000-0000-000038B7CE39
Message-Id: <e24acc8b-6ce4-a054-299b-44c0a56f6f7a@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_03:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002200085
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
--9L7ZATFZSSWMOASmbMhvKXrY3o55RnY3p
Content-Type: multipart/mixed; boundary="eTfDmzQbvQG5d8SVBsb3gD3xr91ruZVNK"

--eTfDmzQbvQG5d8SVBsb3gD3xr91ruZVNK
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2/20/20 11:54 AM, Cornelia Huck wrote:
> On Fri, 14 Feb 2020 10:16:28 -0500
> Janosch Frank <frankja@linux.ibm.com> wrote:
>=20
>> For protected guests, we need to put the STSI emulation results into
>> the SIDA, so SIE will write them into the guest at the next entry.
>>
>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>> ---
>>  target/s390x/kvm.c | 15 ++++++++++++---
>>  1 file changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
>> index eec0b92479..fe669ed24c 100644
>> --- a/target/s390x/kvm.c
>> +++ b/target/s390x/kvm.c
>> @@ -1772,11 +1772,16 @@ static int handle_tsch(S390CPU *cpu)
>> =20
>>  static void insert_stsi_3_2_2(S390CPU *cpu, __u64 addr, uint8_t ar)
>>  {
>> +    CPUS390XState *env =3D &cpu->env;
>>      SysIB_322 sysib;
>>      int del;
>> =20
>> -    if (s390_cpu_virt_mem_read(cpu, addr, ar, &sysib, sizeof(sysib)))=
 {
>> -        return;
>> +    if (env->pv) {
>> +        s390_cpu_pv_mem_read(cpu, 0, &sysib, sizeof(sysib));
>=20
> This is only introduced by the next patch, right?

Ups, time to reorder.

>=20
>> +    } else {
>> +        if (s390_cpu_virt_mem_read(cpu, addr, ar, &sysib, sizeof(sysi=
b))) {
>> +            return;
>> +        }
>>      }
>>      /* Shift the stack of Extended Names to prepare for our own data =
*/
>>      memmove(&sysib.ext_names[1], &sysib.ext_names[0],
>> @@ -1815,7 +1820,11 @@ static void insert_stsi_3_2_2(S390CPU *cpu, __u=
64 addr, uint8_t ar)
>>      /* Insert UUID */
>>      memcpy(sysib.vm[0].uuid, &qemu_uuid, sizeof(sysib.vm[0].uuid));
>> =20
>> -    s390_cpu_virt_mem_write(cpu, addr, ar, &sysib, sizeof(sysib));
>> +    if (env->pv) {
>> +        s390_cpu_pv_mem_write(cpu, 0, &sysib, sizeof(sysib));
>> +    } else {
>> +        s390_cpu_virt_mem_write(cpu, addr, ar, &sysib, sizeof(sysib))=
;
>> +    }
>>  }
>> =20
>>  static int handle_stsi(S390CPU *cpu)
>=20
>=20



--eTfDmzQbvQG5d8SVBsb3gD3xr91ruZVNK--

--9L7ZATFZSSWMOASmbMhvKXrY3o55RnY3p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEwGNS88vfc9+v45Yq41TmuOI4ufgFAl5ObJAACgkQ41TmuOI4
ufjlAw/8CImRAPWX+Nsh/DqTT94Bmrtw/6yLuB/kcbjgkV6RFqEwWgO/wXj43se4
zWOlZUTM63wt8cW1d66HjhS8+n1RgTF0dQr4L0zLQ4OZdt0JjmiFodEeWIkQWoJm
ojwVJuqJ5XoDTkcntcXJ4zxzuZTlk89W089cKT9a51Qnzv/txIZcAc6npSnHsZ3k
W9V1fZwm+/+Qro03RaF/4NFaEyX/Es3hE/8Hwt7/TNh9kSoMI9kqWW/39gRkB0+N
P8QDdYfN8fRj5mtiwPCEOP/Coyg0uULLS+JzrsL3wEGeBPWUWEOxkv7+t+gOfKU+
dvdPSGC4qZDSz17tdv79/6tKR++POLcwYPbOLlCIMh5wPDqFGooaPn6RjPnafXKr
+LrjK65wasiDNsDBG55ZkZjPJWbVg3ZFV/3Ji7xk7HBD2Qapk7ypxUUtTzYjWAcf
poZzwft/HlH9z0EOOpdc0izFHcNtxm6XTcpSopwCu0f/bXh3nYtDNX14592EqPS2
weu5TiddSWBfniXgUfshlJ+P+LnGgc7rhTYGKAYXwTeA1mZFJQ8nkQOMQ/Zlh+vo
qka/WoxIF6LRQvHn7Z/dWohr+TQI/2+XJNjpQXNPUpg2mpMqIn26Gn+zIBc1hqkZ
k/uj6Fgcps/KLBrRSggWALlMF+lyyDCp+jQ2V1nfSrbLydvh7IE=
=Vadf
-----END PGP SIGNATURE-----

--9L7ZATFZSSWMOASmbMhvKXrY3o55RnY3p--


