Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F5D1072CB
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Nov 2019 14:09:16 +0100 (CET)
Received: from localhost ([::1]:50678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iY8gU-0003Us-Ut
	for lists+qemu-devel@lfdr.de; Fri, 22 Nov 2019 08:09:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51629)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1iY8fU-0002ZP-KZ
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 08:08:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1iY8fS-00084q-PX
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 08:08:12 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:12740)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1iY8fS-00083W-H5
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 08:08:10 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAMD7u1b076919
 for <qemu-devel@nongnu.org>; Fri, 22 Nov 2019 08:08:08 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wdv0vywq6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 22 Nov 2019 08:08:07 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Fri, 22 Nov 2019 13:08:02 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 22 Nov 2019 13:08:00 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAMD7wtt56164570
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Nov 2019 13:07:58 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9721411C052;
 Fri, 22 Nov 2019 13:07:58 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 166A111C04C;
 Fri, 22 Nov 2019 13:07:58 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.41.23])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 22 Nov 2019 13:07:58 +0000 (GMT)
Subject: Re: [PATCH 2/4] s390x: Cleanup cpu resets
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191122075218.23935-1-frankja@linux.ibm.com>
 <20191122075218.23935-3-frankja@linux.ibm.com>
 <a57741a5-81ba-0a62-aaf5-ad903f7d1848@redhat.com>
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
Date: Fri, 22 Nov 2019 14:07:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <a57741a5-81ba-0a62-aaf5-ad903f7d1848@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nHIXs4Ztu8Z9oDF9yHtgiEYrWyLgxpwB7"
X-TM-AS-GCONF: 00
x-cbid: 19112213-4275-0000-0000-00000384E12F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112213-4276-0000-0000-000038986202
Message-Id: <0bc40c69-8be0-04b0-1c97-b0c119d0af99@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-22_02:2019-11-21,2019-11-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 clxscore=1015 impostorscore=0 mlxscore=0 phishscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911220116
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, mihajlov@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nHIXs4Ztu8Z9oDF9yHtgiEYrWyLgxpwB7
Content-Type: multipart/mixed; boundary="iwbDqy561m6Ak6lx5YDLFScZwk2EkTF28"

