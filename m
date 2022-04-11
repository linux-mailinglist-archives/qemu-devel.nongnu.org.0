Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E654FBF60
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 16:40:48 +0200 (CEST)
Received: from localhost ([::1]:36408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndvDi-0002LI-V2
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 10:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ndvCX-0001cE-UH
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 10:39:33 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ndvCW-0005Nh-0m
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 10:39:33 -0400
Received: by mail-wr1-x42b.google.com with SMTP id e21so6849436wrc.8
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 07:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aCLxvTMdvejYjVDWTtp3BIcZ00EC4OBZxKsI743UAj8=;
 b=RexiDqsit6bZoISWw2Fjx8NmF97i5gi+aTjGh4I7rhmKq9F/mteMLZ4yLSxIQtFgDg
 69unea7g8t7ReuKqOyi9cWUrBYI9amEWiH+LUatvmNhbzeHLNYfwPplZc39LDBqboIlM
 i6z/BrRk1dWyRMlb+su9Pwk3wTIi89ZfAawcpfDiBv31Xs/KKkm5HdkzBiNbxEIG51SB
 Ce2uDvAX5aBBMvHj2odr5eAgqHwP35K/rvJRWxDKt5+JvbDJnMQ6WyrQW7rm7otdmmN0
 M5fxI7MbywQbSXNGWLJ/+upBXvh3e2O9PJ8pji8wH9RW4UGvi1ZyO6zTg8h0SdkQeGFF
 0RVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aCLxvTMdvejYjVDWTtp3BIcZ00EC4OBZxKsI743UAj8=;
 b=eCnN6q/KVfl/AJFLgpqLsGynNX2uxrp8GCUy2j9D3MlzTecLiktwaABDqlRk2l29Yp
 K8tc9Jg5pZeHZV11tZvWjOzUrlzjLzmVg9HdH1I1UDVitIdGqTaTX0v2xamidsJb/rqD
 ScysJMctPTommFs+cNkXVP0WQ/w6dYTo6TkvAWh8UlN95nvoXKnT4vMhbta8h092cKvQ
 ZBCfS5r2y8dWp2+iBYpg43EV71QDezLtvsCKzObggs1rv8YtrdfvJj1+TtHXL1VEeeDe
 mNSNya70DqFDPijFBp6/Dg2IO7YK0BFofS1a3CZcCm+0hCmVXdJgGmN1sWg7W7UmUH+2
 gaRg==
X-Gm-Message-State: AOAM5333uSaVt43HiGr98UNR1PtIn3hzn9SPUA12I1Rh4yRnuophnudt
 T9a6epgoIrWbGSOC6qzBRDg=
X-Google-Smtp-Source: ABdhPJwHE1A1VsmpsZQrWaJOunPg2OYP2jlhWM9ysXAinCcBpmtFB1C6GhUPIj8Z/ubSx9Ts/8LfFA==
X-Received: by 2002:a05:6000:1b91:b0:207:9869:1dfe with SMTP id
 r17-20020a0560001b9100b0020798691dfemr12473749wru.689.1649687969109; 
 Mon, 11 Apr 2022 07:39:29 -0700 (PDT)
Received: from localhost (109.9.90.146.dyn.plus.net. [146.90.9.109])
 by smtp.gmail.com with ESMTPSA id
 7-20020a05600c024700b0038ec0c4a2e7sm1358082wmj.11.2022.04.11.07.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 07:39:28 -0700 (PDT)
Date: Mon, 11 Apr 2022 15:39:26 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Sakshi Kaushik <sakshikaushik717@gmail.com>
Subject: Re: [PATCH] [PATCH RFC v4] Implements Backend Program conventions
 for vhost-user-scsi
Message-ID: <YlQ9nhcrJWzlx6bK@stefanha-x1.localdomain>
References: <20220406162410.8536-1-sakshikaushik717@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qnidJBATMhMJP59R"
Content-Disposition: inline
In-Reply-To: <20220406162410.8536-1-sakshikaushik717@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=stefanha@gmail.com; helo=mail-wr1-x42b.google.com
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


--qnidJBATMhMJP59R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 06, 2022 at 11:24:10AM -0500, Sakshi Kaushik wrote:
> Signed-off-by: Sakshi Kaushik <sakshikaushik717@gmail.com>
> ---
>  contrib/vhost-user-scsi/vhost-user-scsi.c | 78 +++++++++++++++--------
>  1 file changed, 52 insertions(+), 26 deletions(-)

Thanks, I have applied this patch to my block-next branch!

I made a few small adjustments when merging. You do not need to resend
the patch. Details below:

> diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-us=
er-scsi/vhost-user-scsi.c
> index 4f6e3e2a24..0c38c2988c 100644
> --- a/contrib/vhost-user-scsi/vhost-user-scsi.c
> +++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
> @@ -351,34 +351,58 @@ fail:
> =20
>  /** vhost-user-scsi **/
> =20
> +static int opt_fdnum =3D -1;
> +static char *opt_socket_path;
> +static gboolean opt_print_caps;
> +static char *iscsi_uri;
> +
> +static GOptionEntry entries[] =3D {
> +    { "print-capabilities", 'c', 0, G_OPTION_ARG_NONE, &opt_print_caps,
> +      "Print capabilities", NULL },
> +    { "fd", 'f', 0, G_OPTION_ARG_INT, &opt_fdnum,
> +      "Use inherited fd socket", "FDNUM" },
> +    { "iscsi_uri", 'i', 0, G_OPTION_ARG_FILENAME, &iscsi_uri,

For consistency with --print-capabilities and --socket-path this option
should be called --iscsi-uri.

> +      "Use inherited fd socket", "FDNUM" },
> +    { "socket-path", 's', 0, G_OPTION_ARG_FILENAME, &opt_socket_path,
> +      "Use UNIX socket path", "PATH" }

A zero terminator is required here so
g_option_context_add_main_entries() knows when the array ends.

> +};
> +
>  int main(int argc, char **argv)
>  {
>      VusDev *vdev_scsi =3D NULL;
> -    char *unix_fn =3D NULL;
> -    char *iscsi_uri =3D NULL;
> -    int lsock =3D -1, csock =3D -1, opt, err =3D EXIT_SUCCESS;
> -
> -    while ((opt =3D getopt(argc, argv, "u:i:")) !=3D -1) {
> -        switch (opt) {
> -        case 'h':
> -            goto help;
> -        case 'u':
> -            unix_fn =3D g_strdup(optarg);
> -            break;
> -        case 'i':
> -            iscsi_uri =3D g_strdup(optarg);
> -            break;
> -        default:
> -            goto help;
> -        }
> +    int lsock =3D -1, csock =3D -1, err =3D EXIT_SUCCESS;
> +
> +    GError *error =3D NULL;
> +    GOptionContext *context;
> +
> +    context =3D g_option_context_new(NULL);
> +    g_option_context_add_main_entries(context, entries, NULL);
> +    if (!g_option_context_parse(context, &argc, &argv, &error)) {
> +        g_printerr("Option parsing failed: %s\n", error->message);
> +        exit(EXIT_FAILURE);
>      }
> -    if (!unix_fn || !iscsi_uri) {
> +
> +    if (opt_print_caps) {
> +        g_print("{\n");
> +        g_print("  \"type\": \"scsi\"\n");
> +        g_print("}\n");
> +        goto out;
> +    }
> +
> +    if (!opt_socket_path || !iscsi_uri) {

This check rejects --fd and only allows --socket-path. We can drop
!opt_socket_path since the if statement below checks that already.

--qnidJBATMhMJP59R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJUPZ4ACgkQnKSrs4Gr
c8j9Mwf/Z0Z9s7RZxE7jFofHwB6vHpA5vDNZs9JqlPjcf7MAh/z4rAP5ugPKKEaU
VXWbKSDH/AAkGdKPXVU02S4Wn9Jl+x7ltgvOOGvg7qxhl90IKEoI89iXRQ36t2Rq
GQTL/6aJthqpxiJSPs7P21C8VUTThm8i/VolAm3tos8vc3/dIQQaQI5GgXPhjYFc
lhnpzR10HoaP5GEmSE6hCNLFgmUXiyeekiRXew2u8xKY+MFBHENKayv2WUpcAs2B
jWT9YtIKgqmt4VVvbwEVu44nKz7KK4zgqe5Kxqjd1ILrPSDBw8Txl0yOzBFNA7nW
XQCJOAs1SgXpaFE4IPRkR5EPjqmpAw==
=j5em
-----END PGP SIGNATURE-----

--qnidJBATMhMJP59R--

