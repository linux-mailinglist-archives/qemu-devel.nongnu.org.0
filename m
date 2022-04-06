Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8A84F6318
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 17:26:49 +0200 (CEST)
Received: from localhost ([::1]:41672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc7YW-0007ay-5P
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 11:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nc7XJ-0006cz-F2
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 11:25:33 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nc7XH-0000F0-IA
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 11:25:33 -0400
Received: by mail-wr1-x431.google.com with SMTP id q19so3770600wrc.6
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 08:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tXSpShZ+LmV1orCRlRdMPMn8qSY9ARq9fq1q/WXJzmU=;
 b=JmJLz1daU7XCGRfvRDTMSgXrAtNZgbLmLUcUEzAcbqCeKwwJLFvBFJ4GYxq8gsv+60
 JuBYbHT6RrZHl/l5Ky40cZyXzKanNBa/dVbXsnJ0w6ESECDXaTa1WuEtGCuBEhuoDt67
 SSINkNNYxLsjNE+j6xe0ZAR9nNL0ybXv9zis3lbI5SARwvmuxvROCjq9iHjcLYA+SBpA
 N9SGitpmrOwahJQQ13Mob0TQVCe8ZimIwtlRN75tEUclXy8Qg5swcvba5BYGDTlRF5Iw
 qIjf7rI2X6qsks5Qb6VRruOGsxN37mqHpfSBDn7oc/7kbF5euz/29wq5COjiKfl76pVy
 OMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tXSpShZ+LmV1orCRlRdMPMn8qSY9ARq9fq1q/WXJzmU=;
 b=B5PXo0eN/P7DoiDsONJO20T8dArV5YjF+CpsZCgyde0nVV/1btpGbY6YIbSx5zpGlr
 uFtUhqviTwObPUijRdezPCzWzL25M+is6VXnilDMge8rSVOhYcjcN9po3aMc9gfoyi0T
 aPJ2+TGvAi9M9gmz05WBeFgj/9cXbZbMtiCnHbdmnaNvtYS0N+CEVY7hNIjVLu0oPLrg
 6h8Mowc6kUg9B+vYjKgfdC1c5LSmp8vi8Z4UkgP65C3JOXcfPPNpDFwkQGQDSc3X0+4R
 7eN1Sz3fCsVPc9jVJXtBI8EENyu0X/ejnTYH5Ax9mFKvQPQS7C0+7fpzA32tsIpLzBTC
 UhaQ==
X-Gm-Message-State: AOAM530Ei/8FyDAv6afRLkZnWIo+Q7HYGJ2ToFg62F+MYsQwiDLbcS69
 7L9xyF8JZgaX2MvGNBqlKVk=
X-Google-Smtp-Source: ABdhPJxC27bsPSewPb1TTS5a4zzroZ9HfbAaI6ozkbm4Kh2W6pW7DBHOgPHa1NNuzEMCAbKwKyjUyQ==
X-Received: by 2002:a05:6000:1d8b:b0:203:df82:ff8d with SMTP id
 bk11-20020a0560001d8b00b00203df82ff8dmr7026704wrb.623.1649258729420; 
 Wed, 06 Apr 2022 08:25:29 -0700 (PDT)
Received: from localhost (109.9.90.146.dyn.plus.net. [146.90.9.109])
 by smtp.gmail.com with ESMTPSA id
 r12-20020adfdc8c000000b002060878f735sm11449496wrj.65.2022.04.06.08.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 08:25:28 -0700 (PDT)
Date: Wed, 6 Apr 2022 16:25:27 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Sakshi Kaushik <sakshikaushik717@gmail.com>
Subject: Re: [PATCH] [PATCH RFC v3] Implements Backend Program conventions
 for vhost-user-scsi
Message-ID: <Yk2w5xWeqZ0i1wq1@stefanha-x1.localdomain>
References: <20220405122238.1666-1-sakshikaushik717@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mLkFtj7viqWHmCqi"
Content-Disposition: inline
In-Reply-To: <20220405122238.1666-1-sakshikaushik717@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=stefanha@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: raphel.norwitz@nutanix.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--mLkFtj7viqWHmCqi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 05, 2022 at 07:22:38AM -0500, Sakshi Kaushik wrote:

Thanks for the patch! Comments below:

> Signed-off-by: Sakshi Kaushik <sakshikaushik717@gmail.com>
> ---
>  contrib/vhost-user-scsi/vhost-user-scsi.c | 76 +++++++++++++++--------
>  1 file changed, 51 insertions(+), 25 deletions(-)
>=20
> diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-us=
er-scsi/vhost-user-scsi.c
> index 4f6e3e2a24..74ec44d190 100644
> --- a/contrib/vhost-user-scsi/vhost-user-scsi.c
> +++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
> @@ -351,34 +351,58 @@ fail:
> =20
>  /** vhost-user-scsi **/
> =20
> +int opt_fdnum =3D -1;
> +char *opt_socket_path;
> +gboolean opt_print_caps;
> +char *iscsi_uri;

These variables can be declared static since they don't need to be
externally visible (they aren't used by any other .c files).

> +    if (opt_print_caps) {
> +        g_print("{\n");
> +        g_print("  \"type\": \"scsi\",\n");

The JSON grammar (https://www.json.org/json-en.html) does not allow
trailing commas in objects. Please remove the comma on this line.

(Some parses may accept the trailing comma but others may reject the
input as invalid JSON.)

> @@ -426,10 +450,12 @@ err:
>      goto out;
> =20
>  help:
> -    fprintf(stderr, "Usage: %s [ -u unix_sock_path -i iscsi_uri ] | [ -h=
 ]\n",
> +    fprintf(stderr, "Usage: %s [ -s socket-path -i iscsi_uri -f fd -p pr=
int-capabilities ] | [ -h ]\n",
>              argv[0]);
> -    fprintf(stderr, "          -u path to unix socket\n");
> +    fprintf(stderr, "          -s path to unix socket\n");
>      fprintf(stderr, "          -i iscsi uri for lun 0\n");
> +    fprintf(stderr, "          -f fd, file-descriptor\n");
> +    fprintf(stderr, "          -p denotes print-capabilities\n");
>      fprintf(stderr, "          -h print help and quit\n");

The vhost-user backend conventions only document the long options
("--socket-path", "--fd", "--print-capabilities"). It's okay to offer
short options too but please show the long options in the help output
since it's the standard interface and that will make it clear that this
program supports the vhost-user backend program conventions.

Something like:

  -s, --socket-path=3DSOCKET_PATH     path to unix socket

--mLkFtj7viqWHmCqi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJNsOcACgkQnKSrs4Gr
c8gt4Qf/UkMfQS4YNcQeOH6NB11fddPnJ5PsN4fh1y5VEKVxrOgMym1VTXGmKHdT
k7ceVMElghtLloRL6hg9JFmgBW21I+NDaMq+jvjADNtz/YGLPFHGBy+2CIJqa5mN
OLGfwA2JCAeHhuXWyf8180JLLo+tQMla+fHBBs190fR2TM5PCir5l0v7YEjJev4q
XwyviXHeP1qhne8o7uVw2ZqHfvbaZ8PBbdR+lOO6D0EvAXoJW7dMcrAjTWqYV5Ju
hgcB7dHZxH0bx1TGi5p0CkDtkiTcLjhtdUSpklou05FhcNjkFc++h9G/SyLtNwLK
lm7QGJhmAtZAtFwJG9OtJGkfWnIYOw==
=59xu
-----END PGP SIGNATURE-----

--mLkFtj7viqWHmCqi--

