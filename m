Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BAE318D87
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 15:41:25 +0100 (CET)
Received: from localhost ([::1]:48598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAD9o-0001BD-Q1
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 09:41:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lAD4a-0004JB-Py
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:36:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lAD4W-0007d8-Jq
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:36:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613054155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v/Gty5U+pImW7M9/rYVUon6KAhjP3LOhDrpEK4hiAGs=;
 b=Hk+OFk/qjV+jDsxYkxdy02e2S7PvOM/LPUWtyZouj9cPCjfQlQ/JU401qKJEZ7VZSNtfwR
 HDO4Dqrqx9jnDxso4LAV+Ng3VOzT5iPe73CI8rTn4jkhbDK7TBz1d4rvieRzChhCzDMXUa
 IAugD9Nj5CHg9eplDpk5lFB8YeAWjtA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-5zgCC-kkNe-hutw19y4qFg-1; Thu, 11 Feb 2021 09:35:53 -0500
X-MC-Unique: 5zgCC-kkNe-hutw19y4qFg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAC3F801985
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 14:35:52 +0000 (UTC)
Received: from localhost (ovpn-115-9.ams2.redhat.com [10.36.115.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13F8810013D7;
 Thu, 11 Feb 2021 14:35:42 +0000 (UTC)
Date: Thu, 11 Feb 2021 14:35:42 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 23/24] vhost-user-fs: Implement drop CAP_FSETID
 functionality
Message-ID: <20210211143542.GT247031@stefanha-x1.localdomain>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-24-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209190224.62827-24-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tRcR9GoWqjXrt11v"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 vgoyal@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--tRcR9GoWqjXrt11v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 07:02:23PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: Vivek Goyal <vgoyal@redhat.com>
>=20
> As part of slave_io message, slave can ask to do I/O on an fd. Additional=
ly
> slave can ask for dropping CAP_FSETID (if master has it) before doing I/O=
.
> Implement functionality to drop CAP_FSETID and gain it back after the
> operation.
>=20
> This also creates a dependency on libcap-ng.

Is this patch only for the case where QEMU is running as root?

I'm not sure it will have any effect on a regular QEMU (e.g. launched by
libvirt).

--tRcR9GoWqjXrt11v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAlQL4ACgkQnKSrs4Gr
c8gSLwf+MNfurIaGiYkHOIWwHCdlACeCHH9m2N0kMu3fCt17Z8lNK8gl8yb7YnuO
tLKqwznY//9SmKNR57/TOazwkIib1LCDR6n0SVNoJH0wQa0tqSzhdGtjuOYsUUEU
/nzOtt4xbvCGFxE3xHkmal9TVRTGhg4WA48XDtlKjYolCCeTK6bO/cTxeNZKgELN
cfH0FYyag53Tn5Cpe3fMXhp4tYEG3ltvcECL1MmGRaCQiXGqAqhYwMdCJ5XaKA58
EZX8FCSxJgW2XZfb2FNTXuT3jRkm9OXIBcySDXYBEEbsfZxlaqAFtLvR8BMVXR0l
C2BqNMM0Z0yPu93LdByiX2fGv+sPyw==
=1uXB
-----END PGP SIGNATURE-----

--tRcR9GoWqjXrt11v--


