Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 412061316A5
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 18:21:39 +0100 (CET)
Received: from localhost ([::1]:55588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioW4Q-0005vB-1j
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 12:21:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51947)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1ioW3B-0004wK-01
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 12:20:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1ioW36-00042Z-L5
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 12:20:20 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:20087
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1ioW36-000425-Gg
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 12:20:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578331216;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3DLuASHanszDwea7ZOUzCoNZLwa5421q0kpgIDYs6z0=;
 b=al8bBsCdImChq+M55gxzRk42OS+d7C24Tww35e6c7TjF39lRYi3cpzpgi9gG/+Gq9gbYsA
 mF8leDem5Zazo/WUVkUgtuRIbTtMq44GGEiHLnlXEJiGuN+TMXTxVigSlsnKyd24of+0VL
 f51nSxZTlWOIqhROWg7312oPbdfGoV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-38Jcw2h_PRC_yHCghayN-w-1; Mon, 06 Jan 2020 12:20:14 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC80F1800D4E
 for <qemu-devel@nongnu.org>; Mon,  6 Jan 2020 17:20:13 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AC7A108131B;
 Mon,  6 Jan 2020 17:20:10 +0000 (UTC)
Date: Mon, 6 Jan 2020 17:20:10 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 058/104] virtiofsd: print log only when priority is high
 enough
Message-ID: <20200106172010.GX2930416@redhat.com>
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-59-dgilbert@redhat.com>
 <20200106151048.GV2930416@redhat.com>
 <20200106170511.GI2798@work-vm>
MIME-Version: 1.0
In-Reply-To: <20200106170511.GI2798@work-vm>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 38Jcw2h_PRC_yHCghayN-w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 06, 2020 at 05:05:11PM +0000, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrang=C3=A9 (berrange@redhat.com) wrote:
> > On Thu, Dec 12, 2019 at 04:38:18PM +0000, Dr. David Alan Gilbert (git) =
wrote:
> > > From: Eryu Guan <eguan@linux.alibaba.com>
> > >=20
> > > Introduce "-o log_level=3D" command line option to specify current lo=
g
> > > level (priority), valid values are "debug info warn err", e.g.
> > >=20
> > >     ./virtiofsd -o log_level=3Ddebug ...
> > >=20
> > > So only log priority higher than "debug" will be printed to
> > > stderr/syslog. And the default level is info.
> > >=20
> > > The "-o debug"/"-d" options are kept, and imply debug log level.
> > >=20
> > > Signed-off-by: Eryu Guan <eguan@linux.alibaba.com>
> > > dgilbert: Reworked for libfuse's log_func
> > > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > ---
> > >  tools/virtiofsd/fuse_log.c       |   4 ++
> > >  tools/virtiofsd/fuse_lowlevel.c  |  75 ++++++++------------
> > >  tools/virtiofsd/fuse_lowlevel.h  |   1 +
> > >  tools/virtiofsd/helper.c         |  10 ++-
> > >  tools/virtiofsd/passthrough_ll.c | 118 +++++++++++++----------------=
--
> > >  5 files changed, 92 insertions(+), 116 deletions(-)
> >=20
> > > diff --git a/tools/virtiofsd/fuse_log.c b/tools/virtiofsd/fuse_log.c
> > > index 11345f9ec8..79a18a7aaa 100644
> > > --- a/tools/virtiofsd/fuse_log.c
> > > +++ b/tools/virtiofsd/fuse_log.c
> > > @@ -8,6 +8,10 @@
> > >   * See the file COPYING.LIB
> > >   */
> > > =20
> > > +#include <stdbool.h>
> > > +#include <stdio.h>
> > > +#include <stdarg.h>
> > > +#include <syslog.h>
> > >  #include "fuse_log.h"
> > > =20
> > >  #include <stdarg.h>
> >=20
> > Why do we need to add these headers if there are no code changes in thi=
s
> > file ?
>=20
> Thanks, those are left overs from an earlier version; I've deleted them n=
ow.
>=20
> > > diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_l=
owlevel.c
> > > index f3c8bdf7cb..0abb369b3d 100644
> > > --- a/tools/virtiofsd/fuse_lowlevel.c
> > > +++ b/tools/virtiofsd/fuse_lowlevel.c
> > > @@ -158,19 +158,17 @@ static int fuse_send_msg(struct fuse_session *s=
e, struct fuse_chan *ch,
> > >      struct fuse_out_header *out =3D iov[0].iov_base;
> > > =20
> > >      out->len =3D iov_length(iov, count);
> > > -    if (se->debug) {
> > > -        if (out->unique =3D=3D 0) {
> > > -            fuse_log(FUSE_LOG_DEBUG, "NOTIFY: code=3D%d length=3D%u\=
n", out->error,
> > > -                     out->len);
> > > -        } else if (out->error) {
> > > -            fuse_log(FUSE_LOG_DEBUG,
> > > -                     "   unique: %llu, error: %i (%s), outsize: %i\n=
",
> > > -                     (unsigned long long)out->unique, out->error,
> > > -                     strerror(-out->error), out->len);
> > > -        } else {
> > > -            fuse_log(FUSE_LOG_DEBUG, "   unique: %llu, success, outs=
ize: %i\n",
> > > -                     (unsigned long long)out->unique, out->len);
> > > -        }
> > > +    if (out->unique =3D=3D 0) {
> > > +        fuse_log(FUSE_LOG_DEBUG, "NOTIFY: code=3D%d length=3D%u\n", =
out->error,
> > > +                 out->len);
> > > +    } else if (out->error) {
> > > +        fuse_log(FUSE_LOG_DEBUG,
> > > +                 "   unique: %llu, error: %i (%s), outsize: %i\n",
> > > +                 (unsigned long long)out->unique, out->error,
> > > +                 strerror(-out->error), out->len);
> > > +    } else {
> > > +        fuse_log(FUSE_LOG_DEBUG, "   unique: %llu, success, outsize:=
 %i\n",
> > > +                 (unsigned long long)out->unique, out->len);
> > >      }
> >=20
> > Removing all the 'if (se->debug)' checks means that we take the
> > performance hit of calling many logging functions in the common
> > case where debug is disabled. Hopefully 'fuse_log' is smart
> > enough to avoid printf formatting of the msg + args unless
> > it is actually goiing to output the message
>=20
> It is; we go through fuse_log (fuse_log.c an imported file) that just
> does the va_start and then calls the log_func that was set later in this
> patch and the first thing it does is check the level and exit.

ok then

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


