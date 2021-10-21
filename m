Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FDC436539
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:10:51 +0200 (CEST)
Received: from localhost ([::1]:58364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdZiU-0001Wm-Ac
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mdZgz-0000Zs-J0
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:09:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mdZgv-00031o-LD
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:09:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634828951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F8j8MJ6NSwy1xgZd8cnGRWcDC9rwQgFW+X0vuD5YGxA=;
 b=F1sdXynAM3R16P1lZdYYhSOpKMeLg6ARV4UdEz/Zv+EIPOQzIvQiu5KHHrelLw0HG+dqNB
 krPxh613zU1ZM+2vmE+sIlhrGQ+m5BP9tjj+WxW6JVwnRUlQv3XvPhY++FiQUDCRPa2p8X
 z1UAuLMqExIkKzS9Npbv7htb3TKTOs0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-ZulQlKhuOQ2zuKxnUTd7MQ-1; Thu, 21 Oct 2021 11:09:09 -0400
X-MC-Unique: ZulQlKhuOQ2zuKxnUTd7MQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F01BB8D9C97;
 Thu, 21 Oct 2021 15:08:35 +0000 (UTC)
Received: from localhost (unknown [10.39.195.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 935A069FA0;
 Thu, 21 Oct 2021 15:08:35 +0000 (UTC)
Date: Thu, 21 Oct 2021 16:08:34 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v3 13/25] include/sysemu/blockdev.h: move drive_add and
 inline drive_def
Message-ID: <YXGCctLiWTOMokAl@stefanha-x1.localdomain>
References: <20211012084906.2060507-1-eesposit@redhat.com>
 <20211012084906.2060507-14-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211012084906.2060507-14-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0/3LD4dma8/V+Tu9"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

--0/3LD4dma8/V+Tu9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 12, 2021 at 04:48:54AM -0400, Emanuele Giuseppe Esposito wrote:
> drive_add is only used in softmmu/vl.c, so it can be a static
> function there, and drive_def is only a particular use case of
> qemu_opts_parse_noisily, so it can be inlined.
>=20
> Also remove drive_mark_claimed_by_board, as it is only defined
> but not implemented (nor used) anywhere.
>=20
> This also helps simplifying next patch.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block/monitor/block-hmp-cmds.c |  2 +-
>  blockdev.c                     | 27 +--------------------------
>  include/sysemu/blockdev.h      |  6 ++----
>  softmmu/vl.c                   | 25 ++++++++++++++++++++++++-
>  4 files changed, 28 insertions(+), 32 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--0/3LD4dma8/V+Tu9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFxgnIACgkQnKSrs4Gr
c8jiXAgAnUFztDi9RKOyI6WZqElTNCvxjthHRBvZjybqiawljdm/kBHM8QK+52X+
aVzE6s9qCCifvUEd298dXzKkyfGbSgsPGHlNdn2oTrOVt2/jwXBfGjYQQLyKJVGC
XE90OAR+bAM86ieCjR6sQUiADhJvdTbQcq336+GhhJ2fJn8tRd4HTEIax5FGDbk2
R6QAyXRFWnG1GeYjd1xBkvvSagBLBWIMitboy+Qkg4/8JLdh7XxKShWthTKW2M3T
xOZ6A2b3si1TdYAphe/F5jZMDXmxBPkivbNEtLZx0HVSZd4i4v0Xk4zMEfh5KZ5g
bjmFbocPuvrMaBdNOw6I6ZD5CdeUAA==
=VJjr
-----END PGP SIGNATURE-----

--0/3LD4dma8/V+Tu9--


