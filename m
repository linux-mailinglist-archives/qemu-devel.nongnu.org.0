Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D79509F51
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 14:09:28 +0200 (CEST)
Received: from localhost ([::1]:44632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVcl-0002lk-Qc
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 08:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nhVOw-0007pT-60
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:55:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nhVOu-0001AS-5w
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650542107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w15+eO6rZqKas8hLbc+U0/s5kqcL39gm62QU4aWRnv0=;
 b=I31HeF17NI5zPoIpO5srrzYqiY05XjgQS83ao/8vG0wSN7F3wg1sRudHHfVs7qxl4rTWqL
 RmEzOYfIMvd82tECQhOV2Kgy+9JgSu6Y76E2CIiOcli+JwlmwdfSrdeI6Ap9g4qO4Qkwib
 P6+QeFkzpwr98A3+Nba/X8Vm8ex9gII=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-dTr_SfpjMS-A-42Tu7mmow-1; Thu, 21 Apr 2022 07:55:05 -0400
X-MC-Unique: dTr_SfpjMS-A-42Tu7mmow-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 958F580A0AD;
 Thu, 21 Apr 2022 11:55:05 +0000 (UTC)
Received: from localhost (unknown [10.39.194.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39AC557233C;
 Thu, 21 Apr 2022 11:55:04 +0000 (UTC)
Date: Thu, 21 Apr 2022 12:35:59 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/19] block: fix coroutine_fn annotations
Message-ID: <YmEzj+KQI7pCoHvL@stefanha-x1.localdomain>
References: <20220415131900.793161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="giJnIXr/9NYnDXUa"
Content-Disposition: inline
In-Reply-To: <20220415131900.793161-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, marcandre.lureau@redhat.com, hreitz@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--giJnIXr/9NYnDXUa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 15, 2022 at 03:18:34PM +0200, Paolo Bonzini wrote:
> This is the initial result of reviving Marc-Andr=E9's series at
> https://patchew.org/QEMU/20170704220346.29244-1-marcandre.lureau@redhat.c=
om/.
> A lot of the patches are similar to the ones that Marc-Andr=E9 wrote,
> but due to the changes in the code it was easier to redo them.
>=20
> For nbd, the patch is on top of "nbd: mark more coroutine_fns" that
> I sent a few days ago and that (AIUI) Eric has already queued; only
> one function was missing, much to my surprise.
>=20
> Apart from this, I also identified the following functions that
> can be called both in coroutine context and outside:
>=20
> - qmp_dispatch
> - schedule_next_request
> - nvme_get_free_req
> - bdrv_create
> - bdrv_remove_persistent_dirty_bitmap
> - bdrv_can_store_new_dirty_bitmap
> - bdrv_do_drained_begin
> - bdrv_do_drained_end
> - bdrv_drain_all_begin
> - qcow2_open
> - qcow2_has_zero_init
> - bdrv_qed_open
> - qio_channel_readv_full_all_eof
> - qio_channel_writev_full_all
>=20
> besides, of course, everything that is generated by
> scripts/block-coroutine-wrapper.py.

This looks useful, thanks for bringing it back!

As Eric mentioned, the commits need justifications. The following cases
come to mind:

1. Add coroutine_fn because the function calls a function that is marked
   with coroutine_fn. This must be fixed because it can lead to crashes.

2. Remove coroutine_fn because the function does not call any functions
   marked with coroutine_fn. This is optional because it does not lead
   to crashes and maybe the author intended to be explicit that this
   function runs only in coroutine context even though it doesn't yield.

3. Variants of these cases but related to runtime qemu_in_coroutine()
   checks. Functions should not have coroutine_fn if they legitimately
   are called in both contexts. Any calls to coroutine_fn child
   functions must be conditional on qemu_in_coroutine() or something
   else that indicates whether we are running in coroutine context.

Stefan

--giJnIXr/9NYnDXUa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJhM48ACgkQnKSrs4Gr
c8gAAggAswSHVVW52ymBUXjxFWXOrtTV0zgVSchnrfe+ZuQjBjfUJgNTWEUj836k
rVQnaidItBNPa/qTw6Pgk4aRiXnhFYaJ3YTuoigbESKTpIoEItkcujJKodG5AU2x
puCkghAJWsmSWUYI5rKpVUUseZB0DRCM2+Vz3iuUyOrfsjtn7l25g/XdTd82OCNt
RaGRQEmKs1exl3TGBfSHE45k2i2gWFt90KO6Vmcu49F6U7AlpRFltrUekMwnuJnC
5mhk0dLwaCpykP96ULqMr/Mnpe+CA5aQ3cE3m9kyScwCpA20nXAHTdqbU5IA2RwY
Ssd57QisTkMjJcR3u+SnNbn91Bpy0Q==
=AwBI
-----END PGP SIGNATURE-----

--giJnIXr/9NYnDXUa--


