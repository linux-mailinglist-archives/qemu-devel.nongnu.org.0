Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B28165CE7
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 12:43:46 +0100 (CET)
Received: from localhost ([::1]:40298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4kF7-0000KE-Mr
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 06:43:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43515)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1j4kEO-0008He-Oa
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 06:43:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1j4kEN-0004lB-Bq
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 06:43:00 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:57774)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1j4kEN-0004dj-5e
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 06:42:59 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01KBc8L7168730
 for <qemu-devel@nongnu.org>; Thu, 20 Feb 2020 06:42:58 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y92xe9y0f-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 20 Feb 2020 06:42:58 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Thu, 20 Feb 2020 11:42:55 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 20 Feb 2020 11:42:53 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01KBgqNO62390494
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Feb 2020 11:42:52 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BCCBA405B;
 Thu, 20 Feb 2020 11:42:52 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37159A4054;
 Thu, 20 Feb 2020 11:42:52 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.185.143])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 20 Feb 2020 11:42:52 +0000 (GMT)
Subject: Re: [PATCH v3 06/17] s390x: protvirt: Add migration blocker
To: Cornelia Huck <cohuck@redhat.com>
References: <20200214151636.8764-1-frankja@linux.ibm.com>
 <20200214151636.8764-7-frankja@linux.ibm.com>
 <20200220114815.01634a4c.cohuck@redhat.com>
 <fbcacbf4-75d6-55f9-2ad3-6cd47b400fce@linux.ibm.com>
 <20200220123953.5b0272a4.cohuck@redhat.com>
From: Janosch Frank <frankja@linux.ibm.com>
Autocrypt: addr=frankja@linux.ibm.com; prefer-encrypt=mutual; keydata=
 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
Date: Thu, 20 Feb 2020 12:42:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200220123953.5b0272a4.cohuck@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TWaf0EgMdBBeK5sUPQsKXmUPouyd1Ap1M"
X-TM-AS-GCONF: 00
x-cbid: 20022011-0016-0000-0000-000002E89299
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022011-0017-0000-0000-0000334BAEAB
Message-Id: <da877fda-f3fb-b4f8-fce9-f5c5ab64e0bc@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_03:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=2 malwarescore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002200087
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
Cc: qemu-s390x@nongnu.org, mihajlov@linux.ibm.com, qemu-devel@nongnu.org,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TWaf0EgMdBBeK5sUPQsKXmUPouyd1Ap1M
Content-Type: multipart/mixed; boundary="00Iae8vQu5ytixRH7mgZPDs9EcfXmLlPy"

--00Iae8vQu5ytixRH7mgZPDs9EcfXmLlPy
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2/20/20 12:39 PM, Cornelia Huck wrote:
> On Thu, 20 Feb 2020 12:24:23 +0100
> Janosch Frank <frankja@linux.ibm.com> wrote:
>=20
>> On 2/20/20 11:48 AM, Cornelia Huck wrote:
>>> On Fri, 14 Feb 2020 10:16:25 -0500
>>> Janosch Frank <frankja@linux.ibm.com> wrote:
>>>  =20
>>>> Migration is not yet supported.
>>>>
>>>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>>>> ---
>>>>  hw/s390x/s390-virtio-ccw.c | 16 ++++++++++++++++
>>>>  1 file changed, 16 insertions(+)
>>>>
>>>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c=

