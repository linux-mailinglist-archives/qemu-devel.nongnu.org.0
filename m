Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1581A5F5762
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 17:25:29 +0200 (CEST)
Received: from localhost ([::1]:43238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og6H1-0001vU-OJ
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 11:25:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1og6Aj-00050w-0V
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 11:19:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1og6Ae-0005E3-Nl
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 11:18:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664983130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zfihwp7hCMsYuKH3Ifw6o/3trUXDtaB1YA1yCz7d5/M=;
 b=H4YVVRs0wlGglIkqwUic4ZyKtSVGfysTsz1nQBV9+r0b8QEhbrqVIcjFhjiDwg9T3319bs
 YlKCXhvy1mJHetolIvd2v8Mr0XMBl0ShyPobWnH8iqWKHyG932zm9uwpc3rKyHE4nVqAxc
 wjxj8ut8C7uMLDJhoIzMg9BcsMomyEc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-N-Jcp0ZFPdGSPqKPphLdlA-1; Wed, 05 Oct 2022 11:18:45 -0400
X-MC-Unique: N-Jcp0ZFPdGSPqKPphLdlA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61A5A1C0A12A;
 Wed,  5 Oct 2022 15:18:35 +0000 (UTC)
Received: from localhost (unknown [10.39.193.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E9F34099B5D;
 Wed,  5 Oct 2022 15:18:24 +0000 (UTC)
Date: Wed, 5 Oct 2022 11:18:22 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, kwolf@redhat.com,
 hreitz@redhat.com, mst@redhat.com, den@virtuozzo.com
Subject: Re: [RFC patch 0/1] block: vhost-blk backend
Message-ID: <Yz2gPirx1LRDwLxG@fedora>
References: <20220725205527.313973-1-andrey.zhadchenko@virtuozzo.com>
 <Yzx34Nu4h+3eMDne@fedora>
 <d8d660c2-9539-8afd-cbaf-683e8e25a61f@virtuozzo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4sXZQH9aJZCGqosi"
Content-Disposition: inline
In-Reply-To: <d8d660c2-9539-8afd-cbaf-683e8e25a61f@virtuozzo.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


--4sXZQH9aJZCGqosi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 05, 2022 at 12:14:18PM +0300, Andrey Zhadchenko wrote:
> On 10/4/22 21:13, Stefan Hajnoczi wrote:
> > On Mon, Jul 25, 2022 at 11:55:26PM +0300, Andrey Zhadchenko wrote:
> > > Although QEMU virtio-blk is quite fast, there is still some room for
> > > improvements. Disk latency can be reduced if we handle virito-blk req=
uests
> > > in host kernel so we avoid a lot of syscalls and context switches.
> > >=20
> > > The biggest disadvantage of this vhost-blk flavor is raw format.
> > > Luckily Kirill Thai proposed device mapper driver for QCOW2 format to=
 attach
> > > files as block devices: https://www.spinics.net/lists/kernel/msg42929=
65.html
> > >=20
> > > Also by using kernel modules we can bypass iothread limitation and fi=
naly scale
> > > block requests with cpus for high-performance devices. This is planne=
d to be
> > > implemented in next version.
> >=20
> > Hi Andrey,
> > Do you have a new version of this patch series that uses multiple
> > threads?
> >=20
> > I have been playing with vq-IOThread mapping in QEMU and would like to
> > benchmark vhost-blk vs QEMU virtio-blk mq IOThreads:
> > https://gitlab.com/stefanha/qemu/-/tree/virtio-blk-mq-iothread-prototype
> >=20
> > Thanks,
> > Stefan
>=20
> Hi Stefan
> For now my multi-threaded version is only available for Red Hat 9 5.14.0
> kernel. If you really want you can grab it from here:
> https://lists.openvz.org/pipermail/devel/2022-September/079951.html (kern=
el)
> For QEMU part all you need is adding to vhost_blk_start something like:
>=20
> #define VHOST_SET_NWORKERS _IOW(VHOST_VIRTIO, 0x1F, int)
> ioctl(s->vhostfd, VHOST_SET_NWORKERS, &nworkers);
>=20
> Or you can wait a bit. I should be able to send second versions by the end
> of the week (Monday in worst case).

Thanks, I will wait for the next revision.

Stefan

--4sXZQH9aJZCGqosi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM9oD4ACgkQnKSrs4Gr
c8iE9ggAvi7C7wIAX5fbKuO+AhREMD4Umj1YhsDnY26g3xAKiaHPx1dQaciKjzZ1
Uq0S4udhvDJIBP6LgYQgaG5Sd2m1KQIgagsz2zKBifFwgUVM3h1oCNSSnkKGpu1A
taMBuNkYc/MpRRXZEZvuMzlEy0gmym3BCdusmdJdg4HKvMgTUZVZUKNoVXh+mymP
QDOYmj5QL9KPj1mSgPZ/7jOX5Fe8ToSOxm0cJiQ9/nf8p3EipiLLPAlqsxaQai8U
2rC9cl+32QI7xKi0hXo1EOJAYNxZQO36yOel5lu7TdsHOn3oHcDZmQqTq4slUT+N
xVEb+N1K6nAFRfkC/1hMPefHNk23fg==
=w8+O
-----END PGP SIGNATURE-----

--4sXZQH9aJZCGqosi--


