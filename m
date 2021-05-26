Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C68D4392244
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:45:17 +0200 (CEST)
Received: from localhost ([::1]:47950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1L2-0003Gr-T7
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:45:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lm10x-0001id-8z
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:24:32 -0400
Received: from mout.web.de ([212.227.15.3]:42501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lm10r-0002Zl-Ib
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:24:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1622064259;
 bh=5aQpcAoWwa5f7z2vt2fD0SGP8JMWuTMh9vfW8HxqlX8=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=LPswAiK/++5t45WAuq3xwhg8Wqya/hU+skvzD9/R8R7Z1n+DUou0SUGpSVAOClLLj
 BaRGg9VPzL72FUAleblrtqNcNmID5jSTX9hxDMjHM+rZRFpKzPEtnxe8VGdfm4xg7V
 jgi7W1mGOUyhLhPI3TGUKQSp0XyYYB16H8ZRyEr8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.235]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MT8cQ-1ltCJ32Tna-00S3ab; Wed, 26
 May 2021 23:24:19 +0200
Date: Wed, 26 May 2021 23:24:18 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Leonardo Bras <leobras.c@gmail.com>
Subject: Re: [PATCH 1/1] yank: Unregister function when using TLS migration
Message-ID: <20210526232418.2213cdc1@gecko.fritz.box>
In-Reply-To: <20210526200540.1088333-1-leobras.c@gmail.com>
References: <20210526200540.1088333-1-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pcQrpBbx4o7bD4P+xOhFGTf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:K0Dkn9do94aVW65+a202LfBkTJw497rW41wMjyIB645ey7/RtzK
 KkntFBjhmnoQlf4uI7/okWyfX78ssL5f9Ywk6yfb9H0fu8y2orGKl1RacSmiCsBtFKZFXVG
 Cd9Ginca19WlQzanGR/cFg7BDzX2k2cwDWBN97SJ1SAFftrPiFZsQZUIjJy1fOwwN65MMtU
 r0234Ww1ofdjo3sl8SyMA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BltFfT/JiPc=:M64Ly3ytW+rIeTxSNHnJkP
 8Ap9iRDFTkV3OtyIPE91tQ7BKv9l72uPDXzYCzi2PjWsjkFz9PhYDLvnZeboB8i/peOgp04+u
 ofz8xpYhIbaAOG87CYDbwB+APy42F6Kzfb0ijuNvXq1TStNnZ/rzlYs9nVarYoyeOdVokCgfV
 VzW0l2eXim7UWAtLzaHMoXsmJk5wfFfw0YG3BfNP+XpGDZyVACeFBD5Jj7N5/tczfbGvjL4u7
 PvHVtbt2PdDY44TBqoXP9eQP3Fq+gu4eNJawtd883VcY7ukG06G8RrBiQYLVnrWmoH6D4NJeP
 BDxKyr7eXFtW4PIxKwB9cBfKTMEONPyLUrYuhzD65ukUf53vqkyIL+NWrU2IMWJxwgNz1cdGR
 zdfkxTW33GxTgtHxwdaHYb9aZuyk3sz/nqerilXWNW+Ck18mTU8kUC06/dq7StrOYbE+8YwTJ
 GShNQAbp8PX3xiPUj9cvebruuFBaK7S1umaybqnCW43RTChsdvKe0rirmC1Xmw/jbiosQi4j0
 xp3SaG/iP3fzGC6Msvq9ADl1OJcC5mv1U4HDmXT8EpvtJWjmq6uy4wygpDtIjECuGKxk/Ok+P
 6IPxgfV22ZBRjUpGXZ10Herku/f/Dv+mSQD6z5lZtKdftMKcZvDcbRBCJP52EC16hZ/efvCeY
 7iEUidPvBIJIFSpvejyIvKtGvmtrGccqds7isrKeEEcpEVM63y8cHFB0DzTkVPESvrSkqhdpF
 m5tI4BFlMTTMcutYTSHwxg3RvkPwEKIMHZbhhWkX4DSh+t7e424CaNbVIsgZjq/Feeiy99mLh
 ih7lkaV1LAMF6d7mgMv/h5KPs1TLrIiTqjQC8N5vG7aqLf1GQbNWpVHmdF6KdRE7o5GALifPF
 9XOREyjcPSnHztiTXiou0QCoikVTQ9CKHldFSZDm/E4RMTa4ZkS8pycjA2EpGPg2lK+4sNkfV
 kYDwFxEZw6WrSPcM6FXVs5dkn6v57sua3bqqWSTmqfyihjyjw0yVBtenUdmS/gEiD+nrkPai6
 z0jtChVXVkGVPOk+Nx+mceELSSM3wOCK12mEA+Uvxi9LGbzxda4x5uWwypMyGFcK+lbfHv5V+
 jL122ZglIz308dr3X91tQ0TTwqACQh2cbQX
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 peterx@redhat.com, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/pcQrpBbx4o7bD4P+xOhFGTf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 26 May 2021 17:05:40 -0300
Leonardo Bras <leobras.c@gmail.com> wrote:

> After yank feature was introduced, whenever migration is started using TL=
S,
> the following error happens in both source and destination hosts:
>=20
> (qemu) qemu-kvm: ../util/yank.c:107: yank_unregister_instance:
> Assertion `QLIST_EMPTY(&entry->yankfns)' failed.
>=20
> This happens because of a missing yank_unregister_function() when using
> qio-channel-tls.
>=20
> Fix this by also allowing TYPE_QIO_CHANNEL_TLS object type to perform
> yank_unregister_function() in channel_close() and multifd_load_cleanup().
>=20
> Fixes: 50186051f ("Introduce yank feature")
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1964326
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---
>  migration/multifd.c           | 5 +++--
>  migration/qemu-file-channel.c | 7 +++++++
>  2 files changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 0a4803cfcc..be8656f4c0 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -987,8 +987,9 @@ int multifd_load_cleanup(Error **errp)
>      for (i =3D 0; i < migrate_multifd_channels(); i++) {
>          MultiFDRecvParams *p =3D &multifd_recv_state->params[i];
> =20
> -        if (object_dynamic_cast(OBJECT(p->c), TYPE_QIO_CHANNEL_SOCKET)
> -            && OBJECT(p->c)->ref =3D=3D 1) {
> +        if ((object_dynamic_cast(OBJECT(p->c), TYPE_QIO_CHANNEL_SOCKET) =
||
> +            (object_dynamic_cast(OBJECT(p->c), TYPE_QIO_CHANNEL_TLS)))  =
&&
> +            OBJECT(p->c)->ref =3D=3D 1) {
>              yank_unregister_function(MIGRATION_YANK_INSTANCE,
>                                       migration_yank_iochannel,
>                                       QIO_CHANNEL(p->c));

The code here should be the same as in channel_close. So for the
tls-channel you have to unregister with QIO_CHANNEL(tioc->master) like
below.

Regards,
Lukas Straub

> diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
> index 876d05a540..4f79090f3f 100644
> --- a/migration/qemu-file-channel.c
> +++ b/migration/qemu-file-channel.c
> @@ -26,6 +26,7 @@
>  #include "qemu-file-channel.h"
>  #include "qemu-file.h"
>  #include "io/channel-socket.h"
> +#include "io/channel-tls.h"
>  #include "qemu/iov.h"
>  #include "qemu/yank.h"
>  #include "yank_functions.h"
> @@ -111,6 +112,12 @@ static int channel_close(void *opaque, Error **errp)
>          yank_unregister_function(MIGRATION_YANK_INSTANCE,
>                                   migration_yank_iochannel,
>                                   QIO_CHANNEL(ioc));
> +    } else if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS)
> +               && OBJECT(ioc)->ref =3D=3D 1) {
> +        QIOChannelTLS *tioc =3D opaque;
> +        yank_unregister_function(MIGRATION_YANK_INSTANCE,
> +                                 migration_yank_iochannel,
> +                                 QIO_CHANNEL(tioc->master));
>      }
>      object_unref(OBJECT(ioc));
>      return ret;



--=20


--Sig_/pcQrpBbx4o7bD4P+xOhFGTf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmCuvIIACgkQNasLKJxd
slii7Q/8C8+7L3BSB4TSbDxA16kDlWG3GWOEsNTsnd5wc3VA4sWt6Dddu5kXsZ4K
95SGbsde18gadSKrmAUq04de40GQupSjUsm0G0QBYFirA3kzNQ/iWthaX90H0jBc
4yajPpDahv1xznXiMmpJy/GeFMubtwI58cnrtr2/eajMiRDQPKIvUIH+4JdUBgCK
tFyMIqJRL57PF0qWUs+mz4pgJ7iDdzODRgUcfZisbz29DpvYrvmeDiOoshngMz25
LRZBEhXAbUsDUt4ywLJMsHWB5HGJJj5bujKe70L9u2R95tpz4MMAlMJSAkFnkehP
bmpWXMxczX2OKZK5s9sveiaogaiL8TrkWbjNSkVuRKaM4lmR6odEtlmfzhkBuXdR
Hx7hbzp3HCPEwAz8C1yr4h5TqdiEvk5oB1CQz4JpPr1iszIfO5XtwYx67UPJ9CSN
pSoZ/4s7wATjpW5Iw5mY6rDoeNU31IXI/nZ6Y/BWhx6JrKBnL4mK6d7R+b0QEoDG
3PWiq1bQ4mAPB2HoGxmC41J2yqsZtkAg+5tjW1IIscczRIBAgIpV8KmqBkqhulsR
2JNtjh5H86KxI9Sx3E4DSS3zte2Cc3SA8/RRFHn4fQC5R3e8dmDwtaJfuPP63JqL
0GvhNF24fxB+lBrwiltPF8Em9Tam+lKWZr2BhPpw7Mqk2pjKzUU=
=bxA8
-----END PGP SIGNATURE-----

--Sig_/pcQrpBbx4o7bD4P+xOhFGTf--

