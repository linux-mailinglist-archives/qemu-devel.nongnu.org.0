Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56295538FF2
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 13:38:04 +0200 (CEST)
Received: from localhost ([::1]:50002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw0CJ-00026q-3h
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 07:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nw06T-00063W-Pk
 for qemu-devel@nongnu.org; Tue, 31 May 2022 07:32:01 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nw06R-0004kI-Vw
 for qemu-devel@nongnu.org; Tue, 31 May 2022 07:32:01 -0400
Received: by mail-wr1-x42c.google.com with SMTP id e25so7636794wra.11
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 04:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OEdqZXs2+aCYN+Vi0lkieD3yB4spAUYOqyF6OCLT2eY=;
 b=TIj35Z+8+8+wMi7QEPX7irEk4Wj9xKNysntxPKSlBSCymU3sIYD3zg6eNFlOYUB8cC
 hLGAgP93+1LBb6Fd6ZKP5uozRJ53pR/f+JJCgko6/ERCZBPAOuyMDC/ts548ksEcC5jD
 ipkiAiHrG2r65gmqGfpWFa4yzMff6nQyHWTlj12jI9kW8T2lD+xdsBTAFVg3CgQXUnZh
 oD/Ko5dUYTc8tRkkBVJvmvmiHScDchuwAXpOfi6gj4yGejNAgf+b4dLQZuiQNWEHzRKR
 izCXpBYwrThcXgz2EYiQWLLtkZPNGapKThTZJBDSfHRVbGj5KZV/7is7mNmH7yvKIyNR
 3g/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OEdqZXs2+aCYN+Vi0lkieD3yB4spAUYOqyF6OCLT2eY=;
 b=pAzDV8meECQC6Uy7/WQPrOjGdpQUWvPO1EvJQE1GWpy2oRfj1jB6kLvrSuuI6Bmzwt
 fZN1bh7+z1jGqlPVIo2Y5uR0soqvJjp2+/PSc22lZ6PodpiKaQiHTfaZKtFM009xFVRp
 6jy5NxsbEOdcG5iRBdmyLowwsfS2XSSGuom3pVb58WEk2cTphX9hQBCz56yC2ULgzB9l
 YWX8OMMBnQi+vr7IueORHnXK39SHmC5AEUUxbg+HOl38AhcqjycQjAWmRalfwKSJz6c4
 RD6qfMMZZXPCmV2BJttGqg6S1DqXxQr+qvBpq4IP67oI/jl7fRV73YGppmx4bqpUS2zE
 10sw==
X-Gm-Message-State: AOAM533xHX7ezcDutGPG5OVoTWysAHRyVhmiKXFHq70uDI5nG+DXwK59
 rJ07x34jX0TahizBtawk1PI=
X-Google-Smtp-Source: ABdhPJy6VfGJzzX0dUeTwTeJGoD8+pUzqWrFoYUotee/uB1xZLLgW8LzplCiTP+ruU3Xc1OVlXzPIg==
X-Received: by 2002:a5d:5942:0:b0:210:131c:a81 with SMTP id
 e2-20020a5d5942000000b00210131c0a81mr18652702wri.306.1653996717855; 
 Tue, 31 May 2022 04:31:57 -0700 (PDT)
Received: from localhost (109.9.90.146.dyn.plus.net. [146.90.9.109])
 by smtp.gmail.com with ESMTPSA id
 m129-20020a1ca387000000b003948f4e750fsm1870599wme.23.2022.05.31.04.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 04:31:56 -0700 (PDT)
Date: Tue, 31 May 2022 12:31:55 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v6] Use io_uring_register_ring_fd() to skip fd operations
Message-ID: <YpX8q9XrnTehFu7N@stefanha-x1.localdomain>
References: <20220531105011.111082-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nSygUC1ixIQlGCY4"
Content-Disposition: inline
In-Reply-To: <20220531105011.111082-1-faithilikerun@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=stefanha@gmail.com; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--nSygUC1ixIQlGCY4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2022 at 06:50:11PM +0800, Sam Li wrote:
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
>  block/io_uring.c | 12 +++++++++++-
>  meson.build      |  1 +
>  2 files changed, 12 insertions(+), 1 deletion(-)

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--nSygUC1ixIQlGCY4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKV/KsACgkQnKSrs4Gr
c8gaOgf/RZPTaJ0q3b+7phkuwD/qMpbTnToy2fOet1Qn+/YdKcfABLjVBst2qpXC
qW4LL3mKPrbpHFJw0oErZpBSb50NpVbdMIH161/aFbOOPfv7ta9UqVVjaPQc6kVR
BX4kWC7CAIDXb0dkFzTorIoDeuMgjluC54Eqq85b8eZYw3ptlNjLe6yyMOYa2+6C
SD5XziW0Yaxv9naIxSFZrqZU8uGBJeRuUZkjKGZ6y0gejaRH1j/bstMISUXxUgwq
FNWXfYDDMWPdp0apXsIyO1ofjMBYbK/U2RX42+JLly4H6dhgBz2mmI4emr2UUPX0
dnKfFh+xsCLGimaN7xYY5I0VYo6MHQ==
=TC1w
-----END PGP SIGNATURE-----

--nSygUC1ixIQlGCY4--

