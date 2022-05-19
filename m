Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC50652CFB9
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 11:51:10 +0200 (CEST)
Received: from localhost ([::1]:50664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrcoH-0005ci-T4
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 05:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nrci6-0001MY-H2
 for qemu-devel@nongnu.org; Thu, 19 May 2022 05:44:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nrci3-0001Pf-9c
 for qemu-devel@nongnu.org; Thu, 19 May 2022 05:44:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652953482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XbrqxlH9P/dJO3AoFBltM9QUwnjU6dmhxXWLLuO036s=;
 b=dG40JwFbh2SJOefPrX/hV133uSdaynH0wt20Eal9jnaA9AZtE3ZgeNcfm2NeHP2p2rQcCq
 fQpPUr8VLVHz7lHCrqMummWAtAXZjxvcjcn1FYbEIf+wc2OwGhzj4F/1lt3rkJ1CU/+OVh
 8i/2TmE2l9fmOyrJnZmTxcBYeqcAj5Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-PKWmby4pNwCypxOmrFRlYA-1; Thu, 19 May 2022 05:44:39 -0400
X-MC-Unique: PKWmby4pNwCypxOmrFRlYA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8B59294EDD8;
 Thu, 19 May 2022 09:44:38 +0000 (UTC)
Received: from localhost (unknown [10.39.193.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FDAE7774;
 Thu, 19 May 2022 09:44:38 +0000 (UTC)
Date: Thu, 19 May 2022 10:44:37 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Yongji Xie <xieyongji@bytedance.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, mreitz@redhat.com,
 mlureau@redhat.com, jsnow@redhat.com,
 Eric Blake <eblake@redhat.com>, Coiby.Xu@gmail.com,
 hreitz@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 8/8] libvduse: Add support for reconnecting
Message-ID: <YoYRhX2J6kTlcoQU@stefanha-x1.localdomain>
References: <20220504074051.90-1-xieyongji@bytedance.com>
 <20220504074051.90-9-xieyongji@bytedance.com>
 <YoT8vKuUnGhfaaSJ@stefanha-x1.localdomain>
 <CACycT3s9gt9D7VU2Bkh7Lo2FjR+MQpEC06ZQpRDcVQMC_LmjXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yCOloFgoNFTMstHi"
Content-Disposition: inline
In-Reply-To: <CACycT3s9gt9D7VU2Bkh7Lo2FjR+MQpEC06ZQpRDcVQMC_LmjXw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


--yCOloFgoNFTMstHi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 19, 2022 at 04:25:13PM +0800, Yongji Xie wrote:
> On Wed, May 18, 2022 at 10:03 PM Stefan Hajnoczi <stefanha@redhat.com> wr=
ote:
> >
> > On Wed, May 04, 2022 at 03:40:51PM +0800, Xie Yongji wrote:
> > > @@ -291,6 +294,15 @@ static int vduse_blk_exp_create(BlockExport *exp=
, BlockExportOptions *opts,
> > >          return -ENOMEM;
> > >      }
> > >
> > > +    vblk_exp->recon_file =3D g_strdup_printf("%s/vduse-blk-%s",
> > > +                                           g_get_tmp_dir(), exp->id);
> >
> > g_get_tmp_dir() returns the $TMPDIR environment variable. This means
> > exp->id must be unique across the host. Please document this.
> >
>=20
> Now we also use exp->id as the name of vduse device which should also
> be unique across the host. So I'm not sure if it's better to add a new
> unique id for vduse since the exp->id is now used by all block
> exports.

Good point, I forgot that the VDUSE device name must be unique! It's a
little more flexible to have a separate vduse-name=3D option which is used
for the VDUSE device name and the reconnection filename, but also a
little more typing. I'm not sure if it's necessary to separate the two
concepts.

Stefan

--yCOloFgoNFTMstHi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKGEYUACgkQnKSrs4Gr
c8jZ+wgAwboo400b3cOoG0dhT9c2KJVWqFFwxwcw9oZrQJYl4iQp/K934Mn5z0Wp
LpLwDaTfABOfAsS/CtEzxZqsp45Iy0oUG4iq0pI1FmTbLPqRCZOKy0Y13oX2Wmpg
jj2+pYzw3QSa2jU5PJZ0iE+cAb0dzdA9p1azfZpwC7niyfK2ztLPfzAMtwdHi1+7
D8jVhR7m085JNjZWtGsSccHBmXiBhpx3ItupbpVKHWVmIpzTp+hd9upYirsG2H/0
YhKk+Obj20vrebj8zq7cIKJXEfobGGDAgffPYtKV7v2e5k1FW+28VGZYCgoFhnfz
0HgJaoJEgLhdbE2FtP75VtxDLmvNCA==
=0ES+
-----END PGP SIGNATURE-----

--yCOloFgoNFTMstHi--


