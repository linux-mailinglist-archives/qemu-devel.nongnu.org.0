Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7C96BD981
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 20:47:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pctYn-0006me-At; Thu, 16 Mar 2023 15:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pctYk-0006k7-P7
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 15:46:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pctYj-000877-Aw
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 15:46:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678996003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c3osPEUo33GBz3waOA47EUlVTOJbjwEWJmA/zsrLaqc=;
 b=Suu/cnD/wyEkfRb1qNAvkT9z58khMBu6yTH9tmDl4pXEJsVK+XKfxY2Kr9Q38ZoyfjkPLr
 A/AIN0BKuOhyBfoz8QcBXVPltpCpsmZPmXlgmytws+QsmxEDJyUaeqauNd8LOrfU1OrnRz
 Xmnm1ln1+9omUpgevRfblxnCw1cPeEs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-TOjeRjLtMz-4hLlINjY26w-1; Thu, 16 Mar 2023 15:46:40 -0400
X-MC-Unique: TOjeRjLtMz-4hLlINjY26w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA5B12808E72;
 Thu, 16 Mar 2023 19:46:39 +0000 (UTC)
Received: from localhost (unknown [10.39.192.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE07840AE2C0;
 Thu, 16 Mar 2023 19:46:38 +0000 (UTC)
Date: Thu, 16 Mar 2023 14:51:37 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, dmitry.fomichev@wdc.com,
 qemu-block@nongnu.org, hare@suse.de, Julia Suvorova <jusual@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, damien.lemoal@opensource.wdc.com,
 Aarushi Mehta <mehta.aaru20@gmail.com>
Subject: Re: [PATCH v6 1/4] file-posix: add tracking of the zone write pointers
Message-ID: <20230316185137.GB63600@fedora>
References: <20230310103106.62124-1-faithilikerun@gmail.com>
 <20230310103106.62124-2-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="v0f4RFJkN9hRqTJT"
Content-Disposition: inline
In-Reply-To: <20230310103106.62124-2-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


--v0f4RFJkN9hRqTJT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 10, 2023 at 06:31:03PM +0800, Sam Li wrote:
> @@ -2338,9 +2424,15 @@ static int coroutine_fn raw_co_prw(BlockDriverStat=
e *bs, uint64_t offset,
>  {
>      BDRVRawState *s =3D bs->opaque;
>      RawPosixAIOData acb;
> +    int ret;
> =20
>      if (fd_open(bs) < 0)
>          return -EIO;
> +#if defined(CONFIG_BLKZONED)
> +    if (bs->bl.wps) {
> +        qemu_co_mutex_lock(&bs->bl.wps->colock);
> +    }
> +#endif

Is the lock only needed by QEMU_AIO_WRITE requests? If yes, can we skip
it for other request types to avoid serializing those requests?

--v0f4RFJkN9hRqTJT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQTZTkACgkQnKSrs4Gr
c8hUzgf/UsdfVUBzAAK4FkNO01KV+6DnQREonheYcICCe1dRKKBG5UqyUPNvKME1
Wb9Tqo9zMyz2tdeN+D3B8r1JETrWLJtJhQJE2lq8+05b85Yl2B8kyOpHX+suNRcx
3J+BUotKxESVtV8AIokQ5mqhviUAIxXJyPklHGxYTTd5i7Hi0RUly1QqsUR+7Kbw
DCFE2zyuxQCPNw8w9sSZjh8FL4/x2Ik/jWXBYoETV0032SxaRVpwRlZu9QPJQIyE
OPnz+j226jSrg4JMXARuSGU0kCpuhvLj997xqfrRp2f/oih2mP4MkiS6xCNxQD2V
BxLtUfHjTK7HpIe8TEHMmsWYoLAd+A==
=+Lv2
-----END PGP SIGNATURE-----

--v0f4RFJkN9hRqTJT--


