Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CBE5F4A35
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 22:17:19 +0200 (CEST)
Received: from localhost ([::1]:43128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofoLt-00051V-Q0
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 16:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ofo6r-0004B2-St
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 16:01:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ofo6o-00068L-7n
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 16:01:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664913699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2fo73h3AwQsMc+EkPLrp4vxatJszk50vU8sLiifowgY=;
 b=BljQ9sgPW4Vwm7TB3y64TnOiC9C0mdnCb+ObwCQfC1Y+28VYmzB2KoRpAgwAtri8avPmwi
 6WGZBGAih8n4QP7X3bUpJUltugXPwn3yaOCXdpSPnzjnOJGfC90t/uqzMHY8GatXNTOYlF
 ycuq1y08Cze9UnRNK43dDZJZ30iFyYY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-282-grH5W0I7OHOm2dpV10ZCQg-1; Tue, 04 Oct 2022 16:01:36 -0400
X-MC-Unique: grH5W0I7OHOm2dpV10ZCQg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EC023C6EAA1;
 Tue,  4 Oct 2022 20:01:36 +0000 (UTC)
Received: from localhost (unknown [10.39.192.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7417B2166B26;
 Tue,  4 Oct 2022 20:01:35 +0000 (UTC)
Date: Tue, 4 Oct 2022 14:13:52 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, kwolf@redhat.com,
 hreitz@redhat.com, mst@redhat.com, den@virtuozzo.com
Subject: Re: [RFC patch 0/1] block: vhost-blk backend
Message-ID: <Yzx34Nu4h+3eMDne@fedora>
References: <20220725205527.313973-1-andrey.zhadchenko@virtuozzo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sCIr0AXttG/ZprTh"
Content-Disposition: inline
In-Reply-To: <20220725205527.313973-1-andrey.zhadchenko@virtuozzo.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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


--sCIr0AXttG/ZprTh
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

Hi Andrey,
Do you have a new version of this patch series that uses multiple
threads?

I have been playing with vq-IOThread mapping in QEMU and would like to
benchmark vhost-blk vs QEMU virtio-blk mq IOThreads:
https://gitlab.com/stefanha/qemu/-/tree/virtio-blk-mq-iothread-prototype

Thanks,
Stefan

--sCIr0AXttG/ZprTh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM8d+AACgkQnKSrs4Gr
c8gjEQgApuJzj3L7UofyFcA9yAxImpkhWHI46iuzmE4d81hreWHmxTQ/vh143xUc
9Vu6XonmoD9KVfDE0dWIoAmMsyHl00hDU1MHvu/jr/9Umv2v6JkEjBT7ETOol7dR
HLCAZY9dtuptJEbqMb0t2pYDBFQnDXqGh0gKKnvMBdzuuBQCd62ZN0PEp86ohvZc
QHOrQTo0dPbqa/gxhdwSEuFxFvXPhh1IV1oqRKu+He7N4Zi76f3EQZejJ/VFVYk+
hTby8AjGVyUdv1HB51+xPLdlIf70XK/PoVbJFHLIqb0GKfm3+0oHxUbdcC3gwn+h
m/pWlUDGrgU042aHX5sWrpQI22NQmg==
=GiBY
-----END PGP SIGNATURE-----

--sCIr0AXttG/ZprTh--