--iwbDqy561m6Ak6lx5YDLFScZwk2EkTF28
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11/22/19 11:35 AM, Philippe Mathieu-Daud=E9 wrote:
> Hi Janosh,
>=20
> On 11/22/19 8:52 AM, Janosch Frank wrote:
>> Let's move the resets into one function and switch by type, so we can
>> use fallthroughs for shared reset actions.
>>
>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>> ---
>>   target/s390x/cpu.c | 110 ++++++++++++++++++++-----------------------=
--
>>   1 file changed, 48 insertions(+), 62 deletions(-)
>>
>> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
>> index 3abe7e80fd..556afecbc1 100644
>> --- a/target/s390x/cpu.c
>> +++ b/target/s390x/cpu.c
>> @@ -82,67 +82,52 @@ static void s390_cpu_load_normal(CPUState *s)
>>   }
>>   #endif
>>  =20
>> -/* S390CPUClass::cpu_reset() */
>> -static void s390_cpu_reset(CPUState *s)
>> +typedef enum cpu_reset_type {
>> +    S390_CPU_RESET_NORMAL,
>> +    S390_CPU_RESET_INITIAL,
>> +    S390_CPU_RESET_CLEAR,
>> +} cpu_reset_type;
>> +
>> +static void s390_cpu_reset(CPUState *s, cpu_reset_type type)
>>   {
>>       S390CPU *cpu =3D S390_CPU(s);
>>       S390CPUClass *scc =3D S390_CPU_GET_CLASS(cpu);
>>       CPUS390XState *env =3D &cpu->env;
>>  =20
>> -    env->pfault_token =3D -1UL;
>> -    env->bpbc =3D false;
>>       scc->parent_reset(s);
>>       cpu->env.sigp_order =3D 0;
>>       s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
>> -}
>>  =20
>> -/* S390CPUClass::initial_reset() */
>> -static void s390_cpu_initial_reset(CPUState *s)
>> -{
>> -    S390CPU *cpu =3D S390_CPU(s);
>> -    CPUS390XState *env =3D &cpu->env;
>> +    /* Set initial values after clearing */
>> +    switch (type) {
>> +    case S390_CPU_RESET_CLEAR:
>> +        memset(env, 0, offsetof(CPUS390XState, start_initial_reset_fi=
elds));
>> +        /* Fallthrough */
>> +    case S390_CPU_RESET_INITIAL:
>> +        memset(&env->start_initial_reset_fields, 0,
>> +               offsetof(CPUS390XState, end_reset_fields) -
>> +               offsetof(CPUS390XState, start_initial_reset_fields));
>> +        /* architectured initial values for CR 0 and 14 */
>> +        env->cregs[0] =3D CR0_RESET;
>> +        env->cregs[14] =3D CR14_RESET;
>>  =20
>> -    s390_cpu_reset(s);
>> -    /* initial reset does not clear everything! */
>> -    memset(&env->start_initial_reset_fields, 0,
>> -        offsetof(CPUS390XState, end_reset_fields) -
>> -        offsetof(CPUS390XState, start_initial_reset_fields));
>> -
>> -    /* architectured initial values for CR 0 and 14 */
>> -    env->cregs[0] =3D CR0_RESET;
>> -    env->cregs[14] =3D CR14_RESET;
>> -
>> -    /* architectured initial value for Breaking-Event-Address registe=
r */
>> -    env->gbea =3D 1;
>> -
>> -    env->pfault_token =3D -1UL;
>> -
>> -    /* tininess for underflow is detected before rounding */
>> -    set_float_detect_tininess(float_tininess_before_rounding,
>> -                              &env->fpu_status);
>> +        /* architectured initial value for Breaking-Event-Address reg=
ister */
>> +        env->gbea =3D 1;
>> +        /* tininess for underflow is detected before rounding */
>> +        set_float_detect_tininess(float_tininess_before_rounding,
>> +                                  &env->fpu_status);
>> +        /* Fallthrough */
>> +    case S390_CPU_RESET_NORMAL:
>> +        env->pfault_token =3D -1UL;
>> +        env->bpbc =3D false;
>> +        break;
>> +    }
>>  =20
>>       /* Reset state inside the kernel that we cannot access yet from =
QEMU. */
>> -    if (kvm_enabled()) {
>> -        kvm_s390_reset_vcpu(cpu);
>> +    if (kvm_enabled() && (type =3D=3D S390_CPU_RESET_CLEAR ||
>> +                          type =3D=3D S390_CPU_RESET_INITIAL)) {
>> +            kvm_s390_reset_vcpu(cpu);
>>       }
>> -}
>> -
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
>>  =20
>>   #if defined(CONFIG_USER_ONLY)
>>       /* user mode should always be allowed to use the full FPU */
>> @@ -151,20 +136,21 @@ static void s390_cpu_full_reset(CPUState *s)
>>           env->cregs[0] |=3D CR0_VECTOR;
>>       }
>>   #endif
>> +}
>>  =20
>> -    /* architectured initial value for Breaking-Event-Address registe=
r */
>> -    env->gbea =3D 1;
>> +static void s390_cpu_reset_normal(CPUState *s)
>> +{
>> +    return s390_cpu_reset(s, S390_CPU_RESET_NORMAL);
>> +}
>>  =20
>> -    env->pfault_token =3D -1UL;
>> +static void s390_cpu_reset_initial(CPUState *s)
>> +{
>> +    return s390_cpu_reset(s, S390_CPU_RESET_INITIAL);
>> +}
>>  =20
>> -    /* tininess for underflow is detected before rounding */
>> -    set_float_detect_tininess(float_tininess_before_rounding,
>> -                              &env->fpu_status);
>> -
>> -    /* Reset state inside the kernel that we cannot access yet from Q=
EMU. */
>> -    if (kvm_enabled()) {
>> -        kvm_s390_reset_vcpu(cpu);
>> -    }
>> +static void s390_cpu_reset_clear(CPUState *s)
>> +{
>> +    return s390_cpu_reset(s, S390_CPU_RESET_CLEAR);
>>   }
>>  =20
>>   #if !defined(CONFIG_USER_ONLY)
>> @@ -473,9 +459,9 @@ static void s390_cpu_class_init(ObjectClass *oc, v=
oid *data)
>>   #if !defined(CONFIG_USER_ONLY)
>>       scc->load_normal =3D s390_cpu_load_normal;
>>   #endif
>> -    scc->cpu_reset =3D s390_cpu_reset;
>> -    scc->initial_cpu_reset =3D s390_cpu_initial_reset;
>> -    cc->reset =3D s390_cpu_full_reset;
>> +    scc->cpu_reset =3D s390_cpu_reset_normal;
>> +    scc->initial_cpu_reset =3D s390_cpu_reset_initial;
>> +    cc->reset =3D s390_cpu_reset_clear;
>>       cc->class_by_name =3D s390_cpu_class_by_name,
>>       cc->has_work =3D s390_cpu_has_work;
>>   #ifdef CONFIG_TCG
>>
>=20
> This is a nice cleanup, but the patch is hard to digest.
> Maybe you can split it in 3, one patch for each cpu_reset_type.
>=20
> Regards,
>=20
> Phil.
>=20

