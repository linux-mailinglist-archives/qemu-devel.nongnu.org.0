Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE26B350240
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 16:32:25 +0200 (CEST)
Received: from localhost ([::1]:45584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRbtM-0000XC-Ni
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 10:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRbrr-00082k-Uv
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 10:30:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRbrq-0007xT-7r
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 10:30:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617201045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wj4GU+G9aqfu+qUE9amGAa77mEYo+gAeos2X+m8QOSk=;
 b=HzNtzATrUSR/RW2//VPJj2kHyQHSh5GlgZ4C3WSKJNsEyxe8tgfOWngztDXUwXIkIgdWhs
 VDplqXx/4H5RzfiJs8Tb5eqs6CTv5AYrzThyhP9Wc0RE1vQrlkt/7iHwzh6yB6Y2Z9Poom
 U850V1WixfVVzkdYmueDSMoPdDLDBzQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-HuxlC5qqMSStVWZQinOyOw-1; Wed, 31 Mar 2021 10:30:42 -0400
X-MC-Unique: HuxlC5qqMSStVWZQinOyOw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BBE2107B29D;
 Wed, 31 Mar 2021 14:30:41 +0000 (UTC)
Received: from localhost (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 413386F13A;
 Wed, 31 Mar 2021 14:30:41 +0000 (UTC)
Date: Wed, 31 Mar 2021 15:30:40 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH] virtiofsd: Changed allocations of fuse_session to GLib's
 functions
Message-ID: <YGSHkBOXE/U311V/@stefanha-x1.localdomain>
References: <20210324064943.35827-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210324064943.35827-1-ma.mandourr@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KfKBzTgUrXoKGb5e"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--KfKBzTgUrXoKGb5e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 08:49:43AM +0200, Mahmoud Mandour wrote:
> Replaced the allocation and deallocation of fuse_session structs
> from calloc() and free() calls to g_try_new0() and g_free().
>=20
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  tools/virtiofsd/fuse_lowlevel.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--KfKBzTgUrXoKGb5e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBkh5AACgkQnKSrs4Gr
c8iK6wf/TLLstRpUliCIu0BCxvNrIof/EZ43RyTH6KxsbPigLDo5fdc/pIGUw9Cl
nyhFt1t+8Stn+JrymijbOv/nbWyqYKjUwhkSkOOVh4bDWP36ShDCw/+HRMlU90DY
fcm+RVRyQxZ9kMwldVpBFG+M2ZaZtnQDeEFyida8PRQnHGNLq9oI2thpfF2vSdaP
tm4bJRBltsMhempnY8vDv3fRcTJs1Jz4hTXgK0MjOektByqujoNIisEd/e1jylu4
889P2ZoPqgFb3jzdokC+v/3mPhAl5fc6XMvFP4ZpzMdHv2oIKdH+yx18NfcWEBDB
kA7X5N/XEeJujyAArHt7q3XYO1uQnw==
=oAGE
-----END PGP SIGNATURE-----

--KfKBzTgUrXoKGb5e--


