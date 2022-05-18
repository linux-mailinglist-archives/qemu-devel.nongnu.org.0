Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E219D52BBB0
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 16:07:28 +0200 (CEST)
Received: from localhost ([::1]:46304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrKKl-0008Mu-VL
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 10:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nrKHH-0004kk-Be
 for qemu-devel@nongnu.org; Wed, 18 May 2022 10:03:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nrKHB-0008Q2-2H
 for qemu-devel@nongnu.org; Wed, 18 May 2022 10:03:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652882623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3VUmq3W79jSOH511D6aLR1+72Rc0WQwjpe6J3T+BUPE=;
 b=caKUspQ+ZqKJDcBLO0yEXCntcIPI+X5gWanZ5pLy18qU6wqjG2vBGuE7CwhICypk7HAOPN
 cz7seJNKrySzFWzW/AonCxdXD9Qp2ciVWAAc7m2d4XuX48bxYzafOh3GMbL4KTRKRCAKxr
 Q6bDjsG6y5tcGqYgfgHGRENjTl/ZVM4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-zsto0Z3BMZSgscUaegMriA-1; Wed, 18 May 2022 10:03:42 -0400
X-MC-Unique: zsto0Z3BMZSgscUaegMriA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB22A8015BA;
 Wed, 18 May 2022 14:03:41 +0000 (UTC)
Received: from localhost (unknown [10.39.192.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90C871400E75;
 Wed, 18 May 2022 14:03:41 +0000 (UTC)
Date: Wed, 18 May 2022 15:03:40 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: mst@redhat.com, jasowang@redhat.com, sgarzare@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, mlureau@redhat.com,
 jsnow@redhat.com, eblake@redhat.com, Coiby.Xu@gmail.com,
 hreitz@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 8/8] libvduse: Add support for reconnecting
Message-ID: <YoT8vKuUnGhfaaSJ@stefanha-x1.localdomain>
References: <20220504074051.90-1-xieyongji@bytedance.com>
 <20220504074051.90-9-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TbXkGly0zjFcJNaX"
Content-Disposition: inline
In-Reply-To: <20220504074051.90-9-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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


--TbXkGly0zjFcJNaX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 04, 2022 at 03:40:51PM +0800, Xie Yongji wrote:
> @@ -291,6 +294,15 @@ static int vduse_blk_exp_create(BlockExport *exp, Bl=
ockExportOptions *opts,
>          return -ENOMEM;
>      }
> =20
> +    vblk_exp->recon_file =3D g_strdup_printf("%s/vduse-blk-%s",
> +                                           g_get_tmp_dir(), exp->id);

g_get_tmp_dir() returns the $TMPDIR environment variable. This means
exp->id must be unique across the host. Please document this.

Thanks,
Stefan

--TbXkGly0zjFcJNaX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKE/LwACgkQnKSrs4Gr
c8jyKwf+NxqRlnKzMO//fzfkBBVQQKCBZsScsWENkosdcI0YPkJOIXHRXfB2vCd4
P/R7mGE0dIzTphCjWmmL2OYTnlBKVk3wSGRV7iPCc8BlYpZ+HSM86tN/YhC4Ywwh
ViRgj6Pwv3f3+mreZZBfgFQYnWywM0V+ER+V/CnQsQ4Ni7LbbzCifn33Mf/W38WO
hF6IzgEL6PcoZ0KD7Vva9PBkjyb9dP2AdIw+hikn6ZSjQNBmZN4Oi3PVZsSGRohY
hXorqhoKnsYnEm6La81GUvIxkHdrMTpSDvRvHtYyqVu/3ZWihsZKkzwDt+pUAj3m
tLoDwUbr1xEiJgHajvMH+FELjr30jg==
=UnMv
-----END PGP SIGNATURE-----

--TbXkGly0zjFcJNaX--


