Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5992510FE90
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Dec 2019 14:21:28 +0100 (CET)
Received: from localhost ([::1]:53442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ic87K-0001D6-E4
	for lists+qemu-devel@lfdr.de; Tue, 03 Dec 2019 08:21:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43788)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1ic7sk-0008Tb-2G
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 08:06:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1ic7si-0005Ng-Mq
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 08:06:21 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53373
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1ic7sh-0005K3-UP
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 08:06:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575378376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E2nx1DtZci1tueMQ6Vw0wJ5juB41IcRCZOApmXnQW+k=;
 b=iyEGeOjEIcnZyAysl6G8S/tzq4IdKMQE1LD+CASg1/wbSQL5Ocal6uG1HCSoGAE43pNY/E
 f6j/zYJH53/OOmV/NZ1NVfTGUf02IWgkkr7AIekuhz1YXUGj39tIShhhNJmJ26nTm9yssg
 /owsX56brmT8FEyjJqImbfQPEsydZfc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-e8ATGUOzPNqQs4qvNzJp4Q-1; Tue, 03 Dec 2019 08:06:14 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4393800D4E;
 Tue,  3 Dec 2019 13:06:13 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DFD8600C8;
 Tue,  3 Dec 2019 13:06:06 +0000 (UTC)
Date: Tue, 3 Dec 2019 13:06:04 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: virtiofsd: Where should it live?
Message-ID: <20191203130604.GE3078@work-vm>
References: <20191125185021.GB3767@work-vm>
 <20191126102600.GG556568@redhat.com>
 <20191126121416.GE2928@work-vm>
 <CAFEAcA9Ln2uwg4f4s8oS6VeQk83W3BErmH9cHeyDJy7v-4gNxw@mail.gmail.com>
 <87k17ekhs9.fsf@dusky.pond.sub.org>
 <fef0eaaf-149a-f8a8-02c5-821d2d42becd@redhat.com>
 <20191203105341.GB3078@work-vm>
 <CAFEAcA8bjGAs7JSTNYYYwCH1yF06i0v0r9wjKXqZGZg_Sqy0VA@mail.gmail.com>
 <20191203111949.GB267814@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191203111949.GB267814@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: e8ATGUOzPNqQs4qvNzJp4Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 mszeredi@redhat.com, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrang=E9 (berrange@redhat.com) wrote:
> On Tue, Dec 03, 2019 at 11:06:44AM +0000, Peter Maydell wrote:
> > On Tue, 3 Dec 2019 at 10:53, Dr. David Alan Gilbert <dgilbert@redhat.co=
m> wrote:
> > >
> > > We seem to be coming to the conclusion something that:
> > >
> > >   a) It should live in the qemu tree
> > >   b) It shouldn't live under contrib
> > >   c) We'll create a new top level, i.e. 'daemons'
> > >   d) virtiofsd will be daemons/virtiofsd
> > >
> > > Now, somethings I'm less clear on:
> > >   e) What else would move into daemons?  It was suggested
> > >     that if we've got virtiofsd in there, then we should move
> > >     libvhost-user - which I understand, but then it's not a
> > >     'daemons'.
> > >     Are there any otehr daemons that should move?
> >=20
> > I like the idea of a new top level directory, but I think
> > 'daemons' is a bit too specific -- for instance it seems to
> > me that qemu-img would be sensible to move out of the root,
> > and that's not a daemon.
>=20
> Do we really need an extra directory level ?
>=20
> IIUC, the main point against having $GIT_ROOT/virtiofsd is that
> the root of our repo is quite cluttered already.
>=20
> Rather than trying to create a multi-level hierarchy which adds
> a debate around naming, why not address the clutter by moving
> *ALL* the .c/.h files out of the root so that we have a flatter
> tree:
>=20
>   $GITROOT
>     +- qemu-system
>     |   +- vl.c
>     |   +- ...most other files...

This seems like a good idea anyway (are all these files -system not
user?)

>     +- qemu-img
>     |   +- qemu-img.c
>     +- qemu-nbd
>     |   +- qemu-nbd.c
>     +- qemu-io
>     |   +- qemu-io.c
>     |   +- qemu-io-cmds.c
>     +- qemu-bridge-helper
>     |   ...
>     +- qemu-edid
>     +- qemu-keymap
>     +- qga  (already exists)

I'm not seeing how having ~ one directory per file is helping; the
number of entries doesn't drop much.

> Then we can add virtiofsd and other programs at the root with no big
> issue.

Dave

> Regards,
> Daniel
> --=20
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


