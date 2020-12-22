Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F4A2E08E3
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 11:40:05 +0100 (CET)
Received: from localhost ([::1]:44460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krf5I-0001wh-1e
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 05:40:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1krf3t-0001Um-0h
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 05:38:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1krf3q-0004c3-R5
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 05:38:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608633514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UsUt5OSB5NG2m1rupuEMLYUW3qng0a3r+o78Wlg+pH0=;
 b=jCtY8mf3JmYDgvqKhB7RDUQBC4YAcHYEIwwDMm58gEsyenKfpew9KaIIj5eysykSZMsC5I
 fE0eEqSFBVLQ8KKQMFH9lFy4Bi8HPyjpNR+8VbQPZhnYNb0oMnrtlwmqoinQkYTxCgx6/9
 FYumt0S7Ke8OIgdHp1vVmVC5zxJkkJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-J99rg3drPbuKB7rD8LWxAQ-1; Tue, 22 Dec 2020 05:38:32 -0500
X-MC-Unique: J99rg3drPbuKB7rD8LWxAQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E36B107ACE6;
 Tue, 22 Dec 2020 10:38:30 +0000 (UTC)
Received: from localhost (ovpn-112-56.ams2.redhat.com [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9203177CAA;
 Tue, 22 Dec 2020 10:38:20 +0000 (UTC)
Date: Tue, 22 Dec 2020 10:38:19 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: elena.ufimtseva@oracle.com
Subject: Re: [PATCH v14 00/21] Initial support for multi-process Qemu
Message-ID: <20201222103819.GD105660@stefanha-x1.localdomain>
References: <cover.1608263017.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
In-Reply-To: <cover.1608263017.git.elena.ufimtseva@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="48TaNjbzBVislYPb"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: fam@euphon.net, john.g.johnson@oracle.com, swapnil.ingle@nutanix.com,
 mst@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, armbru@redhat.com, kanth.ghatraju@oracle.com,
 felipe@nutanix.com, thuth@redhat.com, ehabkost@redhat.com,
 konrad.wilk@oracle.com, dgilbert@redhat.com, alex.williamson@redhat.com,
 pbonzini@redhat.com, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--48TaNjbzBVislYPb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 07:57:47PM -0800, elena.ufimtseva@oracle.com wrote:
> From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>=20
> Hi
>=20
> This is the v14 of the patchset. Thank you very much for reviewing v13 an=
d
> sharing your feedback.

Please see Marc-Andr=E9's comment and my comment about a possible
fd/memory leak.

Stefan

--48TaNjbzBVislYPb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/hzJsACgkQnKSrs4Gr
c8hjDgf8C8ghN7kDomcYNc0vFKZLCOMZbSNOb/48/EAo5Zchn53vzwr8QgqUOb0V
4S6W5KdwFDwp5/Q8Vx0XIeUrgTQ9n3V2cztWcWZhYPaxgrH3jE9uTaUZvZFwnXPG
CroX3CEn1lCQ4ERPTgHxLTzJcxfK7ypMf870rz0wt5UMAz1J6Whh6AoYfFoYNw3k
cihSUCL8+aAjpfhMTAKCRDTA70cdLHIkXKtj2/WJALDoGfMBHN/6C2kPYgYO9Xxv
YA6nmcZzSi0xZ2Uk8LijLjNLqinB2ZGaaOVfrK+bS5baARD4gNMKQErZHD8H30X4
HnM+HmCb+0QcXXEvM+G1vXDt+TqJfA==
=+5un
-----END PGP SIGNATURE-----

--48TaNjbzBVislYPb--


