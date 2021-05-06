Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ECF375630
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 17:05:59 +0200 (CEST)
Received: from localhost ([::1]:41966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lefZd-0004to-Sa
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 11:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lefWj-0003ad-7m
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:02:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lefWf-0007x2-NB
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:02:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620313372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UYe4rfariJygj0j3b4ViRidW2a8j6RE0vmgbrLhDKUo=;
 b=CRPbeXPTULtiayYGEI6UvCVO3oJ2bW9n/4Yz4h/B/zrFgIC+k2k4C0tldvVY6qJPEM4SqJ
 FKztquLsSMZj8QssJGkM2Em42zY/+m6H73QzQWiaAfVroM0SeGRBfJ0hyY3BufhlE/Vj6D
 BuAUAHtaF0CkIpLZcZaIm5Gxjtb/zHU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-A9OXT31JMmCvRbGbnCyiNA-1; Thu, 06 May 2021 11:02:50 -0400
X-MC-Unique: A9OXT31JMmCvRbGbnCyiNA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E82248186F5;
 Thu,  6 May 2021 15:02:48 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7AE1510023AB;
 Thu,  6 May 2021 15:02:46 +0000 (UTC)
Date: Thu, 6 May 2021 16:02:45 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 12/26] DAX: virtiofsd: Add setup/remove mappings fuse
 commands
Message-ID: <YJQFFVFq5+3KhaqM@stefanha-x1.localdomain>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-13-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210428110100.27757-13-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nwvIRNPPRvStkmrY"
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

--nwvIRNPPRvStkmrY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 12:00:46PM +0100, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> Add commands so that the guest kernel can ask the daemon to map file
> sections into a guest kernel visible cache.
>=20
> Note: Catherine Ho had sent a patch to fix an issue with multiple
> removemapping. It was a merge issue though.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> Signed-off-by: Peng Tao <tao.peng@linux.alibaba.com>
> Including-fixes: Catherine Ho <catherine.hecx@gmail.com>
> Signed-off-by: Catherine Ho <catherine.hecx@gmail.com>
> ---
>  tools/virtiofsd/fuse_lowlevel.c | 69 +++++++++++++++++++++++++++++++++
>  tools/virtiofsd/fuse_lowlevel.h | 23 ++++++++++-
>  2 files changed, 91 insertions(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--nwvIRNPPRvStkmrY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCUBRUACgkQnKSrs4Gr
c8ikHwf/agBt2zxfJ9tOcLP1Tmi+UOH9EU4df1Exw2BVdK2skXtyRuGp++P+wtUM
m8If55l7Pew4EKWMRMESuqCt5v7L7Um7s2h0U+IKqG1gNHpqFBbqL6KDvHcmhWHh
a/ns/OUB9hHwY5g9chpQsEkvN/lwaXp3SfbLdBwHj9gm+J2w1L/Btc8OUsnHdcsc
ZRmGmtAmJB2clijL8wm+CqQ2B+Zuxu1Hyle/u1trSfYloHaUwfey1/Ayv2ECh0pK
V4BZ2vraLIzqWFm2zPM/VN+0O7BSWD7AEw+Jmk6Xf0T+9O63VfthPDF3rx/UU2Ka
a9wtIWC1Z1ddeTd/RGHxKex70enRvQ==
=SMKU
-----END PGP SIGNATURE-----

--nwvIRNPPRvStkmrY--


