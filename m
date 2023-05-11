Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B456FFBD5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 23:25:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxDm4-0004aA-5p; Thu, 11 May 2023 17:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pxDm2-0004Yu-80
 for qemu-devel@nongnu.org; Thu, 11 May 2023 17:24:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pxDlz-0001Tw-BC
 for qemu-devel@nongnu.org; Thu, 11 May 2023 17:24:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683840266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Iunu2OSen4SsTvAlKu71PnM2BjLBjTVmzME/01ZQY0I=;
 b=VlX4Nfk8+g65bSqWsuycJvWpLafuEhIHPjf0/bSEg78v4q05qg+5Z5ooRGm5tET+YsXxkw
 kGHfsVD9Xcrc6X6PNmdmMFi9+wQFc+ERqrAgF1OgGCh6JUmoIOv7f3QkepQNkeCsr32wf/
 +fjVFTbD5PfAF1bGxdCj/hj5mhSvLwk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-MZoc4K02OLOSuJDjxdWiuQ-1; Thu, 11 May 2023 17:24:24 -0400
X-MC-Unique: MZoc4K02OLOSuJDjxdWiuQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E2BA101A54F;
 Thu, 11 May 2023 21:24:23 +0000 (UTC)
Received: from localhost (unknown [10.39.194.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7EF32026D16;
 Thu, 11 May 2023 21:24:22 +0000 (UTC)
Date: Thu, 11 May 2023 17:24:21 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, xen-devel@lists.xenproject.org,
 eesposit@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Lieven <pl@kamp.de>, Paul Durrant <paul@xen.org>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 Stefano Garzarella <sgarzare@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefan Weil <sw@weilnetz.de>, Xie Yongji <xieyongji@bytedance.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Hanna Reitz <hreitz@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>
Subject: Re: [PATCH v4 20/20] aio: remove aio_disable_external() API
Message-ID: <20230511212421.GD1425915@fedora>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-21-stefanha@redhat.com>
 <ZFQk2TdhZ6DiwM4t@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hOsvZoyrJ+/f+ltH"
Content-Disposition: inline
In-Reply-To: <ZFQk2TdhZ6DiwM4t@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--hOsvZoyrJ+/f+ltH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2023 at 11:34:17PM +0200, Kevin Wolf wrote:
> Am 25.04.2023 um 19:27 hat Stefan Hajnoczi geschrieben:
> > All callers now pass is_external=3Dfalse to aio_set_fd_handler() and
> > aio_set_event_notifier(). The aio_disable_external() API that
> > temporarily disables fd handlers that were registered is_external=3Dtrue
> > is therefore dead code.
> >=20
> > Remove aio_disable_external(), aio_enable_external(), and the
> > is_external arguments to aio_set_fd_handler() and
> > aio_set_event_notifier().
> >=20
> > The entire test-fdmon-epoll test is removed because its sole purpose was
> > testing aio_disable_external().
> >=20
> > Parts of this patch were generated using the following coccinelle
> > (https://coccinelle.lip6.fr/) semantic patch:
> >=20
> >   @@
> >   expression ctx, fd, is_external, io_read, io_write, io_poll, io_poll_=
ready, opaque;
> >   @@
> >   - aio_set_fd_handler(ctx, fd, is_external, io_read, io_write, io_poll=
, io_poll_ready, opaque)
> >   + aio_set_fd_handler(ctx, fd, io_read, io_write, io_poll, io_poll_rea=
dy, opaque)
> >=20
> >   @@
> >   expression ctx, notifier, is_external, io_read, io_poll, io_poll_read=
y;
> >   @@
> >   - aio_set_event_notifier(ctx, notifier, is_external, io_read, io_poll=
, io_poll_ready)
> >   + aio_set_event_notifier(ctx, notifier, io_read, io_poll, io_poll_rea=
dy)
> >=20
> > Reviewed-by: Juan Quintela <quintela@redhat.com>
> > Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@linaro.org>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> > diff --git a/util/fdmon-epoll.c b/util/fdmon-epoll.c
> > index 1683aa1105..6b6a1a91f8 100644
> > --- a/util/fdmon-epoll.c
> > +++ b/util/fdmon-epoll.c
> > @@ -133,13 +128,12 @@ bool fdmon_epoll_try_upgrade(AioContext *ctx, uns=
igned npfd)
> >          return false;
> >      }
> > =20
> > -    /* Do not upgrade while external clients are disabled */
> > -    if (qatomic_read(&ctx->external_disable_cnt)) {
> > -        return false;
> > -    }
> > -
> > -    if (npfd < EPOLL_ENABLE_THRESHOLD) {
> > -        return false;
> > +    if (npfd >=3D EPOLL_ENABLE_THRESHOLD) {
> > +        if (fdmon_epoll_try_enable(ctx)) {
> > +            return true;
> > +        } else {
> > +            fdmon_epoll_disable(ctx);
> > +        }
> >      }
> > =20
> >      /* The list must not change while we add fds to epoll */
>=20
> I don't understand this hunk. Why are you changing more than just
> deleting the external_disable_cnt check?
>=20
> Is this a mismerge with your own commit e62da985?

Yes, it's a mismerge. Thanks for catching that!

Stefan

--hOsvZoyrJ+/f+ltH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRdXQUACgkQnKSrs4Gr
c8jCAwgArfC5LraGY8jVq0rjlhqjo+1t+A8cy3ybRhi7AWg9HlCzom9EknmlRBb2
IFwC4528xXBwjj+W116JsMihzmJzH1z/QhcAfG9yuv5yRM0clnkYit5zYrajIIFW
4r37+T7TPpfIDfJce3jOBhB3or0bTez/YKmkfUE3E0vXwn8W4kvnP3rHUdm0XHN3
z/oTO5uOWntYkSzEsc5mUsTaMmeYuNUJEEFeNeOn9OVioSm2cbyWjFWcv37/K5RA
DTIzgFmxW0VHQGRfp9HanBR7feVw2SkC6yLeh5s1Q6qrRVYiXYVlWzDI87H6GtHp
fFBXo0mv/tcQgnU27cWMn0RHw2xGQQ==
=yBNf
-----END PGP SIGNATURE-----

--hOsvZoyrJ+/f+ltH--


