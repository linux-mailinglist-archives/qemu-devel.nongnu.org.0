Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAE31A99CC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 12:01:36 +0200 (CEST)
Received: from localhost ([::1]:46988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOerP-0003wW-Cj
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 06:01:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40146)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jOeqP-0003Gt-6Z
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 06:00:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jOeqN-0003L4-A2
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 06:00:32 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:41056
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jOeqN-0003Kq-3q
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 06:00:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586944830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jEinIajyiTTyQBHR1LR5vPwYfjC99Wl8BYhwRV8qraM=;
 b=IglVopYblieCjKYdUq/WB9TTbYkS8nuCyDSO4cD3k2bWo1fLnzNCVRCE9KW681D9Dx7FDR
 ZbGHPSYRr5zoBsIlS1+KqPEXI4SPrs77i33hcdRA4BIL85nqweNblxJ5ZPTjDE3mPDw0IK
 qV7xATJTNyqnnAkohaCXoX+5QNNWebU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-75GDrLckNZ22naBJieuiCw-1; Wed, 15 Apr 2020 06:00:28 -0400
X-MC-Unique: 75GDrLckNZ22naBJieuiCw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 922D518C8C00;
 Wed, 15 Apr 2020 10:00:27 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-71.ams2.redhat.com [10.36.114.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 574E8118DF4;
 Wed, 15 Apr 2020 10:00:25 +0000 (UTC)
Date: Wed, 15 Apr 2020 12:00:24 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH for-5.1 1/8] tests-qemu-opts: Cover has_help_option(),
 qemu_opt_has_help_opt()
Message-ID: <20200415100024.GA6916@linux.fritz.box>
References: <20200409153041.17576-1-armbru@redhat.com>
 <20200409153041.17576-2-armbru@redhat.com>
 <8ea167d6-2784-1ab9-cf55-52eb7553cb4d@redhat.com>
 <878siyxwir.fsf@dusky.pond.sub.org>
 <20200414131339.GE7747@linux.fritz.box>
 <87v9m2p4to.fsf@dusky.pond.sub.org>
 <20200414142954.GH7747@linux.fritz.box>
 <874ktlomey.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <874ktlomey.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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

Am 14.04.2020 um 22:13 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
>=20
> > Am 14.04.2020 um 15:36 hat Markus Armbruster geschrieben:
> >> Kevin Wolf <kwolf@redhat.com> writes:
> >> > Am 14.04.2020 um 11:10 hat Markus Armbruster geschrieben:
> >> >> Eric Blake <eblake@redhat.com> writes:
> >> >> > On 4/9/20 10:30 AM, Markus Armbruster wrote:
> >> >> >> +        { "helpme", false, false, false },
> >> >> >> +        { "a,help", true, true, true },
> >> >> >> +        { "a=3D0,help,b", true, true, true },
> >> >> >> +        { "help,b=3D1", true, true, false },
> >> >> >> +        { "a,b,,help", false /* BUG */, true, true },
> >> >> >
> >> >> > So which way are you calling the bug?  Without looking at the cod=
e but
> >> >> > going off my intuition, I parse this as option 'a' and option
> >> >> > 'b,help'. The latter is not a normal option name because it conta=
ins a
> >> >> > ',', but is a valid option value.
> >> >> >
> >> >> > I agree that we have a bug, but I'm not yet sure in which directi=
on
> >> >> > the bug lies (should has_help_option be fixed to report true, in =
which
> >> >> > case the substring ",help" has precedence over ',,' escaping; or
> >> >> > should qemu_opt_has_help_opt be fixed to report false, due to tre=
ating
> >> >> > 'b,help' after ',,' escape removal as an invalid option name).  S=
o the
> >> >> > placement of the /* BUG */ comment matters - where you placed it,=
 I'm
