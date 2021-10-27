Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C48C43D10B
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 20:48:04 +0200 (CEST)
Received: from localhost ([::1]:41250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfnxz-0004Rx-O9
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 14:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfnpU-00032Q-G2
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:39:16 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:40935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfnpR-00085u-Rc
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:39:15 -0400
Received: by mail-qk1-x729.google.com with SMTP id x123so3381328qke.7
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NIJWI43p26d05DM0VRBdGbMWQbJrwn82y81LzSMnCIc=;
 b=Mr4m0oHcKFmS5P6k6v+P5n+lD3WMsP/ka4Ai6aJghWEc9xJ3nYM9wtiqFXuj8DvPpb
 bxTbhC1xW+H5Ic58zbQJK7oZHX/0+cCuEzOx1i1MjpDzOmvYUYrGShwkI5ZDOJ3HWJJf
 9lYjl1UTITDRWA3VrPm9YRUphl+seArC3qRn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NIJWI43p26d05DM0VRBdGbMWQbJrwn82y81LzSMnCIc=;
 b=r/Cc98nogfkEmdpaz3FzuoysIIxmMmgfV24ylt5ojkGPcXQ34DQJ23G/84UASKggvJ
 bd5vXJyQMp8D4ndCVavDFr/Zm5LQXsMIWOzCtsBCagXu4CyuQECSEG+CoFtebf7vLz7a
 TUR2fMd+8LDPIDvtyLEFSkniC/IuOOQJI8EsvVBFVgQXIFv8lu5XglB82ipUhk5AaHOT
 3zHj2PBIOgQuDPavV/1Ybp/4il6vQWIZ9opBRngTWjztpAim7skuLzvQw3OCBblT3chm
 9Kyf7WRn4QF/tOeg0t4luZUbAhZa5NBGCwpl6L2mQbK7Dw3tvPQAYODajjPpNjHSbulT
 joJA==
X-Gm-Message-State: AOAM531OAacBXTxwIBPMB6/BNWmPF0QVcflP2HHAaHjWFKsEv8zWp0Oq
 rCzjMqMtfu13XchhcCtAazAunw==
X-Google-Smtp-Source: ABdhPJzJaQSkmKsIal04xpghcelbs71bLjsfXUKrvJBLo/P38uK5YlVqgJ9G4+1yCvUSjcHR5sPaag==
X-Received: by 2002:ae9:de02:: with SMTP id s2mr25985726qkf.215.1635359952790; 
 Wed, 27 Oct 2021 11:39:12 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-0044-6cb5-81ac-bb0c.res6.spectrum.com.
 [2603:6081:7b01:cbda:44:6cb5:81ac:bb0c])
 by smtp.gmail.com with ESMTPSA id m2sm528614qkp.124.2021.10.27.11.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:39:12 -0700 (PDT)
Date: Wed, 27 Oct 2021 14:39:10 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 05/16] arm: qemu: Add a devicetree file for qemu_arm64
Message-ID: <20211027183910.GH8284@bill-the-cat>
References: <20211013010120.96851-1-sjg@chromium.org>
 <20211013010120.96851-6-sjg@chromium.org>
 <CAHFG_=UDFn9MQfJz6oTAg15PiR2nt6QkoZS58+gsOMMVo31AXQ@mail.gmail.com>
 <87v91iwmoc.fsf@linaro.org> <20211027145653.GB8284@bill-the-cat>
 <CAPnjgZ1sKULC6wKuEWsdjzFsmDK3ECVUTiE7kjp18psgACREVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pVF9EYSGkiif4dMH"
Content-Disposition: inline
In-Reply-To: <CAPnjgZ1sKULC6wKuEWsdjzFsmDK3ECVUTiE7kjp18psgACREVQ@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=trini@konsulko.com; helo=mail-qk1-x729.google.com
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
 Neil Armstrong <narmstrong@baylibre.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andre Przywara <andre.przywara@arm.com>, Tim Harvey <tharvey@gateworks.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>, Rick Chen <rick@andestech.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Jagan Teki <jagan@amarulasolutions.com>, Sean Anderson <seanga2@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--pVF9EYSGkiif4dMH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 27, 2021 at 12:34:26PM -0600, Simon Glass wrote:
> Hi all,
>=20
> On Wed, 27 Oct 2021 at 08:56, Tom Rini <trini@konsulko.com> wrote:
> >
> > On Wed, Oct 27, 2021 at 03:44:08PM +0100, Alex Benn=C3=A9e wrote:
> > >
> > > Fran=C3=A7ois Ozog <francois.ozog@linaro.org> writes:
> > >
> > > > Hi Simon
> > > >
> > > > The only place I could agree with this file presence is in the docu=
mentation directory, not in dts. It creates a mental picture  for the reader
> > > > an entirely bad mind scheme around Qemu and DT.
> > > >
> > > > And even in a documentation directory I would place a bug warning: =
don=E2=80=99t use this with any kernel , Qemu generates a DT dynamically
> > > > based on cpu, memory and devices specified at the command line.
> > >
> > > Certainly for the arm, aarch64 and riscv "virt" machines you should
> > > always use the QEMU generated DTB. I'm not entirely clear what a
> > > qemu_arm and qemu_arm64 def targets are meant to be in this context.
> >
> > Agreed.  We cannot include random device trees in U-Boot for devices
> > that generate their own at run time or otherwise have the source of
> > truth elsewhere.
>=20
> Until we have a way of bringing in the u-boot.dtsi that people in QEMU
> can agree on, I don't see an alternative. I will send a series for the
> bloblist handoff next week and I think you will all see what I mean.

I think the alternative is that QEMU in U-Boot just can't be used for
certain features.  Which is annoying in that it would be good to use it
to test certain feature, yes.  It's generating a good and valid enough
dtb for Linux, so it should be good enough for us in general.

--=20
Tom

--pVF9EYSGkiif4dMH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmF5nMoACgkQFHw5/5Y0
tyz+wAv/dly234YsjqU4iqeUERxgfuAppQoK28yAJiw5cXekTdEAdpNfbAiGDZD9
124kercVWvN9v19Cl0vzeZjJ0l1IS4daFPKabEVDTx0cdxBgjpxAa5+HqvsV2Ics
SyqgDuFoGCg0n4YQpm1gN88gmetWMqEdBuYtxOa+5ilaoAd/8N8U1OZ8ymIG9a2J
wrysZtASoN3J9KsL2ZpiohaZwcA1/HMjyEV+HexDOqABBUIJpNQvKvWjjwOFW9el
BdGQSSjgyL5hO8v1/eLCLdg40aYk7tdOPB1aXDOm5q9CU9Qjmk7v0AhZ+yIcGNqJ
gK5pNwM22fLtCGW5MCau9YMRy+rg8KHDWI89nUDXa09fw/kIUGp3rn7TJ6dWvmkN
QpcRBmEa3b1Y+DVwAx6+mB2n8wJ1GGkpzaXpy14M4OYF+svxWBR7GxcqgvQs3tv8
o2weLz4n0Kv0zYffcR9zBIWtwd4nkRl/w+/DfH6UnJ7YHKav1rJWzR3lkRK9n8Dp
4v6pkTQ8
=8ply
-----END PGP SIGNATURE-----

--pVF9EYSGkiif4dMH--