>>>> index 5fa4372083..d64724af91 100644
>>>> --- a/hw/s390x/s390-virtio-ccw.c
>>>> +++ b/hw/s390x/s390-virtio-ccw.c
>>>> @@ -42,6 +42,9 @@
>>>>  #include "hw/s390x/tod.h"
>>>>  #include "sysemu/sysemu.h"
>>>>  #include "hw/s390x/pv.h"
>>>> +#include "migration/blocker.h"
>>>> +
>>>> +static Error *pv_mig_blocker;
>>>> =20
>>>>  S390CPU *s390_cpu_addr2state(uint16_t cpu_addr)
>>>>  {
>>>> @@ -373,6 +376,7 @@ static void s390_machine_reset(MachineState *mac=
hine)
>>>>      CPUState *cs, *t;
>>>>      S390CPU *cpu;
>>>>      S390CcwMachineState *ms =3D S390_CCW_MACHINE(machine);
>>>> +    static Error *local_err;
>>>> =20
>>>>      /* get the reset parameters, reset them once done */
>>>>      s390_ipl_get_reset_request(&cs, &reset_type);
>>>> @@ -422,6 +426,17 @@ static void s390_machine_reset(MachineState *ma=
chine)
>>>>          }
>>>>          run_on_cpu(cs, s390_do_cpu_reset, RUN_ON_CPU_NULL);
>>>> =20
>>>> +        if (!pv_mig_blocker) {
>>>> +            error_setg(&pv_mig_blocker,
>>>> +                       "protected VMs are currently not migrateable=
=2E");
>>>> +        }
>>>> +        migrate_add_blocker(pv_mig_blocker, &local_err); =20
>>>
>>> If I'm not lost in the context, that's during PV_RESET. I'm a bit
>>> confused why you'd add the blocker here? =20
>>
>> Where would you want me to add it?
>> It's here where we switch into secure mode and I need to block before
>> switching and unblock if it fails.
>>
>> When having the blocker in diag.c, I'd have a hard time unblocking on =
a
>> PV switch fail.
>>
>>>  =20
>>>> +        if (local_err) {
>>>> +            error_report_err(local_err);
>>>> +            error_free(pv_mig_blocker);
>>>> +            exit(1); =20
>>>
>>> Why the exit()? Can't you fail the call? =20
>>
>> Well, if that fails and we go protected, I wouldn't be protected again=
s
>> migrations, right?
>=20
> No, I meant not go protected, if that's possible.

That would be an option, now that we have a proper d308 rc for such a thi=
ng.

Will add!

>=20
>>
>>>  =20
>>>> +        }
>>>> +
>>>>          if (s390_machine_pv_secure(ms)) {
>=20
> Ok, I think what confuses me is this call: it reads as if you actually
> tear down things if the machine is secure. Call it
> s390_machine_pv_make_secure() to make sure it is actively doing
> something and not checking a previously set value?

Ok, will use something along these lines

>=20
>>>>              CPU_FOREACH(t) {
>>>>                  s390_pv_vcpu_destroy(t);
>>>> @@ -430,6 +445,7 @@ static void s390_machine_reset(MachineState *mac=
hine)
>>>>              ms->pv =3D false;
>>>> =20
>>>>              s390_machine_inject_pv_error(cs);
>>>> +            migrate_del_blocker(pv_mig_blocker);
>>>>              s390_cpu_set_state(S390_CPU_STATE_OPERATING, cpu);
>>>>              return;
>>>>          } =20
>>>
>>>  =20
>>
>>
>=20



--00Iae8vQu5ytixRH7mgZPDs9EcfXmLlPy--

--TWaf0EgMdBBeK5sUPQsKXmUPouyd1Ap1M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEwGNS88vfc9+v45Yq41TmuOI4ufgFAl5OcLsACgkQ41TmuOI4
ufiAHxAAnKkt/6i2kyRgDaX9ru+/af8gU2ufmTN/OyCIcGEi3Uuhnws17xZrZ3W1
vltk+LVpI/Xza8n0LTltBzldNXTs/5avasSGMSqicAN7qU4uCMS1tzwsKYNkaR3f
TdyIocBGlbJzTRo5x4YZDtDf9ncUITZXR1BVUSyC9SL/jVN+ScKIQG+HZ0k60CGU
0a3dws9YbaFWDclqI5jfLLhE8KWBjd8WuxKkQtkDuWnHEULwM8cHAFzfo/xaraCq
Ucj5aEQcq05pnkpn5KtmLkCA05X6uGU5tyGJWREcMPWipR1RsXlY0AfzQXlSdLnQ
MH8GONoPnuxBwC2JSVxfOrjgv1obTt5VoRemxjKBnnAtH31Z349Lq+R4Uy0ly5ei
PGRhEApRDGhaWF8tgAf/ZrXskGCVyvrjxn3FRvZ7p4H6RzRM7kh68EltE5vjY2a+
Xwf5RSC92vP3isnnpC2fDkGAzssEfoh1/Qcm8C7D8vE+yDthDrOrVP1NUKg4zZY3
uTD0h2ROqtl//FW6KomsfN4MoEXHM3fzYcxsJqSxIOhIiGE96VgAKYtUIMf7OHCv
bDhbqPTCsjEfI380aApwbQIpYJ0rhDiroblC22urXlciOoTqNIcvQZ5wkAId/Oux
J/JHTa3xPsPio/g+Jo341b35PU1I+FadaNEmm0rr7kmrLo6fOAA=
=QPPf
-----END PGP SIGNATURE-----

--TWaf0EgMdBBeK5sUPQsKXmUPouyd1Ap1M--


