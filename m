Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3665A501E
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 17:23:58 +0200 (CEST)
Received: from localhost ([::1]:48790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSgcG-0003Gm-O0
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 11:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oSgZZ-0000L8-Qk
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 11:21:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oSgZS-00011Q-RQ
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 11:21:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661786460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z7N02ZOY1p0o2GHKZSQVVwTpCIEAoUJ0q8d0OjkaiKE=;
 b=VGDUNIb5IIF1gIgOohSI4wkLKndbvYoQjT6bkDLmB7QFpjQ7bk73CPqtbqtBrksHQ3or/6
 zUyhGhjd5JHIzWeti6ZkIxO2HQuggKRwZATc8TMchvVF5Hx9Vc7plxtZBIBEE/dC6NX68L
 8BvIDxU2bPtlv3+ydaQGmcCXWx3W3BY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-AmKPAg5gN3GDXkDMQbm5Yw-1; Mon, 29 Aug 2022 11:20:57 -0400
X-MC-Unique: AmKPAg5gN3GDXkDMQbm5Yw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4C508037AE;
 Mon, 29 Aug 2022 15:20:56 +0000 (UTC)
Received: from localhost (unknown [10.39.195.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36D3E2166B26;
 Mon, 29 Aug 2022 15:20:55 +0000 (UTC)
Date: Mon, 29 Aug 2022 11:20:54 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: New feature shout outs for KVM Forum QEMU Status Report
Message-ID: <YwzZVv7qMag3dVk7@fedora>
References: <87wnavexjg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nxrjZ9VcUlGGsSA7"
Content-Disposition: inline
In-Reply-To: <87wnavexjg.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


--nxrjZ9VcUlGGsSA7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

block/
- VDUSE export was added so qemu-storage-daemon can export disk images
  to the host kernel and guests. See qemu-storage-daemon(1) man page for
  details.

hw/remote/
- vfio-user server support was added so PCI devices can be emulated in a
  separate QEMU process. vfio-user client support is not yet available
  in QEMU so guests are currently unable to connect to the server.

--nxrjZ9VcUlGGsSA7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMM2VYACgkQnKSrs4Gr
c8gLJQf7BMNc+rst6RfX/oAPkbzsj8z4qiqN3w10lAyzL7GJmM1/Vx5G2swGpymU
VuyyugUqB/p6Ow5ztz07lXGOjKjvXypEvvu6UMwLwXHzEumg/U1Ab2Fk8NdX4H/8
ExQIXfBoNcThcBiWPiM23CmI67VM/RStwYwvXwQTm/5OUMt7pIm6HZmF+xre41J9
gTgVpJG/r3ylZshgvq5HCfmO7cLeioUJM3FWHG7iEoKE7KJiwuGTxVDaYYS7KNa9
UJ4ec3/8sOkVDec+WbS7mUcE07mywMsYU85jNi/LvHPN8xCacAxqFI02ncgyWR8h
fJ/hKOmfXi9LDbpaPn9YRWmPr1UB1Q==
=MW+T
-----END PGP SIGNATURE-----

--nxrjZ9VcUlGGsSA7--


