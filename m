Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6746042518A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 12:54:43 +0200 (CEST)
Received: from localhost ([::1]:33304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYR2w-00030W-Eq
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 06:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYR1P-00025J-Fc
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:53:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYR1N-0007yd-WF
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:53:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633603985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=psHzgoOR5M3e7pk9ux8+RrFxhhyWUcu5yN2NbRBGPME=;
 b=eoqfg1vA4U741cd1tRoSS/S/qrdNHgaBQ0Xw7cHBy9wsOQ6i+IR8eRnt43HC1xO8zw/9aJ
 iYxKvh9keF4Waes8k5u7oC3dwyQzNj9a5AWqsr7eytqDBHKIcbPn8OOHuIxh7QdHM+cxFI
 IXSmKupDUi+i2jYhZPKDicmzbtY8lqM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-El--VPKDOdis2tYA3ywdew-1; Thu, 07 Oct 2021 06:53:02 -0400
X-MC-Unique: El--VPKDOdis2tYA3ywdew-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 346E3196632F;
 Thu,  7 Oct 2021 10:53:01 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 718A79AA36;
 Thu,  7 Oct 2021 10:53:00 +0000 (UTC)
Date: Thu, 7 Oct 2021 11:52:59 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 06/25] include/block/block_int: split header into
 I/O and global state API
Message-ID: <YV7Ri5adGVrl0pPQ@stefanha-x1.localdomain>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-7-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005143215.29500-7-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/idenvPpQx9WeX/W"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--/idenvPpQx9WeX/W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 05, 2021 at 10:31:56AM -0400, Emanuele Giuseppe Esposito wrote:
> +int coroutine_fn bdrv_co_copy_range_from(BdrvChild *src, int64_t src_offset,
> +                                         BdrvChild *dst, int64_t dst_offset,
> +                                         int64_t bytes,
> +                                         BdrvRequestFlags read_flags,
> +                                         BdrvRequestFlags write_flags);
> +int coroutine_fn bdrv_co_copy_range_to(BdrvChild *src, int64_t src_offset,
> +                                       BdrvChild *dst, int64_t dst_offset,
> +                                       int64_t bytes,
> +                                       BdrvRequestFlags read_flags,
> +                                       BdrvRequestFlags write_flags);

These look like I/O APIs to me. Are they in the GS API because only
qemu-img.c call copy_range? I thought SCSI emulation might call it too,
but grep says otherwise.

Otherwise:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--/idenvPpQx9WeX/W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFe0YsACgkQnKSrs4Gr
c8gb1wgAgMIG2u3wcNxTBHHK/pufae0yYd6ZsdmI2ThK4ZEcHA5m/mz0O55Sr5zC
eksl/A96TotkNNObEXJZPeuXL1GyirRxd6qCLSigx/6mv+jJQWcDnrs2tDMJj26m
34319HP1BtFv45B8XJfSeBssB4/TuWpaY1WGOG8JZ9489DQ9uFkCm7wxXGVXRV2Q
Q2mqxXxEdxtkcvdYBn07EiZJzpjbR/NkiiCJCumcByN+6LRWJ/CJfxMjkOeY7Uul
szMj5BnbR7q3g7VOFXmKWzCFJwTQpmoPag+h0wV5z4wdbKPXFdm2AhD35ONlAUGJ
USPswH9LGGtTA/FpgtOvpRLzeNUqwA==
=Usgm
-----END PGP SIGNATURE-----

--/idenvPpQx9WeX/W--


