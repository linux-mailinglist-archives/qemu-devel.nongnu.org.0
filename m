Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7004337ED
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 15:59:52 +0200 (CEST)
Received: from localhost ([::1]:54648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcpei-0006gD-2x
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 09:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mcpco-0005EA-M9
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 09:57:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mcpcn-00062m-0B
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 09:57:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634651872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZvxcRAarMoEWjARZgzPxeGayYPGOa76tubm3yO8/WCA=;
 b=R85BxLh/o+yxUSkfnd+3mdcqKhs+naseAxBKrNcT/38knY1BE6iRPA7kmyKcJFOYQ1fuiY
 XC5BSRPyjhawQ8QD8ng0ZiAfua8GIK/l8BoI6VRilg+hbeKjfc3V5dF8LD/+covST7JhNZ
 XXs8w9R1SN7FMQYVEAXQPbeKg8BOLEI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-OFCv1gf9OUmduvtSYvP7LQ-1; Tue, 19 Oct 2021 09:57:48 -0400
X-MC-Unique: OFCv1gf9OUmduvtSYvP7LQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74704101F7AE;
 Tue, 19 Oct 2021 13:57:47 +0000 (UTC)
Received: from localhost (unknown [10.39.195.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CC8A6788C;
 Tue, 19 Oct 2021 13:57:46 +0000 (UTC)
Date: Tue, 19 Oct 2021 14:57:46 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH v6] Work around vhost-user-blk-test hang
Message-ID: <YW7O2q/UaKl3Ao09@stefanha-x1.localdomain>
References: <20211014043216.10325-1-raphael.norwitz@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20211014043216.10325-1-raphael.norwitz@nutanix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ukmv2loU/I3vfDed"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Ukmv2loU/I3vfDed
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 04:32:23AM +0000, Raphael Norwitz wrote:
> The vhost-user-blk-test qtest has been hanging intermittently for a
> while. The root cause is not yet fully understood, but the hang is
> impacting enough users that it is important to merge a workaround for
> it.
>=20
> The race which causes the hang occurs early on in vhost-user setup,
> where a vhost-user message is never received by the backend. Forcing
> QEMU to wait until the storage-daemon has had some time to initialize
> prevents the hang. Thus the existing storage-daemon pidfile option can
> be used to implement a workaround cleanly and effectively, since it
> creates a file only once the storage-daemon initialization is complete.
>=20
> This change implements a workaround for the vhost-user-blk-test hang by
> making QEMU wait until the storage-daemon has written out a pidfile
> before attempting to connect and send messages over the vhost-user
> socket.
>=20
> Some relevent mailing list discussions:
>=20
> [1] https://lore.kernel.org/qemu-devel/CAFEAcA8kYpz9LiPNxnWJAPSjc=3Dnv532=
bEdyfynaBeMeohqBp3A@mail.gmail.com/
> [2] https://lore.kernel.org/qemu-devel/YWaky%2FKVbS%2FKZjlV@stefanha-x1.l=
ocaldomain/

I sent a fix for the hang so the workaround is no longer needed:
"[PATCH] vhost-user-blk-test: pass vhost-user socket fds to QSD"

Stefan

--Ukmv2loU/I3vfDed
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFuztYACgkQnKSrs4Gr
c8jTvAf7BqtyQOtnM2o35xhtcBbheWaPUKAJ4w5hqZM6yrKh66x6kDo25fpnutxD
pMEiVggd+t4FSv6+w9HKoZOPw9SSYvAYtsTPhYz9sgEATcGPrvSJkLb/iCNb+Lw7
OtiJrCmed4RMKv8+aPF3G9OcFe7bhHDCTF2yo+TTg/FMHr84P/2E03DlRw+Jp2h5
PAT4+dbje/eNSyehU5wW7UCeWaL3PaJH3VazuXEudnpS+qMuNKO9s8URFtq+JOyv
Do3wE607smtN7pWFGtb4POFgG99WzlJ3ui8mfaEEB45MQQ9/1y/D8EMpFXpibmFY
kiDBIgR8X8nsNlvID4osJxV2s121Dw==
=wc4n
-----END PGP SIGNATURE-----

--Ukmv2loU/I3vfDed--


