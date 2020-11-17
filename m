Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C40AF2B67C1
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 15:48:05 +0100 (CET)
Received: from localhost ([::1]:49892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf2H6-0003tO-Sa
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 09:48:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kf2FP-0003CY-9O
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 09:46:23 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:50216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kf2FN-0005Q8-Hy
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 09:46:19 -0500
Received: by mail-wm1-x32c.google.com with SMTP id h2so3513087wmm.0
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 06:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oye4dYKgDtbiMu2bToN6IZjjdl2DBntqCX2O98vJzc0=;
 b=hMefFHBUOHhF3tCqRymNTvlCCPVMvPkEMYUtruPe21evlpjuQwU26vDKOmyOkZWYqM
 QYHJWnml1Std6Ftgt/i0sR3ZXtAuNhImPtaq65ilBJPtOfArtqB8lAe3DZXYaG1cpi5n
 Q+DeQCxo941e7iI48cNllol6Ijqq1h2rknlTM09qwOaon1eNOs52094uiHsBhpBkEpS0
 YKg1So3RZr10k957Kpyaqdu0qXGkSoxm5pITGOQyKTJyeJpLH/SCsaCM28GiRV7lljhm
 6Tyc9LEbPZjc4pOCInhWC8+eb9WQrN+rOVFebzmq6dFMOiOka4lYIcInpZDGKt4tKQEe
 q62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oye4dYKgDtbiMu2bToN6IZjjdl2DBntqCX2O98vJzc0=;
 b=ouYn5fLM+UmoYn+6S9D0XLZzOHI66J767vwGiImOCtJ0/eIXV9eS5mSo65/gwhhE2h
 MchHizjXtCh7jx/t9ZDkGt1/PJMWYSqg+JTk5eB/tfaTdviShE1OowvMYPNkwqkER4ZB
 FGbV4/zGjtXjl51TjHN1aZK8FUUFxvRJe732VbLUBK516XNcWGcHlk5vqEFA085Gczy7
 As+3QQB3AZV/Ch8nX0aT00b44se7FCd81TjT3u7/bHqX71SlYcddiqELdoP2dORdtms2
 SaPVaM5wnG2Tgwdd93SHSO2i5NCOe3EzPcXckDwAbyv+9UsNLNK2CkMxok+ukIGE8lPL
 rq+g==
X-Gm-Message-State: AOAM530NH9OLRiIMjfU89pN9PQeOBGhG9mWbPDtpfeO//MdfZA2a6BU8
 wl8RnNpye0zbE/ys+kgxZ4E=
X-Google-Smtp-Source: ABdhPJzebbYVFl8zzFXTly1g2BeNyc+yCQRKYG99cRVdbFt7wkcrU3Xy+Y2cQNuQEe0YkwBhJ/C27w==
X-Received: by 2002:a1c:a70b:: with SMTP id q11mr5001623wme.90.1605624375546; 
 Tue, 17 Nov 2020 06:46:15 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id 36sm11787961wrf.94.2020.11.17.06.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 06:46:14 -0800 (PST)
Date: Tue, 17 Nov 2020 14:46:12 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: P J P <ppandit@redhat.com>
Subject: Re: About 'qemu-security' mailing list
Message-ID: <20201117144612.GA140001@stefanha-x1.localdomain>
References: <CAFEAcA_9BVbqFCHJqS8jj6L3OqVNc60NCjAjRs516VyLH2EFfw@mail.gmail.com>
 <20200914101517.GD579094@stefanha-x1.localdomain>
 <nycvar.YSQ.7.78.906.2009151536090.10832@xnncv>
 <20200916111025.GA756728@stefanha-x1.localdomain>
 <nycvar.YSQ.7.78.906.2009181031500.10832@xnncv>
 <m2362z8dvx.fsf@oracle.com>
 <nycvar.YSQ.7.78.906.2010011502290.830962@xnncv>
 <m2mu166uyg.fsf@oracle.com>
 <nycvar.YSQ.7.78.906.2010012320290.830962@xnncv>
 <nycvar.YSQ.7.78.906.2010161910530.1246156@xnncv>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline
In-Reply-To: <nycvar.YSQ.7.78.906.2010161910530.1246156@xnncv>
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=stefanha@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: peter.maydell@linaro.org, sstabellini@kernel.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>, mst@redhat.com,
 michael.roth@amd.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Darren Kenny <darren.kenny@oracle.com>, pmatouse@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2020 at 07:47:01PM +0530, P J P wrote:

I have CCed everyone from the Security Process wiki page so they can
participate in discussing changes to the process.

> * So ie. we need to:
>=20
>   1. Create/setup a regular non-encrypted 'qemu-security' list.
>=20
>   2. Invite representatives from user/downstream communities to subscribe=
 to=20
>      it.
>=20
>   3. Collect & store their PGP public keys. Also create a key for the lis=
t.
>=20
>   4. Write 'encrypt & email' automation tool(s) to provide encryption sup=
port.
>=20
>   5. Document and publish above details and list workflow on a page.
>=20
>=20
> ...wdyt?

Writing/maintaining automation tools will take time so I suggest going
with confidential GitLab Issues instead:
https://docs.gitlab.com/ee/user/project/issues/confidential_issues.html

If you would like to test GitLab Issues, please post your username and
you will be given the "Reporter" role so you can view confidential
issues.

I have created a confidential issue here (you'll get 404 if you don't
have permissions to view it):
https://gitlab.com/qemu-project/qemu/-/issues/2

The intention is to migrate QEMU's bug tracker from Launchpad to GitLab
so this will unify reporting regular bugs and security bugs. It also
uses encryption all the time instead of relying on users explicitly
encrypting emails.

Stefan

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+z4jQACgkQnKSrs4Gr
c8hkMAgAwTDnNB0OaoyoX9jWUV8TF5T1mjYvMbvSV1r6OVN6agtABt+JEiynQkXd
aQ+3pqLPk2XE8kDyUAiwkqNI8uMXGpVnDfdb+J7l5V0Wcgy/39A6lJy1cp2s/1Y+
FGorL3po+evYPBSPjxGVDL8B8Ny5esyJta6ifk/DDj9A+CXBV56jdDyZpRteUSyL
J9CEFynYtFtkY/tUUxr/42hWtZPDzNeuX/kwuy+rhcUXzly6xCM1k6JjXk61kRmb
SvFyLTvw0gfqnqaYAnn/G2p1nBMcAdf4smBIINjSA5XZJiovILXuu6C2Akc0R2cT
IenK1XZeG2uuGxOPHIM5mPFmOf3hDg==
=3uSY
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--

