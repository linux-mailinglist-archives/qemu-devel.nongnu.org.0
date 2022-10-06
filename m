Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ADD5F6918
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 16:08:36 +0200 (CEST)
Received: from localhost ([::1]:33892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogRYB-0007ee-Fh
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 10:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogRPu-00020O-24
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 10:00:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogRPp-0001MV-Ql
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 10:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665064790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wvAFTm8FdW2/6pnC/amNx72dguHCE6Nha3ZiXPtT6Ek=;
 b=MrhzHiXDzq1j5PQl78qj5LBRrTyRzh3fFmYGC18OGLWAD6o1mrQKo1jkqf9kuh5xzO47Qh
 ZcgE5gJKsBzwd1p7kRQlSgfoPTXVD8s2wTYg9Z/n5vOLtJ2HU86m13dzH6ZS4Zv0hGIaLQ
 RYU1s+aUWPRjGFm/2XjlA99FfY1K37E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-pkRHXZp8OU-oqy8cOmgpJQ-1; Thu, 06 Oct 2022 09:59:44 -0400
X-MC-Unique: pkRHXZp8OU-oqy8cOmgpJQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0075855307;
 Thu,  6 Oct 2022 13:59:43 +0000 (UTC)
Received: from localhost (unknown [10.39.193.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C1523111E412;
 Thu,  6 Oct 2022 13:59:42 +0000 (UTC)
Date: Thu, 6 Oct 2022 09:59:40 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Denis V. Lunev" <den@virtuozzo.com>
Cc: Ming Lei <tom.leiming@gmail.com>, io-uring@vger.kernel.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kirill Tkhai <kirill.tkhai@openvz.org>,
 Manuel Bentele <development@manuel-bentele.de>,
 qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 rjones@redhat.com, Xie Yongji <xieyongji@bytedance.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Josef Bacik <josef@toxicpanda.com>
Subject: Re: ublk-qcow2: ublk-qcow2 is available
Message-ID: <Yz7fTANAxAQ8KT4v@fedora>
References: <Yza1u1KfKa7ycQm0@T590> <Yzs9xQlVuW41TuNC@fedora>
 <6659a0d5-60ab-9ac7-d25d-b4ff1940c6ab@virtuozzo.com>
 <Yz2epPwoufj0mug/@fedora> <Yz6tR24T8HPHJ70D@T590>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="15fzNgcvZDw6D8kW"
Content-Disposition: inline
In-Reply-To: <Yz6tR24T8HPHJ70D@T590>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--15fzNgcvZDw6D8kW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 06, 2022 at 06:26:15PM +0800, Ming Lei wrote:
> On Wed, Oct 05, 2022 at 11:11:32AM -0400, Stefan Hajnoczi wrote:
> > On Tue, Oct 04, 2022 at 01:57:50AM +0200, Denis V. Lunev wrote:
> > > On 10/3/22 21:53, Stefan Hajnoczi wrote:
> > > > On Fri, Sep 30, 2022 at 05:24:11PM +0800, Ming Lei wrote:
> > > > > ublk-qcow2 is available now.
> > > > Cool, thanks for sharing!
> > > yep
> > >=20
> > > > > So far it provides basic read/write function, and compression and=
 snapshot
> > > > > aren't supported yet. The target/backend implementation is comple=
tely
> > > > > based on io_uring, and share the same io_uring with ublk IO comma=
nd
> > > > > handler, just like what ublk-loop does.
> > > > >=20
> > > > > Follows the main motivations of ublk-qcow2:
> > > > >=20
> > > > > - building one complicated target from scratch helps libublksrv A=
PIs/functions
> > > > >    become mature/stable more quickly, since qcow2 is complicated =
and needs more
> > > > >    requirement from libublksrv compared with other simple ones(lo=
op, null)
> > > > >=20
> > > > > - there are several attempts of implementing qcow2 driver in kern=
el, such as
> > > > >    ``qloop`` [2], ``dm-qcow2`` [3] and ``in kernel qcow2(ro)`` [4=
], so ublk-qcow2
> > > > >    might useful be for covering requirement in this field
> > > There is one important thing to keep in mind about all partly-userspa=
ce
> > > implementations though:
> > > * any single allocation happened in the context of the
> > > =A0=A0 userspace daemon through try_to_free_pages() in
> > > =A0=A0 kernel has a possibility to trigger the operation,
> > > =A0=A0 which will require userspace daemon action, which
> > > =A0=A0 is inside the kernel now.
> > > * the probability of this is higher in the overcommitted
> > > =A0=A0 environment
> > >=20
> > > This was the main motivation of us in favor for the in-kernel
> > > implementation.
> >=20
> > CCed Josef Bacik because the Linux NBD driver has dealt with memory
> > reclaim hangs in the past.
> >=20
> > Josef: Any thoughts on userspace block drivers (whether NBD or ublk) and
> > how to avoid hangs in memory reclaim?
>=20
> If I remember correctly, there isn't new report after the last NBD(TCMU) =
deadlock
> in memory reclaim was addressed by 8d19f1c8e193 ("prctl: PR_{G,S}ET_IO_FL=
USHER
> to support controlling memory reclaim").

Denis: I'm trying to understand the problem you described. Is this
correct:

Due to memory pressure, the kernel reclaims pages and submits a write to
a ublk block device. The userspace process attempts to allocate memory
in order to service the write request, but it gets stuck because there
is no memory available. As a result reclaim gets stuck, the system is
unable to free more memory and therefore it hangs?

Stefan

--15fzNgcvZDw6D8kW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM+30wACgkQnKSrs4Gr
c8iHRQf8CLjA5KPwDOjXvWn297/VU+slSiJzehP2Idpif/5l1xCQuasQWziB8flE
skkANbVPQn8Y+Z/cwWykCx3XjZSoVDM+SO4VG1TMS1ZcPU+ODHzPdA1/yZwArg1J
/6A8HxGpVAQYajnOmAMEBueuSUX30cN32YGh/uNykOU4q0Td8YzXS2ybbRGQfnit
lkU4QvFm6foeKArFelx+8AP3xiQXIHulVtG4Yn72gnAIzZDgJlrsau3x05idY/+L
acGUSyXP2PUnsZqFncWviWOfpa1LnyXDp1/bk4t/XRdrzSCReyOtcEwk/0ahFceh
3AWMJdbDcA+5dP62qT3XyL6dCgaugQ==
=bI8b
-----END PGP SIGNATURE-----

--15fzNgcvZDw6D8kW--


