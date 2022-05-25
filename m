Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C0C5341A5
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 18:44:22 +0200 (CEST)
Received: from localhost ([::1]:49696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntu7Q-0002DU-Gc
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 12:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nttTw-0001VI-W9
 for qemu-devel@nongnu.org; Wed, 25 May 2022 12:03:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nttTt-0004HC-KJ
 for qemu-devel@nongnu.org; Wed, 25 May 2022 12:03:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653494608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jfFMS3wOy5kEcEJh33K4StxjowzbqkIIX7ZxCbn63HM=;
 b=WwgdQ3t8ouxocpi8PMRp0tyVBZBnwbjRDTQW80HRws+8zGVvSWCyhFDYQR4eMb/bFZMGpT
 Jfdtv7MWGcqip2eluOLrNs4874N/f5P6DOYPI1Y5QWARNMilCv0PnmeZcHQlQYh8W3xGXh
 2mpKmfmv/sRBnRHtLzFZxLnofjKAwAU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-eITyyoMJMqaSV8MhdhJ-VQ-1; Wed, 25 May 2022 12:03:26 -0400
X-MC-Unique: eITyyoMJMqaSV8MhdhJ-VQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C5DB8001EA;
 Wed, 25 May 2022 16:03:26 +0000 (UTC)
Received: from localhost (unknown [10.39.195.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B427DC27E8F;
 Wed, 25 May 2022 16:03:25 +0000 (UTC)
Date: Wed, 25 May 2022 17:03:24 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mst@redhat.com,
 marcandre.lureau@redhat.com, mathieu.poirier@linaro.org,
 viresh.kumar@linaro.org, Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH  v2 01/15] contrib/vhost-user-blk: fix 32 bit build and
 enable
Message-ID: <Yo5TTKNm0E/6v+rS@stefanha-x1.localdomain>
References: <20220524154056.2896913-1-alex.bennee@linaro.org>
 <20220524154056.2896913-2-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nW6Do2J0JLY8U6se"
Content-Disposition: inline
In-Reply-To: <20220524154056.2896913-2-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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


--nW6Do2J0JLY8U6se
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 24, 2022 at 04:40:42PM +0100, Alex Benn=E9e wrote:
> We were not building the vhost-user-blk server due to 32 bit
> compilation problems. The problem was due to format string types so
> fix that and then enable the build. Tweak the rule to follow the same
> rules as other vhost-user daemons.
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Message-Id: <20220321153037.3622127-12-alex.bennee@linaro.org>
> ---
>  meson.build                             | 2 +-
>  contrib/vhost-user-blk/vhost-user-blk.c | 6 +++---
>  contrib/vhost-user-blk/meson.build      | 3 +--
>  3 files changed, 5 insertions(+), 6 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--nW6Do2J0JLY8U6se
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKOU0wACgkQnKSrs4Gr
c8gB3wf/SctpqTonlgXYX83erepUp47AamPPkbsPWcNXjNYQWwOJaYQKY/hy+nWC
tkx6CcvQiHu/KsiazZUv3msPLxPM51ExH6Q7uadSZe/H8iM4827BGgHTredEpbY8
6jtZTnznK98MHagCayxs4gCfAnCYDinYwhxRJwUUorN2+tN0tVkrDXndG2LxE090
dD6Vt2YyAd/i2rOs0mQ/U8I9ZTqlHAJHpEz0tVC2tXayb8dmDu1yeMaHFb/co67Y
T0poxx5VJiQ0dg14UZgaZDcejUkhPNDDpHn+sSbBYkl7w+GRLKxGpnUIuNtSkS0g
7SjFp3ilA6WKWRXn0+kKBKGjlHBMvQ==
=p5iA
-----END PGP SIGNATURE-----

--nW6Do2J0JLY8U6se--


