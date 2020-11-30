Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA48F2C8520
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 14:29:04 +0100 (CET)
Received: from localhost ([::1]:38048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjjEl-0000HF-Oc
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 08:29:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kjj9E-0004VD-Rl
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 08:23:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kjj9C-0002yv-Jk
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 08:23:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606742596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jU/Q7U2T8I/rS2YPDcU/8UMYzU96RGPhQwNh0MfAxLI=;
 b=W56+CmbaeAtUZafTemDbOZmzPb7jGYm/tL68n+IGEmofhxdHk7LefBvr5yQbNDs1zxfpiK
 xNP1SRO0B5Kh6eCC/UtqMOxnROgygDmNfprTZRhyvCSaRO75uRnYsd+9stdCBhpq/Fb/uC
 jOv/5sLejX/hhYN1i/WuJU2RmBbrS10=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-M3w_N3xbOHase7PPjA4ZKA-1; Mon, 30 Nov 2020 08:23:12 -0500
X-MC-Unique: M3w_N3xbOHase7PPjA4ZKA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B6FB107AD9A;
 Mon, 30 Nov 2020 13:23:02 +0000 (UTC)
Received: from localhost (ovpn-115-30.ams2.redhat.com [10.36.115.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 147E071C8A;
 Mon, 30 Nov 2020 13:23:00 +0000 (UTC)
Date: Mon, 30 Nov 2020 13:23:00 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: Proposal for a regular upstream performance testing
Message-ID: <20201130132300.GD422962@stefanha-x1.localdomain>
References: <3a664806-8aa3-feb4-fb30-303d303217a8@redhat.com>
 <20201126094338.GB1122957@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201126094338.GB1122957@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IDYEmSnFhs3mNXr+"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?utf-8?B?THVrw6HFoQ==?= Doktor <ldoktor@redhat.com>,
 Charles Shih <cheshi@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--IDYEmSnFhs3mNXr+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2020 at 09:43:38AM +0000, Daniel P. Berrang=C3=A9 wrote:
> On Thu, Nov 26, 2020 at 09:10:14AM +0100, Luk=C3=A1=C5=A1 Doktor wrote:
> > Ideally the community should have a way to also issue their custom buil=
ds
> > in order to verify their patches so they can debug and address issues
> > better than just commit to qemu-master.
>=20
> Allowing community builds certainly adds an extra dimension of complexity
> to the problem, as you need some kind of permissions control, as you can'=
t
> allow any arbitrary user on the web to trigger jobs with arbitrary code,
> as that is a significant security risk to your infra.

syzkaller and other upstream CI/fuzzing systems do this, so it may be
hard but not impossible.

> I think I'd just suggest providing a mechanism for the user to easily spi=
n
> up performance test jobs on their own hardware. This could be as simple
> as providing a docker container recipe that users can deploy on some
> arbitrary machine of their choosing that contains the test rig. All they
> should need do is provide a git ref, and then launching the container and
> running jobs should be a single command. They can simply run the tests
> twice, with and without the patch series in question.

As soon as developers need to recreate an environment it becomes
time-consuming and there is a risk that the issue won't be reproduced.
That doesn't mean the system is useless - big regressions will still be
tackled - but I think it's too much friction and we should aim to run
community builds.

> > The problem with those is that we can not simply use travis/gitlab/...
> > machines for running those tests, because we are measuring in-guest
> > actual performance.
>=20
> As mentioned above - distinguish between the CI framework, and the
> actual test runner.

Does the CI framework or the test runner handle detecting regressions
and providing historical data? I ask because I'm not sure if GitLab CI
provides any of this functionality or whether we'd need to write a
custom CI tool to track and report regressions.

Stefan

--IDYEmSnFhs3mNXr+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/E8jMACgkQnKSrs4Gr
c8hQIgf/Q1numMs5JblzILyWs6UsJgl40OwoP8oNtZbmBT/xslYCkeevRLGXCO5V
k4IltZhVElhn28A8KeeCx0EOBSFpWVFWDcrsV3eRKhochGpldKoWdsKjZcdcwIaB
RD/Dbwm9jUUa7Ty0MISNYC9CdSx/p9xfTvyO1l4QWODxPbXZ68a0C9L0wdjWh6tV
6DlIcqHHvXy/CmL9VS7X2XcQWp1QnWLAdfCS/jec+Be5HgYWvOQdqkycNbJZLJA6
HZ2Rq8b2mvNKxxA0WtfcDcmwDT7UMpX5R/NczpAFmdvggHZUs2YkFFNyAlEgM2GL
r+1ZS8htNsYtZa40p3AcZPx/gaQb0w==
=5HiT
-----END PGP SIGNATURE-----

--IDYEmSnFhs3mNXr+--


