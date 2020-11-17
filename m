Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2CE2B69F0
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 17:20:55 +0100 (CET)
Received: from localhost ([::1]:54288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf3iw-0006bz-SV
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 11:20:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kf3ht-00068B-7Z
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:19:49 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:40063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kf3hr-0003lF-2q
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:19:48 -0500
Received: by mail-wm1-x330.google.com with SMTP id a3so3749063wmb.5
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/cUU/579DHsgDQUzYQ6dmKkUqMQpXjyKmkLrYpPVF+s=;
 b=cDZdm5j5/CaZZiu9kIu6PrBBkQ1OGMsQQWBHPpeop1mRMGLql3Dyqco1kvbzBXSFKF
 AB4zqWT2k2yD5RwPV31zldPrvKr8lsAqAHS8kZL51qpHFeNfbuWXv75J5LPkJjpbQRt3
 84gDh+8f9Hc9sa6JBD3dr698OEFioMTftQt9Yk8tJzAj/ZzmiZydIpGq0uOuw8hQO3eZ
 cAItcrNFxJNS2G9PAMXjyrF02q2Zkj6TgKaOR0Z0sG5KJSGfy3D8TAqIoBiOK3ByR1hy
 BZ+06MoDQHN9h0vM2ZdxXXjudRF1w6DbbFJvBXlUOkOhoXR5HEnZ9QJbBgMtJA3oxjRz
 nwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/cUU/579DHsgDQUzYQ6dmKkUqMQpXjyKmkLrYpPVF+s=;
 b=PRs0iher+CiikQ4dFXumUKD7yrIZQ2lp/9xLV15L/K/dYy7RMVf9fTGilZ1aFixFDe
 kpk4CeqC1dNoMUVs8nfe6lFeiU/XiMdufZmxA4sx9W9xZaErxUkfDDxQ3imVVM4WWIpc
 J6hvV9Aq7ZZTRDzXNTbT+PaR8xDflByUPobCggh9QIlnH1rX9AHo2bj5GnsHz/kGAZrV
 gexHdtkIHHmatKdFd8PerKXQ2XHzOgyoATozcejZvRczrTvV4bB3Eqx7oozE9vEKxIiO
 mK6ynPFDwzV/2/e521TGcVaePnppevVziI2Mff/x0HpXIonBqWiQM2XoYtCM/eiTWkz4
 AwdA==
X-Gm-Message-State: AOAM531ex1/olROSzS3jDiFCK3cBWb8rCghm+wQkjPSoHYgUa2nMBKd2
 C0WMUI+sx1qCQo49MQ8PmWU=
X-Google-Smtp-Source: ABdhPJwU5A0wZtuaw9qWYyairTwu8vLiuSUmNJcRMbsx4nzlPh15Ob61CYLP+9zE/ftGvKvW1v/aLw==
X-Received: by 2002:a1c:b783:: with SMTP id h125mr443424wmf.108.1605629985398; 
 Tue, 17 Nov 2020 08:19:45 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id c2sm30184452wrf.68.2020.11.17.08.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:19:44 -0800 (PST)
Date: Tue, 17 Nov 2020 16:19:42 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: P J P <ppandit@redhat.com>
Subject: Re: About 'qemu-security' mailing list
Message-ID: <20201117161942.GA147428@stefanha-x1.localdomain>
References: <20200914101517.GD579094@stefanha-x1.localdomain>
 <nycvar.YSQ.7.78.906.2009151536090.10832@xnncv>
 <20200916111025.GA756728@stefanha-x1.localdomain>
 <nycvar.YSQ.7.78.906.2009181031500.10832@xnncv>
 <m2362z8dvx.fsf@oracle.com>
 <nycvar.YSQ.7.78.906.2010011502290.830962@xnncv>
 <m2mu166uyg.fsf@oracle.com>
 <nycvar.YSQ.7.78.906.2010012320290.830962@xnncv>
 <nycvar.YSQ.7.78.906.2010161910530.1246156@xnncv>
 <20201117144612.GA140001@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline
In-Reply-To: <20201117144612.GA140001@stefanha-x1.localdomain>
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=stefanha@gmail.com; helo=mail-wm1-x330.google.com
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


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2020 at 02:46:12PM +0000, Stefan Hajnoczi wrote:
> On Fri, Oct 16, 2020 at 07:47:01PM +0530, P J P wrote:
>=20
> I have CCed everyone from the Security Process wiki page so they can
> participate in discussing changes to the process.
>=20
> > * So ie. we need to:
> >=20
> >   1. Create/setup a regular non-encrypted 'qemu-security' list.
> >=20
> >   2. Invite representatives from user/downstream communities to subscri=
be to=20
> >      it.
> >=20
> >   3. Collect & store their PGP public keys. Also create a key for the l=
ist.
> >=20
> >   4. Write 'encrypt & email' automation tool(s) to provide encryption s=
upport.
> >=20
> >   5. Document and publish above details and list workflow on a page.
> >=20
> >=20
> > ...wdyt?
>=20
> Writing/maintaining automation tools will take time so I suggest going
> with confidential GitLab Issues instead:
> https://docs.gitlab.com/ee/user/project/issues/confidential_issues.html
>=20
> If you would like to test GitLab Issues, please post your username and
> you will be given the "Reporter" role so you can view confidential
> issues.
>=20
> I have created a confidential issue here (you'll get 404 if you don't
> have permissions to view it):
> https://gitlab.com/qemu-project/qemu/-/issues/2
>=20
> The intention is to migrate QEMU's bug tracker from Launchpad to GitLab
> so this will unify reporting regular bugs and security bugs. It also
> uses encryption all the time instead of relying on users explicitly
> encrypting emails.

Dan and I tried out confidential issues and unfortunately it is
currently too limited for our workflow.

It is not possible to add non-members to a confidential issue. Members
need at least the 'Reporter' role to view confidential issues, and then
they can view all of them (!).

This means there is no way of working on a need-to-know basis. We would
have to give anyone who ever needs to comment on an issue access to all
other issues :(.

Dan found this open feature request from 2 years ago:
https://gitlab.com/gitlab-org/gitlab/-/issues/20252

For now I think we should stick to email. I'm still concerned about the
prospect of writing custom mailing list software and hosting it
somewhere. Can we run an encrypted mailing list without developing the
software ourselves?

Stefan

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+z+B4ACgkQnKSrs4Gr
c8jGeggApC8dADSPIDux+JNVLFg9iEIv/7cOi796h5knsBjGr5qsqE0S8kG97Vvh
JunlY+jovEllWP0PKUd+ZQJWYG4Hxvs0r9zi39m2S9xB16Uwm80vOe7JgOKoK2nO
+WePBN2c5qFiA+46W3V+C46t1nnk5dmjVUun/vfPiOOtPCTm4h+78oTpRCXzzIsY
VCsnWkJo3seSzbn1JLIVdoS67iNZ8oW+ilcixgxZdqp4/uStUKRdf+LmMMUstk3/
c85h12dx6HhVBaB0hbANy3vF5CU1SmmIlw1mPi54X4ftianNThaHtfsW5KC+dnmU
vAKIBDkM27DC8PHhZaPzEjGe2o0rfA==
=Xmnk
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--

