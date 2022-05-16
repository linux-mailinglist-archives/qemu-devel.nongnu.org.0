Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 209BD528A2E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:22:58 +0200 (CEST)
Received: from localhost ([::1]:51294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqdUn-00046F-6E
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nqd6Q-0004YD-NR
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:57:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nqd6K-0003Vz-7q
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:57:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652716657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KspGY4TkqNo8omtpco8hpXk4tQcTHY+Ieid5dbZLn1U=;
 b=a29Ibte5LVXPqgWDPxqjuJ2z5u2pJx74/H3X8fuquROzWOhY2JIMMHANS1ivShyEB3zqy/
 e/5fZdlhdoOJZ9SXGxfTSFzHlvw8Nu3WyVvpx88ClCT1jYx8vr2QQBqyVTmfZ3aPFYC5AN
 IjqHLno0gu6MFRoTSB1aph/1AfTxd94=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-uKqKmoCaP6exHZBGJrtvKA-1; Mon, 16 May 2022 11:57:33 -0400
X-MC-Unique: uKqKmoCaP6exHZBGJrtvKA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AC5D86B8AB;
 Mon, 16 May 2022 15:57:33 +0000 (UTC)
Received: from localhost (unknown [10.39.192.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1207940C1421;
 Mon, 16 May 2022 15:57:32 +0000 (UTC)
Date: Mon, 16 May 2022 16:57:31 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] vhost-user-scsi: avoid unlink(NULL) with fd passing
Message-ID: <YoJ0a/vMauyA5SQv@stefanha-x1.localdomain>
References: <20220427100116.30453-1-stefanha@redhat.com>
 <CAFEAcA_1cFLDK+oE8=VQaX-FQqTtVH=WP6C47Xo+f99SLin2EQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WKzPY0lLFMSKfEKY"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_1cFLDK+oE8=VQaX-FQqTtVH=WP6C47Xo+f99SLin2EQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--WKzPY0lLFMSKfEKY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 12, 2022 at 04:57:13PM +0100, Peter Maydell wrote:
> On Wed, 27 Apr 2022 at 11:04, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > Commit 747421e949fc1eb3ba66b5fcccdb7ba051918241 ("Implements Backend
> > Program conventions for vhost-user-scsi") introduced fd-passing support
> > as part of implementing the vhost-user backend program conventions.
> >
> > When fd passing is used the UNIX domain socket path is NULL and we must
> > not call unlink(2).
> >
> > Fixes: Coverity CID 1488353
> > Fixes: 747421e949fc1eb3ba66b5fcccdb7ba051918241 ("Implements Backend Pr=
ogram conventions for vhost-user-scsi")
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  contrib/vhost-user-scsi/vhost-user-scsi.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-=
user-scsi/vhost-user-scsi.c
> > index b2c0f98253..08335d4b2b 100644
> > --- a/contrib/vhost-user-scsi/vhost-user-scsi.c
> > +++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
> > @@ -433,7 +433,9 @@ out:
> >      if (vdev_scsi) {
> >          g_main_loop_unref(vdev_scsi->loop);
> >          g_free(vdev_scsi);
> > -        unlink(opt_socket_path);
> > +        if (opt_socket_path) {
> > +            unlink(opt_socket_path);
> > +        }
> >      }
>=20
> Shouldn't this check-and-unlink be one level up, outside the
> "if (vdev_scsi)" ? There are error exit paths which get us to
> the 'out:' label where we have called unix_sock_new() but
> not yet done the g_new0() of vdev_scsi(). The only thing
> that needs to be guarded by "if (vdev_scsi)" is the
> g_main_loop_unref() (the g_free of vdev_scsi itself could
> be inside or outside, since g_free(NULL) is a nop).

Sorry, I was offline last week due to illness. Now I'm back and agree
with what you found. I have sent a v2.

Stefan

--WKzPY0lLFMSKfEKY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKCdGsACgkQnKSrs4Gr
c8iv5Af+Mvv3W2R3CUwPZZxpwVSmQrZdkjkqhs061m+mJuxQvCP0/dJOwcaPSeVW
jB9GRz7dGtEWtkz8zHAIAco8VQjVApp7OvBcpuuy+fsjKNwlQHGw4loY3ib7y+bs
CjPqQwm3/hvFtyBoQPEk8bNEuNNh/qzRZLKMxd6JsLF0GVbj1oHWl+qho9v/Lcpt
B/fWBJxStGn/+YhqtneKA92AAWVXnR9i9lkOkNWjXjoOdVRKnvnDfTeeqbOgsKnV
sCBAzVc5ewzt8CVVZ0q3gWxEbroX0AZcRznxC8eoKnqFlHGOfoJldMh70CdUnZHg
jxLR7lNG3JJQ+23woPakWY3g6EmDiQ==
=FgUC
-----END PGP SIGNATURE-----

--WKzPY0lLFMSKfEKY--


