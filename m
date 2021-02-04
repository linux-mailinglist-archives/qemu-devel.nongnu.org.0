Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5318D30F529
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:41:23 +0100 (CET)
Received: from localhost ([::1]:45858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7fow-0003on-CX
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:41:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7fnO-0003Gj-NS
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:39:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7fnN-0000Q2-31
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:39:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612449583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W1y8th5ZyuJOSMI4ugvEYVyabl+CWhUu48aVIeMQfvM=;
 b=JBCWkdyhDEFMSEvrZ1e6HcXwZ/SXAvSa6tg9vp1J5kavLmKyVFcsS489fB7OkaOVtqRBBb
 WVM+7onWQsxu4+3+YCgGWcjTUG5TyNY/S+A+6TvuAxKWBgHfmaZBJnowJrkQyShcm1M5FM
 nrcN8N9qhNQ1N/CaUOI0kXwKf/vEd3c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-43G8c_WlMY6vlMS15IxWkQ-1; Thu, 04 Feb 2021 09:39:39 -0500
X-MC-Unique: 43G8c_WlMY6vlMS15IxWkQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FFC8100C662;
 Thu,  4 Feb 2021 14:39:37 +0000 (UTC)
Received: from localhost (ovpn-115-89.ams2.redhat.com [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 019255B697;
 Thu,  4 Feb 2021 14:39:30 +0000 (UTC)
Date: Thu, 4 Feb 2021 14:39:29 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/27] Block patches
Message-ID: <20210204143929.GD344659@stefanha-x1.localdomain>
References: <20210204095834.345749-1-stefanha@redhat.com>
 <CAFEAcA-jCbyuYQ_HPR2VB1OLZGJ7SebFZ3qz-eehUV=aWuA3Ng@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-jCbyuYQ_HPR2VB1OLZGJ7SebFZ3qz-eehUV=aWuA3Ng@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="at6+YcpfzWZg/htY"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 John G Johnson <john.g.johnson@oracle.com>, "Denis V. Lunev" <den@openvz.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--at6+YcpfzWZg/htY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 04, 2021 at 10:02:25AM +0000, Peter Maydell wrote:
> On Thu, 4 Feb 2021 at 09:58, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > The following changes since commit 77f3804ab7ed94b471a14acb260e5aeacf26=
193f:
> >
> >   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into s=
taging (2021-02-02 16:47:51 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> >
> > for you to fetch changes up to 026362226f1ff6a1168524a326bbd6347ad40e85=
:
> >
> >   docs: fix Parallels Image "dirty bitmap" section (2021-02-03 16:48:21=
 +0000)
> >
> > ----------------------------------------------------------------
> > Pull request
> >
> > The pull request includes Multi-Process QEMU, GitLab repo URL updates, =
and even
> > a block layer patch to fix the Parallels Image format specification!
> >
> > ----------------------------------------------------------------
>=20
> This has merge conflicts:
>=20
> Auto-merging util/oslib-posix.c
> CONFLICT (content): Merge conflict in util/oslib-posix.c
> Auto-merging util/mmap-alloc.c
> CONFLICT (content): Merge conflict in util/mmap-alloc.c
> Auto-merging softmmu/physmem.c
> CONFLICT (content): Merge conflict in softmmu/physmem.c
> Auto-merging softmmu/memory.c
> CONFLICT (content): Merge conflict in softmmu/memory.c
> Auto-merging include/qemu/mmap-alloc.h
> Auto-merging include/exec/ram_addr.h
> CONFLICT (content): Merge conflict in include/exec/ram_addr.h
> Auto-merging include/exec/memory.h
> Auto-merging hw/Kconfig
> Automatic merge failed; fix conflicts and then commit the result.
>=20
> Can you rebase and resend, please?

Will resend. Thanks!

Stefan

--at6+YcpfzWZg/htY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAcByEACgkQnKSrs4Gr
c8ipigf9HT8aYsatdoo56M87Ma61+smimZnyv8w1BEGatslc1V+NysqCL3ncVkR0
xjguLDxYCEE+7SS3dGfDfqvx8W2VQicsAdQinDlNHy36wkLYf+WcQrZyPhsSxyEb
lfjdry/OxKFLaY+9b8Uo0DJPzUFpjq/LTZG8GLu1Ec5d7tVP1F3Pty2nU0ah5lJz
8CDaSbFtBwME+tqBE/pXF8VYHvF8FKe1lG2ryxveIsLX3849yzeHvTDxMooWMJJc
8juEwGjUHQ/zEpNYi2NYHNPiT8u4N8wufFqoip+9Y4mh2aBJu9KdZjTLgnXohKuq
ekwAyK8MJeWo6kB7D+JGgalsOdrcng==
=XYRk
-----END PGP SIGNATURE-----

--at6+YcpfzWZg/htY--


