Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8402B09F1
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 17:28:03 +0100 (CET)
Received: from localhost ([::1]:51770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdFS6-0003nq-Q6
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 11:28:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kdFQW-0002vo-8W
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 11:26:24 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:51151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kdFQU-0001Cr-G6
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 11:26:23 -0500
Received: by mail-wm1-x343.google.com with SMTP id h2so5836406wmm.0
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 08:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GwozX+KGQQaYIovQxmm8uBUBQNt0BKdRN3Vv92TqLHI=;
 b=BngPhTJL0ELe1R1jh+H3YJHJ4/kf6l/7oNm86mYIk0ieK/8nRUVcFMEajJ6qWh2jDC
 25XYL7oaf/3w88hA7elbFX7Bney12z0qXSpDFdXKThYllqmWcxgHcTyOSmEwWMa39xpm
 HFSstkfLs7qZzjLJZw69z2/6rBjh0ujAVBleP5k5FCczRRjeANHNdWA7SjwsijihhIxS
 khx1xXeAJNUV2V8WIvEvBjED60lbMzMEhwBNV6zxOAcSZaiuW8A9Oz1FVhUd5A2Uf/FX
 tZIsH1eGQd3Rytx5DTOYDu5ZYG1ZWqrwpjPms8JoeQiDHt3M18GA+MbGTWcjv2yUHZ3P
 53zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GwozX+KGQQaYIovQxmm8uBUBQNt0BKdRN3Vv92TqLHI=;
 b=pnSfTKumfDqZ/qRLFVwEdbgba3ZoH3KxlgwlENzn5AQf4Q8byvLsFvDe8C1S8NmPdi
 zCzIW3YG0BZieuUbBStgo0RpFMwPM1z/zmMI5uyyxucHmEVwdXlqaUuTSUARek3P6pAD
 Uv/LmBawaKoDQ2Qg5bJup4JyFrm5Ot6Yremdjq7biKwgmb9rP7IluJELWn0+olrNztex
 GhC2SaYTFKMJjs2/6JlYBS8hLyMqaRcOO4HrYFbFdiOJ0BUzQoobY+f+fknQiWUwCdEz
 YqnxXh8Iz8R0UVo6JBoo5pkhgvNMhyKpIZPFoP6cUo8JOdDLZwuhjVqHP4DLuv/oVipP
 PbyQ==
X-Gm-Message-State: AOAM5320DAWWEthLsNRyziWNgXybYaW2EFnf3XPagDBYWcLq6DosSZts
 dKRLPMvoxUidzu9fyWsSzKQ=
X-Google-Smtp-Source: ABdhPJxqGpntiXq04TQ1PqOa0jhxiGKtjDyOAe1VSgzb86qJP2wXifdpTdZ8k6S+IthpBS3CRJkeaA==
X-Received: by 2002:a1c:2c43:: with SMTP id s64mr449506wms.130.1605198379987; 
 Thu, 12 Nov 2020 08:26:19 -0800 (PST)
Received: from localhost (85.9.90.146.dyn.plus.net. [146.90.9.85])
 by smtp.gmail.com with ESMTPSA id d8sm6737956wmb.11.2020.11.12.08.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 08:26:18 -0800 (PST)
Date: Thu, 12 Nov 2020 16:26:17 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Joelle van Dyne <j@getutm.app>
Subject: Re: [PATCH v5 0/7] iOS and Apple Silicon host support
Message-ID: <20201112162617.GB1553014@stefanha-x1.localdomain>
References: <20201108232425.1705-1-j@getutm.app>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OwLcNYc0lM97+oe1"
Content-Disposition: inline
In-Reply-To: <20201108232425.1705-1-j@getutm.app>
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=stefanha@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 08, 2020 at 03:24:17PM -0800, Joelle van Dyne wrote:
> Based-on: 20201106032921.600200-1-richard.henderson@linaro.org
> ([PATCH v3 00/41] Mirror map JIT memory for TCG)
>=20
> These set of changes brings QEMU TCG to iOS devices and future Apple Sili=
con
> devices. They were originally developed last year and have been working i=
n the
> UTM app. Recently, we ported the changes to master, re-wrote a lot of the=
 build
> script changes for meson, and broke up the patches into more distinct uni=
ts.
>=20
> A summary of the changes:
>=20
> * `CONFIG_IOS` defined when building for iOS and iOS specific changes (as=
 well
>   as unsupported code) are gated behind it.
> * A new dependency, libucontext is added since iOS does not have native u=
context
>   and broken support for sigaltstack. libucontext is available as a new o=
ption
>   for coroutine backend.
> * For (recent) jailbroken iOS devices as well as upcoming Apple Silicon d=
evices,
>   there are new rules for applications supporting JIT (with the proper
>   entitlement). These rules are implemented as well.
>=20
> Since v5:
>=20
> * Fixed some more instances of QAPI define of CONFIG_HOST_BLOCK_DEVICE
> * Fixed libucontext build on newer version of GCC

I have pinged Software Freedom Conservancy about an opinion regarding
merging the reverse-engineered part. Hope to get a reply soon. You are
on CC so you'll see it.

QEMU is currently in freeze (fixes only, no new features) for the
upcoming 5.2 release. The development tree will open again at the start
of December:
https://wiki.qemu.org/Planning/5.2

The code looks good to me. Thank you!

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--OwLcNYc0lM97+oe1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+tYikACgkQnKSrs4Gr
c8hIjwgAgh7lsdeT0Yhu+8Rnpfoc/KF3bkBlGFRhh9zDMXelJaSJDrbZ6jhV7zrD
hRqJlaSgdgm5Rt5v1fcVmyXXIM7v81Ni5POgiGWjzNSTR6kBOcQep7/PuwrAKyof
AqNmSI5gmcLARFzjZVPuwJ5DyzFbpiWajKiCZAwQ4SWmGzZvVCwH5FEMlp0s852D
qLMfcb+gP4Ooxfokn7NIfRsOARYTnuyA6enlXeIxsIsc2HGRREUYUY5ZNo1ixFyu
iqdJRU6lHmS6PrZWCjokQC/D2451WABsEaSsSHbtB3vLEilqeNRDEyTqYcpNZbub
rrmfQwdPAeiwQt0Oh4YU39EL4TwWwg==
=iQx4
-----END PGP SIGNATURE-----

--OwLcNYc0lM97+oe1--

