Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26A81AAA6B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 16:46:31 +0200 (CEST)
Received: from localhost ([::1]:51126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOjJ8-000312-HX
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 10:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48878)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jOjHw-0002Mq-Kw
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 10:45:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jOjHu-0007W0-7K
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 10:45:15 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:40654
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jOjHu-0007VP-16
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 10:45:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586961913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aIKZYJYAVAiALj9/FMppXV+nKFf0TQeFy5yaIyhJzYI=;
 b=NKJ0wxK+zwyzKhnaSEImAcCKN8OYz/3RgaXH4M1BbNd6r4YANfeeHyJlgk3V6xMmjVnJlW
 ZsGoA6EcHTSe1IDFRyS71j2/YYDLOaV26MTWYFfeFhmDwQJHzwuFm7+Bx9qLxwKxWGFAVC
 KiTs56vGZg0sNs7jNvvOwPHsd2wYwCM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-lju12_ibNN2Rossj_-AB4w-1; Wed, 15 Apr 2020 10:45:10 -0400
X-MC-Unique: lju12_ibNN2Rossj_-AB4w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7B87802563;
 Wed, 15 Apr 2020 14:45:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-20.ams2.redhat.com
 [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 581C81265A0;
 Wed, 15 Apr 2020 14:45:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AEB6311385C8; Wed, 15 Apr 2020 16:45:00 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH for-5.1 1/8] tests-qemu-opts: Cover has_help_option(),
 qemu_opt_has_help_opt()
References: <20200409153041.17576-1-armbru@redhat.com>
 <20200409153041.17576-2-armbru@redhat.com>
 <8ea167d6-2784-1ab9-cf55-52eb7553cb4d@redhat.com>
 <878siyxwir.fsf@dusky.pond.sub.org>
 <20200414131339.GE7747@linux.fritz.box>
 <87v9m2p4to.fsf@dusky.pond.sub.org>
 <20200414142954.GH7747@linux.fritz.box>
 <874ktlomey.fsf@dusky.pond.sub.org>
 <20200415100024.GA6916@linux.fritz.box>
Date: Wed, 15 Apr 2020 16:45:00 +0200
In-Reply-To: <20200415100024.GA6916@linux.fritz.box> (Kevin Wolf's message of
 "Wed, 15 Apr 2020 12:00:24 +0200")
Message-ID: <87pnc8g64z.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 14.04.2020 um 22:13 hat Markus Armbruster geschrieben:
>> Kevin Wolf <kwolf@redhat.com> writes:
>>=20
>> > Am 14.04.2020 um 15:36 hat Markus Armbruster geschrieben:
>> >> Kevin Wolf <kwolf@redhat.com> writes:
>> >> > Am 14.04.2020 um 11:10 hat Markus Armbruster geschrieben:
>> >> >> Eric Blake <eblake@redhat.com> writes:
>> >> >> > On 4/9/20 10:30 AM, Markus Armbruster wrote:
>> >> >> >> +        { "helpme", false, false, false },
>> >> >> >> +        { "a,help", true, true, true },
>> >> >> >> +        { "a=3D0,help,b", true, true, true },
>> >> >> >> +        { "help,b=3D1", true, true, false },
>> >> >> >> +        { "a,b,,help", false /* BUG */, true, true },
>> >> >> >
>> >> >> > So which way are you calling the bug?  Without looking at the co=
de but
>> >> >> > going off my intuition, I parse this as option 'a' and option
>> >> >> > 'b,help'. The latter is not a normal option name because it cont=
ains a
>> >> >> > ',', but is a valid option value.
>> >> >> >
>> >> >> > I agree that we have a bug, but I'm not yet sure in which direct=
ion
>> >> >> > the bug lies (should has_help_option be fixed to report true, in=
 which
>> >> >> > case the substring ",help" has precedence over ',,' escaping; or
>> >> >> > should qemu_opt_has_help_opt be fixed to report false, due to tr=
eating
>> >> >> > 'b,help' after ',,' escape removal as an invalid option name).  =
So the
>> >> >> > placement of the /* BUG */ comment matters - where you placed it=
, I'm
>> >> >> > presuming that later in the series you change has_help_option to
>> >> >> > return true, even though that goes against my intuitive parse.
>> >> >>=20
>> >> >> In addition to the canonical QemuOpts parser opts_do_parse(), we h=
ave
>> >> >> several more, and of course they all differ from the canonical one=
 for
