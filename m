Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A0852BB72
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 15:23:40 +0200 (CEST)
Received: from localhost ([::1]:40770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrJeN-0003aj-Og
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 09:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nrJd6-0002aV-7I
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:22:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nrJd4-0000x3-FX
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:22:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652880137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AciuVywCULGKU7MPduszAmjn2zPsDXSA6vVJaM0s/y4=;
 b=RL+HNXayQtGE0NKk+CK9u7dr+X0Tr+p83km14toIgnXP+jRsG2n80Oxo/xWxlkQalP+TfP
 8of35fPquFn7jisopf3p+lEqtJwkli/fjVtZSEViSqDwAKqPe9R2ye9j5DfInvu4XZC+7l
 Kegi7LjJSiNfeks2jDZI2YHXN7X5DN0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-IgqC5JS0MmScBwj8ZN1_ww-1; Wed, 18 May 2022 09:22:13 -0400
X-MC-Unique: IgqC5JS0MmScBwj8ZN1_ww-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2767806601;
 Wed, 18 May 2022 13:22:12 +0000 (UTC)
Received: from localhost (unknown [10.39.192.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 627C540C1438;
 Wed, 18 May 2022 13:22:12 +0000 (UTC)
Date: Wed, 18 May 2022 14:22:11 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: mst@redhat.com, jasowang@redhat.com, sgarzare@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, mlureau@redhat.com,
 jsnow@redhat.com, eblake@redhat.com, Coiby.Xu@gmail.com,
 hreitz@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 1/8] block: Support passing NULL ops to
 blk_set_dev_ops()
Message-ID: <YoTzA+b6CQ0SIMhD@stefanha-x1.localdomain>
References: <20220504074051.90-1-xieyongji@bytedance.com>
 <20220504074051.90-2-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ikh9E9HfY1zCM6D2"
Content-Disposition: inline
In-Reply-To: <20220504074051.90-2-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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


--ikh9E9HfY1zCM6D2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 04, 2022 at 03:40:44PM +0800, Xie Yongji wrote:
> This supports passing NULL ops to blk_set_dev_ops()
> so that we can remove stale ops in some cases.
>=20
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> ---
>  block/block-backend.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--ikh9E9HfY1zCM6D2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKE8wMACgkQnKSrs4Gr
c8g8Xwf/Wji7rLA5cNlqp2kjE0h2fW8ceUsuNnEsMNH0/1YG+/HGOll5LvTII4jE
td6wh5U9vX0U0yUihYwahdSl2hfYChQ5adwqhQzwm6kMzYcIOFmxHaAUUMwjnedY
eQnLgzh6+I+9A4rNNSp9DCNcAFfN/f6MKBuKgDYJ/oKe5d1WZWOh3R4AVBkV7emE
hx8X3+FetApTjA4kWc3TcsyQvE+LskUzvpsRK3lmAa5blMBdjN40R9mD2eff4xk3
ypY4YlWpLFLD4S+qnPgPG/elW6hRHI0XQ8LDmVTq2r2OToCrSsuzkHD6upv2c/ZN
8p4TNNXQYA3QvqsjsRXh8V9eLpZ7JA==
=nfT4
-----END PGP SIGNATURE-----

--ikh9E9HfY1zCM6D2--


