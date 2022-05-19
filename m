Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9145E52D193
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 13:36:11 +0200 (CEST)
Received: from localhost ([::1]:49012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nreRj-00017m-MH
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 07:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nreKo-0007rX-Cm
 for qemu-devel@nongnu.org; Thu, 19 May 2022 07:28:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nreKm-0002X6-Q1
 for qemu-devel@nongnu.org; Thu, 19 May 2022 07:28:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652959728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nDrZXJ4N+F7aMweBUGXYLokvGVj9IJw5kX1KU910ols=;
 b=ZCTvuZ7gONtJydBvNrcn8e76hgbAoSTXvponcaRd79llCeiIK3UVksi6E16FhEPRPAwbeK
 zIXncsIkKFPBlXm7dBv5Eys44AOH6bU4Qy/qgnp3jmIVHQ/3n+dQcjB9TypHrtRVW/bmp6
 hJ5+ksjeG4aRvtHBydDUduRKFe+64JU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-OqdzsPl1OWa1kLyTI5TsQQ-1; Thu, 19 May 2022 07:28:46 -0400
X-MC-Unique: OqdzsPl1OWa1kLyTI5TsQQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C36B811E78;
 Thu, 19 May 2022 11:28:46 +0000 (UTC)
Received: from localhost (unknown [10.39.193.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28B072026D6A;
 Thu, 19 May 2022 11:28:46 +0000 (UTC)
Date: Thu, 19 May 2022 12:28:45 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Yongji Xie <xieyongji@bytedance.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, mreitz@redhat.com,
 mlureau@redhat.com, jsnow@redhat.com,
 Eric Blake <eblake@redhat.com>, Coiby.Xu@gmail.com,
 hreitz@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 8/8] libvduse: Add support for reconnecting
Message-ID: <YoYp7UUj+xGKRrXt@stefanha-x1.localdomain>
References: <20220504074051.90-1-xieyongji@bytedance.com>
 <20220504074051.90-9-xieyongji@bytedance.com>
 <YoT8vKuUnGhfaaSJ@stefanha-x1.localdomain>
 <CACycT3s9gt9D7VU2Bkh7Lo2FjR+MQpEC06ZQpRDcVQMC_LmjXw@mail.gmail.com>
 <YoYRhX2J6kTlcoQU@stefanha-x1.localdomain>
 <CACycT3v6xvawV7tOPB7PXfGLiBQLFAV=6yfEKdJfxiR4QH4OgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yAnhuDEY0Z8rA1G8"
Content-Disposition: inline
In-Reply-To: <CACycT3v6xvawV7tOPB7PXfGLiBQLFAV=6yfEKdJfxiR4QH4OgA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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


--yAnhuDEY0Z8rA1G8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 19, 2022 at 06:02:50PM +0800, Yongji Xie wrote:
> On Thu, May 19, 2022 at 5:44 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> >
> > On Thu, May 19, 2022 at 04:25:13PM +0800, Yongji Xie wrote:
> > > On Wed, May 18, 2022 at 10:03 PM Stefan Hajnoczi <stefanha@redhat.com=
> wrote:
> > > >
> > > > On Wed, May 04, 2022 at 03:40:51PM +0800, Xie Yongji wrote:
> > > > > @@ -291,6 +294,15 @@ static int vduse_blk_exp_create(BlockExport =
*exp, BlockExportOptions *opts,
> > > > >          return -ENOMEM;
> > > > >      }
> > > > >
> > > > > +    vblk_exp->recon_file =3D g_strdup_printf("%s/vduse-blk-%s",
> > > > > +                                           g_get_tmp_dir(), exp-=
>id);
> > > >
> > > > g_get_tmp_dir() returns the $TMPDIR environment variable. This means
> > > > exp->id must be unique across the host. Please document this.
> > > >
> > >
> > > Now we also use exp->id as the name of vduse device which should also
> > > be unique across the host. So I'm not sure if it's better to add a new
> > > unique id for vduse since the exp->id is now used by all block
> > > exports.
> >
> > Good point, I forgot that the VDUSE device name must be unique! It's a
> > little more flexible to have a separate vduse-name=3D option which is u=
sed
> > for the VDUSE device name and the reconnection filename, but also a
> > little more typing. I'm not sure if it's necessary to separate the two
> > concepts.
> >
>=20
> OK, let's reuse the exp->id and document this first. We can add this
> new option if we need it in the future.

Thanks!

Stefan

--yAnhuDEY0Z8rA1G8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKGKe0ACgkQnKSrs4Gr
c8jpZAf/SZ9CRIfhxEOG0K2YTBhRFt1VBJKmqEc3Eg9ulAbfHQ/G//hnAIFzQpBk
q+pSWnGv0Qj/ZoBK8Kfdvp5pWHqRf+UOwaF/iTqN/6W2L62nHxuuRXu8WSyhWT8r
21Zx7yORF8Ls9DGgjymd+9HY2gWzCKjVilc37p549Pl3yMF3qiAd3OFG6PrBrhg7
U33XxCsFD7ZBT4ifND2vgrvHBslB6FERxtHeXZ98oNBifqI+offnL3YPcwwQ3HYy
MF9424eXfII+DxDFlrYJColPMPv1NW0yshwFj/fyOMfQTX7ENnIoD1eKQ9k+M6sF
Rd4ubvBG6fehsXkbjEo2M38wGOuBnQ==
=PBfl
-----END PGP SIGNATURE-----

--yAnhuDEY0Z8rA1G8--


