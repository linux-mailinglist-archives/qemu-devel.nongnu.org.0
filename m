Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D73AE4421A7
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 21:26:05 +0100 (CET)
Received: from localhost ([::1]:58994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhdsb-0000qf-00
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 16:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mhbiN-0002mT-9N
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:07:23 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:40900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mhbiC-0002jI-To
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:07:22 -0400
Received: by mail-qt1-x833.google.com with SMTP id 19so15067777qtt.7
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kkeJzTGHx+uQCLzaOYEH7yirhqmjDRMZDNEp5b1344Q=;
 b=tFvTPNNjjI1tujByDbisZWcyUdLLXzVczBYSXl8xFZLLyQuA3V2BcilxWzm/o9yISX
 pX2UCc9TrCSkeHquaFCUgnIEHpsVddpBIUl6JlowwwefGBK+fgv8lQ/7zx/ZuxK/cbuN
 OvHAtA/e6P0tYxZD7xvaCAN3NQcKLV6zq/Pqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kkeJzTGHx+uQCLzaOYEH7yirhqmjDRMZDNEp5b1344Q=;
 b=iqxjH8MG0Ulgw0CoTsiO3+PMjiPp5jGTAZfE6LE4agrgLuxO83tmgciiQ3M5xohi6y
 ruGnqHwrymRiJ6SN5ZN6SvSRrDBzfU6CWLWrYmkpLplAuYkgJAiLRembE/mMbSwA9iaJ
 gP5/Mx5Lwcd+SZdgf92IqFMloWl911fBQxshH5XIBVdjR9KzUXnHbyvT8/5hSou0WcvC
 rsNN+toQUcI33xayndS8toILbPj2CDMnQePMu4JOe9Jrm/2Oo2V44XeL8mvBbZe2fVnv
 YKNRUYgoHJfTCAXsZCFbqPpHe04+WLmGlCN3H92pWW20QNwBABsLPV/fGApFpPvcZW3p
 uQmg==
X-Gm-Message-State: AOAM533FveJ7ADqqACaHvO7Q0EhJ9dtPalVvKRLQioGCFcwimh8Kk8YB
 3054hGk5My0xDWt2C7sT9mjOhA==
X-Google-Smtp-Source: ABdhPJwwTFOWN9yRoE9IMO1vFHSWUOKHSmAPQ29dQkF4MC/L5cdXL8RId8kmgOziiPBWZsoHBoDqMg==
X-Received: by 2002:a05:622a:1010:: with SMTP id
 d16mr33111127qte.70.1635790030311; 
 Mon, 01 Nov 2021 11:07:10 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-7d10-4e93-4359-630d.res6.spectrum.com.
 [2603:6081:7b01:cbda:7d10:4e93:4359:630d])
 by smtp.gmail.com with ESMTPSA id m20sm8074680qkp.57.2021.11.01.11.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 11:07:09 -0700 (PDT)
Date: Mon, 1 Nov 2021 14:07:07 -0400
From: Tom Rini <trini@konsulko.com>
To: =?iso-8859-1?Q?Fran=E7ois?= Ozog <francois.ozog@linaro.org>
Subject: Re: [PATCH v5 06/26] arm: qemu: Add a devicetree file for qemu_arm64
Message-ID: <20211101180707.GJ24579@bill-the-cat>
References: <20211026002344.405160-1-sjg@chromium.org>
 <20211026002344.405160-7-sjg@chromium.org>
 <CAFEAcA-UukuQXT3ebcboiVOSn0J+88w-kzoH8jE1JVxQnoeuvQ@mail.gmail.com>
 <CAPnjgZ2C8okdUMcgKjuLgV8JdPexYY0=9NtbSOHO81dN7=2RCg@mail.gmail.com>
 <CAHFG_=XWc+Fb=m=SHC6=y4KeF533yqCNk=Ae088oAZyjOULPaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/aHqdxxe3Vo3WJ36"
Content-Disposition: inline
In-Reply-To: <CAHFG_=XWc+Fb=m=SHC6=y4KeF533yqCNk=Ae088oAZyjOULPaw@mail.gmail.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Sean Anderson <seanga2@gmail.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Mark Kettenis <mark.kettenis@xs4all.nl>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/aHqdxxe3Vo3WJ36
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 01, 2021 at 06:33:35PM +0100, Fran=E7ois Ozog wrote:
> Hi Simon
>=20
> Le lun. 1 nov. 2021 =E0 17:58, Simon Glass <sjg@chromium.org> a =E9crit :
>=20
> > Hi Peter,
> >
> > On Mon, 1 Nov 2021 at 04:48, Peter Maydell <peter.maydell@linaro.org>
> > wrote:
> > >
> > > On Tue, 26 Oct 2021 at 01:33, Simon Glass <sjg@chromium.org> wrote:
> > > >
> > > > Add this file, generated from qemu, so there is a reference devicet=
ree
> > > > in the U-Boot tree.
> > > >
> > > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > >
> > > Note that the dtb you get from QEMU is only guaranteed to work if:
> > >  1) you run it on the exact same QEMU version you generated it with
> > >  2) you pass QEMU the exact same command line arguments you used
> > >     when you generated it
> >
> > Yes, I certainly understand that. In general this is not safe, but in
> > practice it works well enough for development and CI.
>=20
> You recognize that you hijack a product directory with development hack
> facility. There is a test directory to keep things clear. There can be a
> dev-dts or something similar for Dev time tools.
> I have only seen push back on those fake dts files in the dts directory: I
> guess that unless someone strongly favors a continuation of the discussio=
n,
> you may consider re-shaping the proposal to address concerns.

Yes.  We need to document how to make development easier.  But I'm still
not on board with the notion of including DTS files for platforms where
the source of truth for the DTB is elsewhere.  That's going to bring us
a lot more pain.

It is important to make sure our "develop our project" workflow is sane
and relatively pain free.  But that needs to not come by making
sacrifices to the "use our project" outcome.  I would hope for example
that the new Pi zero platform is just dtb changes, as far as the linux
kernel is concerned which means that for rpi_arm64 (which uses run time
dtb) it also just works.  And that's what we want to see.

--=20
Tom

--/aHqdxxe3Vo3WJ36
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmGALMcACgkQFHw5/5Y0
tyw+ywv8CpkSJ7gKzeUf2UHRZ7LOqvSaYTcsgyrtIdg+xecMLACjvdccdGouZE2D
14okS9vlJkQbEOAG2+c63ywwtDXE8D4Mv7QCaqPBWGPdGB6H17ctsn0KS0Db46mA
xPYahcgWWO+yX2OiACDpUXI4NecNCOFBfe/iF154VP6MCa0g4JnnSHVSFHHIWZOe
c7aEavfin5Uaj5dgc6BtgiaMYTQA6xIF66X/JKhYJKFLcKY34ZVSMCat/Lt0vNrh
nMiTD5tjFMvfR4Iv+iabxTX8Zu2bczmPfkZ0kZFC6DYdHuB27NT3s2rOkH2gxv+8
AtlgLVwbNav9CiqCREtOeBZTzJ4Sm4giNDeGwVZwCzLGBBpZipk3gikTGMy8pf+M
B7H5X8tdPVolxznZo1zzKpP5bh5vp06A965IJXwKwo36qz7Yzq/llbsa6BEyRLXa
hFUQC9VrTWHBWJ+anaU07uONGqi1mosiEooJtXo3v+jqdG0eiy5u79Eb1FGCcAu9
r1jmdLmN
=pSTr
-----END PGP SIGNATURE-----

--/aHqdxxe3Vo3WJ36--

