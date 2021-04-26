Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBCA36B540
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 16:51:16 +0200 (CEST)
Received: from localhost ([::1]:33032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb2Zu-0004yk-9e
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 10:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lb2YP-00048K-Gc
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 10:49:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lb2YN-0006Z3-C2
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 10:49:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619448578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ll8VoRvhk2WcLyVgU7vrP+HtRnnOKBsqCCAp3UHeB8M=;
 b=fiVZ14nl8Ss/AQKYlH5Tra4a0XXM+CyHZrMBrLPUdPgl2jO1eLKVOXRGdIq3Us/UKtg82B
 J/moOA/agbKUKaDPXeYg5aQK1Ygl5zA9RY2S5NS6pwjalh6RbnZnCGuGwoivKb/vG96Nnc
 2A5TcmTYJrO3hrdUOMZpvacQ0VyjVbU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-PmesLSTNN9OxKpCu0f-59Q-1; Mon, 26 Apr 2021 10:49:36 -0400
X-MC-Unique: PmesLSTNN9OxKpCu0f-59Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 338671087C73;
 Mon, 26 Apr 2021 14:49:15 +0000 (UTC)
Received: from localhost (ovpn-114-158.ams2.redhat.com [10.36.114.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 873525D723;
 Mon, 26 Apr 2021 14:49:14 +0000 (UTC)
Date: Mon, 26 Apr 2021 15:49:13 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH 2/3] vhost-blk: Add vhost-blk-common abstraction
Message-ID: <YIbS6UJSJtS/IVCq@stefanha-x1.localdomain>
References: <20210408101252.552-1-xieyongji@bytedance.com>
 <20210408101252.552-3-xieyongji@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20210408101252.552-3-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="X+74oZqnuTc6QV6J"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: kwolf@redhat.com, mst@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, raphael.norwitz@nutanix.com, lingshan.zhu@intel.com,
 mreitz@redhat.com, changpeng.liu@intel.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--X+74oZqnuTc6QV6J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 08, 2021 at 06:12:51PM +0800, Xie Yongji wrote:
> diff --git a/hw/block/vhost-blk-common.c b/hw/block/vhost-blk-common.c
> new file mode 100644
> index 0000000000..96500f6c89
> --- /dev/null
> +++ b/hw/block/vhost-blk-common.c
> @@ -0,0 +1,291 @@
> +/*
> + * Parent class for vhost based block devices
> + *
> + * Copyright (C) 2021 Bytedance Inc. and/or its affiliates. All rights reserved.
> + *
> + * Author:
> + *   Xie Yongji <xieyongji@bytedance.com>
> + *
> + * Heavily based on the vhost-user-blk.c by:
> + *   Changpeng Liu <changpeng.liu@intel.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.

The hw/block/vhost-user-blk.c license is the GNU LGPL, version 2 or
later. Why did you change the license and did you get permission from
the copyright holders?

--X+74oZqnuTc6QV6J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCG0ukACgkQnKSrs4Gr
c8hBAgf/ZLndejBJAoQU99gKyKZuMX0d1tlqya18dK5qkuiBSvasL18hoHMsXQ1z
00aPxKEZbm9G3hiA9Q2XjS2w4WL/4PYzZ2SVRhu4oahWpZOzJp0s4TCTJLJr3jGW
UhotUlPOoogu0yxf2ChDqnWls61BAz6AlscI/Hflw5LLtwD8O+SGnOTPd5VQxi3G
dXjLefS3igqMuT22HPA6XNyDNnlxla+IKmb4Xih60Y5QIG9SB6c5VtfXcMa/0o1x
SaBH6mbAVSrLZqnmH1xSF9zG4T1pdznSlLS5fAlMWQq0fHlb2zcK90zhyE9knjQF
uSE+4wOayvTEkR2wRaUfBSvNlEpQ4g==
=PJ5w
-----END PGP SIGNATURE-----

--X+74oZqnuTc6QV6J--


