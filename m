Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0B632B0F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 10:46:26 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59786 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXibp-0007uO-M8
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 04:46:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hXiZe-0006XG-Qf
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 04:44:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hXiLc-0003Vr-Ea
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 04:29:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45560)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hXiLc-0003Uu-9g
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 04:29:40 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8ACEA30821F4;
	Mon,  3 Jun 2019 08:29:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-223.ams2.redhat.com
	[10.36.117.223])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BAD510013D9;
	Mon,  3 Jun 2019 08:29:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B0DA511386A0; Mon,  3 Jun 2019 10:29:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
References: <20190529150853.9772-1-armbru@redhat.com>
	<20190529150853.9772-3-armbru@redhat.com>
	<CAL1e-=iM9VUkH+ao+pseJ+2jky2JM9L0hPQzjEF_-BJQjnzENw@mail.gmail.com>
Date: Mon, 03 Jun 2019 10:29:35 +0200
In-Reply-To: <CAL1e-=iM9VUkH+ao+pseJ+2jky2JM9L0hPQzjEF_-BJQjnzENw@mail.gmail.com>
	(Aleksandar Markovic's message of "Fri, 31 May 2019 00:40:35 +0200")
Message-ID: <87k1e3t6kw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 03 Jun 2019 08:29:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 2/3] MAINTAINERS: Improve section headlines
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
Cc: Cornelia Huck <cohuck@redhat.com>,
	=?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Aleksandar Markovic <aleksandar.m.mail@gmail.com> writes:

> On May 29, 2019 5:09 PM, "Markus Armbruster" <armbru@redhat.com> wrote:
>>
>> When scripts/get_maintainer.pl reports something like
>>
>>     John Doe <jdoe@example.org> (maintainer:Overall)
>>
>> the user is left to wonder *which* of our three "Overall" sections
>> applies.  We have three, one each under "Guest CPU cores (TCG)",
>> "Guest CPU Cores (KVM)", and "Overall usermode emulation".
>>
>> Rename sections under
>>
>> * "Guest CPU cores (TCG)" from "FOO" to "FOO CPU cores (TCG)"
>>
>> * "Guest CPU Cores (KVM)" from "FOO" to "FOO CPU cores (KVM)"
>>
>> * "Guest CPU Cores (Xen)" from "FOO" to "FOO CPU cores (Xen)"
>>
>
> In its essence definitely not a bad idea, but I must admit I tend to agree
> with Philippe the new titles sound confusing, odd, artificial. Perhaps the
> better alternative could be:
>
> =E2=80=9CFOO TCG guest=E2=80=9D
> =E2=80=9CFOO KVM guest=E2=80=9D
> =E2=80=9CFOO Xen guest=E2=80=9D

Other suggestions mentioned so far:

  "FOO CPUs (TCG)"
  "TCG FOO CPUs"

and same for KVM and Xen.

I guess mentioning target first, accelerator second, no parenthesis
makes sense.  That leaves "guest" vs. "CPUs".  Which one's closer to the
truth?

>> * "Architecture support" from "FOO" to "FOO general architecture
>>   support"
>>
>
> Here we have a kind of strange situation with S390 architecture - it is t=
he
> only one present in this way in MAINTAINERS. Othrr than that, your new
> wording looks fine to me.

Yes, it's odd.  But it's what works for the S390 maintainers.

>> * "Tiny Code Generator (TCG)" from "FOO target" to "FOO TCG target"
>>
>
> I think this one you got it right.

Thanks!

