Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCA043D1F9
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 21:57:53 +0200 (CEST)
Received: from localhost ([::1]:59734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfp3Y-000276-OV
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 15:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfoYF-0001KT-9T
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 15:25:32 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:46609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfoY3-0005Zv-FY
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 15:25:30 -0400
Received: by mail-qv1-xf33.google.com with SMTP id g25so1508965qvf.13
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 12:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aCyvoubtqD+aHaW0M4YRN/03kjasobCP35HJ4qiFEv4=;
 b=q5Xz+3EAwH9YGAIvjoLyiVAg4Om2RiShMyma61nDWJVyshZBf7n7HLQEzLzfn91yhO
 8LiF5mgQLCmNjdc/eICZiJ3Ko1t2pr5slak2gvDKGSn/jvCfV2UtXMjaOrD0aMz+Vykc
 pTI4tj8kyQBxJcg/4E+mZO4qGrcnP+lASG1as=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aCyvoubtqD+aHaW0M4YRN/03kjasobCP35HJ4qiFEv4=;
 b=kl8Qcizy3Aa8G9/eVCJIoqip7cPsqeoM0yaD7aR+rI38/7PhXthj3tT4nHnDwSU4K2
 zCnFUEdq5VNrejTcbj2WgfNefZxVpRw6vrhSqpB3Aexd8KbOa/SNCDXdUBw0vnEHq142
 dJmfuQ5ql7wTkQeZpTTLSIpnpnB9vQs96Gs39wSh7hl17y7Yug2SGx/WZky/2sx/Uvqd
 JF2NyPU+amR/VB3jZ9PdfpGd//h4lkd7pie7Md8HT/5OuvQZwKTXw6PhCa8oZqt7pLI8
 +Ur/BpXltWI4JrUI0rFx+7Sw+9mnf9E3akHA2hP2wJXJTxw/KJUUjvh0yuZdKBHs2j1A
 cp8A==
X-Gm-Message-State: AOAM531P32QKJIoWX9QE95QFIsrzNLu4RsERxdL18FnIL/QIZR45G5DK
 UoByeYvNJqUsVn15FzP79+nnMg==
X-Google-Smtp-Source: ABdhPJyMW+74IsNuc1Cy0/np7IpU0tWEWcLGyunYMJlhA+kNPrzBlJ0C494oDBkVvjaiGmxqjBQ1Xg==
X-Received: by 2002:ad4:5b81:: with SMTP id 1mr23363884qvp.52.1635362717290;
 Wed, 27 Oct 2021 12:25:17 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-0044-6cb5-81ac-bb0c.res6.spectrum.com.
 [2603:6081:7b01:cbda:44:6cb5:81ac:bb0c])
 by smtp.gmail.com with ESMTPSA id z15sm524673qtw.85.2021.10.27.12.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 12:25:16 -0700 (PDT)
Date: Wed, 27 Oct 2021 15:25:14 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v5 00/26] fdt: Make OF_BOARD a boolean option
Message-ID: <20211027192514.GL8284@bill-the-cat>
References: <20211026002344.405160-1-sjg@chromium.org>
 <CAHFG_=WdKL-WcaNJxwqMRHBgVQZy9SRz11mYDKJifXEnQyQSXg@mail.gmail.com>
 <CAPnjgZ0MGr+2tcSziB8DWXZPmv6Q=9ecs_6RK=N20n3-XJiL5w@mail.gmail.com>
 <CAHFG_=Vr6VkJy+d0MaPvVsoXYgvdB5xd2P5FuvF2w63bxSm4cw@mail.gmail.com>
 <CAPnjgZ3Gr+m+sTHDOpW+RFQ6rTtbriY4TpU3bjzqZB79f43Ycw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qE0/TkNoJLLGUzs4"
Content-Disposition: inline
In-Reply-To: <CAPnjgZ3Gr+m+sTHDOpW+RFQ6rTtbriY4TpU3bjzqZB79f43Ycw@mail.gmail.com>
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
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Sean Anderson <seanga2@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Mark Kettenis <mark.kettenis@xs4all.nl>,
 =?iso-8859-1?Q?Fran=E7ois?= Ozog <francois.ozog@linaro.org>,
 Stephen Warren <swarren@nvidia.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>, Jerry Van Baren <vanbaren@cideas.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Andre Przywara <andre.przywara@arm.com>, Alexander Graf <agraf@csgraf.de>,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Matthias Brugger <mbrugger@suse.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Aaron Williams <awilliams@marvell.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--qE0/TkNoJLLGUzs4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 27, 2021 at 12:23:21PM -0600, Simon Glass wrote:
