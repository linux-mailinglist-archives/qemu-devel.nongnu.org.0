Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5015C4D31E3
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 16:38:20 +0100 (CET)
Received: from localhost ([::1]:53854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRyOI-0006Vp-V7
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 10:38:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRyNE-0005nN-Ow
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 10:37:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRyNC-0001jv-44
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 10:37:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646840226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3GjcLK+Krs1W7VEvfVtBmjbvgwP/Vv5SqNCh9TqLJJo=;
 b=HxKW0NIV18btwsztr0sj8uFBn94SLWMyzUH+qnZLSkKBQG416eDsRELMaRqU5pLR8KXFkJ
 2Tyz+m49+La0BKfRPaZCxaIIg9J7XaFKbvXZP9hmUd+UooS3yATOx3wP7exs01LOvEvOQy
 h8OI9tv38DES6Y/LLX8leMuwdgBUdLM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-JIKeneyYOEK_6ShoG2Jn0g-1; Wed, 09 Mar 2022 10:37:03 -0500
X-MC-Unique: JIKeneyYOEK_6ShoG2Jn0g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDA16835DE0;
 Wed,  9 Mar 2022 15:37:01 +0000 (UTC)
Received: from localhost (unknown [10.39.195.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 783817A52D;
 Wed,  9 Mar 2022 15:37:01 +0000 (UTC)
Date: Wed, 9 Mar 2022 15:37:00 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH v2 0/6] Support exporting BDSs via VDUSE
Message-ID: <YijJnLIp41UajfId@stefanha-x1.localdomain>
References: <20220215105943.90-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DH86Re8oQZGUSItO"
Content-Disposition: inline
In-Reply-To: <20220215105943.90-1-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 mlureau@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--DH86Re8oQZGUSItO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:59:37PM +0800, Xie Yongji wrote:
> Hi all,
>=20
> Last few months ago, VDUSE (vDPA Device in Userspace) [1] has
> been merged into Linux kernel as a framework that make it
> possible to emulate a vDPA device in userspace. This series
> aimed at implementing a VDUSE block backend based on the
> qemu-storage-daemon infrastructure.
>=20
> To support that, we firstly introduce a VDUSE library as a
> subproject (like what libvhost-user does) to help implementing
> VDUSE backends in QEMU. Then a VDUSE block export is implemented
> based on this library. At last, we add resize and reconnect support
> to the VDUSE block export and VDUSE library.
>=20
> Since we don't support vdpa-blk in QEMU currently, the VM case is
> tested with my previous patchset [2].
>=20
> [1] https://www.kernel.org/doc/html/latest/userspace-api/vduse.html
> [2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg797569.html
>=20
> Please review, thanks!

Sorry for the delay. I will review this on Monday.

Stefan

--DH86Re8oQZGUSItO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIoyZwACgkQnKSrs4Gr
c8hSiwf+LMJL2DIDv+WF90tTyMer4+o+1rX0C7ahw2Ru2saseIS2tI+FR+9N7fst
L9T6qTxTBDeE4gnc4daZkIJTuFC07LLUlK6k5KB2bFDffwFv5mNow3k+1Tm+aroI
4ns+tGM8bxV4nEPUvgRuNZOGtZIBt1ka6HWAcQe/vRIHzKIABr2yYmY3sCgdXhTv
r2ON/PKLW9zEAoBbd3dGxYv0T7sUkO6C09h3mDnwJjpb9ondCmY143cqTDl8VhSM
K2n71n34GdswMmORcCHw0mDJdUA3lG2/JSOMDQXxNUesPjjUmcOeXwKtQrMObkQh
bORV/0ryqRjU+vhWyz98vxlJaggQxg==
=0fiP
-----END PGP SIGNATURE-----

--DH86Re8oQZGUSItO--


