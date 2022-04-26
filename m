Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8211650F701
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 11:08:41 +0200 (CEST)
Received: from localhost ([::1]:49564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njHBY-0005p3-Jg
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 05:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1njGyH-0003Kf-RH
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 04:54:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1njGyG-0000uU-AT
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 04:54:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650963295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uogJa8fy4awb5CTmiTBoA+UbVmXEAqojUMKgvCAMKPw=;
 b=UfVtGolgCRIBTaQisoZUqn1esfM658ZEm6PBOM7tMdYsoPMbMj9us8cX2vvOzoZ0B/liEA
 VV12ZUFIUF167gsF9dAURYREkmAZHYWPAyOcU4VZgcQ2vLdWjDL7gYHrzZnCfTZdadh5sE
 L2fdylceUtAURhgW+ya3jcZ2kNZTe3E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-Dkd-a2u3OZOgyCOsWxpjsw-1; Tue, 26 Apr 2022 04:54:53 -0400
X-MC-Unique: Dkd-a2u3OZOgyCOsWxpjsw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0F3186B8BD;
 Tue, 26 Apr 2022 08:54:03 +0000 (UTC)
Received: from localhost (unknown [10.39.195.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18EA3553398;
 Tue, 26 Apr 2022 08:53:43 +0000 (UTC)
Date: Tue, 26 Apr 2022 09:53:41 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Martin Kletzander <mkletzan@redhat.com>
Subject: Re: [PATCH 01/18] hw/audio: Remove -soundhw support
Message-ID: <YmezFYjXT7VRM69W@stefanha-x1.localdomain>
References: <cover.1650874791.git.mkletzan@redhat.com>
 <aaa9e17ef9f35cb34acae2538240c11b911d9f6c.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zJLGHY+WTpu6wxjY"
Content-Disposition: inline
In-Reply-To: <aaa9e17ef9f35cb34acae2538240c11b911d9f6c.1650874791.git.mkletzan@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Eduardo Habkost <eduardo@habkost.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Thomas Huth <huth@tuxfamily.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--zJLGHY+WTpu6wxjY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2022 at 10:21:44AM +0200, Martin Kletzander wrote:
> One thing I am not sure about is whether to keep the aliases of ac97 and
> es1370 in the qdev_alias_table.
>=20
> Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
> ---
>  docs/about/deprecated.rst                     |   9 -
>  docs/about/removed-features.rst               |  10 +
>  docs/qdev-device-use.txt                      |  21 +--
>  docs/replay.txt                               |   2 +-
>  hw/audio/ac97.c                               |   3 -
>  hw/audio/adlib.c                              |   2 -
>  hw/audio/cs4231a.c                            |   2 -
>  hw/audio/es1370.c                             |   3 -
>  hw/audio/gus.c                                |   2 -
>  hw/audio/intel-hda.c                          |  21 ---
>  hw/audio/meson.build                          |   1 -
>  hw/audio/pcspk.c                              |  11 --
>  hw/audio/sb16.c                               |   3 -
>  hw/audio/soundhw.c                            | 177 ------------------
>  include/hw/audio/soundhw.h                    |  15 --
>  qemu-options.hx                               |  27 ---
>  .../codeconverter/test_regexps.py             |   1 -
>  softmmu/qdev-monitor.c                        |   2 -
>  softmmu/vl.c                                  |   6 -
>  19 files changed, 19 insertions(+), 299 deletions(-)
>  delete mode 100644 hw/audio/soundhw.c
>  delete mode 100644 include/hw/audio/soundhw.h

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--zJLGHY+WTpu6wxjY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJnsxUACgkQnKSrs4Gr
c8jY0QgAo5fbiL930s2il805djf64EcvNYfCxUbmf1DdA0OH03GPk4NAw6TTubU7
JLoLnFu5OchAC9dH7SEc+CKtcQkBn4DjXXhwKurObgVnWN7L22Z9Cj13pfGi55aY
Dpeu0v/y0gwQwAIQZV+1BptOG4HyE0UC7TI+vPnhK5Du/hHJNksnSOgqiRL4HK4l
yHmupY9xqcKHnbtUy5M8akFIkMf+KrbO+6dL9C0+S3iFWK9rIoR/+PbccgQ8OTuH
SAeelczM2V4Xlp0LBJpqZ7GQAwP4rO+zNKip3sgvqLgV4NG+heJgP3ZH7MWjiz6S
m13h+o2FL31ydAOlYivsXDYw+2R7HQ==
=Q9bt
-----END PGP SIGNATURE-----

--zJLGHY+WTpu6wxjY--


