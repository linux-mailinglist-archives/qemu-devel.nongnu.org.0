Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3141370B4
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 16:07:50 +0100 (CET)
Received: from localhost ([::1]:47327 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipvt7-00046u-Hi
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 10:07:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50868)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1ipvqM-0000vD-62
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 10:04:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1ipvqK-0008TR-KM
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 10:04:58 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33249
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1ipvqK-0008R6-DE
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 10:04:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578668695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z3APDwnTTB/HJN0sz/jWl8Td8ELJ6JdRqmTBpUgaqsc=;
 b=CRIqkEKU1+TbFHg69Rfm5OEfzsVpveW/anx4gZbmiJBdz1+VH0Lmqd77nMmGMZxXQ/qi1Z
 envE6EO6BLE79hJqv7Kwv9I9duvKpL1uHV2quDwCmQfz3D0I48OowlBQBW8rKnbGk2Yzrt
 TVzmIFTZrDDlSnck6HJ6gyl+pK22e78=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-AzEBc0VCMrm44stxjF6rUQ-1; Fri, 10 Jan 2020 10:04:54 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A0EFDB61
 for <qemu-devel@nongnu.org>; Fri, 10 Jan 2020 15:04:53 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6C2860CD3;
 Fri, 10 Jan 2020 15:04:49 +0000 (UTC)
Date: Fri, 10 Jan 2020 15:04:47 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 mszeredi@redhat.com
Subject: Re: [PATCH 068/104] virtiofsd: passthrough_ll: control readdirplus
Message-ID: <20200110150447.GH3901@work-vm>
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-69-dgilbert@redhat.com>
 <20200107112316.GL3368802@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200107112316.GL3368802@redhat.com>
User-Agent: Mutt/1.13.0 (2019-11-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: AzEBc0VCMrm44stxjF6rUQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=iso-8859-1
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
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrang=E9 (berrange@redhat.com) wrote:
> On Thu, Dec 12, 2019 at 04:38:28PM +0000, Dr. David Alan Gilbert (git) wr=
ote:
> > From: Miklos Szeredi <mszeredi@redhat.com>
> >
>=20
> What is readdirplus and what do we need a command line option to
> control it ? What's the user benefit of changing the setting ?

cc'ing Miklos who understands this better than me.

My understanding is that readdirplus is a heuristic inherited from NFS
where when you iterate over the directory you also pick up stat() data
for each entry in the directory.  You then cache that stat data
somewhere.
The Plus-ness is that a lot of directory operations involve you stating
each entry (e.g. to figure out if you can access it etc) so rolling it
into one op avoids the separate stat.  The unplus-ness is that it's an
overhead and I think changes some of the caching behaviour.

Dave


> > Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> > ---
> >  tools/virtiofsd/passthrough_ll.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthr=
ough_ll.c
> > index 0d70a367bd..c3e8bde5cf 100644
> > --- a/tools/virtiofsd/passthrough_ll.c
> > +++ b/tools/virtiofsd/passthrough_ll.c
> > @@ -118,6 +118,8 @@ struct lo_data {
> >      double timeout;
> >      int cache;
> >      int timeout_set;
> > +    int readdirplus_set;
> > +    int readdirplus_clear;
> >      struct lo_inode root; /* protected by lo->mutex */
> >      struct lo_map ino_map; /* protected by lo->mutex */
> >      struct lo_map dirp_map; /* protected by lo->mutex */
> > @@ -141,6 +143,8 @@ static const struct fuse_opt lo_opts[] =3D {
> >      { "cache=3Dauto", offsetof(struct lo_data, cache), CACHE_NORMAL },
> >      { "cache=3Dalways", offsetof(struct lo_data, cache), CACHE_ALWAYS =
},
> >      { "norace", offsetof(struct lo_data, norace), 1 },
> > +    { "readdirplus", offsetof(struct lo_data, readdirplus_set), 1 },
> > +    { "no_readdirplus", offsetof(struct lo_data, readdirplus_clear), 1=
 },
> >      FUSE_OPT_END
> >  };
> >  static bool use_syslog =3D false;
> > @@ -479,7 +483,8 @@ static void lo_init(void *userdata, struct fuse_con=
n_info *conn)
> >          fuse_log(FUSE_LOG_DEBUG, "lo_init: activating flock locks\n");
> >          conn->want |=3D FUSE_CAP_FLOCK_LOCKS;
> >      }
> > -    if (lo->cache =3D=3D CACHE_NEVER) {
> > +    if ((lo->cache =3D=3D CACHE_NEVER && !lo->readdirplus_set) ||
> > +        lo->readdirplus_clear) {
> >          fuse_log(FUSE_LOG_DEBUG, "lo_init: disabling readdirplus\n");
> >          conn->want &=3D ~FUSE_CAP_READDIRPLUS;
> >      }
> > --=20
> > 2.23.0
> >=20
> >=20
>=20
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


