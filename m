Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 249586F32EE
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 17:33:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptVWN-0007qJ-IK; Mon, 01 May 2023 11:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptVWK-0007n4-E6
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:32:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptVWI-00069b-Ob
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:32:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682955173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IjkR6jVeP9fCH5SAKqRdf9d5ef666XUWX0WMqzfrtHM=;
 b=K8lpS9s5VSh3CAwfht3B+7pM2x2wAo40q+8fOrmogmgB7tI7d+MeMl1paR3zdudVig7rrB
 z1Odqnolq7Q9udBlaGR7yzaKhFxBKa2AA3euQApFib4uKFCvtICxHfMWX2eqDI2X/joSJM
 cPL0bAe9xG7D/k/AG58FFElYb+/PzeY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225-BNcae46zOyOHEVl2lF9YDQ-1; Mon, 01 May 2023 11:32:36 -0400
X-MC-Unique: BNcae46zOyOHEVl2lF9YDQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EF7818811C2;
 Mon,  1 May 2023 15:32:25 +0000 (UTC)
Received: from localhost (unknown [10.39.192.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0F0A483EC4;
 Mon,  1 May 2023 15:32:24 +0000 (UTC)
Date: Mon, 1 May 2023 11:32:22 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, pbonzini@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 06/20] graph-lock: Add GRAPH_UNLOCKED(_PTR)
Message-ID: <20230501153222.GH14869@fedora>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-7-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="I7clKLbpLvHCavJr"
Content-Disposition: inline
In-Reply-To: <20230425173158.574203-7-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--I7clKLbpLvHCavJr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 07:31:44PM +0200, Kevin Wolf wrote:
> For some function, parts of their interface is that are called without
> holding the graph lock. Add a new macro to document this.
>=20
> The macro expands to TSA_EXCLUDES(), which is a relatively weak check
> because it passes in cases where the compiler just doesn't know if the
> lock is held. Function pointers can't be checked at all. Therefore, its
> primary purpose is documentation.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/block/graph-lock.h | 2 ++
>  1 file changed, 2 insertions(+)

Modulo Eric's comment about the commit description:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--I7clKLbpLvHCavJr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRP24YACgkQnKSrs4Gr
c8hS9QgAgK3pHeEUvF57krqwk3TD5UUDmQNNEsw7P2CTypuXYfRQ1WWdFwn5sPYJ
TgcWP+Y3z5KmyqDgpUaL1rz5wdCPgyFhucUho55cv43dmSQgrib8Hs+PrI8aFqgP
XKpw0ZdMOSbzp+4sSsykivH146StRUWXI/r9MIiOAOPmkjnuHbys3BMPpbLn9gxt
xHphJ6PGVDXZm75EXZ4sFjgUQQoYZcaBYhU9dm7trGjYwLETNKM9AQVgaMqL9e/k
35+63tqi6wxp+F/MGD1QYboVICTTRuhKaoVDKyXFe8NG66ih/kqvoZ7v0Ng34NJG
bXSDg/7AciN8ZIBwi1oZ+BKP1vmyqA==
=8j8H
-----END PGP SIGNATURE-----

--I7clKLbpLvHCavJr--


