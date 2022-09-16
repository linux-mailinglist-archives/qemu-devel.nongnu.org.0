Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DB85BBA4A
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 22:20:35 +0200 (CEST)
Received: from localhost ([::1]:52226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZeIk-0004YJ-KA
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 16:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oZeG4-0008Ou-Lp
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 16:17:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oZeG1-0001BD-Sz
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 16:17:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663445864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1XMdaPp2G4QLedMDzTeGoq9hjrCS5Vbk3WZS2kFADMk=;
 b=CDBAVcsoW1DpHPffVHZw7j1XjlYwbE71SD199b7Q0+h0AidumdbDR9pygjDEDLQfCwWuq3
 l801xToZslMDnFieimIW/GeTO1vdinnm0MIiiAsiIrG1WEVJvojGQvFPuh8/XckJS8Xi7Q
 vvd7qWgRDzzLYpiNW2zb5As3DHg8Bew=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-rMRidAiOONW-NFdiH0jUmA-1; Sat, 17 Sep 2022 16:17:40 -0400
X-MC-Unique: rMRidAiOONW-NFdiH0jUmA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31BB83C025C9;
 Sat, 17 Sep 2022 20:17:40 +0000 (UTC)
Received: from localhost (unknown [10.39.192.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 829A549BB60;
 Sat, 17 Sep 2022 20:17:33 +0000 (UTC)
Date: Fri, 16 Sep 2022 15:22:04 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, dmitry.fomichev@wdc.com,
 Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 damien.lemoal@opensource.wdc.com, hare@suse.de,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v9 5/7] config: add check to block layer
Message-ID: <YySUnG5vCxTJj8g1@fedora>
References: <20220910052759.27517-1-faithilikerun@gmail.com>
 <20220910052759.27517-6-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9OSq/dvxdgN8MoSj"
Content-Disposition: inline
In-Reply-To: <20220910052759.27517-6-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9OSq/dvxdgN8MoSj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 10, 2022 at 01:27:57PM +0800, Sam Li wrote:
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 4edfa25d04..354de22860 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -779,6 +779,20 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
>              goto fail;
>          }
>      }
> +#ifdef CONFIG_BLKZONED
> +    /*
> +     * The kernel page chache does not reliably work for writes to SWR zones

s/chache/cache/

--9OSq/dvxdgN8MoSj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMklJwACgkQnKSrs4Gr
c8hr8Af/d9uykBgpoZ8KF2f/UWaGvPdG91g1hoyaZtBwuwvH+CVg07qcw/Xszppu
+twWUV1SylhKC6kjrUoj98RI3IvjO6hYW4zqMJePbHxHDSHPB+j5ZehGXaQ6gS19
wdtrm4t/NmLyBrQKOJiyojF8lwebBhOnRw4WLGCaefatDYs8NBReGvGuwALdzz1l
TuXTHl9Cu02C75WVlTdDb8//5FdpEde4bNmT6g+rvOwbhhHivu5qX1/7bmiTeXnB
pgUp688Eb3UNjLKrqHq2lgHtw35f7AziD5EEQ2fO7SYjR7DRJx9pGPI+rLaGbuXW
Xt+BM2TDs7SZQXzM2X2VaZsfrrqSQg==
=AMoQ
-----END PGP SIGNATURE-----

--9OSq/dvxdgN8MoSj--


