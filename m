Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1536F32F5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 17:35:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptVYF-0000GZ-4j; Mon, 01 May 2023 11:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptVYD-0000Fx-Am
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:34:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptVYB-0006Or-U5
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682955291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mwuGFDQJWzry6XUPdrDFLG6uTzoN++N+u1EnavUEUCQ=;
 b=Z4bTa5xwlKvJGi+8YVqSJyeWSM5k1HcgD/2f9ghU4+aubBxaEP86aQ7U3FO3kY9PSr8gGd
 Wlo/pZtuS248Qr+hFuh9FXAtzgBMU3oZeeNoWEPuDeU/BEGBb4Rr23hs6UlyeWyf2Wtw71
 69o3lVs5trECC6cNmoHyoIUVQVTWA1Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-cPhiN_apPiiDPVkzI2w05g-1; Mon, 01 May 2023 11:34:45 -0400
X-MC-Unique: cPhiN_apPiiDPVkzI2w05g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38746A0F3A3;
 Mon,  1 May 2023 15:34:44 +0000 (UTC)
Received: from localhost (unknown [10.39.192.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 900162166B26;
 Mon,  1 May 2023 15:34:43 +0000 (UTC)
Date: Mon, 1 May 2023 11:34:41 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, pbonzini@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 07/20] graph-lock: Fix GRAPH_RDLOCK_GUARD*() to be reader
 lock
Message-ID: <20230501153441.GI14869@fedora>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-8-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HbTEVWLtuhTbC0hf"
Content-Disposition: inline
In-Reply-To: <20230425173158.574203-8-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--HbTEVWLtuhTbC0hf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 07:31:45PM +0200, Kevin Wolf wrote:
> GRAPH_RDLOCK_GUARD() and GRAPH_RDLOCK_GUARD_MAINLOOP() only take a
> reader lock for the graph, so the correct annotation for them to use is
> TSA_ASSERT_SHARED rather than TSA_ASSERT.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/block/graph-lock.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
> index 7ef391fab3..adaa3ed089 100644
> --- a/include/block/graph-lock.h
> +++ b/include/block/graph-lock.h
> @@ -210,7 +210,7 @@ typedef struct GraphLockable { } GraphLockable;
>   * unlocked. TSA_ASSERT() makes sure that the following calls know that =
we

Does this comment need to be updated to TSA_ASSERT_SHARED()?

>   * hold the lock while unlocking is left unchecked.
>   */
> -static inline GraphLockable * TSA_ASSERT(graph_lock) TSA_NO_TSA
> +static inline GraphLockable * TSA_ASSERT_SHARED(graph_lock) TSA_NO_TSA
>  graph_lockable_auto_lock(GraphLockable *x)
>  {
>      bdrv_graph_co_rdlock();
> @@ -254,7 +254,7 @@ typedef struct GraphLockableMainloop { } GraphLockabl=
eMainloop;
>   * unlocked. TSA_ASSERT() makes sure that the following calls know that =
we

Same.

--HbTEVWLtuhTbC0hf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRP3BEACgkQnKSrs4Gr
c8jt7wf9EntnH9pXIK8UxCMuiYZyNw8XNvNTe4bhKL/pfsiPrDdXFjHWZUQ3gJHN
yx3tmFUCAACGCl0DtzZht/BRiHlH0P+RW808MWcK7vYcoYwAReixoh0Prvy2wCNl
wX8s85PkzNZL4obN+vk/GyrdJyNTbWQVHVurbVBhq36CYqNoSPuiocLMajXxinUR
2pW+JspEqKyNbTnu1G2gb8hPXH/u7lpLL9Bmgp3uAHmZJGHlKhD4r7zRvWsM5NWk
8aQZRY6IXlGOtMpeoiFrDMDCJkYzOC48E/G5vp/V/HmD6uPhWPC7fTsX0lcRGhPH
jpY/sMTno2qrr49RjypMOxrqyFnrEw==
=sJua
-----END PGP SIGNATURE-----

--HbTEVWLtuhTbC0hf--