>> >> >> corner cases.
>> >> >>=20
>> >> >> I treat the canonical one as correct, and fix the others by elimin=
ating
>> >> >> the extra parsers.
>> >> >>=20
>> >> >> The others are:
>> >> >>=20
>> >> >> * has_help_option()
>> >> >>=20
>> >> >>   Fixed in PATCH 5 by reusing the guts of opts_do_parse().
>> >> >>=20
>> >> >> * is_valid_option_list()
>> >> >>=20
>> >> >>   Fixed in PATCH 8 by not parsing.
>> >> >>=20
>> >> >> * "id" extraction in opts_parse()
>> >> >>=20
>> >> >>   Lazy hack.  Fixed in PATCH 3 by reusing the guts of opts_do_pars=
e().
>> >> >>=20
>> >> >> Back to your question: the value of has_help_option() differs from=
 the
>> >> >> value of qemu_opt_has_help_opt().  The latter uses the canonical p=
arser,
>> >> >> the former is one of the other parsers.  I therefore judge the lat=
ter
>> >> >> right and the former wrong.
>> >> >
>> >> > Shouldn't we also consider what users would reasonably expect?
>> >>=20
>> >> Of course we should consider reasonable user expectations.
>> >>=20
>> >> Grumpy aside: when I do, I commonly run into objections that users
>> >> reasonably expect things not to change.
>> >
>> > Fair point. It's not always easy to tell whether something should be
>> > considered a bug in the external interface (and consequently be fixed)
>> > or just an idiosyncrasy that people may have get used to (and therefor=
e
>> > requires deprecation before improving it).
>> >
>> > In this specific case, I'm not aware of empty option names actually
>> > doing anything useful anywhere, so I think it might be clearer in this
>> > case that it's indeed a bug.
>>=20
>> You're right in that backward compatibility is not a convincing argument
>> for stuff that has no known productive uses, and is bonkers to boot.
>>=20
>> >> > Getting it parsed as an empty option name (I assume with a default =
value
>> >> > of "on"?) certainly looks like something that would surprise most u=
sers
>> >> > and, as you can see, even some QEMU developers.
>> >>=20
>> >> My preferred way to address QemuOpts parsing madness is replacing it
>> >> wholesale by keyval.c, but that's some time off, I'm afraid.
>> >>=20
>> >> This series merely aims for more method to the same old madness.
>> >
>> > I understand. Though I think replacing with keyval will be potentially
>> > less problematic if QemuOpts already behaved more similar.
>> >
>> > If I were writing the code, I think I would use existing bugs and
>> > inconsistencies as an excuse to make QemuOpts behave more like what
>> > keyval can easily handle by declaring whatever is closest to keyval as
>> > the correct interpretation.
>>=20
>> Fair enough.
>>=20
>> However,
>>=20
>> (1) is_valid_option_list()'s and opts_do_parse()'s parse of "a,b,,help"
>>     are equidistant from keyval_parse()'s:
>>=20
>>     opts_do_parse() splits it into four parts:
>>=20
>>         "a"     (desugared to a=3Don)
>>         "b"     (desugared to b=3Don)
>>         ""      (desugared to =3Don)
>>         "help"  (desugared to help=3Don)
>>=20
>>     has_help_option() splits it into two:
>>=20
>>         "a"
>>         "b,help"
>>=20
>>     keyval_parse() fails:
>>=20
>>         Expected '=3D' after parameter 'a'
>>=20
>>     If I it implemented boolean sugar, then it would fail at the third
>>     comma, just like ",help" fails now:
>>=20
>>         Invalid parameter ''
>>=20
>>     Fails because ",help" does not start with a valid name.
>>=20
>>     Thus, the answer to the question which of the two functions covered
>>     by the test are wrong would be "both".
>
> opts_do_parse() can return an error. So maybe what we should do is
> rejecting empty option names there?
>
>> (2) This series tries hard not to write QemuOpts parsing code.  It
>>     throws away QemuOpts parsing code.
>
> Arguably, an additional error is writing QemuOpts parsing code, but
> maybe little enough that it's tolerable?

The patch would be simple enough, but I dread writing the commit
message.

I permitted myself to get sidetracked into this series, I'm desperate to
get it out of the way and return to the work I actually want to do.


