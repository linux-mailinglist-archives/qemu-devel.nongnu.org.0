Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B21F514A240
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 11:48:57 +0100 (CET)
Received: from localhost ([::1]:42852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iw1wu-0001Oa-P0
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 05:48:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42771)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iw1mj-0004mE-EP
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 05:38:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iw1mh-0003wJ-Id
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 05:38:25 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42638
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iw1mh-0003vQ-F8
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 05:38:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580121502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=FMP2wnUomGRsovJC75jId5K7HAlKkXq7+QAFOH08FH4=;
 b=Kvi2nwViEKFzfb0VImDbyMPWgqpExkIxlZyzBA0xwEGzGk7GzMsXjVUwHzKqW6Q5NbBri2
 8dZfTz5obrP8kDQLlmQ+gbIShJB/92zfuTtb/hrOm7pXdJ1IHHdcKJ0RNJvadMxllvkIni
 vWBeNs7IehEyKb707em5S4G8/YJkFzY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-KxRNmUnPMKO_HUbKk20FfA-1; Mon, 27 Jan 2020 05:38:19 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E116410054E3;
 Mon, 27 Jan 2020 10:38:17 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-117-94.ams2.redhat.com [10.36.117.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 771405D9C5;
 Mon, 27 Jan 2020 10:38:13 +0000 (UTC)
Subject: Re: [PATCH] tests/acceptance: Add boot tests for some of the QEMU
 advent calendar images
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
References: <20200124170325.30072-1-thuth@redhat.com>
 <8f085a1a-b9df-29d4-db51-eb345a44a971@redhat.com>
 <1f564925-2ee1-ab17-a946-f9bcd656926f@redhat.com>
 <4d5fe645-0652-893f-4e6b-2929849d3cdc@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <168c4f7b-fda5-2d9f-15b8-7100d5b0974d@redhat.com>
Date: Mon, 27 Jan 2020 11:38:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4d5fe645-0652-893f-4e6b-2929849d3cdc@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: KxRNmUnPMKO_HUbKk20FfA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/01/2020 19.38, Philippe Mathieu-Daud=C3=A9 wrote:
> On 1/25/20 5:43 PM, Thomas Huth wrote:
>> On 24/01/2020 22.28, Wainer dos Santos Moschetta wrote:
>>>
>>> On 1/24/20 3:03 PM, Thomas Huth wrote:
>>>> The 2018 edition of the QEMU advent calendar 2018 featured Linux image=
s
>>>> for various non-x86 machines. We can use them for a boot tests in our
>>>> acceptance test suite.
>=20
> Excellent idea!
>=20
>>>>
>>>> Let's also make sure that we build the corresponding machines in Travi=
s,
>>>> and while we're there, drop the superfluous --python parameter (python=
3
>>>> is now the only supported version anyway).
>=20
> I'd rather see this change as another commit.

I thought so, too, often it is good to separate stuff into separate
commits, but in this case, it's not source code but just the CI yml
file, and the change is really trivial, so it rather sounds like
superfluous churn to me in this case to do it in a separate patch...

>>> Yes, please, removal of --python was in my wish list.
>>>
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>> =C2=A0 .travis.yml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>>>> =C2=A0 tests/acceptance/boot_linux_console.py | 96 +++++++++++++++++++=
+++++++
>>>> =C2=A0 2 files changed, 97 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/.travis.yml b/.travis.yml
>>>> index 6c1038a0f1..73ca12c921 100644
>>>> --- a/.travis.yml
>>>> +++ b/.travis.yml
>>>> @@ -268,7 +268,7 @@ matrix:
>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Acceptance (Functional) tests
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - env:
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - CONFIG=3D"--python=3D/us=
r/bin/python3
>>>> --target-list=3Dx86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-s=
oftmmu,arm-softmmu,s390x-softmmu,alpha-softmmu,ppc-softmmu,ppc64-softmmu,m6=
8k-softmmu,sparc-softmmu"
>>>>
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -
>>>> CONFIG=3D"--target-list=3Daarch64-softmmu,alpha-softmmu,arm-softmmu,m6=
8k-softmmu,microblaze-softmmu,mips-softmmu,mips64el-softmmu,nios2-softmmu,o=
r1k-softmmu,ppc-softmmu,ppc64-softmmu,s390x-softmmu,sparc-softmmu,x86_64-so=
ftmmu,xtensa-softmmu"
>>>>
>>>
>>>
>>> Perhaps use MAIN_SOFTMMU_TARGETS in only append the other targets, like=
:
>>>
>>> --target-list=3D${MAIN_SOFTMMU_TARGETS},alpha-softmmu,sparc-softmmu,...=
.
>>
>> Not sure ... while it is a nice way to shorten the line here, it adds a
>> dependency to that variable ... and MAIN_SOFTMMU_TARGETS has been change=
d
>> a couple of times during the course of time, so we might risk to lose
>> some testing coverage here in case someone removes a target from
>> MAIN_SOFTMMU_TARGETS but forgets to add it here again...? I think we
>> should better use the explicit list here instead.
>=20
> Maybe related: "Split enterprise vs. hobbyist acceptance test job"
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg644683.html

I guess naming/splitting is hard in this case ... many targets contain
both, "enterprise" and "hobbyist" machines ... and as long as the Travis
job runs reasonably fast, it's also not really necessary to split it.
The only real ugliness is the very long line - I haven't found a way yet
to correctly wrap this in the YML file to multiple lines .... does
anybody know how to do this in YML?

> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Thanks!

 Thomas


