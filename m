Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEE85E53F6
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 21:51:38 +0200 (CEST)
Received: from localhost ([::1]:57220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob5ku-0008Ie-RD
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 15:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ob5dp-0004T2-Jd
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 15:44:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ob5dm-0000y8-QS
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 15:44:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663789454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0YDFm0ZEOTgbDdBlvquz1AQSxZ8Rhqi+R5aW4KQ82Es=;
 b=gFKv572O/fiBzS7vxNSGxcVJF98pyzTCJxIPMelYPDpBmvEA0MqadWdcVBmVPyPslSFg4J
 9SOHnODuw6Lms6SB67ozu4N4a6h5iHgq1KLHZnNw8zIAivXrdqWxH4rFmm6ny/GNXQ3z7i
 H41ffLfOxLH9IQO7nK/jvZcfAL7La+8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-B4uomQqoO1-L3H05356QSA-1; Wed, 21 Sep 2022 15:44:07 -0400
X-MC-Unique: B4uomQqoO1-L3H05356QSA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D67E384C6C1;
 Wed, 21 Sep 2022 19:44:07 +0000 (UTC)
Received: from localhost (unknown [10.39.192.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E20DA40C2064;
 Wed, 21 Sep 2022 19:44:06 +0000 (UTC)
Date: Wed, 21 Sep 2022 15:44:05 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PULL 00/17] ppc queue
Message-ID: <YytphcdUkGKWuDog@fedora>
References: <20220920194202.82615-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AS+7Y5RWI+z3NswX"
Content-Disposition: inline
In-Reply-To: <20220920194202.82615-1-danielhb413@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--AS+7Y5RWI+z3NswX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--AS+7Y5RWI+z3NswX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMraYUACgkQnKSrs4Gr
c8jzfgf9F9xWQcEP99vhJuLKN4Lw43xN1SCm7m0N3mObdcELvRwg/I2EwrzHTzqw
RL5s7PBzyQrRyCRYLqc6nVcgPOcadfV8ivwxdZGxtkSqnI1W6KlkYqGl1WTtrW2l
FRMXO2CMjmKdcCYk6kopoNmBKU3MpxoZ4GcQ7/5YAjrszUzJX6uyt8aQFB9GNoh9
bCUF7++2+n0E9jQRQIP08AWPTKTMeTQuF1sRTHUJW7c8MqwVz2mLU7QE7ZhxyUho
8+notTF4vU5B0tmj8Hhs0kWGxMurY20DahFAuSfvTrTHeq/nQThoWbdxiIyvhAsM
lZrsMTZQlv3fO/hBm+Krl8cHD/TSUw==
=YQUw
-----END PGP SIGNATURE-----

--AS+7Y5RWI+z3NswX--


