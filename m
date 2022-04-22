Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEF950BB5E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 17:12:06 +0200 (CEST)
Received: from localhost ([::1]:53234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhux2-0001E4-Vt
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 11:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nhuv9-0000EO-54
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:10:11 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:46897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nhuv6-00016O-Es
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:10:05 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso5527643wml.5
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 08:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7m+qbMguvkGyeKT5Wt9tGF819c4U0evWqEHo5J19zow=;
 b=h+/Q0CDB5Sz/S5hCd1Iw1tPHUD9JuWL4nlHhDd8+6IYp84WAyvycixG14zVCuhYuMd
 3RI9Kt4GHY+voSesb3UaU9yaiqxrlCS4zFW/bnO8BFQYNGXqdsszEAnpQannb83ttf3T
 BoXH1o1oBM7Cmb+N6QygrANOnPsHrYk/31zwy+0uZ1UII6QDowaSR3I1HALMxZzCTmqa
 ehSr4Elm8t8ngcY6B9iKcpBcNnS1u9x3jnSjhgqiAR0PmCU1TaCd5CArOaRvvEMRR1fR
 N5Sr7KmNafxfqaIDnezXmhzdYb56ScYkI/XS6UC1T9WLvHVJTaIhfWoBgyfr6v8Ggtzv
 RI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7m+qbMguvkGyeKT5Wt9tGF819c4U0evWqEHo5J19zow=;
 b=1nlg+T1wCwJb/05w0bFoEkaTDmUB1zA/1RRpriF8zgk1x7spz0p2z69gBhMoXrO5WP
 RzCgruULi1782Bk/hCTP1engu2AQnVNpDkYWCluhrbvLcDqEqa8oV9LB4VFEewu6wnTK
 KcbKQND4aDEO5+M85CJjdj1moODss76K0jUnng9R4XBMy4Bfz9WEzXkdRn4PrjVBjTqr
 MKUnWaJFsdFxtrJCmSwy0F65sOs9CvzyDg+t1G9STNDcWdte062xRO0yj5bmyCUH1iF/
 wGVKu9dx7dsHOLLJE14awLagGUJ+yxTNdb2JmrMAMisUjSmE9943ZKyP4ac4UQ2Fkxjz
 DGMA==
X-Gm-Message-State: AOAM533U8QUuR10R4QjDTiwnDVGshEOfSvWEBoltGVsfn65eN6LrhEyD
 gn6+Vg9t2AlH4HQLRVZ1WF4=
X-Google-Smtp-Source: ABdhPJxqrG8NdJsA+yUbyuwKh5GPku7NDRMaPBxReqpv+PDgiXYX9sFnj6BwAQ521IfX1hfB8JyVkA==
X-Received: by 2002:a1c:f604:0:b0:38c:8ffd:dbb6 with SMTP id
 w4-20020a1cf604000000b0038c8ffddbb6mr13802911wmc.43.1650640202392; 
 Fri, 22 Apr 2022 08:10:02 -0700 (PDT)
Received: from localhost (109.9.90.146.dyn.plus.net. [146.90.9.109])
 by smtp.gmail.com with ESMTPSA id
 p1-20020adfaa01000000b0020ab1e305f1sm1951206wrd.22.2022.04.22.08.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 08:10:01 -0700 (PDT)
Date: Fri, 22 Apr 2022 16:10:00 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Sam Li <faithilikerun@gmail.com>
Subject: Re: [PATCH v4] Use io_uring_register_ring_fd() to skip fd operations
Message-ID: <YmLFSJwvToxgdlr7@stefanha-x1.localdomain>
References: <20220421163648.4205-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LcoL03a5/m3TpzL0"
Content-Disposition: inline
In-Reply-To: <20220421163648.4205-1-faithilikerun@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=stefanha@gmail.com; helo=mail-wm1-x333.google.com
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
Cc: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Fam Zheng <fam@euphon.net>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, qemu-devel <qemu-devel@nongnu.org>,
 Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--LcoL03a5/m3TpzL0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 22, 2022 at 12:36:49AM +0800, Sam Li wrote:
> Linux recently added a new io_uring(7) optimization API that QEMU
> doesn't take advantage of yet. The liburing library that QEMU uses
> has added a corresponding new API calling io_uring_register_ring_fd().
> When this API is called after creating the ring, the io_uring_submit()
> library function passes a flag to the io_uring_enter(2) syscall
> allowing it to skip the ring file descriptor fdget()/fdput()
> operations. This saves some CPU cycles.
>=20
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  block/io_uring.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/block/io_uring.c b/block/io_uring.c
> index 782afdb433..5247fb79e2 100644
> --- a/block/io_uring.c
> +++ b/block/io_uring.c
> @@ -435,8 +435,16 @@ LuringState *luring_init(Error **errp)
>      }
> =20
>      ioq_init(&s->io_q);
> -    return s;
> +    if (io_uring_register_ring_fd(&s->ring) < 0) {

What happens when QEMU is built against an older version of liburing
that lacks the io_uring_register_ring_fd() API?

I guess there will be a compiler error because the function prototype is
missing in <liburing.h>.

This can be addressed by checking for the presence of the function in
meson.build:

+config_host_data.set('CONFIG_LIBURING_REGISTER_RING_FD', cc.has_function('=
io_uring_register_ring_fd', prefix: '#include <liburing.h>'))

Then block/io_uring.c can call the function only when available:

+#ifdef CONFIG_LIBURING_REGISTER_RING_FD
+    io_uring_register_ring_fd(&s->ring);
+#endif

(I haven't tested this code but it should be close.)

Stefan

--LcoL03a5/m3TpzL0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJixUgACgkQnKSrs4Gr
c8hLBwf+LW7X8gL8R+UQ2faj0Ihw306sukAe4bn/IgvZvvR5jlFgMsm8yrXQW9xk
zn4N9efQy4IVqBh7oRFaXprQj3i2Cjx6gV5JnEmrWeTf2LyK7lzgbAWQ+TCKRBMx
T/5mumdaLGVfef5vHKjKHRvZTkLp+mbCZIyg1wb+15PbeyiWaGm2mLx/uVI0XFn5
F9TNnYmQ0BQcU4C18feACqAuCjUW5Uz/t/H3jxohknuUS4CxOSJoh0hONNQ/8FZS
zMuj4SLvkIvjasinpuSuw7pe3vX4horKMeEmPLDqqti/HeFjljW+oaaRezJgmuL2
lJkgWCj+c6y6V5lCDDqFNVEk7xFKIw==
=LwNO
-----END PGP SIGNATURE-----

--LcoL03a5/m3TpzL0--

