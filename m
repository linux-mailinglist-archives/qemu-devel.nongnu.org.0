Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C011C3B2C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 15:25:22 +0200 (CEST)
Received: from localhost ([::1]:36688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVb61-0005Y2-Fl
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 09:25:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1jVb51-0004YI-BA; Mon, 04 May 2020 09:24:19 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1jVb50-00063G-4k; Mon, 04 May 2020 09:24:18 -0400
Received: by mail-wm1-x343.google.com with SMTP id k12so8392519wmj.3;
 Mon, 04 May 2020 06:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=P6mz5i5MjURQjd76DBHa/3fb9OF1Vg3Yy6baRWjyx7A=;
 b=auGg78cT5GOY6cmXD7x/7xTsPgANoyyUerjFaG7vgaBcg7veJftCjDSttF9OhEOucD
 7oBrmEREAgfGzKsbHB1ajkWYDPsO7bEV/HYGMC5oF3XWpANvvUWL9oMMBnSOZad0xugr
 9JrqcRJcEQ9yODHKbHwFnNnv/z06eFpnYX/8ycxqTvHB8UyW0Vx9iMlR3q/RspI1y7lU
 C+AxfUBfdkkowUnTmxVPHobbcT7Dq8/2XRcERyVLzTww+yTSEKi1Y77nclxce4R2tap5
 UNGMj5e3pMf4kj/3ndijoySX09o8ejRaui80VkaPCa97Jx7XSrrkGwowCA4Z+J1/Nu5j
 n5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P6mz5i5MjURQjd76DBHa/3fb9OF1Vg3Yy6baRWjyx7A=;
 b=jSTlv5fEAyztqffa+R11YUVFQZt4lvEw8/mw3dfLvpNuLBZhNfSv7w3OY53ey7ycUL
 eXenM2JSs+yfawbB7ZEnRhZAxsIWtCuywIUd34IL6toARaZmq3rFNrLwSp4VHLzmYch3
 jS0wgo87hbs9iP7dGOO7R6SvOIuHEbIjTQbCu64NDFeVdvFx0/FJ/bgV4cbUL6Wkack8
 lTRtUP9X+dy2is00x2dNyfYmlVLIxnGxEgNvnW9ribTINYbyU054zMnEVx0ORiPfW2K2
 bx5BBDs7PW01LC/4ygIdyIUNJOjqcGneBtJ0K2KrGb5/vBSECZDbObQsas9AXbkqrlxG
 HPnA==
X-Gm-Message-State: AGi0Pubdao5DvpbkBU6FL4fyI5x0aiCO7wgamdM02iIOINkIPyVilQh5
 +c1LFHg6elPTgfwUtlAxWfA=
X-Google-Smtp-Source: APiQypIAcV9PuN2gQUytBlAtuuqmyLRY6CYmKxlauENAICA9PS4UhuxyKVAkvfqRaG3xtTTz0bpmGQ==
X-Received: by 2002:a1c:4304:: with SMTP id q4mr15752880wma.152.1588598656261; 
 Mon, 04 May 2020 06:24:16 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id w12sm18609055wrk.56.2020.05.04.06.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 06:24:15 -0700 (PDT)
Date: Mon, 4 May 2020 14:24:14 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH] iotests/041: Fix NBD socket path
Message-ID: <20200504132414.GF354891@stefanha-x1.localdomain>
References: <20200424134626.78945-1-mreitz@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="z+pzSjdB7cqptWpS"
Content-Disposition: inline
In-Reply-To: <20200424134626.78945-1-mreitz@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=stefanha@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--z+pzSjdB7cqptWpS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2020 at 03:46:26PM +0200, Max Reitz wrote:
> We should put all UNIX socket files into the sock_dir, not test_dir.
>=20
> Reported-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tests/qemu-iotests/041 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Cool, thanks for fixing this!

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--z+pzSjdB7cqptWpS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl6wF34ACgkQnKSrs4Gr
c8iEBAf/b5I9xULCCdjKSHvIGDpCS6GcN2/GtrCo8KC81ECncNmXR1ywAG6wRKk9
EdGXbZyBwIqig4Ae3up6aTDtbFYyEhkDbIPkg9AmyTGybyBn++HLKhG8cC4bVThb
51E7ohCw9Z1tbnpoBdUnSJ7khV6ZfJnFIO6r1Kru/zAEV2A44+Pv9Cz59jwBp6vF
qQNZLQpJzSQHBhDYSrhtTw0xwe+axbS5pScIZv6BEKVC4J6Rne9ruBUk8nCiQ3/r
5UalI5UGoFYpps+7OEhqe+RrtUKyL44PwOgPWHRxUfHbrItgUB0pf9QWaLeAdlfb
HpFqJQ70zCpXpRChiWgxqfPlVX6yGw==
=ZKvG
-----END PGP SIGNATURE-----

--z+pzSjdB7cqptWpS--

