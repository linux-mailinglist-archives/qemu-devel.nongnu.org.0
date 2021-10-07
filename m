Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D5242555A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 16:25:16 +0200 (CEST)
Received: from localhost ([::1]:59062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYUKh-00050D-Gh
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 10:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUJU-0003dn-00
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:24:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUJR-0005vm-VD
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:23:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633616637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hF23QxXLZikjPrjGM+jIhH16XEP+ST6ydi18H4abzmY=;
 b=Wzt3iqccQpHWvCcGOupJ3Zn0tMqAT18lOr77t5e7V+za7yhofhA7VauidtOg6JuVDhnNpz
 RJkomlY5uSBm44pEiFv381u4+qw18HHUhcAHqMYmTe5JY2S9gl+2ht907pB7PH+MMboNWr
 G9i3l//N2CcPDZtXRtUPmK57hwLwvAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-JN59DVaPMVWqfmmjwOLC5Q-1; Thu, 07 Oct 2021 10:23:56 -0400
X-MC-Unique: JN59DVaPMVWqfmmjwOLC5Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01B4B100C664;
 Thu,  7 Oct 2021 14:23:55 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B6021F464;
 Thu,  7 Oct 2021 14:23:54 +0000 (UTC)
Date: Thu, 7 Oct 2021 15:23:53 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 11/25] include/block/blockjob.h: global state API
Message-ID: <YV8C+W7PQkVI4+gR@stefanha-x1.localdomain>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-12-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005143215.29500-12-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="brtmjgFuW3S0ITWg"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

--brtmjgFuW3S0ITWg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 05, 2021 at 10:32:01AM -0400, Emanuele Giuseppe Esposito wrote:
> blockjob functions run always under the BQL lock.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/block/blockjob.h | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/include/block/blockjob.h b/include/block/blockjob.h
> index d200f33c10..3bf384f8bf 100644
> --- a/include/block/blockjob.h
> +++ b/include/block/blockjob.h
> @@ -77,6 +77,27 @@ typedef struct BlockJob {
>      GSList *nodes;
>  } BlockJob;
> =20
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
> + * All functions below must use this assertion:
> + * g_assert(qemu_in_main_thread());
> + * to catch when they are accidentally called without the BQL.
> + */

This is comment is duplicated in many places. I suggest explaining it in
one place and using references in the other files:

  /*
   * Global state (GS) API. These functions run under the BQL lock.
   *
   * See include/block/block.h for more information about the GS API.
   */

--brtmjgFuW3S0ITWg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFfAvkACgkQnKSrs4Gr
c8jy6wf/Vfj2AvkVF2Vk0c49aAapMlmfE/fTmds7yWheIWeFbz+Yc2REONQbo4GT
AeXBZ7UyqihHn3sHBY2VbonTU63FXSvZj2PXqbeiThcg9wXY0ry8ZXfjr37SeUTs
UBubuKHpZa5/OyH1lwoJBuG7NaajL5NAcgTStaXEItzaGoKeg70uAOgQB6T02vXr
KCHQAvwJRJ/upaPxrNxrjSIdc9emjkeUj86Lav+F0r3DwJAyqM5reUVCDptjxBK6
JnDNtZIYunwh0nO5KKgzVRxEmDbI7ZD5uoYORus+UTBx2kxRwhWz4/gLX1tefPck
Ph+VoKJ9878ZxuhCYPl010ErCCJq3A==
=SuOi
-----END PGP SIGNATURE-----

--brtmjgFuW3S0ITWg--


