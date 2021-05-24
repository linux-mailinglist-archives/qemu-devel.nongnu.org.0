Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF7F38E81B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 15:54:19 +0200 (CEST)
Received: from localhost ([::1]:39426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llB2A-0006Mc-LM
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 09:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llB0Y-0005Zz-4X
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:52:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llB0O-0005CU-Rw
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:52:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621864346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H5YrSkqA++zzxvWnglRC00fGdqZrEQ45ToPevhVMrew=;
 b=iE2J56hpZWAdcIEo2SceAzPg3CjPkWPci4J2bresijl+uCjIrACqQLMGYZs/yeyngfgPj0
 BOGHxR0vdBAjw6aZFvFWKz2uGU3HYBRchr/PypOetegEUHlzF3Ed1L7qVNYqMWcx0LQc2F
 Sd+WbWohL1tNOoKPr3qxIuLePGC/dao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-bN0AG8WOOQyixbivboZ_FQ-1; Mon, 24 May 2021 09:52:23 -0400
X-MC-Unique: bN0AG8WOOQyixbivboZ_FQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11CE1189D8F3;
 Mon, 24 May 2021 13:51:25 +0000 (UTC)
Received: from localhost (ovpn-113-244.ams2.redhat.com [10.36.113.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 884D25D9D3;
 Mon, 24 May 2021 13:51:24 +0000 (UTC)
Date: Mon, 24 May 2021 14:51:23 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v3 4/6] gitlab-ci: Add ccache in $PATH and display
 statistics
Message-ID: <YKuvWyg50fMGeVkF@stefanha-x1.localdomain>
References: <20210519184549.2192728-1-f4bug@amsat.org>
 <20210519184549.2192728-5-f4bug@amsat.org>
 <5a77ade3-1a6c-2389-4a1c-2c7c2266f298@redhat.com>
 <20c001a0-60ed-df08-b67d-884022e74d04@amsat.org>
 <396e75d2-fe22-3054-fbee-d6de02339b2a@redhat.com>
 <YKeQkqviHbxqcC6Y@redhat.com>
 <afa421f3-337a-c488-c767-b73aaf3780b8@redhat.com>
 <YKefRcVrr9Gtehlk@redhat.com>
 <c7f01111-bada-49b1-ebce-03e6eff96aae@amsat.org>
 <YKes/fqDNT4G9jx/@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YKes/fqDNT4G9jx/@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+Zu8HR2jWnVL/P+8"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--+Zu8HR2jWnVL/P+8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 21, 2021 at 01:52:13PM +0100, Daniel P. Berrang=E9 wrote:
> On Fri, May 21, 2021 at 02:27:26PM +0200, Philippe Mathieu-Daud=E9 wrote:
> > On 5/21/21 1:53 PM, Daniel P. Berrang=E9 wrote:
> > > On Fri, May 21, 2021 at 01:02:51PM +0200, Thomas Huth wrote:
> > >> On 21/05/2021 12.50, Daniel P. Berrang=E9 wrote:
> > >>> On Fri, May 21, 2021 at 12:48:21PM +0200, Thomas Huth wrote:
> > >>>> On 20/05/2021 13.27, Philippe Mathieu-Daud=E9 wrote:
> > >>>>> +Stefan/Daniel
> > >>>>>
> > >>>>> On 5/20/21 10:02 AM, Thomas Huth wrote:
> > >>>>>> On 19/05/2021 20.45, Philippe Mathieu-Daud=E9 wrote:
> > >>>>>>> If a runner has ccache installed, use it and display statistics
> > >>>>>>> at the end of the build.
> > >>>>>>>
> > >>>>>>> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> > >>>>>>> ---
> > >>>>>>>   =A0 .gitlab-ci.d/buildtest-template.yml | 5 +++++
> > >>>>>>>   =A0 1 file changed, 5 insertions(+)
> > >>>>>>>
> > >>>>>>> diff --git a/.gitlab-ci.d/buildtest-template.yml
> > >>>>>>> b/.gitlab-ci.d/buildtest-template.yml
> > >>>>>>> index f284d7a0eec..a625c697d3b 100644
> > >>>>>>> --- a/.gitlab-ci.d/buildtest-template.yml
> > >>>>>>> +++ b/.gitlab-ci.d/buildtest-template.yml
> > >>>>>>> @@ -6,13 +6,18 @@
> > >>>>>>>   =A0=A0=A0=A0=A0=A0=A0 then
> > >>>>>>>   =A0=A0=A0=A0=A0=A0=A0=A0=A0 JOBS=3D$(sysctl -n hw.ncpu)
> > >>>>>>>   =A0=A0=A0=A0=A0=A0=A0=A0=A0 MAKE=3Dgmake
> > >>>>>>> +=A0=A0=A0=A0=A0=A0=A0 PATH=3D/usr/local/libexec/ccache:$PATH
> > >>>>>>>   =A0=A0=A0=A0=A0=A0=A0=A0=A0 ;
> > >>>>>>>   =A0=A0=A0=A0=A0=A0=A0 else
> > >>>>>>>   =A0=A0=A0=A0=A0=A0=A0=A0=A0 JOBS=3D$(expr $(nproc) + 1)
> > >>>>>>>   =A0=A0=A0=A0=A0=A0=A0=A0=A0 MAKE=3Dmake
> > >>>>>>> +=A0=A0=A0=A0=A0=A0=A0 PATH=3D/usr/lib/ccache:/usr/lib64/ccache=
:$PATH
> > >>>>>>
> > >>>>>> That does not make sense for the shared runners yet. We first ne=
ed
> > >>>>>> something to enable the caching there - see my series "Use ccach=
e in the
> > >>>>>> gitlab-CI" from April (which is currently stalled unfortunately)=
.
> > >>>>>
> > >>>>> TL;DR: I don't think we should restrict our templates to shared r=
unners.
> > >>>>
> > >>>> I'm certainly not voting for restricting ourselves to only use sha=
red
> > >>>> runners here - but my concern is that this actually *slows* down t=
he shared
> > >>>> runners even more! (sorry, I should have elaborated on that in my =
previous
> > >>>> mail already)
> > >>>>
> > >>>> When I was experimenting with ccache in the shared runners, I saw =
that the
> > >>>> jobs are running even slower with ccache enabled as long as the ca=
che is not
> > >>>> populated yet. You only get a speedup afterwards. So if you add th=
is now
> > >>>> without also adding the possibility to store the cache persistentl=
y, the
> > >>>> shared runners will try to populate the cache each time just to th=
row away
> > >>>> the results afterwards again. Thus all the shared runners only get=
 slower
> > >>>> without any real benefit here.
> > >>>>
> > >>>> Thus we either need to get ccache working properly for the shared =
runners
> > >>>> first, or you have to think of a different way of enabling ccache =
for the
> > >>>> non-shared runners, so that it does not affect the shared runners
> > >>>> negatively.
> > >>>
> > >>> Is there anything functional holding up your previous full cccache =
support
> > >>> series from last month ? Or is it just lack of reviews ?
> > >>
> > >> It's basically the problems mentioned in the cover letter and Stefan=
's
> > >> comment here:
> > >>
> > >>  https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg02219.html
> > >=20
> > > I'm not sure I understand why Stefan thinks gitlab's caching doesn't
> > > benefit ccache. We add ccache for libvirt GitLab CI, and AFAIR it
> > > sped up our builds significantly.
> >=20
> > I think Stefan is referring to a comment I made, when using both
> > shared runners and dedicated runners (what I'm currently testing)
> > various jobs are stuck transferring artifacts/cache {FROM, TO}
> > {shared, dedicated} runners at the same time, which is sub-optimal
> > because it saturate the dedicated runner network link.
>=20
> I think we're over thinking things a bit too much and worrying about
> scenarios that we're not actually hitting that frequently today, and
> delaying the benefit for everyone.

Thomas' original email indicated using ccache with QEMU isn't
necessarily a win:

  Additionally, the jobs are sometimes running even slower, e.g. if the
  cache has not been populated yet or if there are a lot of cache
  misses,

Let's measure the time taken both on first run and on a subsequent run.
This information can be included in the patch series cover letter so we
know ccache performance has been measured and it works well.

Stefan

--+Zu8HR2jWnVL/P+8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCrr1sACgkQnKSrs4Gr
c8hmRAf/TiCHDmPeVCOXz2lAn/2HoSU7Otw7B2iTwsLgvDPjoMymMXQczkcAKou0
TGapRmcD5xMiglMxj+oXG7bHJbOy1VudTiTCcwx5kTvO8q22KrV++vEe32CJyU3B
tCj4K3EHsgh2oQ7P8RFne/ZUkfid9EG5vkrDRaYzu5Rths78fijS+81e1qh1A4QP
ZNig3px3kcnobUFp7J5NVky1lJOrCz2OdKtU5kV5Y3q7h6RyHZ3iVzt/3REyhIMH
Tu193S5redlazFZR7u+GNs1/FGCAvsTQ9MDkbJYfiWSIPI5UlnlTvJv/01+WSnDY
8zeyrYJAnh9nOXjPs5wdLsMzS5ABtA==
=U3S9
-----END PGP SIGNATURE-----

--+Zu8HR2jWnVL/P+8--


