Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CB03E580B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 12:13:19 +0200 (CEST)
Received: from localhost ([::1]:51508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDOl4-0007K1-DN
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 06:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1mDOk6-0006e8-Lw
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 06:12:18 -0400
Received: from redisdead.crans.org ([185.230.79.39]:50680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1mDOk4-0001xv-BP
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 06:12:18 -0400
Received: from [IPv6:2a0c:700:3012:13:3608:d884:9339:52cc] (unknown
 [IPv6:2a0c:700:3012:13:3608:d884:9339:52cc])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id 834781FE;
 Tue, 10 Aug 2021 12:12:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1628590333; bh=QPovpItE/FdNu6mJgONJ3DYqp2kRIV3sxYxdV6/+sgw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=aIQrvjLKZYBb2R7bUcp+K18Ik3jjEAgQ0ao7uE0J2ywwhBOKoDkT0t1tEBJg/O1ee
 LaNSiDgKbRZt9SN9UKHuqY3Fzga8KINfETPnHfvqyFKR2YUOUMf7HitsLu0Gda2jj8
 S5HGiZlE9f7U+e2WMzIcxovb55+aCv4+RiW98z3WgdbxMKUU+ApGK4ZG3ZXwrR2MUW
 v2QyRjLg/NZJO1J2dbQ29s++whOI0LR8sS7T+eEBk3rm2Mgy8o1jTE3jR0v7Qco+LS
 DjbjmM7dPWlqie4Pi48jEYwhTeENGKh2lM2KxIpqhnonKkbL5oFBNCD8Bv8jYenhiC
 qTZZatM014WNoAAYKgtjQZuSXyMtxIcRkj6ndgg6BOcFcMGitBUE8cR3g35ZG0vhBa
 pcVaeiRhFAkTxSaGxnXcQqRVg2y9R9vpE6ztKY3q8PykvPCVFs+Q1DnrKE0mhNS/9t
 y1KAsPQNDuqjFkX1b/ZYFPyocRIH6AxY0NNoxVBdswWF9IHQHpBhfdtW6hlvdYiAPk
 hUYQW4STVBDcr8PYvguzxuVopCIaYfWlpYW0t78ZWuXcvpmxbOqqEIKiu3ZLMG+Xei
 PngsC1LI3aqRWJFt1YeCG+RpEhlVPZus2l0o+7ptnlyfInnsNuQfn7O6fZhVsu8K5q
 ooHo8PKtnVZc4TjBL1g7kg8A=
Subject: Re: [PATCH] docs/devel: fix missing antislash
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20210809173141.1714998-1-erdnaxe@crans.org>
 <20210809181410.3rzvwtsawwadl6u4@habkost.net>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Message-ID: <be9d75c7-f6ad-da24-318d-ec1af567ad54@crans.org>
Date: Tue, 10 Aug 2021 12:12:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210809181410.3rzvwtsawwadl6u4@habkost.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4zeMnA1cBNaZnP5hdAzN0mYtUCocqJDGK"
Received-SPF: pass client-ip=185.230.79.39; envelope-from=erdnaxe@crans.org;
 helo=redisdead.crans.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4zeMnA1cBNaZnP5hdAzN0mYtUCocqJDGK
Content-Type: multipart/mixed; boundary="D8AYyK8Q3TKTy6fsfzA7xgHl5TsOlJ8UA";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
Message-ID: <be9d75c7-f6ad-da24-318d-ec1af567ad54@crans.org>
Subject: Re: [PATCH] docs/devel: fix missing antislash
References: <20210809173141.1714998-1-erdnaxe@crans.org>
 <20210809181410.3rzvwtsawwadl6u4@habkost.net>
In-Reply-To: <20210809181410.3rzvwtsawwadl6u4@habkost.net>

--D8AYyK8Q3TKTy6fsfzA7xgHl5TsOlJ8UA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/9/21 8:14 PM, Eduardo Habkost wrote:
> On Mon, Aug 09, 2021 at 07:31:41PM +0200, Alexandre Iooss wrote:
>> Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
>> ---
>>   docs/devel/qom.rst | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
>> index e5fe3597cd..b9568c0fb8 100644
>> --- a/docs/devel/qom.rst
>> +++ b/docs/devel/qom.rst
>> @@ -309,7 +309,7 @@ This is equivalent to the following:
>>              OBJECT_GET_CLASS(MyDeviceClass, obj, TYPE_MY_DEVICE)
>>      #define MY_DEVICE_CLASS(void *klass) \
>>              OBJECT_CLASS_CHECK(MyDeviceClass, klass, TYPE_MY_DEVICE)
>> -   #define MY_DEVICE(void *obj)
>> +   #define MY_DEVICE(void *obj) \
>>              OBJECT_CHECK(MyDevice, obj, TYPE_MY_DEVICE)
>=20
> Oops, nice catch!
>=20
> However, the code above is already going to be deleted by:
> https://lore.kernel.org/qemu-devel/20210729175554.686474-9-ehabkost@red=
hat.com
>=20

Oh I was not aware of that new patch, it looks great while also solving=20
the anti-slash problem!

Thanks,
-- Alexandre


--D8AYyK8Q3TKTy6fsfzA7xgHl5TsOlJ8UA--

--4zeMnA1cBNaZnP5hdAzN0mYtUCocqJDGK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmESUP0FAwAAAAAACgkQbHknjz/NzAKr
qg/7B9JIdB164moP0NqMHTWQg8nSti32GH0wKLeAZ5Ijl6SVLrTMHs3NIa46BY8W+5p7MHL3QyKG
2vmQgX3rFg2DtUu/Ioa5qeTr77cN0OGw2fwoZk7wiH5lK/6a4oKOpCA4djyIQTW9+w5V0p6Gz+/1
kCMKOkEzsLrT1BevhX9ogCX1Tpkl+xxONTPqBpowqrVPeGlgoZueUYkl4PInZOA9Qfw9Ov/EoOL8
E40mqIKWDnxeoF/2G85nNi/08SbX2wL4Z7MJ0qyeUGZ/MB7mrT9ubMohoYaUJF+BiIx7WOURzhLC
LBY2eI2D3opvFhOfK+57MeJs7TzqDix+0+8fqub5yyDMhpjmkZL9te/cZbyWFYqtHHbXtZbgEwhk
V0ERWK55+KJ9niX/2xQfMru1xoRlPJV2sWf/ELnxGCLl2pbppUl2tLDnecjkWIK1t7gobyFn2M5K
pOZL4OTCRAOYjSKJwPiT+jLeRcTAph9NszmwBNqvC/lU1qJuBGFJjirFKWF8SnJFlYYwReAXvCjI
25NEsA+FBo9jnyNtJXRJHL6p+aZAPn7mXJ5tQIdZLDmJ5Iwb995/KDzwR6NlDKkiARGCC+SE6ElU
uS9rRrE2aKR26Ch5/iq05qooWgYD6nhQGKvHALLjuz3RpdnuIzLX67IUik/66nuruZ/m7CJB/Kwy
Ygs=
=F8NO
-----END PGP SIGNATURE-----

--4zeMnA1cBNaZnP5hdAzN0mYtUCocqJDGK--

