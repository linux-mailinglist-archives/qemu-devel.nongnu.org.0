Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C74F197E9F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 16:39:02 +0200 (CEST)
Received: from localhost ([::1]:50758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIvZ6-0003XA-W7
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 10:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58996)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jIvYJ-00037D-IB
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 10:38:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jIvYH-0001Fn-5s
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 10:38:10 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:30294)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jIvYG-0001EX-Sg
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 10:38:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585579087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AWq+ZseqSvslG1nF+vpXNazXlFKzxZg8BDd0lOhK+4M=;
 b=anq8fhTuaWvRi7v5ADXygQfGpVhVDk1x3TUS5mTxoiPBL+wHmUnhahTRjv247O0q+/0Roj
 B2VuK4bwXCp0nG9W+QKo/ysukinjDv41Tl0puFgvC+LH34EsjC5VivVbq78fQBndBqksAK
 Y1as54g5n58mKOwlQUAFSVi8j1xfI90=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-hLxPCIWnMTW5nQhLeFRSNw-1; Mon, 30 Mar 2020 10:38:03 -0400
X-MC-Unique: hLxPCIWnMTW5nQhLeFRSNw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AF44107ACC4;
 Mon, 30 Mar 2020 14:38:02 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-66.ams2.redhat.com [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42836A7D0;
 Mon, 30 Mar 2020 14:38:01 +0000 (UTC)
Date: Mon, 30 Mar 2020 16:37:59 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: deprecation of in-tree builds
Message-ID: <20200330143759.GD6139@linux.fritz.box>
References: <CAFEAcA8E6goDHb-7kKCTp=wSpBsuJcfjMmLP0EgymiEL348r4A@mail.gmail.com>
 <87v9mmug73.fsf@dusky.pond.sub.org>
 <CAFEAcA-9U=EAXAtPDh_AnO3eUbM_jcRBuf4x=0Rec0EC-v2mNA@mail.gmail.com>
 <20200330134212.GO236854@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200330134212.GO236854@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 30.03.2020 um 15:42 hat Daniel P. Berrang=E9 geschrieben:
> On Mon, Mar 30, 2020 at 02:31:52PM +0100, Peter Maydell wrote:
> > On Mon, 30 Mar 2020 at 14:26, Markus Armbruster <armbru@redhat.com> wro=
te:
> > >
> > > Peter Maydell <peter.maydell@linaro.org> writes:
> > >
> > > > AIUI from Paolo, the intention is to deprecate and eventually
> > > > stop supporting "in-tree" builds, so that the only option is
> > > > building in a separate build directory. I thought we should
> > > > probably mention that in the 5.0 changelog, so I wrote up some
> > > > text:
> > > >
> > > > https://wiki.qemu.org/ChangeLog/5.0#Build_Information
> > >
> > > Overdue.  Thanks for doing this!
> > >
> > > > Suggestions for changes/comments etc welcome.
> > >
> > > Looks fine to me.
> >=20
> > Consensus in the thread seemed to lean towards having
> > the 'configure/make' runes auto-create a build directory;
> > if we want to do that we should probably not say anything in
> > the release notes, because we'll cause people to change
> > unnecessarily. Or at least have them say "We recommend
> > out-of-tree builds. In future we might make the commands
> > that currently do an in-tree build automatically create
> > and use a build directory for you." rather than a blanket
> > "we're going to drop this and you should change what you
> > do now".
> >=20
> > Thoughts?
>=20
> When the time comes to switch to Meson, we'll be forcing a
> separate build directory & that will also potentially involve
> a change in build instructions for users.
>=20
> So if we expect Meson will arrive in QEMU soon (say before end
> of this year), then I'd try to keep changes related to make to
> the bare minimum, and have Meson switch as the "flag day" when
> developers are forced to adapt their build process.=20
>=20
> IOW, merely warn people that in-tree builds are deprecated and
> not tested by the project and enourage switching to out of tree
> builds. Dont try to magically create a separate build dir now.

If manually dealing with separate build directories is inconvenient
today, it will still be inconvenient with Meson, so this would mean
introducing the automatic directly creation together with the other
changes to enable Meson. Which is fine by me, as long as it is really
done when the external directory becomes mandatory, so that people won't
have to switch back and forth between directories.

Kevin


