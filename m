Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 489BB2AEF72
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 12:19:27 +0100 (CET)
Received: from localhost ([::1]:37922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kco9u-0000zo-Cj
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 06:19:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kco8b-0000Uf-NA
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 06:18:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kco8Z-0005XZ-En
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 06:18:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605093482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CY0l43GcfnPf6Cbkq5u6DLR4ACAO6ShgW6ghqqjEMe8=;
 b=aHCCCYBI+oqYxpTUxTAQO66kOGQSMry4nfaT45WclRroa28CdEwcmbEdCRteVZeX4IUlKZ
 LoqLF0r1xvIeGwPQ89N6ruiP/oxjqLIoiJOhsKbdDhKa3jyxAF7aSwrInZVOEF6Vu2UT+E
 ogXHVUU2W4Cuk35MWCiZaotmXF5I17A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-42-GlWqZN-ScxxnL2EIT8g-1; Wed, 11 Nov 2020 06:18:00 -0500
X-MC-Unique: 42-GlWqZN-ScxxnL2EIT8g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 721856D247;
 Wed, 11 Nov 2020 11:17:58 +0000 (UTC)
Received: from localhost (ovpn-112-222.ams2.redhat.com [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C774D5C3E0;
 Wed, 11 Nov 2020 11:17:47 +0000 (UTC)
Date: Wed, 11 Nov 2020 11:17:46 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [Rust-VMM] Requirements for out-of-process device emulation
Message-ID: <20201111111746.GA1344536@stefanha-x1.localdomain>
References: <20201009161815.GA321402@stefanha-x1.localdomain>
 <87ft6jz7od.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87ft6jz7od.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
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
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Daniele Buono <dbuono@us.ibm.com>, slp@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 Hubertus Franke <frankeh@us.ibm.com>, rust-vmm@lists.opendev.org,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 06:16:18PM +0100, Alex Benn=E9e wrote:
> Stefan Hajnoczi <stefanha@redhat.com> writes:
> > Security
> > --------
> > The trust model
> > ```````````````
> > The VMM must not trust the device emulation program. This is key to
> > implementing privilege separation and the principle of least privilege.
> > If a compromised device emulation program is able to gain control of th=
e
> > VMM then out-of-process device emulation has failed to provide isolatio=
n
> > between devices.
> >
> > The device emulation program must not trust the VMM to the extent that
> > this is possible. For example, it must validate inputs so that the VMM
> > cannot gain control of the device emulation process through memory
> > corruptions or other bugs. This makes it so that even if the VMM has
> > been compromised, access to device resources and associated system call=
s
> > still requires further compromising the device emulation process.
>=20
> However in this model the guest intrinsically trusts device emulation
> because it currently has full access to the guest's address space. It
> would probably be worth making that explicit.
>=20
> There are security models where the guest doesn't need to trust the VMM
> or particular device emulations.

Where do you see that assumption in the text?

BTW, shared guest memory access is optional in vhost-user. The protocol
allows the VMM to handle DMA accesses instead of granting the device
access to guest memory.

Stefan

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+ryFoACgkQnKSrs4Gr
c8g9rgf/ZgHlrHOVm6VYhBanslMCASIdLMjs4UnU9UaNtngJppmRtnPp0SZPDDP0
FJ18kYubLpqJrQltLynqqHFVT2ZRg3KSaJQus/lcgQZeF4XCVJrFCe1UEo/93Vx6
lR0b/e0lGu7TXgaS1JluiJOgQIrhZeGutnVtnmGGDuDYX2IlNx7uNqMOyPDLFFsU
mUhiokR7d/p81bEj7X37pH+32r2uxkRsesWyQ60GEfzHZD6xljICQV4S2CxNHkQ1
hPaqbXpYljx4j6FwJANUPX5gX2DP5wMlB8k15XEU8vdzTBEEYAIoulHHQnVkbL6u
LfcpX52fBVENyPCofIiYiRbPSuU4xQ==
=ijm9
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--


