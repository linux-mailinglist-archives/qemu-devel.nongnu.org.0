Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527334E2389
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 10:44:58 +0100 (CET)
Received: from localhost ([::1]:34866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWEau-0008KG-SM
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 05:44:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nWEYR-0007UA-3u
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 05:42:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nWEYO-0001F2-Q5
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 05:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647855739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+S5RYRo61lZAX+AJWvu28A5xymhSRD6+hASi5bG+Bg0=;
 b=WqtY4TVhhtfim9qEX/uTdwt+/i2X18I8cB9zzTDfARnefo53hVurE3GViRkfaYa1MN5wcD
 zZ0hfhNIZ4/ZyLpNZdtxhpfBv9S9u0qKpg6Z573pG96SfrfQVbQGDBr0fE6LRByh/Xg0C6
 vs+qEKLtNd2oCuhmKBqhy88xQnC9BEI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-mmQH8TzjO7OjE0rR_Tshlw-1; Mon, 21 Mar 2022 05:42:15 -0400
X-MC-Unique: mmQH8TzjO7OjE0rR_Tshlw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39ED61C04B69;
 Mon, 21 Mar 2022 09:42:15 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C550376EB;
 Mon, 21 Mar 2022 09:42:14 +0000 (UTC)
Date: Mon, 21 Mar 2022 09:42:13 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: =?utf-8?B?THVrw6HFoQ==?= Doktor <ldoktor@redhat.com>
Subject: Re: Proposal for a regular upstream performance testing
Message-ID: <YjhIddqwACSpoCfR@stefanha-x1.localdomain>
References: <3a664806-8aa3-feb4-fb30-303d303217a8@redhat.com>
 <a0f8c750-ed7b-908a-1a29-bf03004579e4@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Jc/zmQGIi/6Ls6II"
Content-Disposition: inline
In-Reply-To: <a0f8c750-ed7b-908a-1a29-bf03004579e4@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Charles Shih <cheshi@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Jc/zmQGIi/6Ls6II
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 21, 2022 at 09:46:12AM +0100, Luk=C3=A1=C5=A1 Doktor wrote:
> Dear qemu developers,
>=20
> you might remember the "replied to" email from a bit over year ago to rai=
se a discussion about a qemu performance regression CI. On KVM forum I pres=
ented https://www.youtube.com/watch?v=3DCbm3o4ACE3Y&list=3DPLbzoR-pLrL6q4Zz=
A4VRpy42Ua4-D2xHUR&index=3D9 some details about my testing pipeline. I thin=
k it's stable enough to become part of the official CI so people can consum=
e, rely on it and hopefully even suggest configuration changes.
>=20
> The CI consists of:
>=20
> 1. Jenkins pipeline(s) - internal, not available to developers, running d=
aily builds of the latest available commit
> 2. Publicly available anonymized results: https://ldoktor.github.io/tmp/R=
edHat-Perf-worker1/

This link is 404.

> 3. (optional) a manual gitlab pulling job which triggered by the Jenkins =
pipeline when that particular commit is checked
>=20
> The (1) is described here: https://run-perf.readthedocs.io/en/latest/jenk=
ins.html and can be replicated on other premises and the individual jobs ca=
n be executed directly https://run-perf.readthedocs.io on any linux box usi=
ng Fedora guests (via pip or container https://run-perf.readthedocs.io/en/l=
atest/container.html ).
>=20
> As for the (3) I made a testing pipeline available here: https://gitlab.c=
om/ldoktor/qemu/-/pipelines with one always-passing test and one allow-to-f=
ail actual testing job. If you think such integration would be useful, I ca=
n add it as another job to the official qemu repo. Note the integration is =
a bit hacky as, due to resources, we can not test all commits but rather te=
st on daily basis, which is not officially supported by gitlab.
>=20
> Note the aim of this project is to ensure some very basic system-level wo=
rkflow performance stays the same or that the differences are described and=
 ideally pinned to individual commits. It should not replace thorough relea=
se testing or low-level performance tests.

If I understand correctly the GitLab CI integration you described
follows the "push" model where Jenkins (running on your own machine)
triggers a manual job in GitLab CI simply to indicate the status of the
nightly performance regression test?

What process should QEMU follow to handle performance regressions
identified by your job? In other words, which stakeholders need to
triage, notify, debug, etc when a regression is identified?

My guess is:
- Someone (you or the qemu.git committer) need to watch the job status and =
triage failures.
- That person then notifies likely authors of suspected commits so they can=
 investigate.
- The authors need a way to reproduce the issue - either locally or by push=
ing commits to GitLab and waiting for test results.
- Fixes will be merged as additional qemu.git commits since commit history =
cannot be rewritten.
- If necessary a git-revert(1) commit can be merged to temporarily undo a c=
ommit that caused issues.

Who will watch the job status and triage failures?

Stefan

--Jc/zmQGIi/6Ls6II
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmI4SHQACgkQnKSrs4Gr
c8gFjgf8C6vprBITsbDlst9Pb/88HHDsN6YaXd1SryXBEh7FFJf+4dLLg5Z2wSUA
/EZuWFtoDP29vPxaPHruL0Q6q4ETE0XmYOvkCm6vOTPws9sBeE0lViItNXLBa3k5
A16dkVOgn8yObpDSwJz3sa5A+6QssuLF5Y/m7A/cnPfu8GTweNQr50QPX2bNanJo
WnNCdNVGFPwMjuBmlZVc1uvU0u/PaMbQBZ0JYyqfgRpUgUowgWTEmkMP2CWFHDWX
FnXWtVW6EmRTcUfo8vGQuHR4uNiALSAo/p0bEAYP3hmlNiTAeIbcQg9jqxoPypyT
aXsX1z2eybLfa7hF6CJmyj8a10tY3Q==
=AWeO
-----END PGP SIGNATURE-----

--Jc/zmQGIi/6Ls6II--


