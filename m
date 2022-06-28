Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E971B55BF7F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:39:41 +0200 (CEST)
Received: from localhost ([::1]:48128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66l3-0002FD-1U
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o66SQ-0003eG-Lm
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 04:20:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o66SO-0003H0-7h
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 04:20:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656404423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4DGNsNIZlYMXCB2OJ7QJM2NBXolbb6tNbJUrHVXtzWI=;
 b=BLg5QX1Nht+mo7JEfpI35zncV8/JWtYLATa0meuMSGmSTj8uyGSjcxbJwhmox+WMbwXaAn
 VvUHyBP+Jq/dhgGvzoPHXo/q+iIIQA7PsUCn5U/JWxkWtDiGczuDmq4/PM+M4t7QwvUXAL
 UfvkMk++QVNB21C6xhpmtT1vHHF06XA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-e-N3DaZ6PPSocf1BAJGh4A-1; Tue, 28 Jun 2022 04:20:17 -0400
X-MC-Unique: e-N3DaZ6PPSocf1BAJGh4A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3E311C006AC;
 Tue, 28 Jun 2022 08:20:16 +0000 (UTC)
Received: from localhost (unknown [10.39.195.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36905492C3B;
 Tue, 28 Jun 2022 08:20:16 +0000 (UTC)
Date: Tue, 28 Jun 2022 08:56:51 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, hare@suse.de, Hanna Reitz <hreitz@redhat.com>,
 dmitry.fomichev@wdc.com, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, damien.lemoal@opensource.wdc.com,
 qemu-block@nongnu.org
Subject: Re: [RFC v3 2/5] qemu-io: add zoned block device operations.
Message-ID: <Yrq0QwRahF9wJh1S@stefanha-x1.localdomain>
References: <20220627001917.9417-1-faithilikerun@gmail.com>
 <20220627001917.9417-3-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jaWc2mMRgEsL0+2r"
Content-Disposition: inline
In-Reply-To: <20220627001917.9417-3-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--jaWc2mMRgEsL0+2r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2022 at 08:19:14AM +0800, Sam Li wrote:
> diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> index 2f0d8ac25a..3f2592b9f5 100644
> --- a/qemu-io-cmds.c
> +++ b/qemu-io-cmds.c
> @@ -1706,6 +1706,122 @@ static const cmdinfo_t flush_cmd =3D {
>      .oneline    =3D "flush all in-core file state to disk",
>  };
> =20
> +static int zone_report_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int ret;
> +    int64_t offset, len, nr_zones;
> +    int i =3D 0;
> +
> +    ++optind;
> +    offset =3D cvtnum(argv[optind]);
> +    ++optind;
> +    len =3D cvtnum(argv[optind]);
> +    ++optind;
> +    nr_zones =3D cvtnum(argv[optind]);
> +
> +    g_autofree BlockZoneDescriptor *zones =3D g_new(BlockZoneDescriptor,=
 nr_zones);
> +    ret =3D blk_zone_report(blk, offset, len, &nr_zones, zones);
> +    while (i < nr_zones) {

Does blk_zone_report() set nr_zones to 0 on failure or do we need to
check if (ret < 0) here?

> +        fprintf(stdout, "start: 0x%lx, len 0x%lx, cap 0x%lx, wptr 0x%lx,=
 "

The rest of the source file uses printf() instead of fprintf(stdout,
=2E..). That's usually preferred because it's shorter.

> +                        "zcond:%u, [type: %u]\n",

Please use PRIx64 instead of lx format specifiers for portability. On
32-bit hosts lx is 32-bit, not 64-bit. You can grep QEMU's code for
examples of PRIx64.

> +                zones[i].start, zones[i].length, zones[i].cap, zones[i].=
wp,
> +                zones[i].cond, zones[i].type);
> +        ++i;
> +    }

A for loop is more idiomatic:

  for (int i =3D 0; i < nr_zones; i++) {
      ...
  }

> +    return ret;
> +}
> +
> +static const cmdinfo_t zone_report_cmd =3D {
> +        .name =3D "zone_report",
> +        .altname =3D "f",
> +        .cfunc =3D zone_report_f,
> +        .argmin =3D 3,
> +        .argmax =3D 3,
> +        .args =3D "offset [offset..] len [len..] number [num..]",

The arguments are "offset len number". This command does not accept
optional offset/len/num arguments.

> +        .oneline =3D "report a number of zones",

Maybe "report zone information".

> +};
> +
> +static int zone_open_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int64_t offset, len;
> +    ++optind;
> +    offset =3D cvtnum(argv[optind]);
> +    ++optind;
> +    len =3D cvtnum(argv[optind]);
> +    return blk_zone_mgmt(blk, zone_open, offset, len);

Where is the error reported? When I look at read_f() I see:

    if (ret < 0) {
        printf("read failed: %s\n", strerror(-ret));

I think something similar is needed because qemu-io.c does not print an
error message for us. The same is true for the other commands defined in
this patch.

> +}
> +
> +static const cmdinfo_t zone_open_cmd =3D {
> +        .name =3D "zone_open",
> +        .altname =3D "f",
> +        .cfunc =3D zone_open_f,
> +        .argmin =3D 2,
> +        .argmax =3D 2,
> +        .args =3D "offset [offset..] len [len..]",

There are no optional offset/len args. The same is true for the other
commands below.

--jaWc2mMRgEsL0+2r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmK6tEMACgkQnKSrs4Gr
c8jjvAgAiC44gH7JOjD7Rm+22Q/zggEjpHstG+YWFNZXCuHM2hhUY9RlDyzfWbeq
IbWYbKCQMGEqmY5piUJav8NS5jHRzrc2sIuecgNRYovMM5djpe69kJnHa+W8WvMx
PUxC0fVTXUFHNYU+vSGrv3oxcFmud3PKuMkqKP7tzljfYnGR/SfWM1cEpCMamftq
m1jNdAQem0U/DNEOUwjrwug4A/++1tEpk4Qt48ywU6cF6vj35WItmqQ9VLnQcv8F
xxdAlkaQM1stcSKK6kobRCGYOEkuSCrrohfH8vnPdsV4eMFjyqI9sVtyJMzW61aR
BJ1SXtgUSmYSKc0Ml7wJHSjdOkPXwA==
=91Al
-----END PGP SIGNATURE-----

--jaWc2mMRgEsL0+2r--


