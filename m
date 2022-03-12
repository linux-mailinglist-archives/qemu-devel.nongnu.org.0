Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3D44D6F54
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Mar 2022 14:53:30 +0100 (CET)
Received: from localhost ([::1]:36074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nT2BU-0004ZK-KP
	for lists+qemu-devel@lfdr.de; Sat, 12 Mar 2022 08:53:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nT29Z-0003o0-Nq
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 08:51:29 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:52057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nT29X-0004Sm-7H
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 08:51:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=/qIYf/6EigJ9dRDcWI3alE0Tbf6f6Cpg1TBIbnaBUkw=; b=NPQvwNbnrhlW9y8LAKqp9ui8ho
 jNwt00qWQRpmmWC1VJJXosSBRc1ejRpJSWcpM6KQWyH93LPTki1bp19H+o4lTCW8L4JhX4hz0Eykt
 1vu+I+vwOClaM45Hrcb0qRjwAOaWYsPfpiglaiWffQ3rZ1cuF4wEX4jMewycgceyhP+G1xTzxkMg3
 O95XrpT/BaTK9bWYmkMUlVycixZwYwXiDZg2mn/a3O61UcH9aVxvAVZ7rI/5xsrW09H3+XwLUpDuK
 YyZBKWKBckKGscf2rfWlF3D503rqibWL/5wA5DGYnP9GayAJ/1U6+NgPG58wIAK7n2koR3WFCjooK
 7JVc0g/opbLU/Z3+rf63CYTp39XGs3qVA/8eYQyj9EBX2XK57V/digl6PqNOJT3vBHhOFFN6MIaOg
 CGXFFG2WHvGuwkzUHhssGyP+fwVzEWT+xgfXl0IESjbyzUn+ZjjacnF2vhAh5S1Zvfy3KHdMB0UCm
 dun66PqNfVogI3KCUBp/BLVFLYeG6cljJf/nbLHktT8CzPV/RUvtC6bIE/q9O7PYbWPXL8Tu4HtQk
 /eu2AiAF80hZv6LDFKD/24YLXkaY57V6PsbMy7pSZl+GE3XqeX/kUdJiqu0nNbTpjWHTsL/YN7AGy
 2HLtF6RF7Q9EzfBrwLrTHxkHP5n9y3c4H3YSgPPfk=;
To: qemu-devel@nongnu.org,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philippe.mathieu.daude@gmail.com>,
 Joelle van Dyne <j@getutm.app>, Stefan Hajnoczi <stefanha@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: MAINTAINERS: macOS host support (was: MAINTAINERS: take edk2)
Date: Sat, 12 Mar 2022 14:51:21 +0100
Message-ID: <1978631.qOGrPXpdaL@silver>
In-Reply-To: <YisV10u6lbemEtHA@redhat.com>
References: <20220308145521.3106395-1-kraxel@redhat.com>
 <1799774.TS5kVz7OSp@silver> <YisV10u6lbemEtHA@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Christian Schoenebeck <qemu_oss@crudebyte.com>
From:  Christian Schoenebeck via <qemu-devel@nongnu.org>

On Freitag, 11. M=E4rz 2022 10:26:47 CET Daniel P. Berrang=E9 wrote:
> On Fri, Mar 11, 2022 at 10:13:24AM +0100, Christian Schoenebeck wrote:
> > On Donnerstag, 10. M=E4rz 2022 12:40:06 CET Philippe Mathieu-Daud=E9 wr=
ote:
> > > +Stefan for overall project resources.
> > >=20
> > > On 10/3/22 12:07, Daniel P. Berrang=E9 wrote:
> > > > On Thu, Mar 10, 2022 at 12:00:35PM +0100, Christian Schoenebeck wro=
te:
> > > >> On Mittwoch, 9. M=E4rz 2022 12:44:16 CET Daniel P. Berrang=E9 wrot=
e:
> > > >>> On Wed, Mar 09, 2022 at 11:40:42AM +0100, Christian Schoenebeck=20
wrote:
> > > >>>> On Mittwoch, 9. M=E4rz 2022 11:05:02 CET Philippe Mathieu-Daud=
=E9=20
wrote:
> > > >>>>> Not sure what you have in mind. I'm totally new to the
> > > >>>>> macOS/Darwin
> > > >>>>> world, and have no choice but to use it as primary workstation =
and
> > > >>>>> for CI builds, so I can help with overall testing / maintenance.
> > > >>>>>=20
> > > >>>>> Peter, since you take some macOS patches, would you like to
> > > >>>>> maintain
> > > >>>>> this officially? Since I doubt you want to take yet another
> > > >>>>> responsibility, what about having a co-maintained section,
> > > >>>>> including
> > > >>>>> technical expertise from Akihiko / Joelle / Christian? (Cc'ed)
> > > >>>>>=20
> > > >>>>> Regards,
> > > >>>>=20
> > > >>>> Also CCing Cameron on this, just in case someone at Apple could
> > > >>>> spend
> > > >>>> some
> > > >>>> slices on QEMU macOS patches in general as well.
> > > >>>>=20
> > > >>>> As for my part: I try to help out more on the macOS front. As
> > > >>>> there's
> > > >>>> now
> > > >>>> macOS host support for 9p I have to start QEMU testing on macOS
> > > >>>> locally
> > > >>>> anyway. Too bad that macOS CI tests on Github are no longer
> > > >>>> available
> > > >>>> BTW.
> > > >>>=20
> > > >>> Note QEMU gets macOS CI coverage in GitLab. We use a clever trick=
 by
> > > >>> which we use 'cirrus-run' from the GitLab job to trigger a build =
in
> > > >>> Cirrus CI's macOS builders, and pull the results back when its do=
ne.
> > > >>>=20
> > > >>> Any contributor can get this working on their QEMU fork too, if t=
hey
> > > >>> configure the needed Cirrus CI API token. See the docs in
> > > >>>=20
> > > >>>     .gitlab-ci.d/cirrus/README.rst
> > > >>>=20
> > > >>> This is enough for build + automated tests.
> > > >>=20
> > > >> Does this mean that people no longer have to pull their credit card
> > > >> just
> > > >> for running CI tests on Gitlab?
> > > >=20
> > > > Not really. The CC validation is something GitLab have had to force
> > > > onto all new accounts due to cryptominer abuse of their free shared
> > > > CI runners :-( If you have VMs somewhere you could theoretically
> > > > spin up your own CI runners instead of using the shared runners and
> > > > that could avoid the CC validation need.
> > >=20
> > > Not that trivial, first you need to figure out the list of dependenci=
es
> > > GitLab images come with, then you realize you need 50GiB+ of available
> > > storage a single pipeline (due to all the Docker images pulled / buil=
t)
> > > and you also need a decent internet link otherwise various jobs timeo=
ut
> > > randomly, then you have to wait 20h+ with a quad-core CPU / 16GiB RAM,
> >=20
> > Considering that CI jobs currently take about 1 hour on Gitlab, which
> > processor generation are you referring to that would take 20 hours?
>=20
> You're not taking into account parallelism. The GitLab pipeline takes
> 1 hour wallclock time, which is not the same as 1 hour CPU time. We
> probably have 20+ jobs running in parallel on gitlab, as they get
> farmed out to many machines. If you have only a single machine at your
> disposal, then you'll have much less prallelism, so overall time can
> be much longer.
>=20
> > > and eventually you realize you lost 3 days of your life to not regist=
er
> > > your CC which you'll be forced to give anyway.
> >=20
> > It's an obstacle. And that keeps people away. Plus the trend seems to be
> > that free CI services disappear one by one, so I am not so sure that
> > giving your credit card once solves this issue for good.
>=20
> The CC requirement there is primarily to act as an identity check
> on accounts, so they have some mechanism to discourage and/or trace
> abusive users. You can use it to purchase extra CI time, but they've
> stated multiple times their intention to continue to grant free CI
> time to open source projects and their contributors. They are actively
> discussing their plans with a number of open source project contributors
> including myself on behalf of QEMU, to better understand our needs. I
> outlined my current understanding of their intentions here:
>=20
>  https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg03962.html

Please send an announcement (in subject) and/or CC maintainers if there are=
=20
any news on this topic. This discussion went completely unseen on my end.

> > > Long term maintainers don't realize that because they had the luxury =
to
> > > open their GitLab account soon enough and are now privileged.
> >=20
> > Would it be possible to deploy all CI jobs via Cirrus-CI?
>=20
> Not unless you want to wait 10 hours for the pipeline to finish. Cirrus
> CI only lets you run 2 jobs at a time. It also doesn't have any integrated
> container registry which we rely on for creatnig our build env.

=46or the vast majority of contributors that would be absolutely fine. What=
=20
matters is running tests for the various architectures. Average response ti=
me=20
on submitted patches is much longer than 10 hours. Still better than not=20
running CI tests at all.

Best regards,
Christian Schoenebeck



