Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB245485EC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 17:11:09 +0200 (CEST)
Received: from localhost ([::1]:59404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0lie-0002EK-2a
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 11:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o0lha-0001Xj-Gv
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 11:10:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o0lhX-0004t2-CK
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 11:10:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655132998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3bw3jTbcBgA61y9HjbHykUMyH1KWjF9Cp2DUZa1ohFM=;
 b=Q2OMV/qTALqzmArlTZzP5+gFTbsVV0dzc95XO/oxHHemFzrWgnHtS3un1clBJzZs//EEUs
 zHbMOF6awBVZbr1MTJbQ+Tyxl2til9b8ZgcKopA3Zyu58usA5Jr8xlGTKPjF1JzYDWvbfq
 WiSzeOuIQkeXM7YP5dcL3TkmHAN41Lo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-Z1qDqsA8N26LmYUd8KhY8w-1; Mon, 13 Jun 2022 11:09:56 -0400
X-MC-Unique: Z1qDqsA8N26LmYUd8KhY8w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F3ED1857F06;
 Mon, 13 Jun 2022 15:09:56 +0000 (UTC)
Received: from localhost (unknown [10.39.192.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C700710725;
 Mon, 13 Jun 2022 15:09:55 +0000 (UTC)
Date: Mon, 13 Jun 2022 16:09:53 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Julia Suvorova <jusual@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Subject: Re: [PATCH] hw/mem/nvdimm: fix error message for 'unarmed' flag
Message-ID: <YqdTQYUhO/3dzJvZ@stefanha-x1.localdomain>
References: <20220531145147.61112-1-jusual@redhat.com>
 <YpY0/Pc3uoA9QQD/@stefanha-x1.localdomain>
 <CAMDeoFUxG7B67BCm4nb303VEwBdiD=JNi_OWSaxirThWnTd6LA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nTCBM3PM0yp4ot5W"
Content-Disposition: inline
In-Reply-To: <CAMDeoFUxG7B67BCm4nb303VEwBdiD=JNi_OWSaxirThWnTd6LA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--nTCBM3PM0yp4ot5W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 13, 2022 at 05:01:10PM +0200, Julia Suvorova wrote:
> On Tue, May 31, 2022 at 5:32 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> >
> > On Tue, May 31, 2022 at 04:51:47PM +0200, Julia Suvorova wrote:
> > > In the ACPI specification [1], the 'unarmed' bit is set when a device
> > > cannot accept a persistent write. This means that when a memdev is
> > > read-only, the 'unarmed' flag must be turned on. The logic is correct,
> > > just changing the error message.
> > >
> > > [1] ACPI NFIT NVDIMM Region Mapping Structure "NVDIMM State Flags" Bi=
t 3
> > >
> > > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > > ---
> > >  hw/mem/nvdimm.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> It seems like Xiao is not active, whose tree should this patch go to?

Michael or Igor can merge it:

  $ scripts/get_maintainer.pl -f hw/mem/nvdimm.c
  Xiao Guangrong <xiaoguangrong.eric@gmail.com> (maintainer:NVDIMM)
  "Michael S. Tsirkin" <mst@redhat.com> (supporter:ACPI/SMBIOS)
  Igor Mammedov <imammedo@redhat.com> (supporter:ACPI/SMBIOS)
  Ani Sinha <ani@anisinha.ca> (reviewer:ACPI/SMBIOS)
  qemu-devel@nongnu.org (open list:All patches CC here)

Stefan

--nTCBM3PM0yp4ot5W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKnU0EACgkQnKSrs4Gr
c8i/dgf6A96v7QfsVYRWt4cFITPa3EB0nPx2FlVEDhvv9LA0d/m+OF3F6D738wYJ
Zy9IyfkcoBRA5jRCISVEzTrH/Lxy3pmu/YHgt/B6hZk/8NZ7wshNYrzMATLBxV1D
qGyq4zzitXMkMNnav4h2O3rM9vYk3CnJVZ0bP0vRO3jtd7tWnZOoJE4cbXf0/FLj
rK2fUvhopoN7hGvUh5Xuqca5Xyku+f4jQk1qBC0zIWBe6ETojwJlikEDjNyIB9Rr
4gknYNCLmzJUVg/owtNVDquzDUOEVtXgoKvfFhshH0kJ+q6HqHYHYgQvX+rDTWwJ
DjuIN7a3aMN/V78a3zD5J39YklL49Q==
=E4il
-----END PGP SIGNATURE-----

--nTCBM3PM0yp4ot5W--


