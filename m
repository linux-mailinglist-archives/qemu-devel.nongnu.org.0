Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3854C36B424
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 15:32:43 +0200 (CEST)
Received: from localhost ([::1]:36252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb1Lu-00056O-AA
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 09:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lb1KD-000406-La; Mon, 26 Apr 2021 09:30:57 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:39705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lb1KB-0001Ob-RH; Mon, 26 Apr 2021 09:30:57 -0400
Received: by mail-ej1-x630.google.com with SMTP id zl7so4767359ejb.6;
 Mon, 26 Apr 2021 06:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FIscxo3PP9kGGRxEdLKDNVwK/IjbND0Oxh+dBQqbsw0=;
 b=tCUeQAtcsJDs+KuHsyVjuHRuDONDl5jn3nJNdhmjCojVYCzHjCy2w5tTpBsRhCTaoW
 1lHeXsfcPMzgTWo0+ocdtpT2rftvI1Ysie75P9dKa7x5jHZJkOGjrAb4w5qZkURs0dA1
 8I7sroSoD5LX5SBrB0CFsxIvs1K3Ow3O9AEJuFHwDsfEmpREYokWtwsoXcVv5oFyFn58
 Qx99UEIONNn6CqD7ZSzEmOCtvpUlksdz/Fvdk6/swXzMX1+dfGTRxKPnw7Vm9gpGbhAY
 T9DfomuXEpvUhPCb4GTuh5O+0GNil6bBtzdEJP8yxiZAPb+1arlGtiXrI4aiCunL9vbb
 trBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FIscxo3PP9kGGRxEdLKDNVwK/IjbND0Oxh+dBQqbsw0=;
 b=QA/mEoi4zk37fOamz5DJCYkRvMZ9tKyEN5GzdBD2nWfhZWcJCrDF0YM7mg5Uz1K545
 ZxudwC9k5riVlbRZzE/3PxUGeg2XE4yZOa/6k5WKUBS6K/1lwHn2cwSfV+L5/wiST3Xw
 Ve4+084VRTF1or1NbTfc8qIsyx4i/qJSLhyJe+zTOZqjyLXmrjwBql8v79lSTkmkLmDJ
 WixE0vZPg4Cbvp4t4JB4nkvI38wOjOi3Nmq1QssOeIqCmGeCe4BFPOBgkcQDsIuj5wtd
 U3KmnbHkcH4TQCFGKq6A5LeR1PiGrj6DtWCAI7pV0s+atPD1NzgD0M9FEMvxyJHzYvYq
 708g==
X-Gm-Message-State: AOAM532xn5I6veIMit26m5+ok+/7lUfUV1HsXemzDVVp+CgTY9uOZlzO
 voJcrsloaLj0tOxG/WY0p1w=
X-Google-Smtp-Source: ABdhPJy+vT2bQrR2KZWZXB7ycYG8dfnlcwvF1up+SMdDZtRQAby1Qcn8jOkcGkL1oSnjgLmD5RNuiQ==
X-Received: by 2002:a17:906:ecb8:: with SMTP id
 qh24mr19243805ejb.162.1619443853704; 
 Mon, 26 Apr 2021 06:30:53 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id x7sm1404845eds.11.2021.04.26.06.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 06:30:52 -0700 (PDT)
Date: Mon, 26 Apr 2021 14:30:51 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v3] multi-process: Initialize variables declared with
 g_auto*
Message-ID: <YIbAi/3hOPLMi8LE@stefanha-x1.localdomain>
References: <20210312112143.1369-1-yuzenghui@huawei.com>
 <d4a03c50-12db-f44c-7d6a-d2baba77f164@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RjVyKqY+SXkpmSo4"
Content-Disposition: inline
In-Reply-To: <d4a03c50-12db-f44c-7d6a-d2baba77f164@huawei.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=stefanha@gmail.com; helo=mail-ej1-x630.google.com
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 qemu-trivial@nongnu.org, qemu-stable@nongnu.org, mjt@tls.msk.ru,
 qemu-devel@nongnu.org, laurent@vivier.eu, stefanha@redhat.com,
 wanghaibin.wang@huawei.com, berrange@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--RjVyKqY+SXkpmSo4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 06, 2021 at 10:00:03PM +0800, Zenghui Yu wrote:
> [+Stefan]
>=20
> On 2021/3/12 19:21, Zenghui Yu wrote:
> > Quote docs/devel/style.rst (section "Automatic memory deallocation"):
> >=20
> > * Variables declared with g_auto* MUST always be initialized,
> >    otherwise the cleanup function will use uninitialized stack memory
> >=20
> > Initialize @name properly to get rid of the compilation error (using
> > gcc-7.3.0 on CentOS):
> >=20
> > ../hw/remote/proxy.c: In function 'pci_proxy_dev_realize':
> > /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: 'name' may =
be used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
> >     g_free (*pp);
> >     ^~~~~~~~~~~~
> > ../hw/remote/proxy.c:350:30: note: 'name' was declared here
> >               g_autofree char *name;
> >                                ^~~~
> >=20
> > Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> > Reviewed-by: Jagannathan Raman <jag.raman@oracle.com>
> > Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
>=20
> Message-Id: <20210312112143.1369-1-yuzenghui@huawei.com>
>=20
> Ping for 6.0, thanks.

I'm sorry I missed this email! QEMU 6.0.0-rc4 has already been tagged
and the final release is tomorrow. Only critical patches are applied at
this stage of the release process.

My understanding is that this patch silences a gcc 7.3.0 warning. The
warning is bogus since both code paths always initialize the variable.
You should still be able to compile successfully using ./configure
--disable-werror.

I guess this issue was hit on CentOS 7 since CentOS 8 ships a newer
version of gcc. Debian stable also ships a newer gcc. That probably
explains why this issue has not been encountered by others. I don't
think the patch is absolutely critical for QEMU 6.0 although I regret
not having merged it earlier in the release process. Sorry again.

I have queued this patch for QEMU 6.1 and CCed it for -stable for
inclusion in QEMU 6.0.1.

If you think this patch is critical for QEMU 6.0, please get in contact
with myself and Peter Maydel ("pm215"), preferrably on #qemu
irc.oftc.net IRC as soon as possible.

Thanks, applied to my block-next tree:
https://gitlab.com/stefanha/qemu/commits/block-next

Stefan

--RjVyKqY+SXkpmSo4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCGwIsACgkQnKSrs4Gr
c8iAnwf/RBbJPZ/22/5aGUYbS01irs6HM6RY2/XYkjMSyBasXcN21AoyJxyyRsQ7
zsiwcZNrTogZMe1dNQiu5VNr1s5ySlyoUI4wMGnZlSJIES0yBiks1IiZDylONzxj
A3JZOQ4TmbEs5T4VO3xh33Wzu8hI/HAEEBwZYTbsRnpY+dFVb/4iUImIg4O8snJ6
tJfcDvOlwgY3LY4Ue+pbvvYPoHPcI2DMjC8VHfRQGQC3av3fKUXe1GlD0R4L2TFD
rZuOtMY8tir1o3Yl1RcFWn38ABh9In/h05Whankyd8WXiuBTMhET9RuM70p3Ym6s
DRHGbb6P15A3i8iP7fZn/Cj+PKMvEg==
=9SN/
-----END PGP SIGNATURE-----

--RjVyKqY+SXkpmSo4--

