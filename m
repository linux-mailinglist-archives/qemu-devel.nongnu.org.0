Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 020191CDD65
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 16:39:01 +0200 (CEST)
Received: from localhost ([::1]:40640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jY9a8-00008C-2x
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 10:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1jY9Yu-0007O3-8T; Mon, 11 May 2020 10:37:44 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1jY9Yt-00041t-AL; Mon, 11 May 2020 10:37:43 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04BEZG3q016454; Mon, 11 May 2020 10:37:41 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30wrvyfdrh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 10:37:41 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04BEZkw2018938;
 Mon, 11 May 2020 10:37:40 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30wrvyfdpx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 10:37:40 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04BEZ4no006885;
 Mon, 11 May 2020 14:37:38 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 30wm55huge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 14:37:38 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 04BEaOTc61145346
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 May 2020 14:36:24 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 065DE4C058;
 Mon, 11 May 2020 14:37:35 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 681084C040;
 Mon, 11 May 2020 14:37:34 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.161.199])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 11 May 2020 14:37:34 +0000 (GMT)
Subject: Re: [PATCH v1 1/8] s390/sclp: remove SCLPDevice param from
 prepare_cpu_entries
To: Collin Walling <walling@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20200508230823.22956-1-walling@linux.ibm.com>
 <20200508230823.22956-2-walling@linux.ibm.com>
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
Message-ID: <1b6fab50-4353-e630-aea2-9afaef003f8f@linux.ibm.com>
Date: Mon, 11 May 2020 16:37:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200508230823.22956-2-walling@linux.ibm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dsjH8n2olNIjFMEKcRsuQpwxvYOGQU6X9"
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-11_06:2020-05-11,
 2020-05-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005110116
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 10:37:41
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
Cc: david@redhat.com, cohuck@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, mst@redhat.com, svens@linux.ibm.com,
 pbonzini@redhat.com, mihajlov@linux.ibm.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dsjH8n2olNIjFMEKcRsuQpwxvYOGQU6X9
Content-Type: multipart/mixed; boundary="uKgaNnBKagPQJ7XLvdfMh26a1DkKMvmbr"

--uKgaNnBKagPQJ7XLvdfMh26a1DkKMvmbr
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 5/9/20 1:08 AM, Collin Walling wrote:
> It was never used in this function, so let's remove it.
>=20
> Signed-off-by: Collin Walling <walling@linux.ibm.com>

Acked-by: Janosch Frank <frankja@de.ibm.com>

> ---
>  hw/s390x/sclp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
> index ede056b3ef..156ffe3223 100644
> --- a/hw/s390x/sclp.c
> +++ b/hw/s390x/sclp.c
> @@ -49,7 +49,7 @@ static inline bool sclp_command_code_valid(uint32_t c=
ode)
>      return false;
>  }
> =20
> -static void prepare_cpu_entries(SCLPDevice *sclp, CPUEntry *entry, int=
 *count)
> +static void prepare_cpu_entries(CPUEntry *entry, int *count)
>  {
>      MachineState *ms =3D MACHINE(qdev_get_machine());
>      uint8_t features[SCCB_CPU_FEATURE_LEN] =3D { 0 };
> @@ -77,7 +77,7 @@ static void read_SCP_info(SCLPDevice *sclp, SCCB *scc=
b)
>      IplParameterBlock *ipib =3D s390_ipl_get_iplb();
> =20
>      /* CPU information */
> -    prepare_cpu_entries(sclp, read_info->entries, &cpu_count);
> +    prepare_cpu_entries(read_info->entries, &cpu_count);
>      read_info->entries_cpu =3D cpu_to_be16(cpu_count);
>      read_info->offset_cpu =3D cpu_to_be16(offsetof(ReadInfo, entries))=
;
>      read_info->highest_cpu =3D cpu_to_be16(machine->smp.max_cpus - 1);=

> @@ -135,7 +135,7 @@ static void sclp_read_cpu_info(SCLPDevice *sclp, SC=
CB *sccb)
>      ReadCpuInfo *cpu_info =3D (ReadCpuInfo *) sccb;
>      int cpu_count;
> =20
> -    prepare_cpu_entries(sclp, cpu_info->entries, &cpu_count);
> +    prepare_cpu_entries(cpu_info->entries, &cpu_count);
>      cpu_info->nr_configured =3D cpu_to_be16(cpu_count);
>      cpu_info->offset_configured =3D cpu_to_be16(offsetof(ReadCpuInfo, =
entries));
>      cpu_info->nr_standby =3D cpu_to_be16(0);
>=20



--uKgaNnBKagPQJ7XLvdfMh26a1DkKMvmbr--

--dsjH8n2olNIjFMEKcRsuQpwxvYOGQU6X9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEwGNS88vfc9+v45Yq41TmuOI4ufgFAl65Yy4ACgkQ41TmuOI4
ufhBsw//W/OZWeJEyRmZSVH4udl+36VvnjW3hUrfKyYXm3khD5MMKP4Wcxok8V+a
GKUjGBDVnMseMF27xWHN1luJFgC7/WeXAxJxf3SpWX/PbOQmPuKN9rO2i85ViUh5
8GMuBVGc2vtlxugC6fD8NBvCKIUaCLBzKWhP4i5fwyEhyh+E+B4RRT+kV6PuOXW9
0bjBCMkS2qE5KJspe69umdN4wCs0SL3mXjJpjuE7mZUyXAwy3Zr/w09dkNj38mxt
MmoELRy8DJArTa0krVppCXQ9PpHmaDunFofQQYgb5O1f9qr1dpT9L5iub0gQDQow
B0hL3yOJxdEpmyOQe7f5n3wbO4ASgdg69a19CvveWdadS4Lh2goJrWjiy55kMeYV
417HtcJoAIyNSJMtSugS2bCV8pbp/mUgAEKkK51znajDIZaVj+eOyLGI9i4poSXQ
tyqph6F8LbtA2oV71fLZPsVsLGOpw2EF3Uz5nP0ePB2YRkfXFPmfd3IdjbQHq2Ri
DB9ccYZDDRxB1LqwiBq2RkF5pZqtrXdr+k4GOX6mbNALVRIuGtHE/YYLGwkrSyZX
MOxzEot81I+wXii6zepgB5UwNJADq+R7KrqS7wfz1S1UZmF1q742NdVEFQVyzU3w
+XFpw1CczKpW+Wmqrzp9KKq1vzidB7Kzdfb4Os33SzTYnGNzKVA=
=7rV5
-----END PGP SIGNATURE-----

--dsjH8n2olNIjFMEKcRsuQpwxvYOGQU6X9--


