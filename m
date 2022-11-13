Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E98C628DB9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:47:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouijw-0004Zp-QS; Mon, 14 Nov 2022 18:19:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ouiey-0004o9-D5
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ouc0u-0006lD-2k
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 11:08:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668442126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KFqGBs1MyJxTUy/9LUG5TvUg7DtJjGaIQfirb94iEH8=;
 b=cH3aCKDMvN2TBcANE6kDXJlQJ0ki2GXgIjgY3Ntlrtu0TNnxq2mcLZEZrq8nuS7iEIx77f
 8aLnQu4m7POF8TjooRzi8c7r4zURxMV0M92xpBYyJpp3ix8SpSdeWo73EYmRrn3fz54z1I
 bAb2cmT0E8BRju3ki0Y0tJllNVPpEpA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-DgFfDVQuMuaCxb84LsqMkw-1; Mon, 14 Nov 2022 11:08:44 -0500
X-MC-Unique: DgFfDVQuMuaCxb84LsqMkw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FD3F2999B20;
 Mon, 14 Nov 2022 16:08:44 +0000 (UTC)
Received: from localhost (unknown [10.39.192.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A542A492B05;
 Mon, 14 Nov 2022 16:08:43 +0000 (UTC)
Date: Sun, 13 Nov 2022 06:30:32 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, gaosong@loongson.cn, stefanha@redhat.com
Subject: Re: [PULL 0/1] Fix loongarch make check-tcg failure
Message-ID: <Y3DVWFqKFKyxST7w@fedora>
References: <20221112015133.2593661-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LH1iKwtfTtrYzUBz"
Content-Disposition: inline
In-Reply-To: <20221112015133.2593661-1-richard.henderson@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


--LH1iKwtfTtrYzUBz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--LH1iKwtfTtrYzUBz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNw1VgACgkQnKSrs4Gr
c8i8+QgAj0JdcC2dW+vM7wbN4aTg8RJAXDtG0STUNVuukSrXAU3RqC0emg+TTZ1b
c20eqMdZ35diBFDMtUnACm8lx/4PajuxcJfw4C5IK8OBANO4XZkHJtu/KiJLnQpk
egeuSj/0Ys0EYFTpE6948/Kb61jJTxDS5KEaJ1HUP3vNRuP5K8t3nWcHvunyp2Fm
8SpFtdODPZVCKeW8KgB6br1tV8iXSXzJ+ZhZiLSJl8VloSpi72Pckixnui//fJVU
TWXcjfag3Ho0XdJR4RApsUrca5QTKR91BE/+lucrU2/uzOEIA93L6itXoHh46070
y7BWXQurU6Z2/13S6Avi/f4voEW6ew==
=e2VV
-----END PGP SIGNATURE-----

--LH1iKwtfTtrYzUBz--


