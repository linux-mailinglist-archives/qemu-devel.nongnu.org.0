Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F56B6328BB
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 16:55:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox98J-0006tJ-IM; Mon, 21 Nov 2022 10:54:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ox98G-0006qp-2v
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 10:54:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ox98E-0003AS-B0
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 10:54:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669046089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tZUOOdZ7Rm7EFJ+DKNQ+nlf9bs2Q8k9Ro28/5XWCRa4=;
 b=FrLgdiUxmB2BD42QPCY8r/dAfwFrH00Vr+fFyiW0L3eQuL60W5LQq1eb5JX/vyrFtNFtUM
 qf93F7Ksj+oyIOdJHm7qJ0PyMbd+hKY/07C6aZ2FIRm5BGQqyM8Oqu0VOqhcfi5chX8X8o
 4IZ/sRrB0joGXzQ8K2oUXqm6mGTwcT0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-CmezxQADNBWOpLPsH6kDyg-1; Mon, 21 Nov 2022 10:54:46 -0500
X-MC-Unique: CmezxQADNBWOpLPsH6kDyg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CED671C008A7;
 Mon, 21 Nov 2022 15:54:45 +0000 (UTC)
Received: from localhost (unknown [10.39.195.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 667AE17582;
 Mon, 21 Nov 2022 15:54:45 +0000 (UTC)
Date: Mon, 21 Nov 2022 10:54:43 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 0/5] target-arm queue
Message-ID: <Y3ufQyGAl4ToeIls@fedora>
References: <20221121130239.1138631-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Arp1ebJIcuqYQy9Z"
Content-Disposition: inline
In-Reply-To: <20221121130239.1138631-1-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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


--Arp1ebJIcuqYQy9Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--Arp1ebJIcuqYQy9Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmN7n0MACgkQnKSrs4Gr
c8jQqQf9HTrV7iD/Hd6w4p4d8T/hPPoetJ340VhjxahVpeSK8hlvjPOMgDBAq3nq
xuAfLeC+JIFrb2TGqu5qPUqXYQyFpT+bX0kaCHV17muQagb4Z49ZcwF+nr84Di49
/mQX0h3wZCYTVTLIQ5SwKqicYxMmI8oV2AUmUtbT4eGfUDDjlOLmabend6bT6Akz
w42G5Yoa4sDkOzFkv+TvJb6axVpgpfheh3uWMrFLqZnBJaumlvXAAcwlx9OGbY25
/K7q5Id4E8vQMpIC06syFFVqIvtc+EVDo98ZyKWRgA6lJciTsLGNXb5DUNU6WxA4
fI+10Q6E6CDiPh09ui6EO3nt1PwLWw==
=/bkF
-----END PGP SIGNATURE-----

--Arp1ebJIcuqYQy9Z--


