Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D33413814
	for <lists+qemu-devel@lfdr.de>; Sat,  4 May 2019 09:19:01 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52482 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMowm-0005X6-BV
	for lists+qemu-devel@lfdr.de; Sat, 04 May 2019 03:19:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hMovi-00055j-M7
	for qemu-devel@nongnu.org; Sat, 04 May 2019 03:17:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hMovh-0000Mc-DF
	for qemu-devel@nongnu.org; Sat, 04 May 2019 03:17:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40770)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>) id 1hMovh-0000MJ-5l
	for qemu-devel@nongnu.org; Sat, 04 May 2019 03:17:53 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 03DDC308A958;
	Sat,  4 May 2019 07:17:52 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-38.ams2.redhat.com [10.36.116.38])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C179F39BD;
	Sat,  4 May 2019 07:17:50 +0000 (UTC)
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20190503004130.8285-1-ehabkost@redhat.com>
	<20190503004130.8285-20-ehabkost@redhat.com>
	<40c4d236-ed76-e433-51d5-c9feabb4374a@redhat.com>
	<20190503210011.GW28722@habkost.net>
	<20190503213457.GX28722@habkost.net>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <b86fd845-ba4b-6e27-73ac-50b2c8810fe8@redhat.com>
Date: Sat, 4 May 2019 09:17:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503213457.GX28722@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Sat, 04 May 2019 07:17:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PULL 19/19] configure: automatically pick python3
 is available
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/05/2019 23.34, Eduardo Habkost wrote:
> On Fri, May 03, 2019 at 06:00:11PM -0300, Eduardo Habkost wrote:
>> On Fri, May 03, 2019 at 06:41:43PM +0200, Thomas Huth wrote:
>>> On 03/05/2019 02.41, Eduardo Habkost wrote:
>>>> From: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>>>>
>>>> Unless overridden via an env var or configure arg, QEMU will only lo=
ok
>>>> for the 'python' binary in $PATH. This is unhelpful on distros which
>>>> are only shipping Python 3.x (eg Fedora) in their default install as=
,
>>>> if they comply with PEP 394, the bare 'python' binary won't exist.
>>>>
>>>> This changes configure so that by default it will search for all thr=
ee
>>>> common python binaries, preferring to find Python 3.x versions.
>>>>
>>>> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>>>> Message-Id: <20190327170701.23798-1-berrange@redhat.com>
>>>> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>>>> ---
>>>>  configure | 18 +++++++++++++++---
>>>>  1 file changed, 15 insertions(+), 3 deletions(-)
>>>
>>> I haven't bisected it, but I think this patch here broke the gitlab-c=
i tests:
>>>
>>>  https://gitlab.com/huth/qemu/-/jobs/206806257
>>>
>>> Seems like the test is now failing when you don't have an UTF-8 local=
e:
>>>
>>>  LANG=3DC make check-qapi-schema
>>
>> I couldn't reproduce it this way, probably because I'm running Python =
3.7 which
>> implements PEP 538 ("Coercing the legacy C locale to a UTF-8 based loc=
ale").
>>
>> But I can force it to break using:
>>
>>   PYTHONIOENCODING=3Dascii make check-qapi-schema
>>
>>>  [...]
>>>  TEST    tests/qapi-schema/union-base-empty.out
>>>  --- /builds/huth/qemu/tests/qapi-schema/unicode-str.err	2019-05-03 1=
5:21:39.000000000 +0000
>>>  +++ -	2019-05-03 15:42:01.561762978 +0000
>>>  @@ -1 +1 @@
>>>  -tests/qapi-schema/unicode-str.json:2: 'command' uses invalid name '=
=C3=A9'
>>>  +tests/qapi-schema/unicode-str.json:2: 'command' uses invalid name '=
\xe9'
>>>  /builds/huth/qemu/tests/Makefile.include:1105: recipe for target 'ch=
eck-tests/qapi-schema/unicode-str.json' failed
>>>  make: *** [check-tests/qapi-schema/unicode-str.json] Error 1
>>>
>>> Any ideas how to fix this?
>>
>> Probably we just need to specify an explicit encoding at the statement=
 that
>> prints the error message to stderr.  I will give it a try.
>=20
> Forcing a specific encoding inside test-qapi.py would very easy
> on Python 3.7+ (sys.stderr.reconfigure(...)), but tricky on older
> versions.  I believe this is the simplest way to fix the problem
> on Python 3.5 and 3.6.
>=20
> Can somebody confirm this really fixes the problem on gitlab-ci?
>=20
> ---
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 7c8b9c84b2..af88ab6f8b 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -1103,7 +1103,7 @@ check-tests/qemu-iotests-quick.sh: tests/qemu-iot=
ests-quick.sh qemu-img$(EXESUF)
>  .PHONY: $(patsubst %, check-%, $(check-qapi-schema-y))
>  $(patsubst %, check-%, $(check-qapi-schema-y)): check-%.json: $(SRC_PA=
TH)/%.json
>  	$(call quiet-command, PYTHONPATH=3D$(SRC_PATH)/scripts \
> -		$(PYTHON) $(SRC_PATH)/tests/qapi-schema/test-qapi.py \
> +		PYTHONIOENCODING=3Dutf-8 $(PYTHON) $(SRC_PATH)/tests/qapi-schema/tes=
t-qapi.py \
>  		$^ >$*.test.out 2>$*.test.err; \
>  		echo $$? >$*.test.exit, \
>  		"TEST","$*.out")

Yes, thanks, this seems to fix this issue:

 https://gitlab.com/huth/qemu/-/jobs/207041381

It also works on my laptop now (which uses Python 3.6).

 Thomas

