Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D29343CDDA
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 17:42:18 +0200 (CEST)
Received: from localhost ([::1]:47366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfl4D-00070u-Cl
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 11:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfkMM-0001FY-GN
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:56:58 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:34714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfkMK-00052k-Tv
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:56:58 -0400
Received: by mail-qt1-x833.google.com with SMTP id v17so2719524qtp.1
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 07:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jY0E1cOJTzsXkt41MT2UFx0i1yzVa72LPx8852DQWBQ=;
 b=PiZJPek/aRare1E95tkLZJtHgWNINw7cBjTYAyG6gVTKFcEy90a4wXRxRbvjGzvV3j
 hAemVYbNzrUTbnfDYH+7XjwBlOPbKxCgCNDTScUb02Q14zJbf23aji/ATkeGmFAYBRpu
 VAK7exf+iqFaR2n7alA//G+4XPiQ5DZV+rgH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jY0E1cOJTzsXkt41MT2UFx0i1yzVa72LPx8852DQWBQ=;
 b=gTO3wVoQ0uXD2niwxUpEa6y+mPUhYBmywdrHj8kwgkBKXK0wydZo6LpTtt1nD8Rkyy
 BbqAOOS9lQCWmzJL5xdDarTtYS26xtjXjPaZyRpjTZH4sdcyJ/ywgFC20v1JyGq0CBPi
 oul2fuLo9PKrSuCBn6BA4UePiaZ9KIitbFAm/OwJQQ9tMXPx0vLB1WzvsKB1FaGeU5ba
 Kypk9AveQHAJvRyUAg9H/4REgO+77B8qC8ru/gFDaxFP3AgL+n6E3PuE8Fu7FJI7L9BJ
 0wB7kXFyFXZyBY6ZDZDJOSoVKYqh+5EZLACrMy9hD/w7Bq4Syk2Ybfp+jWk9Q1qRXYTS
 c/5Q==
X-Gm-Message-State: AOAM532q4UBp+KBBvOUKQeMnnZBmEsOuMGnh5bnb+c7dA7hgfJjL1hpZ
 XWeT88UG40QkaS2Bo5W2NjO1iA==
X-Google-Smtp-Source: ABdhPJxU1MDmiRfZSnJECf7SUVZg0hupcFJQjcb3/gBBYZt7iVXbd4+ajylM3h9ZVPmNMynny+lITg==
X-Received: by 2002:ac8:5755:: with SMTP id 21mr31775376qtx.353.1635346615981; 
 Wed, 27 Oct 2021 07:56:55 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-0044-6cb5-81ac-bb0c.res6.spectrum.com.
 [2603:6081:7b01:cbda:44:6cb5:81ac:bb0c])
 by smtp.gmail.com with ESMTPSA id w185sm150692qkd.30.2021.10.27.07.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 07:56:55 -0700 (PDT)
Date: Wed, 27 Oct 2021 10:56:53 -0400
From: Tom Rini <trini@konsulko.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 05/16] arm: qemu: Add a devicetree file for qemu_arm64
Message-ID: <20211027145653.GB8284@bill-the-cat>
References: <20211013010120.96851-1-sjg@chromium.org>
 <20211013010120.96851-6-sjg@chromium.org>
 <CAHFG_=UDFn9MQfJz6oTAg15PiR2nt6QkoZS58+gsOMMVo31AXQ@mail.gmail.com>
 <87v91iwmoc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ofekNuVaYCKmvJ0U"
Content-Disposition: inline
In-Reply-To: <87v91iwmoc.fsf@linaro.org>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=trini@konsulko.com; helo=mail-qt1-x833.google.com
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
Cc: Heiko Schocher <hs@denx.de>,
 =?iso-8859-1?Q?Fran=E7ois?= Ozog <francois.ozog@linaro.org>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Neil Armstrong <narmstrong@baylibre.com>, qemu-devel@nongnu.org,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>, Rick Chen <rick@andestech.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Jagan Teki <jagan@amarulasolutions.com>, Sean Anderson <seanga2@gmail.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Fabio Estevam <festevam@gmail.com>,
 Tim Harvey <tharvey@gateworks.com>, Peter Robinson <pbrobinson@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ofekNuVaYCKmvJ0U
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 27, 2021 at 03:44:08PM +0100, Alex Benn=C3=A9e wrote:
>=20
> Fran=C3=A7ois Ozog <francois.ozog@linaro.org> writes:
>=20
> > Hi Simon
> >
> > The only place I could agree with this file presence is in the document=
ation directory, not in dts. It creates a mental picture  for the reader
> > an entirely bad mind scheme around Qemu and DT.
> >
> > And even in a documentation directory I would place a bug warning: don=
=E2=80=99t use this with any kernel , Qemu generates a DT dynamically
> > based on cpu, memory and devices specified at the command line.
>=20
> Certainly for the arm, aarch64 and riscv "virt" machines you should
> always use the QEMU generated DTB. I'm not entirely clear what a
> qemu_arm and qemu_arm64 def targets are meant to be in this context.

Agreed.  We cannot include random device trees in U-Boot for devices
that generate their own at run time or otherwise have the source of
truth elsewhere.

--=20
Tom

--ofekNuVaYCKmvJ0U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmF5aLUACgkQFHw5/5Y0
tyyE3Qv7By4ZScROAq6Z8M1IN948ZclwHo/QAyU22EMcJsz8CfiTKaun2r7BC21S
fcJWLKYS77VPhVezj+onBhvpLX3b6RF3MLJvWgYFh/bZZYWIVqNBb/bhhjsZI0qZ
j4V+8abBlHBOfKfZOnu0rgW97GsT9frQqUgj7b7WCY2Cx+F0zWX5HfCRgSxazJgH
Xed+jjqxggWMsHrSF8Sb4QsEc12wOCZ1D7xmRUqU+wL1T09Jll+Q9IP/gjJzNSEy
wB2YpA5LMnt92ekCnzUlXz5MqI1EXrEnpOXEmDc3lbiw1iakiGQxS/uViB33cnGT
iYYLGgqaK43P9M0vbaos1aeN24v2XTWuO48/m1czWFjgM7rRHcw3Otg7kQqCsoYf
YOmJY/uRlEUf7R8t/u01iVl0+q6rplWgIjP39Ud+cxUuF8gzVeuEFPrVT4M0lCxc
n9EFlqKuv25VnnlfZ6n0W1LlGtFygyvaTTNxL3wH1L+vRfsVwrkPT1iidRSWlR10
Y7rB+SHh
=gMfa
-----END PGP SIGNATURE-----

--ofekNuVaYCKmvJ0U--

