Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB084533CF5
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 14:50:08 +0200 (CEST)
Received: from localhost ([::1]:38276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntqSR-0007mO-Ap
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 08:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ntqR5-0006xw-Ij
 for qemu-devel@nongnu.org; Wed, 25 May 2022 08:48:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ntqR2-0001KH-MC
 for qemu-devel@nongnu.org; Wed, 25 May 2022 08:48:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653482898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fd/T3WiHN2In1pIUZ0DCj2D/WJ4q1EaXb3OTQ9SVilc=;
 b=JeaEtcGeWLP4+4obWtNHykfoIoJJrvb5UaPGozv8kQTeB1M1yf3lJstnEqh88k2DQC8BU6
 te/Ssk5w4vXy0dVEasLWoQfFjRy4IoI6dcuAiGalSvGsLmEAOfjZFaE55vMBqc5LACts4h
 Hezg1BBm7KwU0E6lzckwtrnDS5NKFn8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-FolMqfukNHS07qQ9DfMHUg-1; Wed, 25 May 2022 08:48:15 -0400
X-MC-Unique: FolMqfukNHS07qQ9DfMHUg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB35B1C16B40;
 Wed, 25 May 2022 12:48:14 +0000 (UTC)
Received: from localhost (unknown [10.39.195.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D8311410DD5;
 Wed, 25 May 2022 12:48:14 +0000 (UTC)
Date: Wed, 25 May 2022 13:48:13 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: mst@redhat.com, jasowang@redhat.com, sgarzare@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, mlureau@redhat.com,
 jsnow@redhat.com, eblake@redhat.com, Coiby.Xu@gmail.com,
 hreitz@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 0/8] Support exporting BDSs via VDUSE
Message-ID: <Yo4ljbJKI9pfIQtf@stefanha-x1.localdomain>
References: <20220523084611.91-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qoHNYoif3fbDqTRK"
Content-Disposition: inline
In-Reply-To: <20220523084611.91-1-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


--qoHNYoif3fbDqTRK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 23, 2022 at 04:46:03PM +0800, Xie Yongji wrote:
> Hi all,
>=20
> Last few months ago, VDUSE (vDPA Device in Userspace) [1] has
> been merged into Linux kernel as a framework that make it
> possible to emulate a vDPA device in userspace. This series
> aimed at implementing a VDUSE block backend based on the
> qemu-storage-daemon infrastructure.
>=20
> To support that, we firstly introduce a VDUSE library as a
> subproject (like what libvhost-user does) to help implementing
> VDUSE backends in QEMU. Then a VDUSE block export is implemented
> based on this library. At last, we add resize and reconnect support
> to the VDUSE block export and VDUSE library.
>=20
> Now this series is based on Stefan's patch [2]. And since we don't
> support vdpa-blk in QEMU currently, the VM case is tested with my
> previous patchset [3].
>=20
> [1] https://www.kernel.org/doc/html/latest/userspace-api/vduse.html
> [2] https://lore.kernel.org/all/20220518130945.2657905-1-stefanha@redhat.=
com/
> [3] https://www.mail-archive.com/qemu-devel@nongnu.org/msg797569.html
>=20
> Please review, thanks!

I talked to Kevin about who should merge this. He will do a final
review and it can go through his tree.

I will drop it from my 'block' branch for now.

Stefan

--qoHNYoif3fbDqTRK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKOJY0ACgkQnKSrs4Gr
c8jDCggArSCsSiG/Bqej19VVjA8Sh+0i7qpDhnBZ9aLXfsJYXpZqxdiK3r1S68b1
ymKVrLDEEyfBK3il+1/ZfKLm6lfeCk4h1oB/OGsx6fyAh0OTxLNc/5bia7vPjWCJ
EGjpChP0122VjlZimDBDjcTd+KfqTJDIgqh0eX+8YYcJSitgE72WpaDKXUpUt9UT
/aRYPMITYCdP2pFiCl7ncFeq8mhSpD+5h/kBcELJXo0sHI5BecOKFyVw0HTThk9r
IExnYV6rdHOQgmuWl3swYxhBY59fHM/Myq1R/3A6L9bGnAa58JTwc8IzyC2fBHcW
ETIXjDKuk2c+ta17GTYSq3hjTSytaA==
=Xl+L
-----END PGP SIGNATURE-----

--qoHNYoif3fbDqTRK--


