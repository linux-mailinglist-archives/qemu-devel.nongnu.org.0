Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF326C6A4D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 15:00:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfLSX-0000Bb-9i; Thu, 23 Mar 2023 09:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pfLSV-0000B7-4h
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 09:58:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pfLST-00088j-IH
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 09:58:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679579904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D1W3DHp3xspmY5hdu5czMWy056gRsu9LM5k0US6jbuA=;
 b=i40YjbkEuxmpxqZCXylCgiwo6/tp6CPUC+8aTE8/UTf6f3JhlctSWldJQrJW2Ybz6gEyJF
 qEgbfWl0HB1+rixhXz+SKWKP0Vtr/IkhuJDzBK+V9QJwY18Gfs71sZw65CmclXnnqzSVpo
 QZnJJeHjSgVvvwCEMxR2OvI/mBsdwHs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-wFG-vdJQPfCfz51UHQXQUQ-1; Thu, 23 Mar 2023 09:58:22 -0400
X-MC-Unique: wFG-vdJQPfCfz51UHQXQUQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA5D8830FB0;
 Thu, 23 Mar 2023 13:58:21 +0000 (UTC)
Received: from localhost (unknown [10.39.195.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CD4718EC7;
 Thu, 23 Mar 2023 13:58:20 +0000 (UTC)
Date: Thu, 23 Mar 2023 09:58:19 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Fam Zheng <fam@euphon.net>, qemu-stable <qemu-stable@nongnu.org>,
 Qing Wang <qinwang@redhat.com>
Subject: Re: [PATCH for-8.0] aio-posix: fix race between epoll upgrade and
 aio_set_fd_handler()
Message-ID: <20230323135819.GA1331422@fedora>
References: <20230322145521.1294954-1-stefanha@redhat.com>
 <CABgObfbxqDNjH_RWu8L4dU+f9VchZi-c-=nNpt5vCGfK7Asndg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Trv9uuz69zfZMbP2"
Content-Disposition: inline
In-Reply-To: <CABgObfbxqDNjH_RWu8L4dU+f9VchZi-c-=nNpt5vCGfK7Asndg@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--Trv9uuz69zfZMbP2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2023 at 06:02:36AM +0100, Paolo Bonzini wrote:
> Il mer 22 mar 2023, 15:55 Stefan Hajnoczi <stefanha@redhat.com> ha scritt=
o:
>=20
> > +    /* The list must not change while we add fds to epoll */
> > +    if (!qemu_lockcnt_dec_if_lock(&ctx->list_lock)) {
> > +        return false;
> > +    }
> > +
> > +    ok =3D fdmon_epoll_try_enable(ctx);
> > +
> > +    qemu_lockcnt_unlock(&ctx->list_lock);
> >
>=20
> Shouldn't this be inc_and_unlock to balance the change made by dec_if_loc=
k?

Yes, the caller expects list_lock to still be incremented. Thanks for
catching this!

Stefan

--Trv9uuz69zfZMbP2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQcWvsACgkQnKSrs4Gr
c8h4HwgAmWR/S40fAci3MOSb8ERlBpNK8/JAZhajCadRSJ/+5DgzIyBM+af3Mx8h
TE/lvNaZKVq8wXy4rZEkK0TK3gGXb25mcV6kgL52wBsJpmyIGWhxT9ldZOp+BwKf
M276/761+omf697ZWoZJWtkJ0FgkDhpbS2QDF3VbKPiv+V0gea5DDFG7lJCtx4Od
hh3/6JTt8JRzpsqF/VOvy62zjt7whVPLxwkH6nkJJauGOnY/rjtJDpQM8GWyslCe
3+ciu/UsqOIDbUdFruqHE5Yn4iZGfySXtFn71gTj3VecC4WOwUSu/kkh2UAOeFq6
xk/SDLOcXva4tYFoxv6QJ8a4tVx9lg==
=m9uz
-----END PGP SIGNATURE-----

--Trv9uuz69zfZMbP2--