I'll try to split it up.



--iwbDqy561m6Ak6lx5YDLFScZwk2EkTF28--

--nHIXs4Ztu8Z9oDF9yHtgiEYrWyLgxpwB7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEwGNS88vfc9+v45Yq41TmuOI4ufgFAl3X3a0ACgkQ41TmuOI4
ufgrDg/+NEanhrjEdH0x0LjQcFocVGpdNM1+1wKc52pT1z1J0q2WxS5oQh1l2hWO
Yz9ASGNyixZ+N4Pa4H95luakTX4CNJR7UHOOgeE2TOTGSWJ+cgAG5AqBoxs4jD0H
Jos1LqLaj7AOUTb9i7P0i1LbK+hD9qwe2EtGEgeWvc3WzZSswNrNzlLsVBTSYzk9
3dNkup/fqoHs+Uan1bAGX4y1f/w4ZKupXDvycKhGeKfE2OC4HDAKiVWPcoonNIvA
U60cDr0hX/Gf2/yyxS91yX1l0ynkV18viqtKrYX5NxDtXgVAwLZEs3DeBvMQRd44
P6usd/UuWZ3F+FgyGSzJd/f7BXryUa9Ud6ntMlPxLUXWl6WtdHGx1SPlnNqnSwHb
DogV8rf5X8hZfLu75FgNLgp0PH1ftxcpE6vQ5kqhOm2WPP8KhlQJhXNp3HHZcE39
9/clY9InBAN4tv4pPKUxzFlZ3+X8qLvgjfs3P3TaTwvVwTA6L5yab/8UEaakbBkD
8rqHQSWzqkamxheF5zrY0vKZ/Fpo0wj9trjxOsVVPTaanJ+31Xu/ScdWy9TkGuhR
x13P9c+LNiiY6xNYW2xMfeAzIW6KZVb9vvljRVuvUsSfk7n+UVx8gvdFXelS9Srz
qdBmc/3hUsT3nU9HGR15pfjhYNPf0f/3peuKyEM+nRFhgGKv67I=
=8bzC
-----END PGP SIGNATURE-----

--nHIXs4Ztu8Z9oDF9yHtgiEYrWyLgxpwB7--


