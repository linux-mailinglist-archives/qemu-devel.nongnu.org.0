Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA166293881
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 11:53:39 +0200 (CEST)
Received: from localhost ([::1]:56258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUoKo-0007oW-U2
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 05:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kUoK3-0007Kd-Vn
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 05:52:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kUoK1-0003bS-8o
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 05:52:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603187567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ymaw8k7TQhmh3dQDLPi72TUJSjprMiUjTVwjNwKgIjo=;
 b=ZQm3qB12OYdBqURvR75lOoXG+EH9tCgodDOuM5T4tk5mbwk+AKFvg43Z68E6lnAegxxhcy
 zdDuGG+06rQzZOlrQ2gkt69iEtf6CKJPtkEhffwA+XGinFeah2lE51F96Sa8/ik1HqEHhZ
 Dn/vS+1kjIslz9miqLtydkoU5tp4bTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-_aH2kFJtPLyLx-MZEpiwvg-1; Tue, 20 Oct 2020 05:52:45 -0400
X-MC-Unique: _aH2kFJtPLyLx-MZEpiwvg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA8C010866AE
 for <qemu-devel@nongnu.org>; Tue, 20 Oct 2020 09:52:44 +0000 (UTC)
Received: from localhost (ovpn-115-35.ams2.redhat.com [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 640161A837;
 Tue, 20 Oct 2020 09:52:38 +0000 (UTC)
Date: Tue, 20 Oct 2020 10:52:37 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 3/5] tools/virtiofsd: xattr name mappings: Map server
 xattr names
Message-ID: <20201020095237.GC140014@stefanha-x1.localdomain>
References: <20201014180209.49299-1-dgilbert@redhat.com>
 <20201014180209.49299-4-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201014180209.49299-4-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zCKi3GIZzVBPywwA"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:16:16
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
Cc: dinechin@redhat.com, virtio-fs@redhat.com, qemu-devel@nongnu.org,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--zCKi3GIZzVBPywwA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2020 at 07:02:07PM +0100, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> Map xattr names coming from the server, i.e. the host filesystem;
> currently this is only from listxattr.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 89 ++++++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--zCKi3GIZzVBPywwA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+Os2UACgkQnKSrs4Gr
c8harwf/QbnDmhsN2ddgSULa0eG4vqrBqKHj7Fqj4d+cf4NGQ8Ff/2jC30T6DgcE
ilC/kF/f2xp0PgXxRXro3A6pcYVcoqYpnpmyxeatVfSK0j7IPim/R7hBr27wATdF
0xa2qlPHoxS23e3+BK0M/Mb48jerBHf4lAaun58J4EkxN5GsLw7uI8ySWOKTIQKC
5sQ3zKXadQ0DvEjfZCd1OYaVyTISO7RPoB/bDsGDP6j1CWdbPer717jiv6JwfU6z
hCWD5ord9vyyY1Y6Pg8FoWE+uUJtgCRxoTmLKS0E79eu5DNcVfUHWCPRaND5Hrhc
LiWwR0exq+RsuBB8P1C4+tbrOUY8VA==
=Szjr
-----END PGP SIGNATURE-----

--zCKi3GIZzVBPywwA--


