Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D035706AC
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 17:10:48 +0200 (CEST)
Received: from localhost ([::1]:44366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAv3f-0000Q1-Mk
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 11:10:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oAuzE-0000wv-GI
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 11:06:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oAuzB-000659-3b
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 11:06:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657551968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r4mKOg6zonFKECTdbUJ/l2SkVcXoDkNnJdPsKCAO4yA=;
 b=WEM9ajuQgqpPgBhRPYmFiyGWCj+M3j6lKJLXUV7zT3k8m+qpJZ9Q4MIi1EzWCbRgPhUzGS
 uxWd5rFkguB1DhJzrD9D4WFkE9x2GqgLMDX3czDOc+mNuAgu/5HJ4GUfSzUhKUiye6d1Uy
 l36TRyTEE6gAc9Q3Crq0Mg4o9e0wmXc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-sU-0z4ANNp23_Gw2C6EkIQ-1; Mon, 11 Jul 2022 11:06:03 -0400
X-MC-Unique: sU-0z4ANNp23_Gw2C6EkIQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B01D3802B8E;
 Mon, 11 Jul 2022 15:06:03 +0000 (UTC)
Received: from localhost (unknown [10.39.193.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 025FA492C3B;
 Mon, 11 Jul 2022 15:06:02 +0000 (UTC)
Date: Mon, 11 Jul 2022 16:05:59 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Chao Gao <chao.gao@intel.com>
Cc: fam@euphon.net, pbonzini@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] util/aio: Defer disabling poll mode as long as possible
Message-ID: <Ysw8VwARwNx0KACh@stefanha-x1.localdomain>
References: <20220710120849.63086-1-chao.gao@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BUO96VP1JplPMcH5"
Content-Disposition: inline
In-Reply-To: <20220710120849.63086-1-chao.gao@intel.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--BUO96VP1JplPMcH5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 10, 2022 at 08:08:49PM +0800, Chao Gao wrote:
> When we measure FIO read performance (cache=3Dwritethrough, bs=3D4k,
> iodepth=3D64) in VMs, ~80K/s notifications (e.g., EPT_MISCONFIG) are obse=
rved
> from guest to qemu.
>=20
> It turns out those frequent notificatons are caused by interference from
> worker threads. Worker threads queue bottom halves after completing IO
> requests.  Pending bottom halves may lead to either aio_compute_timeout()
> zeros timeout and pass it to try_poll_mode() or run_poll_handlers() retur=
ns
> no progress after noticing pending aio_notify() events. Both cause
> run_poll_handlers() to call poll_set_started(false) to disable poll mode.
> However, for both cases, as timeout is already zeroed, the event loop
> (i.e., aio_poll()) just processes bottom halves and then starts the next
> event loop iteration. So, disabling poll mode has no value but leads to
> unnecessary notifications from guest.
>=20
> To minimize unnecessary notifications from guest, defer disabling poll
> mode to when the event loop is about to be blocked.
>=20
> With this patch applied, FIO seq-read performance (bs=3D4k, iodepth=3D64,
> cache=3Dwritethrough) in VMs increases from 330K/s to 413K/s IOPS.
>=20
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> ---
>  util/aio-posix.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--BUO96VP1JplPMcH5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLMPFcACgkQnKSrs4Gr
c8jzgggAmgwlYfQg2ezhJnfBFQptE3OQ47AYdm4TmPE4cZLdxTkFMhYZeTnXE8A5
l6Kq+93eZsyRNHOcYkzijo1xPVoQeRCq6dZWO0fS7L5lq+KU1toMauh8ecGTZjsc
wuGR4o1XIZb3YjnODZD8V+bc4hSY2DCEWoAP1pZ+KlvF1Tpp4/+8Tr/bzZnDhSp2
vYjVwAr1du5WbL8BSo/6wtdoEKnzO/3SyKeOmPxffnGkxQPPMZpT2Awps69omflf
zSLbPC3Y4j0wu8Sy4zHcSQ22FT/h4hmSs6buthnl0BPlx9k5I7AnDBAjZwO8iQrj
LZrNHnSgCBDBpfZ641BVl9c4UIQC2g==
=hsaV
-----END PGP SIGNATURE-----

--BUO96VP1JplPMcH5--


