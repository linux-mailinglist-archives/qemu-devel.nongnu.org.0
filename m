Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B35528046
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 10:55:48 +0200 (CEST)
Received: from localhost ([::1]:40252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqWW3-0006fb-IM
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 04:55:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nqWRo-0005FO-Mi
 for qemu-devel@nongnu.org; Mon, 16 May 2022 04:51:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nqWRk-0005f8-0B
 for qemu-devel@nongnu.org; Mon, 16 May 2022 04:51:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652691076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RfYuWCB6ZR/x1VFRplbCJeRjblKCsxZjUkYDCUmuexw=;
 b=aun5PWt42T5qqemvIpVLjCH3F3MjUOD/sTJCHX95Nn+IynhCiALBACBQrheuoAaM86RKuH
 VnncxDYHFzS9SUxzTzKnntIzFATWv/Z3XCaxqhY0QIWEU0WAbPkoPZmyHytNpGF6ADdapp
 EEwoXbXWWijVbi0pu4x5taG42LO+5oM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-WE6siEJ8MJyAUWvkdbNGOw-1; Mon, 16 May 2022 04:51:14 -0400
X-MC-Unique: WE6siEJ8MJyAUWvkdbNGOw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 518FD805B25
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:51:14 +0000 (UTC)
Received: from localhost (unknown [10.39.195.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0683EC53360;
 Mon, 16 May 2022 08:51:13 +0000 (UTC)
Date: Mon, 16 May 2022 09:51:12 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: Re: [PULL 00/16] migration queue
Message-ID: <YoIQgCndgjW1s58k@stefanha-x1.localdomain>
References: <20220510083355.92738-1-dgilbert@redhat.com>
 <Yno3RvWhwSDZjI7o@work-vm> <Yno8NV5bQPUlqvcx@redhat.com>
 <YnpB4vg2ozbBzUCg@work-vm>
 <CAJ6HWG5Mgaqt9dOVH-0-Y78x96HO5c-TevYeuN5xMvSQqj7W8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pBPlv25A0F+TMIyF"
Content-Disposition: inline
In-Reply-To: <CAJ6HWG5Mgaqt9dOVH-0-Y78x96HO5c-TevYeuN5xMvSQqj7W8Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--pBPlv25A0F+TMIyF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2022 at 12:40:07AM -0300, Leonardo Bras Soares Passos wrote:
> From a previous thread:
>=20
> On Thu, Apr 28, 2022 at 1:20 PM Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > Leo:
> >   Unfortunately this is failing a couple of CI tests; the MSG_ZEROCOPY
> > one I guess is the simpler one; I think Stefanha managed to find the
> > liburing fix for the __kernel_timespec case, but that looks like a bit
> > more fun!
> >
> > Dave
>=20
> I thought Stefanha had fixed this bug, and we were just waiting for a
> new alpine rootfs/image with that fixed.
> Is that correct?

I didn't fix the liburing __kernel_timespec issue on alpine Linux. It's
probably a packaging bug and I gave Dave the email address of the
package maintainer. I'm not sure if the package maintainer has been
contacted or released a fixed liburing package.

Stefan

--pBPlv25A0F+TMIyF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKCEIAACgkQnKSrs4Gr
c8iE1Af/SkNq0ttW3b9Ri1Vytblq4t3dyVKczi2//3ia+VnPfhPmjXBLbuc96uMp
56Jn+/BmyQHC3vQ68Cs2HOAU3JqPPzAXjI65XWNuz+wxF+0IPYphHTk05vwKTLNe
22zBmIJNFAfubqWOeUKWn1SkdI8iO+IO5rg+xvxWHB3VqDp3vM1JQ2WJEE6ou/Fy
i0jfs6ndYAUajWLdKXWWQJiLgdxm6Q0m9faD2ooBCu3yZwGijVDIOUWFidRikOpM
I1M2TF4C80otNPyqhfO6DS14eDZPhp4WNoFYBQimphIfjh3UFUePUGHaIFencG9T
rw+9i+0/cAXLy8rav39MAewPl77Tfw==
=dxjJ
-----END PGP SIGNATURE-----

--pBPlv25A0F+TMIyF--


