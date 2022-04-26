Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB4D50F707
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 11:16:30 +0200 (CEST)
Received: from localhost ([::1]:60262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njHJ7-0005Dl-A0
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 05:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1njGyh-0003kZ-DR
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 04:55:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1njGyf-0000xd-Eo
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 04:55:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650963321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4UMWZP+S1ig7zzcHOBBbKvy/5mzU8oAd8Skcp4UhlxU=;
 b=PfZHe3j6gEUZQ5tRv2I/cqAvc9cUC6gZmUdVaE6Kcili4ZxJ4VJa0Lt52x5lkVvUD84fTy
 DLDEl/S/BzXZseERUuNzNlpOdccPhHV8lC5uP7z0MQc/A2tAzsoGLezQq3d1JZns7RJK8d
 boKOYttDraVUiALiQGsW6jI4xTNOvAI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-BC7sMEHwMieLITKtRuO3Nw-1; Tue, 26 Apr 2022 04:55:17 -0400
X-MC-Unique: BC7sMEHwMieLITKtRuO3Nw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D18E586B8A3;
 Tue, 26 Apr 2022 08:54:51 +0000 (UTC)
Received: from localhost (unknown [10.39.195.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A822428EFD;
 Tue, 26 Apr 2022 08:54:39 +0000 (UTC)
Date: Tue, 26 Apr 2022 09:54:37 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Martin Kletzander <mkletzan@redhat.com>
Subject: Re: [PATCH 00/18] RFC: Remove deprecated audio features
Message-ID: <YmezTbozi9qjEzm1@stefanha-x1.localdomain>
References: <cover.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gqisuhwj0IRf8Qnd"
Content-Disposition: inline
In-Reply-To: <cover.1650874791.git.mkletzan@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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


--gqisuhwj0IRf8Qnd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2022 at 10:21:43AM +0200, Martin Kletzander wrote:
> I wanted to deal with https://bugzilla.redhat.com/2043498 and I got a
> suggesstion that removing deprecated features could actually make it
> easier to propagate the error.  In the end (last patch) it turns out the
> error is still just reported with error_fatal, so it probably is not
> really needed, but I really wanted to dig into QEMU more and learn some
> of the internals for quite some time now.  So I used the opportunity.
> The one-liner ended up being an 18 patch series which was, for someone
> who has just one commit in QEMU codebase, a pretty challenging task.
> Although I tried my best to do things properly, I am not sure whether I
> handled everything correctly, hence the RFC.
>=20
> Any comments are very much appreciated.  Thanks and have a nice day ;)

Hi Martin,
The -soundhw removal looks good to me. I'm not familiar with the audio
subsystem so I didn't review the rest.

Stefan

--gqisuhwj0IRf8Qnd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJns00ACgkQnKSrs4Gr
c8hlQAgAnSTgpon9DyHtiOjo7MjmkNCoDctEt60CsSNLCpwpPHvWMgoTkY4GPhnq
dnXmC+EWULqiwZYLg4TotKV12H9Zl51SvbGCpzcKwkLvfF1/9Vwm+Lshi/qhMjVE
iTn5OWa+MQaP0uwcS//j7/G31MZfp7dM9zk2soPrmkMszqu0Sz16u9L9m4eyfmSi
PnlPWMbVNVt0UpTJiZ5P3DlCoHkSRWsMmG2dcj58fhyZw3jR4Oi5XkxPaivZXXKp
9Oeo6K1UkPDgLVGirgm8U3zxsbv5oJ8q7yu1dvgZtlBF3MtkGgJbKNJFuqFLAs85
7yrrS3RabtZWkYVeif0z6vX5y7JbUg==
=TgWM
-----END PGP SIGNATURE-----

--gqisuhwj0IRf8Qnd--


