Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id 4580C38A43
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 14:28:53 +0200 (CEST)
Received: from localhost ([::1]:49980 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZDzI-0000YQ-1A
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 08:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46292)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hZDvz-0007Eb-FE
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 08:25:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hZDvx-0004l7-0i
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 08:25:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35246)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hZDvv-0004aq-39
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 08:25:23 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A99BC30C0DC6;
 Fri,  7 Jun 2019 12:25:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-148.ams2.redhat.com
 [10.36.116.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC3C410A48C4;
 Fri,  7 Jun 2019 12:25:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 68AA211386A0; Fri,  7 Jun 2019 14:25:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
References: <87woihi1wl.fsf@dusky.pond.sub.org>
 <20190524185344.GJ10764@habkost.net>
 <87r28k1g4q.fsf@dusky.pond.sub.org>
 <e5372760-7599-3155-44f7-dc704c9cbaa5@redhat.com>
 <875zphg9t8.fsf@dusky.pond.sub.org>
 <47942a1d-efa4-c20d-a854-bd0e3b4ec1f2@redhat.com>
Date: Fri, 07 Jun 2019 14:25:13 +0200
In-Reply-To: <47942a1d-efa4-c20d-a854-bd0e3b4ec1f2@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 7 Jun 2019 10:33:14
 +0200")
Message-ID: <87a7etd1li.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 07 Jun 2019 12:25:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] qapi/misc.json is too big,
 let's bite off a few chunks
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
Cc: "Daniel P. =?utf-8?Q?Berrang?= =?utf-8?Q?=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 6/7/19 8:59 AM, Markus Armbruster wrote:
> [...]
>> QOM is not a particularly active subsystem now: 51 commits in two years.
>>=20
>> We obviously need maintainers to review and merge patches.  The nominal
>> maintainer hasn't been doing that since 2015.  Git shows the following
>> top committers taking on / getting sucked into QOM:
>>=20
>>     Markus Armbruster <armbru@redhat.com>
>>     Eduardo Habkost <ehabkost@redhat.com>
>>     Paolo Bonzini <pbonzini@redhat.com>
>>     Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>     Eric Blake <eblake@redhat.com>
>>=20
>> We really need nominal maintainer(s) again.
>>=20
>> Of course, *active* maintainers would be even better: I consider QOM
>> stuck in an unhappy place where much of its potential is still
>> potential.
>>=20
>> But let's start small.  Volunteers for the reviewer role, please step
>> forward :)
>>=20
>>=20
>>=20
>> The details I promised:
>>=20
>> Output of "scripts/get_maintainer.pl --git --git-since=3D'2-years-ago' |
>> grep commit_signer" sorted by file size:
>>=20
> [...]
>> =3D include/qom/object_interfaces.h =3D
>> Eduardo Habkost <ehabkost@redhat.com> (commit_signer:8/5=3D100%)
>> Igor Mammedov <imammedo@redhat.com> (commit_signer:3/5=3D60%)
>> "Marc-Andr=C3=A9 Lureau" <marcandre.lureau@redhat.com> (commit_signer:2/=
5=3D40%)
>> "Philippe Mathieu-Daud=C3=A9" <f4bug@amsat.org> (commit_signer:2/5=3D40%)
>> Eric Blake <eblake@redhat.com> (commit_signer:1/5=3D20%)
>
> get_maintainer's commit_signer is lying...

Any of Signed-off-by:, Reviewed-by:, Acked-by: counts as
"commit_signer".

[...]
>> =3D qom/trace-events =3D
>> Stefan Hajnoczi <stefanha@redhat.com> (commit_signer:2/2=3D100%)
>> "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com> (commit_signer:2/2=3D1=
00%)
>> Markus Armbruster <armbru@redhat.com> (commit_signer:1/2=3D50%)
>> Michael Tokarev <mjt@tls.msk.ru> (commit_signer:1/2=3D50%)
>
> This 'git log -p' history of this file is very interesting...

Papershuffling...

