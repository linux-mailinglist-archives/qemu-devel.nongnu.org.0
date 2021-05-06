Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346EE375710
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 17:28:58 +0200 (CEST)
Received: from localhost ([::1]:57436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lefvt-0007ol-9M
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 11:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lefug-0006jj-Aa
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:27:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lefuc-0003YF-BC
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:27:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620314857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PnUseUX0VZVMy2urNhrYHwSTOspQJjvvS5uZjI7GJmc=;
 b=LuOjwzR/p3KRLaB4rwsK2bNHmRT1oLLE+szf3U8ogUTf3UxVz5Lor9UGv1kZPL5IJ/fay0
 Sqfhq1X4vt46W7YjRNOsI8kP3tSlpA5tpnQJeNJeEuyZ3WAe4ZGfeVYtRSULCU9R+Hlf7P
 aR7kW7SQ0/ubMP8oNZ5xxozPYoN4DkM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-bniCqQiKM0CXqm8Krqq_-w-1; Thu, 06 May 2021 11:27:34 -0400
X-MC-Unique: bniCqQiKM0CXqm8Krqq_-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25ACD8B78AB;
 Thu,  6 May 2021 15:27:33 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6233E70F6F;
 Thu,  6 May 2021 15:27:32 +0000 (UTC)
Date: Thu, 6 May 2021 16:27:31 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 21/26] DAX/unmap virtiofsd: Route unmappable reads
Message-ID: <YJQK48vo1EucwKmv@stefanha-x1.localdomain>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-22-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210428110100.27757-22-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2+pT4L74SHCe/uvb"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, vgoyal@redhat.com,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--2+pT4L74SHCe/uvb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 12:00:55PM +0100, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> When a read with unmappable buffers is found, map it to a slave
> read command.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  tools/virtiofsd/fuse_virtio.c | 37 +++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--2+pT4L74SHCe/uvb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCUCuIACgkQnKSrs4Gr
c8i71wf/a0OogYntbO594T7tHNcLkE9cM9p8i84faW9ptsTYFJzmvIwlqdjsgSKu
O9PQZbWptaORHUjcYAOAXtPNMd/6fK8AmBiDQfAB/EwGIUl4d1Qn/iNc3xT/Hr2j
gU2+FzBgYNxN9xAEMh9GYXQG7LuiyAcm40eWNfpYgSHIffGLp/las/XGNtoqfmjG
CDuR/XuQNXnfZ7SEPlKGX+lxTah7QPms/DTEETEPqDX1vwho5xwpZVk1s9FVJG4N
o5LatVuwpRqCRTG0sssY+F2gD4tQFa+lVPGX2qARYMt4Y0DkMWd/wUi5gvkj5+wo
W9f7kMowGZBLJ1rarf68JeMOHG0/Aw==
=cJto
-----END PGP SIGNATURE-----

--2+pT4L74SHCe/uvb--


