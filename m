Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F2F390AA2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 22:45:15 +0200 (CEST)
Received: from localhost ([::1]:45310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lldvO-00018X-Ne
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 16:45:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lldtR-0008R8-Ki
 for qemu-devel@nongnu.org; Tue, 25 May 2021 16:43:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lldtM-0007SH-Vw
 for qemu-devel@nongnu.org; Tue, 25 May 2021 16:43:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621975386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1nEw7/tclR5oSbZ3HEr09puE0oGsz6+Ych0UuhY+aJ0=;
 b=TwhhkRWiCP21I1aRDYyGdnE/sYweDY9ryPxg4J1gsNrfBJCRtX/YOYJK1hyXiUjAsnvwpZ
 alCrm/xy00b4OIIIa1zRC0EtI1OB1akSLnuQDdNOvNKJzSQG7Q5fVTE/j2RWW2b4mou5B/
 H3uaFnYNVrVPF4DBV/615hZ/JHUtkRs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-ap23LxZRNai2HDZzKeI9yw-1; Tue, 25 May 2021 16:43:02 -0400
X-MC-Unique: ap23LxZRNai2HDZzKeI9yw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EC871922960;
 Tue, 25 May 2021 20:43:01 +0000 (UTC)
Received: from localhost (ovpn-114-2.phx2.redhat.com [10.3.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 174F51007606;
 Tue, 25 May 2021 20:42:54 +0000 (UTC)
Date: Tue, 25 May 2021 16:42:37 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 23/25] python: add .gitignore
Message-ID: <20210525204237.GG1567491@amachine.somewhere>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-24-jsnow@redhat.com>
 <YK1RqhFrWt6yHuRt@localhost.localdomain>
 <0d0053ab-4410-e905-7261-332f21fd8852@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0d0053ab-4410-e905-7261-332f21fd8852@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yZnyZsPjQYjG7xG7"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--yZnyZsPjQYjG7xG7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 04:10:55PM -0400, John Snow wrote:
> On 5/25/21 3:36 PM, Cleber Rosa wrote:
> > On Wed, May 12, 2021 at 07:12:39PM -0400, John Snow wrote:
> > > Ignore *Python* build and package output (build, dist, qemu.egg-info)=
;
> > > these files are not created as part of a QEMU build.
> > >=20
> > > Ignore miscellaneous cached python confetti (__pycache__, *.pyc,
> > > .mypy_cache).
> > >=20
> > > Ignore .idea (pycharm) .vscode, and .venv (pipenv et al).
> > >=20
> > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > ---
> > >   python/.gitignore | 19 +++++++++++++++++++
> > >   1 file changed, 19 insertions(+)
> > >   create mode 100644 python/.gitignore
> > >=20
> > > diff --git a/python/.gitignore b/python/.gitignore
> > > new file mode 100644
> > > index 00000000000..e27c99e009c
> > > --- /dev/null
> > > +++ b/python/.gitignore
> > > @@ -0,0 +1,19 @@
> > > +# python bytecode cache
> > > +*.pyc
> >=20
> > This is a duplicate from the parent .gitignore, so I would avoid it.
> >=20
> > > +__pycache__/
> >=20
> > And this one is interesting because, the only thing that *should* be
> > in __pycache__ dirs is .pyc files (covered by the parent .gitignore
> > file).
> >=20
> > So, I get the same behavior without these two entries here, so I would
> > skip them.  Let me know if you have any reason for explicitly
> > including them.
> >=20
> > - Cleber.
> >=20
>=20
> Hm, not really ... Just completeness, I suppose, since this directory is
> becoming increasingly separate from the rest of the tree.
>=20
> It isn't crucial, it just seemed like a weird omission if they weren't
> listed here. *shrug*
>=20
> --js

And still, this dir is part of the overall tree.  Honestly, without
any change in behavior, I'd *not* add those two ignore rules.

Cheers,
- Cleber.

--yZnyZsPjQYjG7xG7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCtYT0ACgkQZX6NM6Xy
CfMq/Q/9GHTK1s0cvNVGSFBqh2qOugHry+18JXNnEiyvigq7ta0/b/7orxWGhalZ
1bBYw+NIZmJ6pB/wG14kunvOiHbNrFnu8YrZ3NTcSTlgIRCLXfz22x1+mRPh0Ogr
hziRnz4tuEzGpG2SOdHo/JRaHH6fFiKl8FLHye2STy1oJ64uhcBSUHF6PmRABPx6
oQ7yBhu8QfyRa4nfvw4o+8FtSYSZ8I+qY3WGlSnVdWnkr8UKTI4Oqvwzz53dKzVI
o9AdsV+paGJpQ11yQQhoeu6vcckDvoL2qPIeW5vw3wrrJ4AA14YxyqN6PnU1qgNR
CbqCzRe+sV0M8VsBFor83ACWveN7mDFHIV/hmvOJv9R/tMir5m4HAv/F0fUJUYoW
gKrtLjnPcqMFz+RLsaOOYWmqeSKsTQOJNPbz+8NRo+tDDR1CLgFTsCsfXQvUX/pX
s3A72DwKXde6LxXRMozkFU1w1vkjiZ6whg/xSNjzUyniUWOqs0Xsu1bbbwpZ/lvO
zcPJDBjwqt9XU75rsD9N7/dIiv3MeQBR4kAP1QHcMcAK6Nm5gK0HUUUB3AeOfrX7
AWzxYt1LOmiuiNcev/6u970w3pIM9TSp7Cz72T6cqpl/AJ4SJ92pJsvlQNPCIn36
UJem/KepuBQMXSh/FIzVmKr5A60T7R02wigi5vGPRtkfx97Bnkw=
=1zdp
-----END PGP SIGNATURE-----

--yZnyZsPjQYjG7xG7--


