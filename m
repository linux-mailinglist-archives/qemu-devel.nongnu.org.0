Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89F6249AD5
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 12:48:41 +0200 (CEST)
Received: from localhost ([::1]:53738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8Le4-0005Gh-Vj
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 06:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1k8Lbr-0002u9-05; Wed, 19 Aug 2020 06:46:23 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:36972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1k8Lbo-0003S9-GS; Wed, 19 Aug 2020 06:46:22 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07JAX4Zf106513; Wed, 19 Aug 2020 06:46:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=pp1; bh=rT5lH+j7IW+N2uwu9vK4rNPmnhRTXd0BgPFB8lkyl58=;
 b=LVzdEodL8xFYYi5DvTG2PpNAX1uNOFSPAgnMjxrRTZ+Ckd2aUOz1UTsJzaQR7FEZVjH6
 DWxo8Vjt8L7/9OxBtJdcPa+LN3zdbxHbbvgpFOyElZ0YHnqOtNj/PrNdenqUqQKv2N2T
 1BT9FhL8rGHxkdeKWLTTv/5Oyagw/xVoTvJeUcxGVh0src6IQK2mJCo3uZhqaigatxfu
 7j8vQIf9PcYsOUF61OSF6mgLQz25JkNXK7WY8rJvPfN+TDahxkEQR9orxSVOZ5WxC4DO
 Ij9VBV8/4l7s6lKMDGzUmmEP54k/hBatKogConpXyyKqzkf/WnEC0oX90uYQr+lw/o0y AQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3311yd95au-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 06:46:18 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07JAiiJS141392;
 Wed, 19 Aug 2020 06:46:18 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3311yd95a4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 06:46:17 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07JAgG87008664;
 Wed, 19 Aug 2020 10:46:15 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 330tbvresj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 10:46:15 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 07JAkCD566584900
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Aug 2020 10:46:12 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BEBA552050;
 Wed, 19 Aug 2020 10:46:12 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.70.234])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 687EE5204E;
 Wed, 19 Aug 2020 10:46:12 +0000 (GMT)
Subject: Re: [PATCH] pc-bios: s390x: Only set lowcore iplb address on
 list-directed IPL
To: Cornelia Huck <cohuck@redhat.com>
References: <20200817141734.5109-1-jjherne@linux.ibm.com>
 <20200817183048.30cb6f9e.cohuck@redhat.com>
 <f232a187-c989-cf77-52e5-2e31678e5bed@linux.ibm.com>
 <173257e9-a6cb-48a5-62ed-794c060e3900@linux.ibm.com>
 <20200819114538.7485d580.cohuck@redhat.com>
From: Janosch Frank <frankja@linux.ibm.com>
Autocrypt: addr=frankja@linux.ibm.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <81d2ca24-538a-56ba-04de-079d28a16cb3@linux.ibm.com>
Date: Wed, 19 Aug 2020 12:46:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200819114538.7485d580.cohuck@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0jmvmUpVMijNpT54G5fnXnSDQrBMaE8nL"
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-19_04:2020-08-19,
 2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008190092
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 05:32:56
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jjherne@linux.ibm.com, qemu-s390x@nongnu.org,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0jmvmUpVMijNpT54G5fnXnSDQrBMaE8nL
Content-Type: multipart/mixed; boundary="1p9IgJkV9O4eQc3saoPMbm4LrPpAf1iil"

--1p9IgJkV9O4eQc3saoPMbm4LrPpAf1iil
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/19/20 11:45 AM, Cornelia Huck wrote:
> On Wed, 19 Aug 2020 11:32:34 +0200
> Janosch Frank <frankja@linux.ibm.com> wrote:
>=20
>> On 8/17/20 7:51 PM, Jason J. Herne wrote:
>>> On 8/17/20 12:30 PM, Cornelia Huck wrote: =20
>>>> On Mon, 17 Aug 2020 10:17:34 -0400
>>>> "Jason J. Herne" <jjherne@linux.ibm.com> wrote:
>>>> =20
>>>>> The POP states that the IPLB location is only written to 0x14 for
>>>>> list-directed IPL. Some operating systems expect 0x14 to not change=
 on
