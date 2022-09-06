Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C78C05AEA50
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 15:43:55 +0200 (CEST)
Received: from localhost ([::1]:51286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVYrq-0007bQ-Tl
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 09:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oVXp0-0001gz-0E
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 08:37:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oVXow-0006uJ-RL
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 08:36:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662467809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R6zjwiLSSQ6MNLqQ3T83TfX+J4miyfVO5zQoisy4kMg=;
 b=Ae7emqt/d7TqIksJSFXYAzNhF7ruBM2zwrmm+gCCQYsSqrChx5RIINJBcAoUexst52spdO
 NrD5b/6SxtBOtjlb8MouMU6lgYUDcxRncS3WPiL2NQk5ZF0zzT7RWnDEJYXmAmscRUrgTc
 RdRAKRhAtc2RsENkmGKDwrzmTRyL9gI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-40BeMQctNBmArirpeJBvOA-1; Tue, 06 Sep 2022 08:36:46 -0400
X-MC-Unique: 40BeMQctNBmArirpeJBvOA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D6A53C01DF8;
 Tue,  6 Sep 2022 12:36:46 +0000 (UTC)
Received: from localhost (unknown [10.39.193.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0898C15BB3;
 Tue,  6 Sep 2022 12:36:45 +0000 (UTC)
Date: Tue, 6 Sep 2022 08:36:43 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: qemu-devel@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: [PULL 0/1] baum: better document usb-braille configuration
Message-ID: <Yxc+2/tX3Km6eoGm@fedora>
References: <20220905221841.558943-1-samuel.thibault@ens-lyon.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Kuyc5MVE9iZVgcu5"
Content-Disposition: inline
In-Reply-To: <20220905221841.558943-1-samuel.thibault@ens-lyon.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


--Kuyc5MVE9iZVgcu5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--Kuyc5MVE9iZVgcu5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMXPtsACgkQnKSrs4Gr
c8gkNAgAs+qsapc2Bpojy/YlHVUgeWB4Xd6CNvl2t7B/n8ui504F7xgAS/yQXSWm
UD8qmtNzxfSmA6sdo03RUdppHLybGqLnibsJ98zfsvEk0oazJw/LQHHEEbN4mQRW
zBmUCaZ/wuGOtYPVN5qrCJ12VINo3TLe6mNIMIQMjiADD9JCQ6s2XuVEZEME8MXB
MNnzwX6Mq3Z0rJ1xBa2d14393vpBVJkLKxKLlty/3TCF9jN+aT+1Y5oZJFUUZjrp
cv0+LgzgPfHXuSegjHcnV6I0a+7WxMmSPwBnU9k15GPckC3QnZiNpHckxNqwUFgg
gm3teXrdwbsTYSwK9YP+lfF8x0Tdrg==
=5b1W
-----END PGP SIGNATURE-----

--Kuyc5MVE9iZVgcu5--


