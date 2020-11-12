Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0E92B0C83
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:24:13 +0100 (CET)
Received: from localhost ([::1]:39972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdHGW-0005vy-Lu
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:24:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kdHFb-0005Hk-Jf
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:23:15 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:51875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kdHFY-0000ot-Br
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:23:15 -0500
Received: by mail-wm1-x330.google.com with SMTP id 19so6125284wmf.1
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 10:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=rXbnu0ptItiuclVhVSTHfuwTauGz/kLgRJwirJo7Le8=;
 b=FYUMfcfmOe24AC4E0/dYc83BX0K2P0tjGcebetTCjYVF5NJr77Z5cvhSfpDvv9QpYg
 Wsu+de/UlzWV1WEiPEqNE9HNyqYHdmfOfjamwkMjjCD+RGmhUzbzb0NQL8ziRnSjp0gx
 Hy+04wW84evXEHDkGRjvmjc1Pw1/4RfBz5liJmEi4/x5YBNT3bezttNL4InItQp0Jnrs
 WFaIla3Y6v55k7lJfY0ubdhJ3HjSYyChA/mPx7/j9299Gzed000t2Hwx5F9pHxBdLocE
 GMWrJtqCkVmmQcHoA6KF4t1m98hfmuxTNkLN+cJ2sun1y884CB0RGe4Yhe+Zp945eRx3
 X7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=rXbnu0ptItiuclVhVSTHfuwTauGz/kLgRJwirJo7Le8=;
 b=qBCoJjHPh7pYXpbTqahTV8ZLK9ro8KbPPoVxojqJdovYvK5raMJiCkn8wARpagDIT5
 VVHtD+6/U1bwsW4GnSyjZgor/FmNDcy3LetA8PNgSYYrp3Tvw6yxnUJAwrno/d8iE+6P
 SGMeNaEBVZjm2Rg/k009hnUfxq1Klmo3rySBf1nWratj5kMZz/2FjG6OVxhJiBOuZTBe
 OF6LLRqRXXLsFL6AhxrPZjP8FYgcTyO4sulSqz+tTBv6KxKCUgKgoyHFB4mq2H5k34v6
 Mb/ohreNVG490L6G99+BVXwEBxdXXEYAe2cWU0KWct9eBgLNmnu+CqvPwNhbPACtgBVG
 ubng==
X-Gm-Message-State: AOAM531sMM5XMYs7DphEfrd48j8bawyvR62Y+vZqH3vtTX59ich/V1YA
 WhsOORP0bOLmODsqNaKm98KjMw==
X-Google-Smtp-Source: ABdhPJx3b7rwNElmtwRLPfAlWzpZAkkUhpvrF08cgrBi5u2cZzfjjq+9sUcJ9tk/5lS8qCyFboT0KA==
X-Received: by 2002:a1c:490b:: with SMTP id w11mr892576wma.101.1605205390761; 
 Thu, 12 Nov 2020 10:23:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v2sm7847647wrm.96.2020.11.12.10.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 10:23:09 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EE01E1FF7E;
 Thu, 12 Nov 2020 18:23:08 +0000 (GMT)
References: <20201112144041.32278-1-peter.maydell@linaro.org>
 <20201112144041.32278-5-peter.maydell@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [for-5.2 4/9] docs/system/virtio-pmem.rst: Fix minor style issues
In-reply-to: <20201112144041.32278-5-peter.maydell@linaro.org>
Date: Thu, 12 Nov 2020 18:23:08 +0000
Message-ID: <87y2j65t9v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> The virtio-pmem documentation has some minor style issues we hadn't
> noticed since we weren't rendering it in our docs:
>
>  * Sphinx doesn't complain about overlong title-underlining the
>    way it complains about too-short underlining, but it looks odd;
>    make the underlines of the top level title the right length
>
>  * Indent of paragraphs makes them render as blockquotes;
>    remove the indent so they just render as normal text
>
>  * Leading 'o' isn't rst markup, so it just renders as a literal
>    "o"; reformat as a subsection heading instead
>
>  * "QEMU" in the document title and section headings are a bit
>    odd and unnecessary since this is the QEMU manual; delete
>    or rephrase them
>
>  * There's no need to specify what QEMU version the device first
>    appeared in.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/virtio-pmem.rst | 55 ++++++++++++++++++-------------------
>  1 file changed, 27 insertions(+), 28 deletions(-)
>
> diff --git a/docs/system/virtio-pmem.rst b/docs/system/virtio-pmem.rst
> index 4bf5d004432..e5f91eff1c2 100644
> --- a/docs/system/virtio-pmem.rst
> +++ b/docs/system/virtio-pmem.rst
> @@ -1,38 +1,37 @@
>=20=20
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -QEMU virtio pmem
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +virtio pmem
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20=20
> - This document explains the setup and usage of the virtio pmem device
> - which is available since QEMU v4.1.0.
> -
> - The virtio pmem device is a paravirtualized persistent memory device
> - on regular (i.e non-NVDIMM) storage.
> +This document explains the setup and usage of the virtio pmem device.
> +The virtio pmem device is a paravirtualized persistent memory device
> +on regular (i.e non-NVDIMM) storage.
>=20=20
>  Usecase
>  --------

nit: but we didn't fix this while we were at it?

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

