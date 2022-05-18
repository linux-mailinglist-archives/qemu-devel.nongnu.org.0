Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D7B52BB6F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 15:21:52 +0200 (CEST)
Received: from localhost ([::1]:37822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrJcd-0001SE-3Y
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 09:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nrJYU-0006wi-ST
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:17:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nrJYT-000092-CE
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:17:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652879852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w/bz6PhgEp9ot5IO9vy8tVBVVROfEv4XWqpAsELhWZY=;
 b=fAc7QfsKR8tkhTAI+1zONPYTT/HN000HuFCmT0amaMmkxMd+JmqPauzuSelYL0VMPtTyd9
 1XftNis5X96HdgsEVRcVTe4x2hG26ZYGk+zkUARku3hs/MEgu4UTzh2XGctbMU1hwQYlE6
 oxIRU+zOWeYiPo9CsaMueIG/DuEptO8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-H7vLXWk4Mg2FtZrfZWVEWw-1; Wed, 18 May 2022 09:17:26 -0400
X-MC-Unique: H7vLXWk4Mg2FtZrfZWVEWw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08D11395AFF4;
 Wed, 18 May 2022 13:17:26 +0000 (UTC)
Received: from localhost (unknown [10.39.192.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 689721121315;
 Wed, 18 May 2022 13:16:52 +0000 (UTC)
Date: Wed, 18 May 2022 14:16:51 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: mst@redhat.com, jasowang@redhat.com, sgarzare@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, mlureau@redhat.com,
 jsnow@redhat.com, eblake@redhat.com, Coiby.Xu@gmail.com,
 hreitz@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 2/8] block-backend: Introduce blk_get_guest_block_size()
Message-ID: <YoTxwwS97POt79PQ@stefanha-x1.localdomain>
References: <20220504074051.90-1-xieyongji@bytedance.com>
 <20220504074051.90-3-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cdaRaVcrWcQHMvAv"
Content-Disposition: inline
In-Reply-To: <20220504074051.90-3-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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


--cdaRaVcrWcQHMvAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 04, 2022 at 03:40:45PM +0800, Xie Yongji wrote:
> Support getting the guest block size for the block backend.
> It's needed for the following commit.
>=20
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> ---
>  block/block-backend.c             | 6 ++++++
>  include/sysemu/block-backend-io.h | 1 +
>  2 files changed, 7 insertions(+)
>=20
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 35457a6a1d..1582ff81c9 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -2106,6 +2106,12 @@ void blk_set_guest_block_size(BlockBackend *blk, i=
nt align)
>      blk->guest_block_size =3D align;
>  }
> =20
> +int blk_get_guest_block_size(BlockBackend *blk)
> +{
> +    IO_CODE();
> +    return blk->guest_block_size;

I have sent a patch to remove blk->guest_block_size because this field
is currently unused.

I think there is a cleaner way for this patch series to store the guest
logical_block_size (see next patch). Stashing it in BlockBackend was
attractive because virtio-blk-handler.c lacks a struct to store its
parameters (writable, serial, logical_block_size), but if such a struct
is introduced then there's no need to stash it in BlockBackend.

Stefan

--cdaRaVcrWcQHMvAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKE8cMACgkQnKSrs4Gr
c8jIJwf/QI1ZKgvWXQtv9YAjn2qUciBsFa+CIx2AUw3SLLn7p02Qmz9SIYKADu4s
Tkitqwypm3sVvywdVVaOLVqWnLK8Xc2gIwgNyZg0H4ln6hRLYhXVNDL1HB6EcYzf
/NzwcyZGLNJU1J3jKEiABQVv8Wz5amR0G35BYqrRVzHm5kqrsUOirrrYoPchaFR1
4QH6XDyYJuYl5/AxEHWhTArQP8f+sNfgOWhW04NNYtYOZCze7PK+P05XxAEiKoDH
qpNyb3c/J6bOfk07UabbBOkObktUyQa1JJPr3ZnqcqVehfsUR9YJDOwMPJ9Gmrq/
LqFwuD4QuPtT2/cBz91wK7g6X+6n+g==
=zh2a
-----END PGP SIGNATURE-----

--cdaRaVcrWcQHMvAv--


