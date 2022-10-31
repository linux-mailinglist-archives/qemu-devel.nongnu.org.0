Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CE9613DCF
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 19:54:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opZu1-00019v-Jq; Mon, 31 Oct 2022 14:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opZts-000119-Q5
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 14:52:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opZtr-0003d8-3E
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 14:52:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667242362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E7UVSLdWPCk9hDQPHkRnDXqPKvz78QZHgrXYKOQsxxA=;
 b=hTB8/dVfKYHpttEpocdO0L8C+LqUD7H4i29J648CErmyvpftjMFpyf9txOnXC3MjJULVg7
 ZMEFkrAefo5beNbQ+SWJ+APqkBIC1Yz6g+DmcNV+XZ4Ir0pnA20kfuOq1DWXdbtHjrz1Ag
 DVZP/RJLMPPQ8flo7vBiTdqDxg066vM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-9U_vvqLQMxqJ3opIRRXpgw-1; Mon, 31 Oct 2022 14:52:40 -0400
X-MC-Unique: 9U_vvqLQMxqJ3opIRRXpgw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87511800B30
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 18:52:40 +0000 (UTC)
Received: from localhost (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E23C8140EBF5;
 Mon, 31 Oct 2022 18:52:39 +0000 (UTC)
Date: Mon, 31 Oct 2022 14:37:53 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PULL 00/21] s390x and qtest patches
Message-ID: <Y2AWAXTw3wjs5jY9@fedora>
References: <20221028132304.829103-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="e4Oy1EkVmE3bBFpl"
Content-Disposition: inline
In-Reply-To: <20221028132304.829103-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org


--e4Oy1EkVmE3bBFpl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--e4Oy1EkVmE3bBFpl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNgFgEACgkQnKSrs4Gr
c8iFhwgAntguEFoeH276FYw0LvrZZ8tdfPD4p+63INusnwTprN0fvtgTZm2chYoV
fVSGwVavIOZg4xkRD0ADn1kU8XzImWq/wV0orFVc+WVIbp4MUKBaDwu2dfeey0w9
nm79lgaqRkQiE12B0jrUAL0ipZdcxT+C0JmW6mYuHb/o8CjSLBPPMerQytoptJ3J
0VxNi9tyi4kfWxsor8SM9pGmRw4w2daQUV8OgdR4tF8sTupncyaxJCks4Expslwc
MRrshzGoLsPp1MNL6lJlawtc/62jUXFcLMyYGu9wjxfi0m+OJE3NEhtx5nOKx3Mx
PfU+dV6SImkC1bd20Hg3MmmNLG34Kw==
=8Fp8
-----END PGP SIGNATURE-----

--e4Oy1EkVmE3bBFpl--


