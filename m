Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 965BD55177A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 13:33:05 +0200 (CEST)
Received: from localhost ([::1]:44376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3FeS-0002oM-5C
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 07:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o3FaX-0000er-VN
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 07:29:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o3FaV-0005HP-1e
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 07:29:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655724537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qHVF4FisVUZQHRY7iFZ281+nRBrywW1NdPEPtvm4mZs=;
 b=M7o94apf2dWjo/UKQM+4fv76K802yFMvl84csigzI82sd7gnQVcOxjJfxwvrd5b6Fw3nZA
 /JPSTRCmqWP/Qe8f9GcFXYUSzLOOV8xxgi4311gi8MoNNBNLyzkpUF5JTfCb12QXGA6M+D
 LNO3HNonbKvvxflYRV1C6Hs4104Qm5w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-HuG6AFfHMCasWrKhcRpTSQ-1; Mon, 20 Jun 2022 07:28:54 -0400
X-MC-Unique: HuG6AFfHMCasWrKhcRpTSQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03D89811E7A;
 Mon, 20 Jun 2022 11:28:54 +0000 (UTC)
Received: from localhost (unknown [10.39.193.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B0D5492C3B;
 Mon, 20 Jun 2022 11:28:53 +0000 (UTC)
Date: Mon, 20 Jun 2022 12:28:52 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org,
 dmitry.fomichev@wdc.com, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, hare@suse.de
Subject: Re: [RFC v2] Adding block layer APIs resembling Linux
 ZoneBlockDevice ioctls.
Message-ID: <YrBZ9JPABRLlEA5d@stefanha-x1.localdomain>
References: <20220620033611.82166-1-faithilikerun@gmail.com>
 <YrAn2f4ORFziZ8vk@stefanha-x1.localdomain>
 <61cbccee-c865-1765-bf62-b74da130d62f@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6/IdY7giwqYvFqDK"
Content-Disposition: inline
In-Reply-To: <61cbccee-c865-1765-bf62-b74da130d62f@opensource.wdc.com>
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


--6/IdY7giwqYvFqDK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2022 at 07:11:40PM +0900, Damien Le Moal wrote:
> On 6/20/22 16:55, Stefan Hajnoczi wrote:
> > On Mon, Jun 20, 2022 at 11:36:11AM +0800, Sam Li wrote:
> >> +    uint32_t nr_zones;
> >=20
> > Should this really be limited to 32-bit? For example, take 256 MB zones,
> > then the max nr_zones * 256 MB is much smaller than a uint64_t capacity
> > value. It seems safer to make this 64-bit, but maybe Dmitry, Hannes, or
> > Damien can tell us what to do here.
>=20
> u32 is fine. We are nowhere near 4G zones :)
> The max out there today is 20TB SMR drive with 128MB zones. About 150,000
> zones. Nowhere near 4G limit. Linux kernel also uses unsigned int for
> number of zones everywhere.

Thanks!

Stefan

--6/IdY7giwqYvFqDK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKwWfQACgkQnKSrs4Gr
c8jbVAf/YA3Krt2Juv7xMKL98/mT8HASDHLnNpDQwCrkbea4GS2JyYVQ1P0rJicE
vIB/86NH7CZlbjrDUFjOxWiIUoxOEW1BPBy/kUeAWKuwT5Le2ka6Xc6an15b1yIB
s0xxu8cIuIhn4RxfXsXabszM3HrTVG0BIh0dZSy3IEsMvicUdBZkVfpQ9El3pMq4
u4cdEcBqgdHKf2hlACniYSGcDzem1XorrjcqbwBnLBC3Plgn/qKcMrWJqLBXJIqv
XF0CvByZcteqk15hWjyh9xWkymId8qUD2P6F4IqQ+0j5WqpZiQ6dw4tB/8izf5ix
6Fe1aULdTPY1LFoR3lEwUBM3v4iO5w==
=ec8A
-----END PGP SIGNATURE-----

--6/IdY7giwqYvFqDK--


