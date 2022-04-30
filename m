Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F8E515AB9
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 07:56:21 +0200 (CEST)
Received: from localhost ([::1]:60244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkg5c-0006vq-SP
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 01:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nkg2G-0005M6-FZ
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 01:52:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nkg2E-0000xm-Vi
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 01:52:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651297970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wjkJ/kxCNLYB0S3aH8vRHI++Ea31WV7i4BWRMhULLfU=;
 b=ccVOCO61QXmJevysv/alRskoF6cnWwvgAN1OdPHaGhhnTHFLPprxDhLqHLLfvMw497qkNy
 Jl/PDe/JLVYZeYg62tLXqvNFzneMUNaTPmDxsFTWzAacSkQZySg6SZ3kQA3Daqk3OdkgB0
 FTZtmIuqUm6WqwYPRWiCmAJUQnn9Vr0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-2cACCkrRMpmQIaHTLjKOmQ-1; Sat, 30 Apr 2022 01:52:47 -0400
X-MC-Unique: 2cACCkrRMpmQIaHTLjKOmQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23F8C1C0515E;
 Sat, 30 Apr 2022 05:52:47 +0000 (UTC)
Received: from localhost (unknown [10.39.192.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF4844010E3D;
 Sat, 30 Apr 2022 05:52:46 +0000 (UTC)
Date: Sat, 30 Apr 2022 06:52:45 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/6] virtio-scsi: don't waste CPU polling the event
 virtqueue
Message-ID: <YmzOrb/zE/UgljtS@stefanha-x1.localdomain>
References: <20220427143541.119567-1-stefanha@redhat.com>
 <20220427143541.119567-3-stefanha@redhat.com>
 <ca28d5bf-5bd6-e002-c420-ed9b98989555@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rIxB6wVgNqkKPNtI"
Content-Disposition: inline
In-Reply-To: <ca28d5bf-5bd6-e002-c420-ed9b98989555@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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
Cc: Nir Soffer <nsoffer@redhat.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--rIxB6wVgNqkKPNtI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 29, 2022 at 01:17:05AM +0200, Paolo Bonzini wrote:
> On 4/27/22 16:35, Stefan Hajnoczi wrote:
> > This is typical for rx virtqueues where the device uses buffers when
> > some event occurs (e.g. a packet is received, an error condition
> > happens, etc).
> >=20
> > Polling non-empty virtqueues wastes CPU cycles. We are not waiting for
> > new buffers to become available, we are waiting for an event to occur,
> > so it's a misuse of CPU resources to poll for buffers.
>=20
> Shouldn't polling wait for _used_ buffers, rather than available ones?
>=20
> I agree that it's generally useless to poll the event queue, but not beca=
use
> it doesn't empty the virtqueue.

This is device emulation code, not driver code. It's the device that
uses buffers and the driver that waits for used buffers. So the device
shouldn't poll for used buffers.

Stefan

--rIxB6wVgNqkKPNtI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJszq0ACgkQnKSrs4Gr
c8hq2gf8D5DyZ7xxOZ29FXR9czm/4XFbEGh5NMcCv7iNuXL7HUjcr9Qkhi1xU0UP
fJnr0Vc87NZoE4lqVLsS93oryoa3N0yb+0D1h/xiPvkH4u/lpjItTh+w4yhUPoKT
rY5ycM6c8w1O827jkz+oBpK1cocTMDxZuBwwAuMB8zpnAZK/Bd51rYBAMwIwOKIA
jAN0Y0N+pYE/YuCCtU3hx5rChz+9XcUx+UnGjnmuWnIVz82P8hddVblxyKk7hyd9
lhf/AzbRXSLRbqsmGrX7VG7z0Me6Z/10B7yZMnnSxQP1602a40xfQisrfIr4pv+z
ebsYqdOqti4GB5J5k0Jl0n7mMceqYg==
=yBtN
-----END PGP SIGNATURE-----

--rIxB6wVgNqkKPNtI--


