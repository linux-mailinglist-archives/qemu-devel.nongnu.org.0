Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0C72960FB
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 16:36:59 +0200 (CEST)
Received: from localhost ([::1]:49324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVbi6-0004Xi-Il
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 10:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kVbfV-0002LW-JD
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 10:34:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kVbfT-0004PP-CS
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 10:34:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603377253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SQ3E4o+sAIxzFgxdpx8espYoAaKTdq7IWD9mo1S3r1k=;
 b=R45I5NjiSdm2JBtMFhin7qhEG1W+UCupiphyySHscDZRS8Kl6hPZjGTtKNSNhL7QALHvdZ
 0N5etHsOELZIVFooQ9MgxaaTd4R/f3z5iJrBz+4bXTIK3W9P608ZQHPF+K9MjrLUsvmxiH
 hjdgG/C5jzj4vvB0qMRLjZ+dFP2qvtM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-qUyHfIqKNjK1nnpsBAQGjA-1; Thu, 22 Oct 2020 10:34:11 -0400
X-MC-Unique: qUyHfIqKNjK1nnpsBAQGjA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5985C80733F;
 Thu, 22 Oct 2020 14:34:10 +0000 (UTC)
Received: from localhost (ovpn-114-229.ams2.redhat.com [10.36.114.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C34855D9F1;
 Thu, 22 Oct 2020 14:34:06 +0000 (UTC)
Date: Thu, 22 Oct 2020 15:34:05 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 13/16] util/vfio-helpers: Introduce
 qemu_vfio_pci_msix_init_irqs()
Message-ID: <20201022143405.GM761187@stefanha-x1.localdomain>
References: <20201020172428.2220726-1-philmd@redhat.com>
 <20201020172428.2220726-14-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201020172428.2220726-14-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8c07nsHwQobhlezh"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 08:09:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--8c07nsHwQobhlezh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2020 at 07:24:25PM +0200, Philippe Mathieu-Daud=E9 wrote:
> qemu_vfio_pci_init_irq() allows us to initialize any type of IRQ,
> but only one. Introduce qemu_vfio_pci_msix_init_irqs() which is
> specific to MSIX IRQ type, and allow us to use multiple IRQs
> (thus passing multiple eventfd notifiers).
> All eventfd notifiers are initialized with the special '-1' value
> meaning "un-assigned".
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  include/qemu/vfio-helpers.h |  6 +++-
>  util/vfio-helpers.c         | 65 ++++++++++++++++++++++++++++++++++++-
>  util/trace-events           |  1 +
>  3 files changed, 70 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--8c07nsHwQobhlezh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+RmF0ACgkQnKSrs4Gr
c8giBQgAo3uyHH8JswOuQfuswx73mdxsSLjokCHJasclgeQOHU7pNkoUdC0F1vaM
n85KNeQZomqFyXQUMaow3FYW9i+Dld6pSBYxHyOrdAQymsP0REFaD5fMBlpdWoNb
3Fvz+WcDdcdRhitYyAchyjM5dSxToYkeIRlRBJjmKR/O58El8rJ+DEUJC6xy3bYj
EoYOh5kFfsSlQtX0P5ZiwG7WwOgeLEfHTLKyXEhvv7WEEXlO8d3jhDnzES33GMPi
f5YwNCxort9RfK0dIC5M4vUmlTsyQx+30+kSm7Xhgg1oQ2NONpBmDI8JttTayUD1
Dg3Qb7GYKQ5K2x7c1pgJCLMPA0030w==
=AJkv
-----END PGP SIGNATURE-----

--8c07nsHwQobhlezh--


