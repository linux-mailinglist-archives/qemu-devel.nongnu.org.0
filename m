Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AC142C7D0
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 19:40:35 +0200 (CEST)
Received: from localhost ([::1]:45878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maiF0-0000xS-PL
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 13:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1maiAt-0005lf-MU
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 13:36:21 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:37524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1maiAq-00032g-8z
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 13:36:17 -0400
Received: by mail-qv1-xf33.google.com with SMTP id o13so2170234qvm.4
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 10:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ylRA12NrPDi6XVn5axU4DahvD3CJkunA5ezGmfYN+zc=;
 b=Myy3LZCqSG4AaysNRm5xQL6lTbc4aTVrZEhBIVzR5Z8TkAAlB8cQU/74iCsoYelyVU
 arSyU5Up3w3qQWdJfTOoB4pbLm099m6jh62UGlNJpF2tkRGaSRDiUlbXpS4+P203kda5
 wmbx0nveB5hSxL9QQA6nV5wHOqevFg0j8blbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ylRA12NrPDi6XVn5axU4DahvD3CJkunA5ezGmfYN+zc=;
 b=C2BHC5abLn1xNl8naWXsicYjcjcQeqHieatE1Tlifw/vcJkF/s6kVZ/5X9VYoSY4wh
 VtHXMEW0f1bM4Nr2qypqoBDWV+OMcF2qprYLkG3rg2SI76YzfGE3pV8X78xT5IjdUhLM
 FcQWZ+R0pQYXPXacNMqFVWKInFiw5WomQZWrfYLbjv+JYWe6PhTKpa4lOMNdn9Fq8vSX
 WFFnEvROLA2vYRKAFERLvhrOp2xG9Huw3bOsUnJAaoH9TSAiKvD6KBzwDHiFTMVTkPw0
 Urq4p2v9hZqmW9c9DCzAXs84ZYkbt1DkbTcwrufek5MS4ybXpVPui3fGCi0wkXwUpWU6
 7/ug==
X-Gm-Message-State: AOAM533RwHjfqjXHlte+nBD40ChI1/L5hE7UQV7jad7iHc452TpSvjYu
 5HtzEcbkh+fYbH/e3XbfqZAKpg==
X-Google-Smtp-Source: ABdhPJwh26Gkn2oFDuycUvrcCFIYXE1tLVLVjlRLRxZ7uYuJZfuv1hVBYVbwPoYIJbbLzoe6uZdMog==
X-Received: by 2002:a0c:e003:: with SMTP id j3mr583265qvk.42.1634146575131;
 Wed, 13 Oct 2021 10:36:15 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-e98d-c49f-f596-1fb5.res6.spectrum.com.
 [2603:6081:7b01:cbda:e98d:c49f:f596:1fb5])
 by smtp.gmail.com with ESMTPSA id x6sm149514qts.79.2021.10.13.10.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 10:36:14 -0700 (PDT)
Date: Wed, 13 Oct 2021 13:36:12 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 02/16] arm: qemu: Explain how to extract the generate
 devicetree
Message-ID: <20211013173612.GX7964@bill-the-cat>
References: <20211013010120.96851-1-sjg@chromium.org>
 <20211013010120.96851-3-sjg@chromium.org>
 <CAHFG_=Wj9w0w8C88O4BNN4pO-C+wMqFuqmVh4F1avcwsqE_csQ@mail.gmail.com>
 <CAPnjgZ1g4j4YdcgWKfJU81xC8NViA2Wew62Ygp0VO2QbrT6zhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2wMstBBNMOiVTqn7"
Content-Disposition: inline
In-Reply-To: <CAPnjgZ1g4j4YdcgWKfJU81xC8NViA2Wew62Ygp0VO2QbrT6zhQ@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=trini@konsulko.com; helo=mail-qv1-xf33.google.com
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
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 =?iso-8859-1?Q?Fran=E7ois?= Ozog <francois.ozog@linaro.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--2wMstBBNMOiVTqn7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2021 at 10:58:31AM -0600, Simon Glass wrote:
> Hi Fran=E7ois,
>=20
> On Tue, 12 Oct 2021 at 19:20, Fran=E7ois Ozog <francois.ozog@linaro.org> =
wrote:
> >
> >
> >
> > Le mer. 13 oct. 2021 =E0 03:02, Simon Glass <sjg@chromium.org> a =E9cri=
t :
> >>
> >> QEMU currently generates a devicetree for use with U-Boot. Explain how=
 to
> >> obtain it.
> >>
> >> Signed-off-by: Simon Glass <sjg@chromium.org>
> >> ---
> >>
> >>  doc/board/emulation/qemu-arm.rst | 12 ++++++++++++
> >>  1 file changed, 12 insertions(+)
> >>
> >> diff --git a/doc/board/emulation/qemu-arm.rst b/doc/board/emulation/qe=
mu-arm.rst
> >> index 97b6ec64905..b458a398c69 100644
> >> --- a/doc/board/emulation/qemu-arm.rst
> >> +++ b/doc/board/emulation/qemu-arm.rst
> >> @@ -91,3 +91,15 @@ The debug UART on the ARM virt board uses these set=
tings::
> >>      CONFIG_DEBUG_UART_PL010=3Dy
> >>      CONFIG_DEBUG_UART_BASE=3D0x9000000
> >>      CONFIG_DEBUG_UART_CLOCK=3D0
> >> +
> >> +Obtaining the QEMU devicetree
> >> +-----------------------------
> >> +
> >> +QEMU generates its own devicetree to pass to U-Boot and does this by =
default.
> >> +You can use `-dtb u-boot.dtb` to force QEMU to use U-Boot's in-tree v=
ersion.
> >
> > this is for either Qemu experts or u-boot for Qemu maintainers. Not for=
 the kernel d=E9velopper as it is recipe for problems: could you add this w=
arning ?
>=20
> Yes I can do that...or would it be better to hide this in doc/develop
> somewhere with a link here?

Somewhere under doc/develop and an external link to the QEMU
documentation on dumpdtb would be good, as it's (as you demonstrate
throughout this series) a generic feature.

--=20
Tom

--2wMstBBNMOiVTqn7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFnGQUACgkQFHw5/5Y0
tyy4CAwAkHyWMu7siPbGg8Xl6iiJYjdC34XmM7nN/r9E09OknRLWPavUA6/1UrOC
Oy42tCDDsKNEhjnuEUsltYG67pv7w7s+Gp2rkM3r1TuYlHPDgMQXTEzCwmC7CZl+
Rp7phC7Oum16QaEZky1Rm2budp/pUvd3IK4pxQurcsDhtSUi/Jwzr9uEstj0cK97
tlDDcm6bf0QiXa+JdtRGEdkV/AmpL4n6b3gSbrxfhi74xlSL2UYWsvbMiThRg1KQ
rFhXRbXaDjulws/YHVGODW0OIa9md9jLs3sC053kIYccss3KvZgLGgW0BQAP9kGl
VRllEomkkZxLmwHUscKj09itS+zcFgB5I0grvfp8HITQZ3S8nUZtve0zTVXIryXU
csz6XvkE7sLfwZP6d54jz+YXx6psQSLXb/g4UMSwIEiKfHDx0sXPJLN/1/K2cKji
NRc/tNlJsITsaijDl3D5V6MIcVD2CBYkeNEPJ++SrwI/RnvM1OvimIKJxJ7uC6Hf
wsXgJiAy
=qSlM
-----END PGP SIGNATURE-----

--2wMstBBNMOiVTqn7--