> Hi Fran=E7ois,
>=20
> On Wed, 27 Oct 2021 at 09:14, Fran=E7ois Ozog <francois.ozog@linaro.org> =
wrote:
> >
> >
> >
> > On Wed, 27 Oct 2021 at 16:08, Simon Glass <sjg@chromium.org> wrote:
> >>
> >> Hi Fran=E7ois,
> >>
> >> On Tue, 26 Oct 2021 at 00:07, Fran=E7ois Ozog <francois.ozog@linaro.or=
g> wrote:
> >> >
> >> > Hi Simon
> >> >
> >> > Position unchanged on this series: adding fake dts for boards that g=
enerate their device tree in the dts directory is not good. If you have the=
m in documentation the it is acceptable.
> >>
> >> I think we are going to have to disagree on this one. I actually used
> >> the qemu one in testing/development recently. We have to have a way to
> >> develop in-tree with U-Boot. It does not impinge on any of your use
> >> cases, so far as I know.
> >
> > I am not the only one in disagreement... You just saw Alex B=E9n=E9e fr=
om Qemu saying the same thing.
> > I understand the advanced debug/development scenario you mention.
> > But locating the DT files in the dts directory is mis-leading the contr=
ibutors to think that they need to compile the DT for the targeted platform=
s.
> > For your advanced scenario, you can still have the dts in the documenta=
tion area, or whatever directory (except dts). compile it and supply to U-B=
oot.
>=20
> We have this situation with rpi 1, 2 and 3 and I don't believe anyone
> has noticed. U-Boot handles the build automatically. If you turn off
> OF_BOARD, it will use the U-Boot devicetree always so you know what is
> going on.

That we have to have so many separate rpi build targets, and can't just
use rpm_arm64 and add rpi_arm32 is not a good feature.  The various rpi
configs that use CONFIG_OF_EMBED are on your list of things that need to
be cleaned up, yes?

> We can add a message to U-Boot indicating where the devicetree came
> from, perhaps? That might be useful given everything that is going on.
>=20
> As in this case, quite often in these discussions I struggle to
> understand what is behind the objection. Is it that your customers are
> demanding that devicetrees become private, secret data, not included
> in open-source projects? Or is it just the strange case of QEMU that
> is informing your thinking? I know of at least one project where the
> first-stage bootloader produces a devicetree and no one has the source
> for it. I believe TF-A was created for licensing reasons...so can you
> be a bit clearer about what the problem actually is? If a board is
> in-tree in U-Boot I would like it to have a devicetree there, at least
> until we have a better option. At the very least, it MUST be
> discoverable and it must be possible to undertake U-Boot development
> easily without a lot of messing around.

What I don't understand here is why or how U-Boot is supposed to become
the source of truth for device trees.  The general goal is that the
device tree be something that actually comes along on the hardware,
because it's stable enough and correct enough that it's not going to be
changed from one OS kernel release to the next.  That should be where
the correct and true tree comes from, the device itself.

--=20
Tom

--qE0/TkNoJLLGUzs4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmF5p5cACgkQFHw5/5Y0
tywFgQv+MRkY8zca+DzN/PrzoW3Ca5dCrZQYWBbmT6iful/aP+t4HAyvpAIvSxe+
be/F/CP77Jj+mBsj3wFFVyy6OCwI1qPJain3IYzdINVXi/DYeMG9qxWm569t3hJ7
6nLg6sYSdybI+eXxHjOhLhQQypgNLd8BdSCucW8SPO1zu3NROuTnDlOXEp26Mead
c7JzgeUIh5kBloFXkKDINSQT6jPxVvQmTC0n0cF6Ky1EVb3kaj3wGtV61ldSUGWA
vfnnXNcqPSICW8nhHrx+VwdT58dKCS2s6X+uHhoACaUEENAD94kcQGxY1LFFmw0s
44UspgZyyjnHZR95J3++8vlMBTnYuCkJzJFPMDmSiYvOOR3lftFhosCpL0Z0Hg5T
OK9zy7liDbDo0uQ9dOzae8ZUIi6j+fSXtEPpiXIHcu0nDb+f7k8W3abSEoZqlLxW
PtgyvWdYATJa6g40ZGyFOY3P/VdxcAE3m1YkXvxoXvJ5TDBkSxMJDCQz2uaPGLze
fjDTH+O+
=lRX1
-----END PGP SIGNATURE-----

--qE0/TkNoJLLGUzs4--

