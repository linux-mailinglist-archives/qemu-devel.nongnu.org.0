Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A02BB6F3678
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 21:05:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptYnt-0000uh-6L; Mon, 01 May 2023 15:03:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptYnq-0000u0-Kq
 for qemu-devel@nongnu.org; Mon, 01 May 2023 15:03:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptYno-0004ms-LA
 for qemu-devel@nongnu.org; Mon, 01 May 2023 15:03:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682967791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kcf1wnISySQJyqm850z69jR6W0V8ccUJ79ybjCRLjrQ=;
 b=QmhTe6nY8y2vgOmyd1Cwkds7kuizcTDl2S50sOr9oyl21LBfoOoCb+XxOKNL0FDUStejdJ
 6CUhcy2a8dOBIAejlh2C+2D2oe4zYtnVZzyHgLnwkbsJm1EVW4MsQs/WsshdoSl7+PYaf3
 bpeTipnDoJXgqaTU5IST6iu3hkhodmw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-R62b0ZtEMIuyKUIXLf2AGA-1; Mon, 01 May 2023 15:03:07 -0400
X-MC-Unique: R62b0ZtEMIuyKUIXLf2AGA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 681253850542;
 Mon,  1 May 2023 19:03:07 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F175C51E3;
 Mon,  1 May 2023 19:03:06 +0000 (UTC)
Date: Mon, 1 May 2023 15:03:05 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, pbonzini@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 13/20] block: Mark bdrv_co_get_allocated_file_size() and
 callers GRAPH_RDLOCK
Message-ID: <20230501190305.GO14869@fedora>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-14-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="i0yefTUaRUwmBE70"
Content-Disposition: inline
In-Reply-To: <20230425173158.574203-14-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--i0yefTUaRUwmBE70
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 25, 2023 at 07:31:51PM +0200, Kevin Wolf wrote:
> @@ -5778,6 +5779,7 @@ int64_t coroutine_fn bdrv_co_get_allocated_file_size(BlockDriverState *bs)
>  {
>      BlockDriver *drv = bs->drv;
>      IO_CODE();
> +    assert_bdrv_graph_readable();

Is there a need for runtime assertions in functions already checked by
TSA?

I guess not. Otherwise runtime assertions should have been added in many
of the other functions marked GRAPH_RDLOCK in this series.

--i0yefTUaRUwmBE70
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRQDOkACgkQnKSrs4Gr
c8hx8QgAsQBXQTkpL+HnwZcU2J+tT+UdG+Ltkfz0ZcjyJE4hBGf+NXfV8UaKpvMr
fryeHBlxo3c6OiCdYB7fAL3V7VHEz27ysJru30P9TI0sqa1V4GzwpKy56KdQxcmL
NvFF7uEMsTWOJ8G1iLRGiuLruHej58pie1zX7EZIyLlsVEz4t6o/Ka7naY2+VZoA
iODLyC7EixGR+xrSypzFqHG4UO/g5u55vahECCXK2NwQ5fN06jBdMVmGLmdOgXkY
KjYxluzQXyWdWRuheP+Jmlb+VEimxGs0qAkKw24lMC0sry2Fy+6hw+uzHzgpxjwG
qA1n1hr4lBkNiBbfSrrfY9g3+X6mqg==
=CnB7
-----END PGP SIGNATURE-----

--i0yefTUaRUwmBE70--


