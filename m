Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A34CC4984E5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 17:33:32 +0100 (CET)
Received: from localhost ([::1]:41854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC2Hb-0007u0-8z
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 11:33:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nC2Ex-0006nL-8J
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 11:30:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nC2Ev-0000W4-AZ
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 11:30:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643041839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wt4QGFkjSOMvvJKAy8Ft6nHQ+7bq0qxLuzlE5g/o3Nk=;
 b=DT9TNCVa9QNjD15NN6Xv9JC2GbewpcGqFrtnGe2QW4xc7DjKaFaTIDSExrq3jwfpPdbULf
 v7yOzO2ikqow1rFvyAPi670p05J7NqlONXmG1TA6J7qe3tIRu116r47kgdnV/mRYNAfuFQ
 g1KcbPVhUOWRxap8RP5VGCo5puE53IM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-d5WGp4TlPc2hTyTHEmnXBw-1; Mon, 24 Jan 2022 11:30:36 -0500
X-MC-Unique: d5WGp4TlPc2hTyTHEmnXBw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9174F8144E7;
 Mon, 24 Jan 2022 16:30:34 +0000 (UTC)
Received: from localhost (unknown [10.39.195.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6DAD1091EE7;
 Mon, 24 Jan 2022 16:30:33 +0000 (UTC)
Date: Mon, 24 Jan 2022 16:30:32 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH v3 0/3] physmem: Have flaview API check bus
 permission from MemTxAttrs argument
Message-ID: <Ye7UKJTY0D2rbJN2@stefanha-x1.localdomain>
References: <20211215182421.418374-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Nmz19xCNcV2fnUt8"
Content-Disposition: inline
In-Reply-To: <20211215182421.418374-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Nmz19xCNcV2fnUt8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 07:24:18PM +0100, Philippe Mathieu-Daud=E9 wrote:
> This series aim to kill a recent class of bug, the infamous
> "DMA reentrancy" issues found by Alexander while fuzzing.

I took a look at how to protect DMA transactions in VIRTIO devices. It
will require setting the MemTxAttrs for address_space_ld/st_le/be_cached
calls. Errors on write (store) can be ignored. Errors on read (load) are
a bit more questionable since the device performs some operation based
on the loaded value, but at this point the driver has already caused the
device to do something no correct driver does (as of today, it could
change in the future...) so undefined device behavior might be okay.

It would be easier to be confident if there was a single place to
disable DMA re-entrancy for a device. The currently proposed API
requires per-device code audits and fixes. It leaves decisions to the
developer of each device. This will be a lot of work to fix and we
cannot be confident that everything has been covered since this is an
opt-in mechanism.

For these reasons it seems likely that DMA re-entrancy issues will
continue to creep in. I think the only way to rule out this class of
bugs is to implement a centralized change that doesn't involve fixing
every DMA access in QEMU.

Thoughts?

Stefan

--Nmz19xCNcV2fnUt8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHu1CcACgkQnKSrs4Gr
c8jh7wf+LtLSG78X0kcLGRf8PP230sjFKWxAV2rNDLHKBSldJRi9/xf1N8p29gUu
hJCtiHwqEx+BtbAkiAaw6Qfk3wmlmKzJKiRmbXSSeiptAjC32nl9V3aVyfRngPif
4cHHJLietYorRUvr+E8CK7rW3aa+pZWTGKEilYNQcFRxfw4a7GHwlnd2hx+I79Vm
VB7q8UenjpxgbSUE1R5qWiVrRTP1B0trz6SW6+Bj25o/1mbXwaliQfFPo7nbeRM6
a5GPhaK7z5xfS4uUAxJyZldyutFcNVCXrFP1Y/kYousS6Hos/C1TbU3q5J2lYH6B
d13zrrJdXEFe/GkkQs2aesUA5+4ERQ==
=rbCG
-----END PGP SIGNATURE-----

--Nmz19xCNcV2fnUt8--


