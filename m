Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31DE642CCC
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 17:29:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2EJY-0002aS-Gx; Mon, 05 Dec 2022 11:27:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1p2EJW-0002Zx-NR
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 11:27:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1p2EJU-0003zW-5p
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 11:27:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670257647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6jmZRUCkhYkCvbAyiuMXdd7No755t9d5XuIxTdQW3eQ=;
 b=ZEPdjLx+A7H+X/haBzNSTFMge+zysS/R3mRnlzctuAJFxLleye3RdxnofygNNMj/dRkzbK
 cgyhbk279WA00p+5HyL+JLAkgHySJRPnSAv9yK5GtMbKunTN/89x8wfc/J8dbFngXmnCjT
 HWZU/NJq+LFjrV2bW5utPLSs8OvtL5Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-NVQ-vIPwP9Gdn2703JoXSw-1; Mon, 05 Dec 2022 11:27:24 -0500
X-MC-Unique: NVQ-vIPwP9Gdn2703JoXSw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 925C385A59D;
 Mon,  5 Dec 2022 16:27:23 +0000 (UTC)
Received: from localhost (unknown [10.39.195.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E62BC49BB60;
 Mon,  5 Dec 2022 16:27:22 +0000 (UTC)
Date: Mon, 5 Dec 2022 11:27:18 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Song Gao <gaosong@loongson.cn>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, stefanha@gmail.com,
 peter.maydell@linaro.org, philmd@linaro.org,
 yangxiaojuan@loongson.cn, maobibo@loongson.cn
Subject: Re: [PATCH] Revert "hw/loongarch/virt: Add cfi01 pflash device"
Message-ID: <Y44b5hlgasVa4Gso@fedora>
References: <20221205113007.683505-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="B+LE2e06l9Dwwlvr"
Content-Disposition: inline
In-Reply-To: <20221205113007.683505-1-gaosong@loongson.cn>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--B+LE2e06l9Dwwlvr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--B+LE2e06l9Dwwlvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmOOG+YACgkQnKSrs4Gr
c8jLxwf/cu/77//ldx1dzItiWcowCdYT8H6Booc9wC2cjfLx4egSr7mtsC5eeLfx
scLzPvnKTufVsIGzac4sU+U1vY8rEUKsSChPUxED7qcHijJKprB1bd8ZQBQ2uX/R
F32coAn7yGFHHppY+j9iTp272oOLOssOfPfdeZA4PtF/4lJ1eDTgpFaN6VZB4Ly2
om9SVqRX3uFxPlcF7bOwLewtUckpMR2czqc/wpHRzBC4j5cQKCt30zlfUpzgcqVZ
inu39RbVyG2psIlx26cxuBJM+Z4nzu41h0gYniSwWAAydmxUjOFCdrjcSog9vqwv
LFeQT+wvVghXUQplHTRLj7aebZEDaQ==
=8WD7
-----END PGP SIGNATURE-----

--B+LE2e06l9Dwwlvr--


