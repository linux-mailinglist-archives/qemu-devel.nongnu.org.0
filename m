Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F13DA5FCD20
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 23:28:10 +0200 (CEST)
Received: from localhost ([::1]:49366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oijGr-0006wO-KN
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 17:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oijEE-00037Q-PF
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 17:25:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oijEC-0003QE-8M
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 17:25:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665609918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aK+Qih/3+vVVDrz8GzGA6mqJ9j6F9jcHMWttVsAv/JU=;
 b=MK9tUdcP3kksVKxmzO94eWyiO/D8RT4VOkYDPCCmxVGCouRLp6tyga94hVGyqTP+n5q8dZ
 JEQ/Beq8P9BFbX/cdfsDb0VTKr6RCQ4u9Rp0WvhXT+Ci01DPTVjEn6rR8YGwFd1jwoBTkR
 g+qi4nlzh6FDylIPHT61lxnzXYW+j28=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-tmLNyNj7Nj2Saa_xVc6GXA-1; Wed, 12 Oct 2022 17:25:15 -0400
X-MC-Unique: tmLNyNj7Nj2Saa_xVc6GXA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 530B18027F5;
 Wed, 12 Oct 2022 21:25:15 +0000 (UTC)
Received: from localhost (unknown [10.39.192.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CEF4E2166BA3;
 Wed, 12 Oct 2022 21:25:14 +0000 (UTC)
Date: Wed, 12 Oct 2022 17:25:12 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/55] pc,virtio: features, tests, fixes, cleanups
Message-ID: <Y0cwuN+SnU5OvF+/@fedora>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fnou/bu772RUSm3T"
Content-Disposition: inline
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--fnou/bu772RUSm3T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--fnou/bu772RUSm3T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNHMLgACgkQnKSrs4Gr
c8gThggAkd9p8gsR99jat4Lx1TAX+hi/AM7KAMv+0AjFVuRG2th1QuCbipzhl7sI
teCiShVTzy4xEVDs3xWPQdqhr39S/ZTlBIwYxIUqIFsIn4KdPjIkZvUkF0O5OmeS
jywvTienPdB5XpL026slOLX3atQIEeg6Dv/bw176w2GQURiU/nTXrfHjAiv/zBSJ
Qwr5zuw33uGPZ+sgCdmclxjzNBapB5r+SlPYs2XgXT2t+3UBlI0zWIGRTAR6ruxm
6C2nKrKHDS4/5VmtHlRy3CZYJHoQIY7XaQheP6PPCNvuh/2R4K5W2WgXom7RjgLI
DvkCS1dh/za1jERQ+iT0E49khy7U7Q==
=iAP2
-----END PGP SIGNATURE-----

--fnou/bu772RUSm3T--


