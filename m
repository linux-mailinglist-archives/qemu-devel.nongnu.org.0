Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D31A5F4A57
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 22:34:11 +0200 (CEST)
Received: from localhost ([::1]:60220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofocE-0004zQ-Ky
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 16:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ofo6s-0004B3-OF
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 16:01:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ofo6p-0006Bq-Dy
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 16:01:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664913702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UVkEcN+THOGeCIU9GIZeI244r6u+rJl548o2Y8eRGig=;
 b=dyL66DZMeeitFUrhUwwemwBIgskcWFlAbNno6nFuEA/0dAD5aw0qSOOmePy20lH96SeBoz
 yy1TcUPMh1JzvizYnfmO1yYpSVANounGf1+/ukLeAJBrxG2+4Zb00T2XgmSi/T10SGfkAX
 pu4i3jAUW51pZKhL+UMFi8UfT8pzQzs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-T41N84LDMRutg_LFS48FJg-1; Tue, 04 Oct 2022 16:01:38 -0400
X-MC-Unique: T41N84LDMRutg_LFS48FJg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F48B299E77C;
 Tue,  4 Oct 2022 20:01:38 +0000 (UTC)
Received: from localhost (unknown [10.39.192.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E01BF492B04;
 Tue,  4 Oct 2022 20:01:37 +0000 (UTC)
Date: Tue, 4 Oct 2022 14:26:12 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, kwolf@redhat.com,
 hreitz@redhat.com, mst@redhat.com, den@virtuozzo.com
Subject: Re: [RFC patch 0/1] block: vhost-blk backend
Message-ID: <Yzx6xDCnpIQ0yOi5@fedora>
References: <20220725205527.313973-1-andrey.zhadchenko@virtuozzo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mmKcEpN0NRwt67nO"
Content-Disposition: inline
In-Reply-To: <20220725205527.313973-1-andrey.zhadchenko@virtuozzo.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


--mmKcEpN0NRwt67nO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2022 at 11:55:26PM +0300, Andrey Zhadchenko wrote:
> Although QEMU virtio-blk is quite fast, there is still some room for
> improvements. Disk latency can be reduced if we handle virito-blk requests
> in host kernel so we avoid a lot of syscalls and context switches.
>=20
> The biggest disadvantage of this vhost-blk flavor is raw format.
> Luckily Kirill Thai proposed device mapper driver for QCOW2 format to att=
ach
> files as block devices: https://www.spinics.net/lists/kernel/msg4292965.h=
tml
>=20
> Also by using kernel modules we can bypass iothread limitation and finaly=
 scale
> block requests with cpus for high-performance devices. This is planned to=
 be
> implemented in next version.
>=20
> Linux kernel module part:
> https://lore.kernel.org/kvm/20220725202753.298725-1-andrey.zhadchenko@vir=
tuozzo.com/
>=20
> test setups and results:
> fio --direct=3D1 --rw=3Drandread  --bs=3D4k  --ioengine=3Dlibaio --iodept=
h=3D128

> QEMU drive options: cache=3Dnone
> filesystem: xfs

Please post the full QEMU command-line so it's clear exactly what this
is benchmarking.

A preallocated raw image file is a good baseline with:

  --object iothread,id=3Diothread0 \
  --blockdev file,filename=3Dtest.img,cache.direct=3Don,aio=3Dnative,node-n=
ame=3Ddrive0 \
  --device virtio-blk-pci,drive=3Ddrive0,iothread=3Diothread0

(BTW QEMU's default vq size is 256 descriptors and the number of vqs is
the number of vCPUs.)

>=20
> SSD:
>                | randread, IOPS  | randwrite, IOPS |
> Host           |      95.8k	 |	85.3k	   |
> QEMU virtio    |      57.5k	 |	79.4k	   |
> QEMU vhost-blk |      95.6k	 |	84.3k	   |
>=20
> RAMDISK (vq =3D=3D vcpu):

With fio numjobs=3Dvcpu here?

>                  | randread, IOPS | randwrite, IOPS |
> virtio, 1vcpu    |	123k	  |	 129k       |
> virtio, 2vcpu    |	253k (??) |	 250k (??)  |

QEMU's aio=3Dthreads (default) gets around the single IOThread. It beats
aio=3Dnative for this reason in some cases. Were you using aio=3Dnative or
aio=3Dthreads?

> virtio, 4vcpu    |	158k	  |	 154k       |
> vhost-blk, 1vcpu |	110k	  |	 113k       |
> vhost-blk, 2vcpu |	247k	  |	 252k       |

--mmKcEpN0NRwt67nO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM8esQACgkQnKSrs4Gr
c8hfpggAntru5hwBpykIA5WymbD0YFHUxyFLFtLgzfuevzqYuONCLSDE1U38d6l3
HZTdupwJikzxMYoSvzlsQO7XEMRERVmn/1CMMeOuyIGiDPDNctpIUamEld+54wRm
tbib08W91g1SuxSjEsafLkr0hIfhhf4M0wh3usvZQh3FNOZJ3DRBKhd+DMfdw22/
POSyJ3VuUOxF0NSjfUvyHy4fPAMZqY2SSbt9E2Rttwd7bCAW1UKJ1l96shG86h7a
L/mnZNxRCQeKqloE40wJMG9Rd+Lfm1L8VRdTuu5+grZQg90K/Fi5VdkmJr83PTtW
qpxWr0ebgOGpJJ7QcOxd2KSSXo/CEQ==
=mM1O
-----END PGP SIGNATURE-----

--mmKcEpN0NRwt67nO--


