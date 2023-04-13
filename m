Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 551FD6E1371
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 19:25:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn0gW-0004lM-Vx; Thu, 13 Apr 2023 13:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pn0gV-0004lD-QD
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 13:24:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pn0gS-0002J6-07
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 13:24:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681406669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/sgd7+4F5uZZwNXsUXpCVaSv3IWT2fHxs8vp8yv0lgQ=;
 b=VDRMzyX0RVklsGrGq0Jh2QDHyUZ1Cm0NMMjve3OdM+puxAQIHFsKvSUUfuepkVC5xe3btS
 iRKX7vv56G5UEx5Ry3m9VwkuafV2qmbXwz0C1926CaVTh524PpVJqp2sVu5e7jnNLgCEVf
 kw+b1Ob/j8uuR8vQSZBvH0QDXQvOAM4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-r34hBMT8PkawpmIWlI_ulQ-1; Thu, 13 Apr 2023 13:24:27 -0400
X-MC-Unique: r34hBMT8PkawpmIWlI_ulQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8506A3C0F1A9;
 Thu, 13 Apr 2023 17:24:27 +0000 (UTC)
Received: from localhost (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE8082027043;
 Thu, 13 Apr 2023 17:24:26 +0000 (UTC)
Date: Thu, 13 Apr 2023 13:24:25 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH for-7.2 v3 3/3] rtl8139: honor large send MSS value
Message-ID: <20230413172425.GB2864043@fedora>
References: <20221117165554.1773409-1-stefanha@redhat.com>
 <20221117165554.1773409-4-stefanha@redhat.com>
 <CAFEAcA_hkABS_ydCOiDxvZh71s916o0y2Gm5rht-FPDjzVbpLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gD0AwCJOFiUYA5aZ"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_hkABS_ydCOiDxvZh71s916o0y2Gm5rht-FPDjzVbpLA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--gD0AwCJOFiUYA5aZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2023 at 04:38:52PM +0100, Peter Maydell wrote:
> On Thu, 17 Nov 2022 at 16:58, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > The Large-Send Task Offload Tx Descriptor (9.2.1 Transmit) has a
> > Large-Send MSS value where the driver specifies the MSS. See the
> > datasheet here:
> > http://realtek.info/pdf/rtl8139cp.pdf
> >
> > The code ignores this value and uses a hardcoded MSS of 1500 bytes
> > instead. When the MTU is less than 1500 bytes the hardcoded value
> > results in IP fragmentation and poor performance.
> >
> > Use the Large-Send MSS value to correctly size Large-Send packets.
> >
> > Jason Wang <jasowang@redhat.com> noticed that the Large-Send MSS value
> > mask was incorrect so it is adjusted to match the datasheet and Linux
> > 8139cp driver.
>=20
> Hi Stefan -- in v2 of this patch
>=20
> https://lore.kernel.org/qemu-devel/20221116154122.1705399-1-stefanha@redh=
at.com/
>=20
> there was a check for "is the specified large_send_mss value
> too small?":
>=20
> +                /* MSS too small? */
> +                if (tcp_hlen + hlen >=3D large_send_mss) {
> +                    goto skip_offload;
> +                }
>=20
> but it isn't present in this final version of the patch which
> went into git. Was that deliberately dropped?
>=20
> I ask because the fuzzers have discovered that if you feed this
> device a descriptor where the large_send_mss value is 0, then
> we will now do a division by zero and crash:
> https://gitlab.com/qemu-project/qemu/-/issues/1582
>=20
> (The datasheet, naturally, says nothing at all about what
> happens if the descriptor contains a bogus MSS value.)

Yes, I dropped that deliberately and forgot to add a large_send_mss =3D=3D 0
check. Sorry!

I have sent a patch:
https://patchew.org/QEMU/20230413171946.2865726-1-stefanha@redhat.com/

Thanks,
Stefan

--gD0AwCJOFiUYA5aZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQ4OskACgkQnKSrs4Gr
c8g+WAgAvLdJ18h4WndqxRN5gwPGjohFDhA/3ItZO1Z4IHHVkATZ4+gTFntdqAp/
ff78OV7FWvIolXtnW5yj6Vf4RaRA+JCoFLP1ssIXdoiEh3XhXGCNNxQP9fLIsEjB
KxsxwKEiu6JQct2g571/73/ybjWQ1WoyoOnKHG8pkaSmnDqOGTAlF3rQnlJrXR83
oK6nD78qOr0fca1My6XtpWmkuNs2sws8u2aqib8XaibNUWYvDUosCz+G7G4ehaAq
4ZJyeO6LEQRr+Kdz2aE2/5tz5ucymHf1vttjfhBS64ScR2fr2Zcp7jRX3F34yhVA
qXOkADOoDmUKnS19m5JFpSkWEzKNaA==
=zo2F
-----END PGP SIGNATURE-----

--gD0AwCJOFiUYA5aZ--


