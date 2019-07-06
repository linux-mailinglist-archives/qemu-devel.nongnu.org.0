Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 187B760EA9
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Jul 2019 06:03:52 +0200 (CEST)
Received: from localhost ([::1]:57620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjbvS-00038t-EN
	for lists+qemu-devel@lfdr.de; Sat, 06 Jul 2019 00:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52145)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hjbuA-0002He-Oe
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 00:02:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hjbu8-0004Yw-QL
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 00:02:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44726)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hjbu7-0004XR-DM
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 00:02:27 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E2A9130054AB
 for <qemu-devel@nongnu.org>; Sat,  6 Jul 2019 04:02:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-111.ams2.redhat.com
 [10.36.116.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C8038681E;
 Sat,  6 Jul 2019 04:02:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E9E9F1132ABF; Sat,  6 Jul 2019 06:02:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
References: <20190703171005.26231-1-philmd@redhat.com>
 <20190703172501.GI23082@redhat.com>
 <20190704102457.GE1609@stefanha-x1.localdomain>
 <20190704102837.GA24190@redhat.com>
 <20190705080717.GD10995@stefanha-x1.localdomain>
 <8470a203-430b-1814-b2ef-6adf3fa739a6@redhat.com>
 <87d0iok4ai.fsf@dusky.pond.sub.org>
 <c4997dee-932c-eb57-23b9-4b51e8856f91@redhat.com>
Date: Sat, 06 Jul 2019 06:02:18 +0200
In-Reply-To: <c4997dee-932c-eb57-23b9-4b51e8856f91@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 5 Jul 2019 19:53:09
 +0200")
Message-ID: <874l3zhktx.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Sat, 06 Jul 2019 04:02:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC PATCH-for-4.2] tracing: Allow to tune tracing
 options via the environment
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
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 7/5/19 3:19 PM, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>> On 7/5/19 10:07 AM, Stefan Hajnoczi wrote:
>>>> On Thu, Jul 04, 2019 at 11:28:37AM +0100, Daniel P. Berrang=C3=A9 wrot=
e:
>>>>> On Thu, Jul 04, 2019 at 11:24:57AM +0100, Stefan Hajnoczi wrote:
[...]
>>>>>> What is the concern about adding these environment variables to QEMU?
>>>>>>
>>>>>> It is convenient to be able to use tracing even if QEMU is invoked by
>>>>>> something you cannot modify/control.
>>>>>>
>>>>>> The main issues I see with environment variables are:
>>>>>>
>>>>>> 1. Security.  Is there a scenario where an attacker can use environm=
ent
>>>>>>    variables to influence the behavior of a QEMU process running at a
>>>>>>    different trust level?
>>=20
>> The common (and sad) solution for this is to require whatever runs $PROG
>> at a different trust level to scrub the environment.
>
> I hope people concerned by security build QEMU with the NOP trace backend.

I sure hope at least one of our tracing backends (other than nop) can be
used safely in production.

>>>>>> 2. Name collision.  What is the chance that existing users already
>>>>>>    define environment variables with these names and that unexpected
>>>>>>    behavior could result?
[...]

