Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C86429D0D8
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 16:50:39 +0100 (CET)
Received: from localhost ([::1]:59658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXnig-0002i6-9F
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 11:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kXng3-0000u2-U0
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 11:47:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kXng1-00029E-Ct
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 11:47:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603900072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aa/CDn9GOLp3e8uxWOKYxnXW9G4X/OAFZ+M+LXax4WM=;
 b=BksZ4YBSY+2MyqcBTlIicA11S/XNF+ZhdXwGAzmVZG5tnTeAr2jFVl3yM+3PZH+DBoSlnP
 pgqXl09pj45mX3YttdhxlVb3NCDeRGmgNGHHrzo3axW8VMaEVOVm6CnMjyWjVOM9KNa+Bb
 +5NORn0xVM7Q1w1vShQptuyqqEnQkPA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-NNnEX6eYNAac_HLTjbDUWA-1; Wed, 28 Oct 2020 11:47:48 -0400
X-MC-Unique: NNnEX6eYNAac_HLTjbDUWA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7686640A9;
 Wed, 28 Oct 2020 15:47:46 +0000 (UTC)
Received: from localhost (ovpn-114-6.ams2.redhat.com [10.36.114.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B50360C04;
 Wed, 28 Oct 2020 15:47:45 +0000 (UTC)
Date: Wed, 28 Oct 2020 15:47:45 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 03/25] block/nvme: Report warning with warn_report()
Message-ID: <20201028154745.GU231368@stefanha-x1.localdomain>
References: <20201027135547.374946-1-philmd@redhat.com>
 <20201027135547.374946-4-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201027135547.374946-4-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aQ0PHH3iiKbaMI5N"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:50:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--aQ0PHH3iiKbaMI5N
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2020 at 02:55:25PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Instead of displaying warning on stderr, use warn_report()
> which also displays it on the monitor.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  block/nvme.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--aQ0PHH3iiKbaMI5N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+ZkqAACgkQnKSrs4Gr
c8hzcQgAqtNB+qIFL4oqRn/jqfAHtQhaYn5xCNPQtfsnzhh/jRlPfKnikIxFNyPI
DZiKYDII17dtwcOlqD3lMyt89WML0Wozh+rtdaX9PfoGfEIDxFehZ0RaOWpNMslT
mkq9jDna+N6XlT0isC1SZNbFPU3Qd40G/s5kFeXBBFHmQf+UoPW0Jr9J/YbnwPOt
aROAjEnTK6QiV142D1tuZDoPKollxCUTl1ec/rpk+SvT3v0JWMhRoa0CwQnakZgZ
jpVWcaqxhmSmdmYr1wJ6zCxFD57zsNeegl6nIMBWNgYUDIXzqbnEcaD6iHm2HjiQ
bUAvxx9IEF0+OzoOXFu7yUTw9qIdEA==
=77pl
-----END PGP SIGNATURE-----

--aQ0PHH3iiKbaMI5N--


