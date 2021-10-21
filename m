Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 708FA43661C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:24:44 +0200 (CEST)
Received: from localhost ([::1]:58318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdZvv-0004MG-FU
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mdZqH-00051e-RH
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:18:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mdZqF-0003On-DA
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:18:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634829530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TQ17gD85fJaPXT9NYiEU5A6gnc/x789edLCp5lJS03w=;
 b=XmxrKNdPiprM6mrTry80UN2a2igwRry2VEPFLUVxO8waLEwfk8JU2e3J0JgYwnreIsgqq5
 KoU8Qyg43KCZBttWroGjXc1MQmRKJ99fOPXeagGsog78XxbtRHytruMXM/NB4F05kctkYs
 OYIRmRmS3f85QaDsp13c2mEt+25w8QU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-pgvCD_lyOGiqPf4YKeG27Q-1; Thu, 21 Oct 2021 11:18:47 -0400
X-MC-Unique: pgvCD_lyOGiqPf4YKeG27Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 387A080A5C2;
 Thu, 21 Oct 2021 15:18:46 +0000 (UTC)
Received: from localhost (unknown [10.39.195.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D50765F4F5;
 Thu, 21 Oct 2021 15:18:41 +0000 (UTC)
Date: Thu, 21 Oct 2021 16:18:41 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH 1/3] file-posix: add `aio-max-batch` option
Message-ID: <YXGE0e/08DZXO1pj@stefanha-x1.localdomain>
References: <20210923143100.182979-1-sgarzare@redhat.com>
 <20210923143100.182979-2-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210923143100.182979-2-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="00r3C8Xdxw9HR/S7"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00r3C8Xdxw9HR/S7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 23, 2021 at 04:30:58PM +0200, Stefano Garzarella wrote:
> Commit d7ddd0a161 ("linux-aio: limit the batch size using
> `aio-max-batch` parameter") added a way to limit the batch size
> of Linux AIO backend for the entire AIO context.
>=20
> The same AIO context can be shared by multiple devices, so
> latency-sensitive devices may want to limit the batch size even
> more to avoid increasing latency.
>=20
> For this reason we add the `aio-max-batch` option to the file
> backend, which will be used by the next commits to limit the size of
> batches including requests generated by this device.
>=20
> Suggested-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  qapi/block-core.json | 5 +++++
>  block/file-posix.c   | 9 +++++++++
>  2 files changed, 14 insertions(+)
>=20
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index c8ce1d9d5d..1a8ed325bc 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -2851,6 +2851,10 @@
>  #              for this device (default: none, forward the commands via =
SG_IO;
>  #              since 2.11)
>  # @aio: AIO backend (default: threads) (since: 2.8)
> +# @aio-max-batch: maximum number of requests in an AIO backend batch tha=
t
> +#                 contains request from this block device. 0 means that =
the

The first sentence is a little unclear. I guess s/request/requests/ but
that still doesn't doesn't fully explain how this works.

Does the AIO backend use the minimum aio-max-batch value of all its
blockdevs?

Maybe:

  maximum number of requests to batch together into a single submission
  in the AIO backend. If multiple BlockdevOptionsFile sharing an AIO
  backend have different values the smallest value is chosen. ...

--00r3C8Xdxw9HR/S7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFxhNAACgkQnKSrs4Gr
c8gj5wf9FQyXsURkzERtzoy1YK7dtQB85SSpvIP3GpWsCZkN7NXxP8tZVZdc1gtT
Tzf610R8ljL6nFZtJae/dTzzaZ9fx4GcOC+Zts3ArF5iwlRD5LLTQgfw7f4+vYm5
ca9ETmBQQ+M2AA1YQZ8F3QJUl7TgHeQy07h71g+c2blEv6c+9WnXX8I1rwXwTgTq
5xukl95WE0Q/ayc2OlmNLjzHaCgwcEXr5InUiUDGvbtYP10Nv/xJjqw2k/2jBrYX
9arpf/73iWdTLTT3Ga+rLdLG/LjbJ8oyYiPHAUBA98pWZis9mB0oFuAz/ttXciDp
fOu+MG1YLfdtWQzHuF7B1vhufqE3cw==
=CW97
-----END PGP SIGNATURE-----

--00r3C8Xdxw9HR/S7--


