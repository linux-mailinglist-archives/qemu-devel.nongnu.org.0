Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AD36D4EAB
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 19:13:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjNjb-00045d-UT; Mon, 03 Apr 2023 13:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pjNjZ-0003xU-DB
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 13:12:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pjNjY-0001Lj-00
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 13:12:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680541962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H9HffTUQT3mc+Mt7pfgZhzF6QtMRvo0ZIyZpMxM8kzw=;
 b=aQ3TYdIlgYvWclOncUf7ViZXGQG0kd+VR7yz0fIoTV1g/ufKoeuKu2ZkJNauczqFoCysLr
 mKFSurYU+7swHrgjj1gxigwXJ1y7izti71tW2dFAG2oDAlY3cxanzwZBrxlAKUgPQOG85c
 dzE/yMNc0pZb25/ad+U5z/LRLuQbM8Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-ximW07AZNtSU185udOY1ZQ-1; Mon, 03 Apr 2023 13:12:37 -0400
X-MC-Unique: ximW07AZNtSU185udOY1ZQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFD9585530C;
 Mon,  3 Apr 2023 17:12:36 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E665C15BA0;
 Mon,  3 Apr 2023 17:12:36 +0000 (UTC)
Date: Mon, 3 Apr 2023 13:12:34 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, hare@suse.de,
 Fam Zheng <fam@euphon.net>, dmitry.fomichev@wdc.com,
 damien.lemoal@opensource.wdc.com, Julia Suvorova <jusual@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v7 4/4] block: add some trace events for zone append
Message-ID: <20230403171234.GE318024@fedora>
References: <20230323051907.5948-1-faithilikerun@gmail.com>
 <20230323051907.5948-5-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="M20IVeahAlSRbra5"
Content-Disposition: inline
In-Reply-To: <20230323051907.5948-5-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


--M20IVeahAlSRbra5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 23, 2023 at 01:19:07PM +0800, Sam Li wrote:
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> ---
>  block/file-posix.c | 3 +++
>  block/trace-events | 2 ++
>  2 files changed, 5 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--M20IVeahAlSRbra5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQrCQIACgkQnKSrs4Gr
c8hcCggAwib8wdBAgR5oG2NfUgLGlU8qCp399F9z4LZkEgJkdE3shh0qlG6KVROZ
GbUXRWUpw1tR60zjGYk6UbKcvKxXXGnBPaDx0H9sMFKv3U5vH0zy8/Iw6wAD4Wym
AEpJotOvZewaw5SrjLkhM2nVRgAsCkl5gbTf4rrW0XvShAFewClSukSzRMPAzP8s
kKUxvwg3vYMga41ClIeNqXDTLhWCR2SVSsk3Yr5YVG2QKQtoKDOPnXJQ+6THe6HW
nvnvoUihl5NI+R1Ht3SQVm5OG7yGboo8A25eKJqau2rw6SgvTpRPvEoEm9Gl2Yz5
7WMwrU0OyeF0e91+2SOilV4FYBI88Q==
=+8KN
-----END PGP SIGNATURE-----

--M20IVeahAlSRbra5--


