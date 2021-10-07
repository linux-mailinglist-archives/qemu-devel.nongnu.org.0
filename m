Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C0742557D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 16:32:37 +0200 (CEST)
Received: from localhost ([::1]:38322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYURo-0001wJ-UH
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 10:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUP2-00084z-71
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:29:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUP0-0001qN-Ee
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:29:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633616981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/Hs4JJNnlM6Dr1X2hdhhdGfPIH+YTBoP5KZLrZxufZA=;
 b=RegK7tdISV5XpJO2CfGPrpxyL1Yp9iPEnOSPPX4Ij0Laxvm7yU89XlSnTGrXZvV69RqolV
 E86sAwNP6Qe7n7PSw6Zt3eaYzEiITwJS7Xs6BBYUtL/UzWpockjAkrv/RUamoAClaxRzKi
 jSd3jCvGSU4h2WPwsryWBdwyh2iFix8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-rye5f7BbM-2WWlEhG78XtA-1; Thu, 07 Oct 2021 10:29:04 -0400
X-MC-Unique: rye5f7BbM-2WWlEhG78XtA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D4068042F4;
 Thu,  7 Oct 2021 14:29:03 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20DC15C1CF;
 Thu,  7 Oct 2021 14:28:48 +0000 (UTC)
Date: Thu, 7 Oct 2021 15:28:47 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 13/25] include/systemu/blockdev.h: global state API
Message-ID: <YV8EH2uRn6xrnWBp@stefanha-x1.localdomain>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-14-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005143215.29500-14-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sdFwa34iOPzUGkTz"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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

--sdFwa34iOPzUGkTz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 05, 2021 at 10:32:03AM -0400, Emanuele Giuseppe Esposito wrote:
> blockdev functions run always under the BQL lock.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/sysemu/blockdev.h | 35 ++++++++++++++++++++++++++++++-----
>  1 file changed, 30 insertions(+), 5 deletions(-)
>=20
> diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
> index 32c2d6023c..28233f6b63 100644
> --- a/include/sysemu/blockdev.h
> +++ b/include/sysemu/blockdev.h
> @@ -38,24 +38,49 @@ struct DriveInfo {
>      QTAILQ_ENTRY(DriveInfo) next;
>  };
> =20
> -DriveInfo *blk_legacy_dinfo(BlockBackend *blk);
> +/*
> + * Global state (GS) API. These functions run under the BQL lock.
> + *
> + * If a function modifies the graph, it also uses drain and/or
> + * aio_context_acquire/release to be sure it has unique access.
> + * aio_context locking is needed together with BQL because of
> + * the thread-safe I/O API that concurrently runs and accesses
> + * the graph without the BQL.
> + *
> + * It is important to note that not all of these functions are
> + * necessarily limited to running under the BQL, but they would
> + * require additional auditing and may small thread-safety changes
> + * to move them into the I/O API. Often it's not worth doing that
> + * work since the APIs are only used with the BQL held at the
> + * moment, so they have been placed in the GS API (for now).
> + *
> + * All functions in this header must use this assertion:
> + * g_assert(qemu_in_main_thread());
> + * to catch when they are accidentally called without the BQL.
> + */
> +
>  DriveInfo *blk_set_legacy_dinfo(BlockBackend *blk, DriveInfo *dinfo);
>  BlockBackend *blk_by_legacy_dinfo(DriveInfo *dinfo);
> =20
>  void override_max_devs(BlockInterfaceType type, int max_devs);
> =20
>  DriveInfo *drive_get(BlockInterfaceType type, int bus, int unit);
> -void drive_mark_claimed_by_board(void);

This function prototype is no longer used. Please make a note of this in
the commit description so reviewers know the deletion is intentional and
the reason for it. (It could have been an accident so I had to grep the
code to figure out why you did this.)

Otherwise:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--sdFwa34iOPzUGkTz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFfBB8ACgkQnKSrs4Gr
c8jKZQf/SzPbNFjyV3CLxW0OBw6f1Q6KtilfPhPgbjdk9jWBc7qTR25PpR4o7s4H
y9FglnjbXnknGDAoTAHSqv3GgipWdWltm/FGyPASDO7Hh25hxd2ouupP6iI3Phy+
fWofXhGJY38Y60FWG01RcvbvrwXOPlfS2msKpAhoUCU01Czz6mnkrMVQYSaJRqys
3x0VjmC4hEap3sOX6Az6ebNWuooea4fNJ58DY9DEFHJSpihEmHt6j7FBSO0URAMx
TgoChgt+8PQkbc8A3rYAVZ/qGhx9vpVesagcMpAojB1xHXb+pjBBzTJoUuOezjhc
+BekBmCJ3IWbWg4t5tdLsmHMlxNJJg==
=gB6Y
-----END PGP SIGNATURE-----

--sdFwa34iOPzUGkTz--