>>>>> boot and will fail IPL if it does change.
>>>>>
>>>>> Fixes: 9bfc04f9ef6802fff0 =20
>>>>
>>>> Should be
>>>>
>>>> Fixes: 9bfc04f9ef68 ("pc-bios: s390x: Save iplb location in lowcore"=
)
>>>> =20
>>>>> Signed-off-by: Jason J. Herne <jjherne@linux.ibm.com>
>>>>> Reviewed-by: Janosch Frank <frankja@de.ibm.com>
>>>>> ---
>>>>>   pc-bios/s390-ccw/jump2ipl.c | 5 ++++-
>>>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/pc-bios/s390-ccw/jump2ipl.c b/pc-bios/s390-ccw/jump2ip=
l.c
>>>>> index 767012bf0c..5e3e13f4b0 100644
>>>>> --- a/pc-bios/s390-ccw/jump2ipl.c
>>>>> +++ b/pc-bios/s390-ccw/jump2ipl.c
>>>>> @@ -33,7 +33,10 @@ void jump_to_IPL_code(uint64_t address)
>>>>>   {
>>>>>       /* store the subsystem information _after_ the bootmap was lo=
aded */
>>>>>       write_subsystem_identification();
>>>>> -    write_iplb_location();
>>>>> +
>>>>> +    if (iplb.pbt !=3D S390_IPL_TYPE_CCW) {
>>>>> +            write_iplb_location();
>>>>> +    } =20
>>>>
>>>> What happens for ipl types other than CCW and FCP? IOW, should that
>>>> rather be a positive check for S390_IPL_TYPE_FCP?
>>>> =20
>>>>>  =20
>>>>>       /* prevent unknown IPL types in the guest */
>>>>>       if (iplb.pbt =3D=3D S390_IPL_TYPE_QEMU_SCSI) { =20
>>>> =20
>>>
>>> Based on my (admittedly limited) understanding of the architecture an=
d
>>> code, I believe write_iplb_location() should be called at least for
>>> S390_IPL_TYPE_FCP but I'm not 100% sure on S390_IPL_TYPE_QEMU_SCSI.
>>> Perhaps Janosch has an idea?
>>>
>>> It was originally unconditional, and my new conditional excludes vfio=

>>> CCW which is definitely a step in the right direction, in any case :)=
=2E =20
>>
>> If I remember correctly the problem was that ZIPL used the IPLB lowcor=
e
>> ptr without checking how it was booted (CCW or FCP). That was fixed in=

>> mid of July by testing if diag308 gives back a config or not.
>=20
> So we have the problem that old zipl relies on the presence of a value
> that must not be there if you follow the architecture? Nasty.
>=20
> (Is it really "must not change" vs "don't expect anything here"? Not
> sure if I'm looking at the right part of the documentation.)

Well if the loaded program overwrites absolute 0x0, we shouldn't modify
it if we are not explicitly allowed to, no?

We already talked about saving the exception new addresses and restoring
them before jumping to the new kernel. I think we might need to go a
step further and use a non zero prefix for the bios to avoid any changes
to absolute 0x0.

However that wouldn't fix this dilemma.

>=20
>> So we might have a deadlock situation here which I need to think about=

>> for a bit. I'm setting Viktor CC to get a bit more information about t=
he
>> state of the zipl backports into the distros.
>=20
> Changing this is problematic unless everything we support as a guest is=

> fixed. Does the guest go boom in a way that it is at least easy to
> figure out what went wrong? What breaks when the value continues to be
> set?
>=20
I think it goes into disabled wait because of the failed secure boot
verification or gets a PGM Addressing and then goes into disabled wait,
so no, not very user friendly.


--1p9IgJkV9O4eQc3saoPMbm4LrPpAf1iil--

--0jmvmUpVMijNpT54G5fnXnSDQrBMaE8nL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEwGNS88vfc9+v45Yq41TmuOI4ufgFAl89AvMACgkQ41TmuOI4
ufjbzw//RaE13uUDn74eRd3wUXeoah9W+v1yPOhPyVqyvxwCecJHUILGYYNgCNrA
Jn2KEGAhr6B39eqP+5mDeBCNey6i7h3SWUmkxfUs7b1nminZ5Ri69KtiGm9Cizrz
ERn2C+oY7BKOtsaW9tuYHD0O3HiuxbfPWkuvz5l9MV8lJ+au2jHcHq1pPjqxxFP1
hkzInHWf/5yF04DVuAh92UqlsIfo7LEr46aonlqgFQmYNyxBXokznZEkvIMZF9RB
CNPPoj5pQnIluD+IKVW9x/z3UnaM0PA03zC/Z+77YvAFT0KGcTlchPTpNSxrZfjl
eqbtuq4roSutOqMbq25lapYH96LXtlgn2KWZVrIqpT/+enuK8xHTniJ/SMAXjkfR
EqHkzhzfkViGUKpTq0JzfdNebrJ0LNWyT46lR14x+DeEqenaZ6JokFKKt2Lzx2nN
U6unghDLohwLaZ5r8yJI+TIgicPp8SoqPn9tAJxcWTwzHviH9DWzJVwFo3lhUPRO
VcQeG+C5WCMWQKE4SSmAX9vyW7PYIDeP0BRMWhL/Za1raAR+CQyoiYZaXFM7QbDD
ILiDfG3u3e9tSWMZtHbmuA0WHd32RBzZ/3fiuVv90G09z5/iO7eSuvICUdXm5f2q
QkvRVx9MRRCzx8dEEFk041wP6aAndFfYwa/IGP/QQfurYuY8mi0=
=bPfG
-----END PGP SIGNATURE-----

--0jmvmUpVMijNpT54G5fnXnSDQrBMaE8nL--


