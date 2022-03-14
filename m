Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D8F4D8ABC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 18:24:49 +0100 (CET)
Received: from localhost ([::1]:37386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nToR5-00067m-NK
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 13:24:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nToPh-0004jZ-AG
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:23:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nToPe-0005uG-Nm
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:23:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647278597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ktkjmz/dswC8WrrpDBnO+6/30eEQe483g6gb+TqhNts=;
 b=Y9yxrpc9xph+YjDJmEj32GUqKGHNrjLL4pQLQvLJ+CWhFEVSElbaq/xLFG4kKtIHqr0tHT
 4bDMS/TU1+PEsSHQnGZ+g3ToQTik1xvStMxEiU7Qv/uHQ/qjlIIWR5K9bMxSn/ZXVl5p4I
 +aFVx5iIBYID9eu7pGQShbFAz+st0b8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-UnVJIJUGP8G4IU-PshcMSQ-1; Mon, 14 Mar 2022 13:23:15 -0400
X-MC-Unique: UnVJIJUGP8G4IU-PshcMSQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21BEC106655B;
 Mon, 14 Mar 2022 17:23:15 +0000 (UTC)
Received: from localhost (unknown [10.39.195.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E9072D475;
 Mon, 14 Mar 2022 17:23:02 +0000 (UTC)
Date: Mon, 14 Mar 2022 17:23:00 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>, John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 1/6] block: Support passing NULL ops to
 blk_set_dev_ops()
Message-ID: <Yi959Cf+k8z8gOwm@stefanha-x1.localdomain>
References: <20220215105943.90-1-xieyongji@bytedance.com>
 <20220215105943.90-2-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nKnbn5V4qEAn57Ee"
Content-Disposition: inline
In-Reply-To: <20220215105943.90-2-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 mlureau@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--nKnbn5V4qEAn57Ee
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:59:38PM +0800, Xie Yongji wrote:
> This supports passing NULL ops to blk_set_dev_ops()
> so that we can remove stale ops in some cases.
>=20
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> ---
>  block/block-backend.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 4ff6b4d785..08dd0a3093 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1015,7 +1015,7 @@ void blk_set_dev_ops(BlockBackend *blk, const Block=
DevOps *ops,
>      blk->dev_opaque =3D opaque;
> =20
>      /* Are we currently quiesced? Should we enforce this right now? */
> -    if (blk->quiesce_counter && ops->drained_begin) {
> +    if (blk->quiesce_counter && ops && ops->drained_begin) {
>          ops->drained_begin(opaque);
>      }
>  }

John: You added this code in f4d9cc88ee6. Does blk_set_dev_ops() need to
call ->drained_end() when ops is set to NULL?

Stefan

--nKnbn5V4qEAn57Ee
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIvefQACgkQnKSrs4Gr
c8iFiAf/TWQL/zL3LCDrICStXgmBp75y3oDQbik5TB/rgYuk0s2tXGEG58u3F6ZP
e6gXaK2jUyh1YbFQ0EVdqZnU3+SaxfpM/A8J+U4qG33O/JEWso4zmyW8YWSa7zeS
JwQ9WEIrlsCXMmy4SRdM20bsqx88MP+WfPRU53fCaUsrFYNKPmZO76JicJxwecal
99DIVsIEto7ghj1aCC4yFy4wY/PUy4pDIoe15Vd56azcyju3gNQfKjSx5RQI0EkS
Vv6Ga5Q11fHAQ3Wda3BD8jgmQMxRrPIalOfoBeKjiCW7oW/GHfVmOSeXY2ix8HsB
OKK6CYjLyEllD5p7L6ZF8e2osZHOcA==
=muyS
-----END PGP SIGNATURE-----

--nKnbn5V4qEAn57Ee--


