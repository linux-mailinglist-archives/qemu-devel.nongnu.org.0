Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF5B20B044
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 13:14:15 +0200 (CEST)
Received: from localhost ([::1]:47506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jomJC-00050L-Rv
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 07:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jomI2-00040v-L1
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 07:13:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49369
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jomI1-0006nn-0w
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 07:13:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593169980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QKFnMQkyf9njFGdFNEJo5W1kU0H9iPa/5Zm+Fmj6tW8=;
 b=hxd8nwZFr53lBIYDIj6RlTiT6DmELHkd6yqn6ag5Gn3s7FqHVLOSejepykQsUGcb0KIydO
 VeUB2C0YLnoDRobbLIplwS9P9lj0W6dY8LNscs/pJciqKNOAqeeH/i3dIX/DwW0cZPnOts
 RtE7NFTZRke8R89bmNBOh1AeOcPzxG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-bG6sXModMPOnFm13cRCTBA-1; Fri, 26 Jun 2020 07:12:58 -0400
X-MC-Unique: bG6sXModMPOnFm13cRCTBA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 019648064AE;
 Fri, 26 Jun 2020 11:12:57 +0000 (UTC)
Received: from localhost (ovpn-114-181.ams2.redhat.com [10.36.114.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C3887C1FE;
 Fri, 26 Jun 2020 11:12:56 +0000 (UTC)
Date: Fri, 26 Jun 2020 12:12:55 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 03/17] block/nvme: Define QUEUE_INDEX macros to ease code
 review
Message-ID: <20200626111255.GJ281902@stefanha-x1.localdomain>
References: <20200625184838.28172-1-philmd@redhat.com>
 <20200625184838.28172-4-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200625184838.28172-4-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="k1BdFSKqAqVdu8k/"
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=stefanha@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 01:49:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--k1BdFSKqAqVdu8k/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2020 at 08:48:24PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Use definitions instead of '0' or '1' indexes. Also this will
> be useful when using multi-queues later.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  block/nvme.c | 33 +++++++++++++++++++--------------
>  1 file changed, 19 insertions(+), 14 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--k1BdFSKqAqVdu8k/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl712DYACgkQnKSrs4Gr
c8iabgf/cbPpgLNq3izY3cLxE2nVKNvSlPCZ0BJ7ToZfeHasJR4R3pCEeK3BdXYw
XoAkLhDqdsC17g4L/RsTZLyVf2U/RfC/yCMflbIVFTgJWEBKjvG3ziBfYY+YobuL
cBtGoLm5ACACocE4Bx/kaZG3B5lUAg5uCjmSdTiw8wH8B0Ke+GIc1dKZfbKwysj0
vn7UbzjxJV2FB7gUnjizHzvheLGGryivmbcQWu/pmT1KxQNRwnjptRniEL35y4Hr
u9mWjItjAnukMa+aoSq5zowRBsrXnuwMQGMqBi442NEH4kfSOG0iXi6TjA/hLrC+
fS6DR8KhhTdmxg9TYe7XiBDGRoKLCA==
=BrV9
-----END PGP SIGNATURE-----

--k1BdFSKqAqVdu8k/--


