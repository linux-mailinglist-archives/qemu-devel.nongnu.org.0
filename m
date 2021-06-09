Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542DE3A1814
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 16:55:43 +0200 (CEST)
Received: from localhost ([::1]:33904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzcM-0002wn-6Y
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 10:55:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lqzba-0002IH-Ei
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:54:54 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lqzbY-0002N5-GG
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:54:54 -0400
Received: by mail-wr1-x436.google.com with SMTP id l2so25856059wrw.6
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 07:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hDNUtz/UhuLV/PMZxh/gV6QURyUYq+/T/jq5OgKMvfc=;
 b=oTzrssDbCPIddidaclg+QXAY1PHl2ekws3GPT/kd8+Mx1mByCVECLcMQUYjLV8faIq
 NYsYt8pnQGhX6NsAlyXtcSczkfnVbooXKnBplpNbVFLHdlE/hFRschTQod+YE8F9Xb+M
 7LcL6fbltYOXrXGRXr75Ld+zGmHcPR/GJSdYGl24jUWUvBBX0q4SSkR+GKkQpvvzEZe0
 BeYaeJZzAwMzAgLVcps5YSsAaJ7Lub6/0eG5xHE1PGPxrHC7mNY/cHJNcSIMXHTDhEdL
 cUNNpOdNZq1SGxLXLEOnSi2fTTqvh+jMIP8DdVPi5O9/5cDOTy+xg6/5rEX2mMuRKSop
 toUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hDNUtz/UhuLV/PMZxh/gV6QURyUYq+/T/jq5OgKMvfc=;
 b=mkWAlZxoOc2CJ99RTkPBTFux+W5qzmQCYK2eUmvlIP3DIBw2UNOiWBLAvfYEZLN6l7
 Av8qier7dJorURcHAZBxyAw1ew2BUQPiQ+sg4e40j4fQuSCdSV1W+Hi6nTOELEJ4NKyK
 NWd9g4Tq+q0bd0hc6euqqHO8j9RDa6y4yZpTDO3IWLawtwVnJuwJVxOB6Tp0skOPGgsE
 KARP2ZzOUqfX4K8g1NDAUbxqxtYZ8V92mnEvKBcvEbF49i0ARk3pxh5uy4JJw3GLQ1Fy
 FNx0wrYXswMyzsVTkbg2nYD7iNsVo/kaWVLYseKiLbNNbInaQl7WdJeuvAp81yiFKPeE
 Cxtw==
X-Gm-Message-State: AOAM532D5wzpdlDQ2KyKpWkKKjzQS72oKqtRqiWj65zUeCpjY/WtQMO9
 yBpL1C2NTugQgykAJGtIJv8=
X-Google-Smtp-Source: ABdhPJx2kg2GWBiBOaXugXw7XXvFrWkuXRgwJeyyRMBukAZ6TwC19RvRC8Y3UQOe7GmQ+34T6Ew/qQ==
X-Received: by 2002:adf:f346:: with SMTP id e6mr197529wrp.179.1623250490988;
 Wed, 09 Jun 2021 07:54:50 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id m23sm5790083wms.2.2021.06.09.07.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 07:54:50 -0700 (PDT)
Date: Wed, 9 Jun 2021 15:54:48 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Cleber Rosa Junior <crosa@redhat.com>
Subject: Re: [PATCH v6 4/4] Jobs based on custom runners: add job definitions
 for QEMU's machines
Message-ID: <YMDWOIN469m4/LPu@stefanha-x1.localdomain>
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-5-crosa@redhat.com>
 <9770910a-f586-0b79-395c-7154c4693690@amsat.org>
 <CA+bd_6+-je9t3DzegS0uiyC9fCYF++sMXkRJhAz1Dxe2zz-v1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1futLhYO3lAoucB2"
Content-Disposition: inline
In-Reply-To: <CA+bd_6+-je9t3DzegS0uiyC9fCYF++sMXkRJhAz1Dxe2zz-v1A@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=stefanha@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <willianr@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--1futLhYO3lAoucB2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 08, 2021 at 09:36:37AM -0400, Cleber Rosa Junior wrote:
> On Tue, Jun 8, 2021 at 2:30 AM Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> wrote:

Here are my thoughts. It's just my opinion based on experience running
the old QEMU Buildbot infrastructure and interacting with our hosting
providers. I'm not planning to actively work on the CI infrastructure,
so if you have a strong opinion and want to do things differently
yourself, feel free.

> > Who has access to what and should do what (setup)? How is this list of
> > hw managed btw? Should there be some public visibility (i.e. Wiki)?
> >
>=20
> These are good questions, and I believe Alex can answer them about those
> two machines.  Even though I hooked them up to GitLab, AFAICT he is the
> ultimate admin (maybe Peter too?).
>=20
> About hardware management, it has been suggested to use either the Wiki or
> a MAINTAINERS entry.  This is still unresolved and feedback would be
> appreciated.  For me to propose a MAINTAINERS entry, say, on a v7, I'd ne=
ed
> the information on who is managing them.

Here is the wiki page that lists project resources (machines, etc):
https://wiki.qemu.org/AdminContacts

We can continue to use this page.

> > Is there a document explaining what are the steps to follow for an
> > entity to donate / sponsor hardware? Where would it be stored, should
> > this hw be shipped somewhere? What documentation should be provided for
> > its system administration?

A document is needed that explains the process and the
roles/responsibilities of the people involved.

QEMU doesn't have a physical presence and we currently don't have a way
to host physical machines. We also probably shouldn't get involved in
that because it has a high overhead and puts the responsibility on the
project to maintain the hardware. There are hosting providers like
OSUOSL that offer non-x86 architectures, so I don't think we need to
deal with physical hardware even for other architectures. If someone
needs their special hardware covered, let them act as the sponsor and
sysadmin for that machine - they'll need to figure out where to host it.

> > In case an entity manages hosting and maintenance, can the QEMU project
> > share the power bill? Up to which amount?
> > Similar question if a sysadmin has to be paid.

No, it's too complicated. QEMU does not have regular income that could
be used for periodic expenses. We shouldn't spend time worrying about
this unless there is a real need and plenty of funding.

> > If the QEMU project can't spend money on CI, what is expected from
> > resource donators? Simply hardware + power (electricity) + network
> > traffic? Also sysadmining and monitoring? Do we expect some kind of
> > reliability on the data stored here or can we assume disposable /
> > transient runners?

Sponsors provide access to internet-connected machines. They can
designate a QEMU community volunteer to admin machines or they can admin
the machine themselves.

Sysadmins deal with keeping the machine online (security, network
traffic, monitoring, etc).

For simplicity it's best if sponsored machines are owned and paid for by
the sponsor. Billing electricity, bandwidth, etc to QEMU will make
things complicated and we don't have the admin infrastructure to support
that.

> > Should donators also provide storage? Do we have a minimum storage
> > requirement?

Sponsors provide storage. There is a minimum storage requirement that
depends on the nature of CI jobs (I don't know what the exact amount
is and it may change over time).

> > Where is defined what belong to the project, who is responsible, who can
> > request access to this hardware, what resource can be used?

Machines belong to their sponsors, not to the QEMU project. They could
go away in the future if the sponsor decides to withdraw them.

Only the sysadmin has ssh access to the machine. The CI system provides
access to logs so that ssh access to machines is not necessary for QEMU
developers. If ssh access is needed then the developer can ask the
sysadmin for help.

Regarding resource usage, that's up to the sysadmin. If they want to
apply resource limits to the CI environment they need to configure that.

Stefan

--1futLhYO3lAoucB2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDA1jgACgkQnKSrs4Gr
c8jy1ggAln7WdwPqo8p3hLarvwPOe4J11v41M77PPmNy0HJPQ1A6Rj+Fc4cO2Au7
kq+fc417KV7rin5iqh4NVQfDfxkJyfXG+N5+VEPLM1TIwEjy9Cyy/5Qntx7pEbfL
OCgx0aem0RS1bFkFepbSdZkAvO0y8LJ6yaK3Fsq20Vxmy3fsAUjvPQluzCXE4E+g
WBU+V+oJkotp7HlAvzbxNeuHr0Zm5BXs2qSAfaTIDz612mYMwasYV3BcKi+vVFK/
9/tQ2bnGwU4nC5jsOPd2m9Ho+NpPmDMYEssjdn1d8X/zFFPZr/aKPBZKa/42O6JZ
kbgMf6WB0A2gaYJ3bf3CTfvuwens1Q==
=S76q
-----END PGP SIGNATURE-----

--1futLhYO3lAoucB2--

