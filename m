Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B74761C74
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jul 2019 11:36:07 +0200 (CEST)
Received: from localhost ([::1]:39798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkQ46-0003UL-7l
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 05:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48418)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berrange@redhat.com>) id 1hkQ2P-0002GC-VN
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 05:34:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1hkQ2O-0005yM-JV
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 05:34:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40578)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hkQ2L-0005sQ-CK
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 05:34:18 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B152B30C0DD9
 for <qemu-devel@nongnu.org>; Mon,  8 Jul 2019 09:34:07 +0000 (UTC)
Received: from redhat.com (unknown [10.42.17.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 57D311838C;
 Mon,  8 Jul 2019 09:34:02 +0000 (UTC)
Date: Mon, 8 Jul 2019 10:34:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20190708093400.GB3082@redhat.com>
References: <20190703171005.26231-1-philmd@redhat.com>
 <20190703172501.GI23082@redhat.com>
 <20190704102457.GE1609@stefanha-x1.localdomain>
 <20190704102837.GA24190@redhat.com>
 <20190705080717.GD10995@stefanha-x1.localdomain>
 <8470a203-430b-1814-b2ef-6adf3fa739a6@redhat.com>
 <87d0iok4ai.fsf@dusky.pond.sub.org>
 <c4997dee-932c-eb57-23b9-4b51e8856f91@redhat.com>
 <874l3zhktx.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <874l3zhktx.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Mon, 08 Jul 2019 09:34:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jul 06, 2019 at 06:02:18AM +0200, Markus Armbruster wrote:
> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>=20
> > On 7/5/19 3:19 PM, Markus Armbruster wrote:
> >> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
> >>> On 7/5/19 10:07 AM, Stefan Hajnoczi wrote:
> >>>> On Thu, Jul 04, 2019 at 11:28:37AM +0100, Daniel P. Berrang=C3=A9 =
wrote:
> >>>>> On Thu, Jul 04, 2019 at 11:24:57AM +0100, Stefan Hajnoczi wrote:
> [...]
> >>>>>> What is the concern about adding these environment variables to =
QEMU?
> >>>>>>
> >>>>>> It is convenient to be able to use tracing even if QEMU is invok=
ed by
> >>>>>> something you cannot modify/control.
> >>>>>>
> >>>>>> The main issues I see with environment variables are:
> >>>>>>
> >>>>>> 1. Security.  Is there a scenario where an attacker can use envi=
ronment
> >>>>>>    variables to influence the behavior of a QEMU process running=
 at a
> >>>>>>    different trust level?
> >>=20
> >> The common (and sad) solution for this is to require whatever runs $=
PROG
> >> at a different trust level to scrub the environment.
> >
> > I hope people concerned by security build QEMU with the NOP trace bac=
kend.
>=20
> I sure hope at least one of our tracing backends (other than nop) can b=
e
> used safely in production.

AFAIK, *all* of the trace backends are safe for use in production. The
only questions are around performance in production.  If anyone knows of
any security problems with specific backends we should either address the=
m,
or document the backend is unsafe.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

