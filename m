Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DB7305FB7
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 16:34:52 +0100 (CET)
Received: from localhost ([::1]:47546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4mqJ-0007n3-D3
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 10:34:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l4mom-0006lf-6D
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 10:33:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l4moj-0008OE-RF
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 10:33:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611761592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HJUPcnG16IMcEmKEc08DHUOywx3tTxNEPe/0Hp1oqMk=;
 b=LPKbNrTITuHbYRkM9LAnjokYGzJbMhnB6z82CPgG3hIYl2U5cG+Qw4B3GxD/TYLpeQqclR
 8MUVMdnd+/GQCKo6WuqbBOiKke7+TA/4yo6rpcMjUQcZVPacv6nw6M2STWfitiYM+P7sQr
 i6wAlNGDUt+GKblivVtRWj/Snjlb3ug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-uyDMsD71OlyTR3pb8f0eNg-1; Wed, 27 Jan 2021 10:33:09 -0500
X-MC-Unique: uyDMsD71OlyTR3pb8f0eNg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD2B4100E32B
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 15:33:08 +0000 (UTC)
Received: from localhost (ovpn-115-15.ams2.redhat.com [10.36.115.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A19F7100239F;
 Wed, 27 Jan 2021 15:33:01 +0000 (UTC)
Date: Wed, 27 Jan 2021 15:33:01 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 4/8] meson: move qxl trace events to separate file
Message-ID: <20210127153301.GG310142@stefanha-x1.localdomain>
References: <20210121125028.3247190-1-kraxel@redhat.com>
 <20210121125028.3247190-5-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210121125028.3247190-5-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EDJsL2R9iCFAt7IV"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--EDJsL2R9iCFAt7IV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2021 at 01:50:24PM +0100, Gerd Hoffmann wrote:
> Move qxl trace events to separate trace-events-qxl file.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/display/qxl-render.c     |  1 +
>  hw/display/qxl.c            |  1 +
>  hw/display/meson.build      |  5 +++
>  hw/display/trace-events     | 67 -------------------------------------
>  hw/display/trace-events-qxl | 66 ++++++++++++++++++++++++++++++++++++
>  5 files changed, 73 insertions(+), 67 deletions(-)
>  create mode 100644 hw/display/trace-events-qxl

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--EDJsL2R9iCFAt7IV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmARh6wACgkQnKSrs4Gr
c8iqnAf/c2L0DfOoi5LK/eN7FeHMj8QNVvWCKmHEh3B/dLNvZxFTSRjDZZa292qG
ireyXGsQLD3WBbD7r4LTw2WJbOh3m9fakaMQW3KfywskPCJFxWw9jVgueAwthUFD
gkhiwmVxdcga+Dc1hzkNTlVsak5AsAXPkT7fdjdMqiZEgrCUVNbeFBhYEGhpwvs5
JkKtxp+GjDLr4woNp0Bs/REZrfJB+Eyo2g88e4uB3p2vteF5yw0zjL7qnr8eWuIt
HlfsgT3EHysASCOpG1MQ9toDtE+ze6a5Ip8JH5MrOqZuHrY1H/SG3lvbphtio4Gy
FEXCLZA5v97FwaVexRDJgAfV0rkymQ==
=1klQ
-----END PGP SIGNATURE-----

--EDJsL2R9iCFAt7IV--