> >> >> > presuming that later in the series you change has_help_option to
> >> >> > return true, even though that goes against my intuitive parse.
> >> >>=20
> >> >> In addition to the canonical QemuOpts parser opts_do_parse(), we ha=
ve
> >> >> several more, and of course they all differ from the canonical one =
for
> >> >> corner cases.
> >> >>=20
> >> >> I treat the canonical one as correct, and fix the others by elimina=
ting
> >> >> the extra parsers.
> >> >>=20
> >> >> The others are:
> >> >>=20
> >> >> * has_help_option()
> >> >>=20
> >> >>   Fixed in PATCH 5 by reusing the guts of opts_do_parse().
> >> >>=20
> >> >> * is_valid_option_list()
> >> >>=20
> >> >>   Fixed in PATCH 8 by not parsing.
> >> >>=20
> >> >> * "id" extraction in opts_parse()
> >> >>=20
> >> >>   Lazy hack.  Fixed in PATCH 3 by reusing the guts of opts_do_parse=
().
> >> >>=20
> >> >> Back to your question: the value of has_help_option() differs from =
the
> >> >> value of qemu_opt_has_help_opt().  The latter uses the canonical pa=
rser,
> >> >> the former is one of the other parsers.  I therefore judge the latt=
er
> >> >> right and the former wrong.
> >> >
> >> > Shouldn't we also consider what users would reasonably expect?
> >>=20
> >> Of course we should consider reasonable user expectations.
> >>=20
> >> Grumpy aside: when I do, I commonly run into objections that users
> >> reasonably expect things not to change.
> >
> > Fair point. It's not always easy to tell whether something should be
> > considered a bug in the external interface (and consequently be fixed)
> > or just an idiosyncrasy that people may have get used to (and therefore
> > requires deprecation before improving it).
> >
> > In this specific case, I'm not aware of empty option names actually
> > doing anything useful anywhere, so I think it might be clearer in this
> > case that it's indeed a bug.
>=20
> You're right in that backward compatibility is not a convincing argument
> for stuff that has no known productive uses, and is bonkers to boot.
>=20
> >> > Getting it parsed as an empty option name (I assume with a default v=
alue
> >> > of "on"?) certainly looks like something that would surprise most us=
ers
> >> > and, as you can see, even some QEMU developers.
> >>=20
> >> My preferred way to address QemuOpts parsing madness is replacing it
> >> wholesale by keyval.c, but that's some time off, I'm afraid.
> >>=20
> >> This series merely aims for more method to the same old madness.
> >
> > I understand. Though I think replacing with keyval will be potentially
> > less problematic if QemuOpts already behaved more similar.
> >
> > If I were writing the code, I think I would use existing bugs and
> > inconsistencies as an excuse to make QemuOpts behave more like what
> > keyval can easily handle by declaring whatever is closest to keyval as
> > the correct interpretation.
>=20
> Fair enough.
>=20
> However,
>=20
> (1) is_valid_option_list()'s and opts_do_parse()'s parse of "a,b,,help"
>     are equidistant from keyval_parse()'s:
>=20
>     opts_do_parse() splits it into four parts:
>=20
>         "a"     (desugared to a=3Don)
>         "b"     (desugared to b=3Don)
>         ""      (desugared to =3Don)
>         "help"  (desugared to help=3Don)
>=20
>     has_help_option() splits it into two:
>=20
>         "a"
>         "b,help"
>=20
>     keyval_parse() fails:
>=20
>         Expected '=3D' after parameter 'a'
>=20
>     If I it implemented boolean sugar, then it would fail at the third
>     comma, just like ",help" fails now:
>=20
>         Invalid parameter ''
>=20
>     Fails because ",help" does not start with a valid name.
>=20
>     Thus, the answer to the question which of the two functions covered
>     by the test are wrong would be "both".

opts_do_parse() can return an error. So maybe what we should do is
rejecting empty option names there?

> (2) This series tries hard not to write QemuOpts parsing code.  It
>     throws away QemuOpts parsing code.

Arguably, an additional error is writing QemuOpts parsing code, but
maybe little enough that it's tolerable?

Kevin


