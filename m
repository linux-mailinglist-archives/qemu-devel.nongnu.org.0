Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E294443C9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:43:56 +0100 (CET)
Received: from localhost ([::1]:55142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHUZ-0005Yv-Cv
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1miHSH-00032B-JE
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:41:35 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:44024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1miHSD-0007KZ-ET
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:41:33 -0400
Received: by mail-qv1-xf34.google.com with SMTP id j9so3085078qvm.10
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kjDef0vKGwC2YknZI5+ta3GY3FfCR22SaxKjqiynY58=;
 b=gUgR7JvkrGx21xfu9t7KXNzZnmad+8fsIRudIS2UcqjcYSa+IAnVmQzVq/4I1JVVht
 KvzZxBNNQNV/mfi0D06TwxhEXgetx9EEoi90I1i9ZATi0lt+3BP/+Go0WFFNvL9Hoatc
 Sh+nbzBcirzPj+gInpi/joqL7RT76zlIrvkz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kjDef0vKGwC2YknZI5+ta3GY3FfCR22SaxKjqiynY58=;
 b=RXpvnPECIaMUfNtdNHm9wLmHSK1raYORqejjIarXtXp/dFpbM5PI35NOOFtJLqs5p/
 jS8mpqvU4o/8UuIR/xWXAvfhjsVWy9G0JnRpulGZlc5RzkXPne/2VdlteoF0/+c36sAa
 TBl9yt1DijNWKcRDsEQ7+WsCGyGlxnIg/i83bTUlP7pGHhIJ+198apIBgRbdmF5XpwoJ
 0Y/d8Fm7yY1sauiQM70AOIi7jNHLv7JFMiHiCbfSOpyjHTX4fivgeHM/EzQjQv2iCQA1
 oNcIVgCTPP50nppc90JZSJ8VD9msTNbBjnYtxeifEdLTAvizhK+Ft04Yqz29ziv5Ly1R
 9mjA==
X-Gm-Message-State: AOAM530QXtkin+xi4x9WSIADgMFqVN7lZEp2xAqWiNybXnIQvts1gtdK
 gHSkPCsbpdG9fWJ0qcKd03C8sA==
X-Google-Smtp-Source: ABdhPJxS1u77BuEcU1AFF2aevQdPSaO7Ftk2pkOrdpMlGzkd85LwbMFUKYbmgwSGGIk39AcEzb0+gQ==
X-Received: by 2002:a05:6214:842:: with SMTP id
 dg2mr42450768qvb.19.1635950488393; 
 Wed, 03 Nov 2021 07:41:28 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-e929-65d4-8978-cf6f.res6.spectrum.com.
 [2603:6081:7b01:cbda:e929:65d4:8978:cf6f])
 by smtp.gmail.com with ESMTPSA id i67sm1535583qkd.90.2021.11.03.07.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 07:41:27 -0700 (PDT)
Date: Wed, 3 Nov 2021 10:41:25 -0400
From: Tom Rini <trini@konsulko.com>
To: =?iso-8859-1?Q?Fran=E7ois?= Ozog <francois.ozog@linaro.org>
Subject: Re: [PATCH v5 06/26] arm: qemu: Add a devicetree file for qemu_arm64
Message-ID: <20211103144125.GZ24579@bill-the-cat>
References: <20211026002344.405160-1-sjg@chromium.org>
 <20211026002344.405160-7-sjg@chromium.org>
 <CAFEAcA-UukuQXT3ebcboiVOSn0J+88w-kzoH8jE1JVxQnoeuvQ@mail.gmail.com>
 <CAPnjgZ2C8okdUMcgKjuLgV8JdPexYY0=9NtbSOHO81dN7=2RCg@mail.gmail.com>
 <CAHFG_=XWc+Fb=m=SHC6=y4KeF533yqCNk=Ae088oAZyjOULPaw@mail.gmail.com>
 <20211101180707.GJ24579@bill-the-cat>
 <CAPnjgZ0XeFHrXwBuTZ=eoKHCo7cMSuM_gUiTfv-Sqt8o6tPOXw@mail.gmail.com>
 <20211102172833.GS24579@bill-the-cat>
 <CAPnjgZ1zDeXMCtccy6=cQzjjAz92xJZunObm2OYKZ2eyP=Sdsw@mail.gmail.com>
 <CAHFG_=UTbUkZ3EUss4qoJwL6nJcL6tvZQATfPrH1WFQpRgqubQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kkj3vgNzAWGjboLC"
Content-Disposition: inline
In-Reply-To: <CAHFG_=UTbUkZ3EUss4qoJwL6nJcL6tvZQATfPrH1WFQpRgqubQ@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=trini@konsulko.com; helo=mail-qv1-xf34.google.com
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


--kkj3vgNzAWGjboLC
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 03, 2021 at 06:29:20AM +0100, Fran=E7ois Ozog wrote:
[snip]
> > 3. Anything else?
> >
> > For qemu_arm_spl, it *does not boot* unless the U-Boot SPL properties
> > are present. There is no easy way to fix this.
>=20
> one clean and easy way would be to upstream a Qemu change to merge a
> supplied overlay to the generated one. This the same idea as applying the
> NT_FW_COnFIG overlay in the TFA world. In both cases previous loaders do
> their job properly for U-Boot : setting up the stage as needed.

For the record, I believe Simon did propose this and the QEMU response
was that no, you should dumpdtb, combine externally and pass that
directly.

--=20
Tom

--kkj3vgNzAWGjboLC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmGCn5UACgkQFHw5/5Y0
tyz94gv/S8i5F4Rv3kK4JeOz7OiFYlIUAp062JoKdj7tpkBWb6cDRIVApxBHLMYl
xE54k1ewBP6ElFUaR4sMYckmiVaVTFB1IoWgLTw2h9Uad/67HsEjMvizcwDFGRlq
wQlzpZ1BIZ4LW0L03JWB9qhX9oGe3pC7IAba/oWpiAu4bxjHn3GIf9OkMifi2/Sh
2Y+KUCjRtrs7dqW60DWkwlxUkxCQPDMc8lbFY4KpzrjfQbgo6TXLmgLw/JAvVsu0
Vo+zlcBydVUkpmMI9x3rk709WnZWtoVMC3GP1h0FaydQGXwq0PbDlaoeRB+gAYQX
yVzLUxIX01DmPjnEoTrhfCiLkbaXBBk9LD3ZqEodPrbI4bd3CGAPtEUXqRpoPdbR
MNdRLIl/dBMiHwIG4JHrVfkZE17cxLafVvF3lHscW548NjcOQ9lkOH8ZMIi5NhQu
QVtLXugXHNoGeCpN1gr+4r9BK4tkFLmcPNbtF51HTr/EoOY8d3+lE+waev+4L9N2
vgAEeg04
=NCiM
-----END PGP SIGNATURE-----

--kkj3vgNzAWGjboLC--

