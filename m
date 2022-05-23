Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2345310FC
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 15:22:53 +0200 (CEST)
Received: from localhost ([::1]:33852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt81M-0002x3-I2
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 09:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nt7zZ-0001WZ-If
 for qemu-devel@nongnu.org; Mon, 23 May 2022 09:21:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nt7zX-0006Ey-7f
 for qemu-devel@nongnu.org; Mon, 23 May 2022 09:21:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653312057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ojFMPfcId9bYZhQPEJDr3bzKJlBjhu1+bC+N5bxDTKc=;
 b=fhdoVqBxzRH2wkfCMUOUQ9Z3GzIw1FsIqYf0JkXLeUHK2rMityYyRcxWNK4oC7R5J97JYc
 UgYu1SyNds4Cjj4oEzwE79QXYToHcbAbouuUwG8JXXf31RbmcmXTmIDkqvIo0bWhDZvonL
 3J1xih99vlAMToy89xglSzm4lAn/lvc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-CX3IB-BdPiurlT4JMr9Bmw-1; Mon, 23 May 2022 09:20:55 -0400
X-MC-Unique: CX3IB-BdPiurlT4JMr9Bmw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A26A3C60527;
 Mon, 23 May 2022 13:20:55 +0000 (UTC)
Received: from localhost (unknown [10.39.195.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF02C2166B25;
 Mon, 23 May 2022 13:20:54 +0000 (UTC)
Date: Mon, 23 May 2022 14:20:53 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: proposed 7.1 release schedule
Message-ID: <YouKNd6zW1o8+m9Z@stefanha-x1.localdomain>
References: <CAFEAcA80ABJ+RXFeoH4mo5yJk5oNh4Zc5QTBN35vVOL4eg0cNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="41A1Vgz/i5ZtyNDX"
Content-Disposition: inline
In-Reply-To: <CAFEAcA80ABJ+RXFeoH4mo5yJk5oNh4Zc5QTBN35vVOL4eg0cNQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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


--41A1Vgz/i5ZtyNDX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 23, 2022 at 10:53:44AM +0100, Peter Maydell wrote:
> I just put some proposed dates into the 7.1 schedule page:
> https://wiki.qemu.org/Planning/7.1#Release_Schedule
>=20
> * 2022-07-12  Softfreeze
> * 2022-07-19  Hardfreeze. Tag rc0
> * 2022-07-26  Tag rc1
> * 2022-08-02  Tag rc2
> * 2022-08-09  Tag rc3
> * 2022-08-16  Release; or tag rc4 if needed
> * 2022-08-23  Release if we needed an rc4
>=20
> Does this work for people? I just worked backwards
> from a final release date about 4 months after 7.0; easy
> enough to shift it forward or back by a week or so if
> that works better for some reason.

Sounds good to me.

QEMU 7.1 will be the last release before KVM Forum 2022.

Stefan

--41A1Vgz/i5ZtyNDX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKLijUACgkQnKSrs4Gr
c8hV6ggAm/X+OlzC46NTC9qXtdRZzsuLpU9YSuxmJH6RURkHxWlVr9OnklFs9uYw
eDYCO0+I9F+dfg71pjRrOxb7d9TTctbqGYnnXT2E/XR2O4hGkoy2MJSdWwmIcPjB
EZmCs4jbuLg88bEniAUtND9FJetYhiTwWnx93XbNy5jqvzHU/T+fg8r5dsKWtlsX
25r82I1G4VR6ynGnQXL73YlOi+iN0ZScYl0zM/cvTacN4JhLxBMzaEJ+2P7iq1eL
qSvf53WL7TBSo3eN6q9kZ/7WCGugQcEIQMuy6Hu0oWuDPOoXyj3tNZLyVThal1zE
8+FcFoi/p+q6TZWeXQG1ShG4tw5mMQ==
=b3kE
-----END PGP SIGNATURE-----

--41A1Vgz/i5ZtyNDX--


