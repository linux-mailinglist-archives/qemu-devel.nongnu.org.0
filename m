Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 490482960D4
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 16:22:27 +0200 (CEST)
Received: from localhost ([::1]:46620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVbU2-0007jh-B8
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 10:22:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kVbLT-0000to-VN
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 10:13:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kVbLN-0001Yt-IU
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 10:13:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603376007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n3YAAdyvt2m7bBDp5Y8zIZTn1aOgfb5ScV0gQtQhALY=;
 b=EZ5h5oIDxsdxiP9YbxfJnmnE0u9zyLiqaREHEjU1rWpW/TlAOjEeGg1g8tkEwQQq/ssyz0
 7ycs5cLeascCpoxxyMTqOGCpgDcbVyOFK7Cp1EM6NR83yJmSD4me6QqIssehvydzsYWM2p
 F5stWIn5VZa4HXQLGJ7WjjA45DZWA6s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-OmeJUEBcOjegxYXBZ4nglg-1; Thu, 22 Oct 2020 10:13:24 -0400
X-MC-Unique: OmeJUEBcOjegxYXBZ4nglg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBFE3EC509;
 Thu, 22 Oct 2020 14:13:23 +0000 (UTC)
Received: from localhost (ovpn-114-229.ams2.redhat.com [10.36.114.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F11B660C04;
 Thu, 22 Oct 2020 14:13:19 +0000 (UTC)
Date: Thu, 22 Oct 2020 15:13:17 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 06/16] util/vfio-helpers: Trace PCI BAR region info
Message-ID: <20201022141317.GF761187@stefanha-x1.localdomain>
References: <20201020172428.2220726-1-philmd@redhat.com>
 <20201020172428.2220726-7-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201020172428.2220726-7-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qftxBdZWiueWNAVY"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 08:33:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--qftxBdZWiueWNAVY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2020 at 07:24:18PM +0200, Philippe Mathieu-Daud=E9 wrote:
> For debug purpose, trace BAR regions info.
>=20
> Reviewed-by: Fam Zheng <fam@euphon.net>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  util/vfio-helpers.c | 8 ++++++++
>  util/trace-events   | 1 +
>  2 files changed, 9 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--qftxBdZWiueWNAVY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+Rk30ACgkQnKSrs4Gr
c8j2ewf/fD5AkYC6Zz8C0ZSx1oZDgqx4PLUma4/qB9tuIstk1Zr4SIXrY1iaxHjb
zXlrHAGUopGIBRWkfVDSocwbGQjswEk6ko24Q/wcI0WOdiBz2jq/lh7UH1+x+JP9
6fJEfXDGtS4Hci4XN7DuALzMfVF4FNhRZ5JAcPWOht3OwiOzpZG6VSxEWQ68mYiG
ofeR5OpIE0S+eFFWp4IRe3fb+vbritXuPEyRGLGsT/bK96lUZOILAb9KSm1xlQh3
6iDPRfgq7uu/Ahr08mxklfuzTUt/f6lYmBm8seHDiyuLPndTp9X0QouvTbDZAEkj
L+7OGhTj6qqZrI+A5bqz2iGU0rZg8w==
=Gi/L
-----END PGP SIGNATURE-----

--qftxBdZWiueWNAVY--


