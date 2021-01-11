Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A82702F0F8E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 10:58:59 +0100 (CET)
Received: from localhost ([::1]:57906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kytyU-0001vk-PE
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 04:58:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kytxR-0001UX-DP
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 04:57:53 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kytxP-00058s-NV
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 04:57:53 -0500
Received: by mail-wr1-x430.google.com with SMTP id a12so15681734wrv.8
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 01:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HVTwhShWqAMLHrKKrQZLdfC3/S2ON/nvoxWh7+ADR1o=;
 b=ZAx93E6oRSeMiS+cHhy9d3rRaa0lI4yoAotaKGJslYq6OPKsHhy1jqGNviFABHJDcr
 D73zINjjhtZ2PLtNWnYktUHCP9gDw9HOnzq7v1WGVAk8xzqlWAg5ZM6B3M9kvOeoXW0I
 zA8dVzN25kosaF5dlXonIJUkdI9UZFsyB0A2rJiSAa5hGNpeGG95eCMEI4u7Onhlny8E
 DaTnd/+5zcqtyKK7FWtkeTAFovtkJ35LSXsav1C+znqhkZ3gf8zpf+lB5MNq6+ji3FtZ
 Af6pUs0LIpmfS5J+B4iBCH60v8uff0HdiqVIzEIFu08foADdTL5VVellRK3xy8wdMpnc
 GLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HVTwhShWqAMLHrKKrQZLdfC3/S2ON/nvoxWh7+ADR1o=;
 b=qOi7ML/pzX6aevMP8bp8tI1SuWS68pjF9E8Hcmd/CGx8A1PyJ2KR9ttBuZyJ5932Eu
 sRbMlBbbKfJBMsuWR+MwX5xPhf/gbRs9q1BktYYvgdyowsdHFgErE/XvKzUhuv7LYuar
 DOh/LXTKunREqUEtVGuvU+bavaFEXst97af3IvtMAU7Lndn4bLe6DWIR+aIcnUn6Xdu/
 AOop0hdpeknp2ZFPbEWKto43i7byEq2jyNL3k632m3IjEARVfnWUAhrc3BxnhqxVMxPV
 c+AoXH0iwt/l/Ako7GIPA8XF85IqZ5b2/EXVoksbRSETKyq4tXxSItnPDx8CBDvAzbUA
 h8Rg==
X-Gm-Message-State: AOAM530Tcub0Zz13D6QeDHqhmExYMJ66xt008DMrIvhWTANcJ5z4JMWj
 9xwGn9EEMwhUOuF84HhFGqg=
X-Google-Smtp-Source: ABdhPJyKvTgvHE3U8IFPKLlajYtsZ5+i7UrZUoYoat57t9RjaCF9R1V2dpXcVnkBgP+pBRwBM1f2ow==
X-Received: by 2002:adf:fdcc:: with SMTP id i12mr15326159wrs.317.1610359069821; 
 Mon, 11 Jan 2021 01:57:49 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id h13sm23497986wrm.28.2021.01.11.01.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 01:57:48 -0800 (PST)
Date: Mon, 11 Jan 2021 09:57:47 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC] Using gitlab for upstream qemu repo?
Message-ID: <20210111095747.GA43712@stefanha-x1.localdomain>
References: <672b8aa0-2128-23e1-b778-01a4d96b209d@redhat.com>
 <CAFEAcA93iYHz2aXUY+sXwNqwNT3MD0HD6V+JoJJWt+xO9OUZNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline
In-Reply-To: <CAFEAcA93iYHz2aXUY+sXwNqwNT3MD0HD6V+JoJJWt+xO9OUZNg@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=stefanha@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 05, 2021 at 02:12:59PM +0000, Peter Maydell wrote:
> On Thu, 22 Oct 2020 at 17:48, Paolo Bonzini <pbonzini@redhat.com> wrote:
> > now that Gitlab is the primary CI infrastructure for QEMU, and that all
> > QEMU git repositories (including mirrors) are available on Gitlab, I
> > would like to propose that committers use Gitlab when merging commits to
> > QEMU repositories.
>=20
> > - right now Gitlab pulls from upstream repos and qemu.org pulls from
> > gitlab, but this is not true for the qemu, qemu-web and openbios
> > repositories where Gitlab pulls from qemu.org and qemu.org is the main
> > repository.  With this switch, all the main repositories would be on
> > Gitlab and then mirrored to both qemu.org and GitHub.  Having a
> > homogeneous configuration makes it easier to document what's going on.
>=20
> So IIRC we decided that we wanted to do this git.qemu.org -> gitlab
> switchover, but not during the 5.2 release. 5.2 is now out the door,
> so what's the next step to do the changeover? Now seems like a good
> time to do it so we can be happy we've dealt with any snags well
> before we get towards softfreeze.

Yes, let's do this now.

I will send a patch to point .gitmodules at GitLab. In the process of
doing this I noticed sgabios.git is not yet mirrored on GitLab. After I
create that repo (and any other missing repos) I will send a qemu.git
patch series that references the GitLab repos instead of qemu.org repos.

We can perform the mirroring direction switch that Paolo described above
independently.

Stefan

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/8IRUACgkQnKSrs4Gr
c8iPTwf/b9CplNSiIladhOBQ/gJ/Hr0Nnii5CbQHT/bBjGoPezfPgpaWiqK8/YBd
ywP0x3xp26tnVotwB4Suwm51/fdFDxi8PZQyJg4wBSuVGV0h8LChGq7MUBITAvyK
Lj19Bs/JKKH+kTeU+RuNEHSWUoNAJN/B1ScaksGtbcon8UVauWaUkYudjgYns0QU
dZkmZcF6tpVajg+KAMYW0oXruQtP4IBz9ToahB/NzMOTjewS0s01xHEO9nhLrm46
ReQExESoC2D3YnNBstxX84RpKUUo3+pNfOh4iKHkKeeHfsKZfL4VSwpuiIZbVHZg
b/C97pJgN8lFcPkHJdYEjklb3iu+vA==
=21BT
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--

