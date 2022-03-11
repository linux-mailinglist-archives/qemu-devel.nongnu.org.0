Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD224D5E20
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 10:16:20 +0100 (CET)
Received: from localhost ([::1]:57088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSbNi-00073j-SK
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 04:16:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nSbL0-0006L0-QM
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 04:13:30 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:38423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nSbKy-0001Ja-4T
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 04:13:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=3WH6q8+OxRBTHeAnWu79R6VbAc4iNykav9VDZHJQZaM=; b=uYDJgMHe2ZSTheh1Nad4jPlDiF
 JldLSvh01RudvGhMoVQw64BkQOr8Gm6W1a4K1hF5UoLjG6QeUizGGaKQLnKADuT8lg9sQJR0hSYP6
 FWBVqvXH0fd4PYWAtI0EnnEVf9Rb8apHUVpFmCtkAU/YVnKVO0U4DMvvevFWjZo4Nc0sHLSdXvo4J
 C7QcgNygib2qhRVDOiiJfrv0OZLFfFyMM4wHk46XN+nsDJJMFxhg8Fs/mXXZzyavT9bs+hC9Rewn1
 3apoEhlfqAdk1O7YIuQS6vVU0b3SL2t+O5f+gSOXS7x1/pp6OwfttUnc+IN3P6gp3OfLxWKuiVvua
 hGBlP/4ibxsOl60rmvpAE8/a1uvaGUJr1tL94v2isshJ6jasdjAq/S9fCrTEdeCEmMcNswksaagqr
 2+h8vDdV2XZM5pQmZD3jCfboJniGwhFHInHtEx98oObIqlYpaQXEuI6klAHsJTyig6uRSfogLRQ48
 tncOBv/l+DgI8De6jR9DwbLO93O/W1SB49W/qXHbFPzqu9zbxh/nn1ngf0FrgxL6avYuNNCnyZUXO
 BvwwKsz+bqVqb5xDvZfQ21xnRPNtGbnn2j+43MrOV7almOlJyU0jgtfOZrUE8aKKvV6dXKj5Z2SKB
 tsldWXyBQkV0gMbSCJZn9mGjYc9nEgHtD7kWXrO+E=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?=
 <philippe.mathieu.daude@gmail.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Joelle van Dyne <j@getutm.app>, Cameron Esfahani <dirty@apple.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: MAINTAINERS: macOS host support (was: MAINTAINERS: take edk2)
Date: Fri, 11 Mar 2022 10:13:24 +0100
Message-ID: <1799774.TS5kVz7OSp@silver>
In-Reply-To: <b3438511-abad-b9bd-5343-7e6dacabda3c@gmail.com>
References: <20220308145521.3106395-1-kraxel@redhat.com>
 <YincBMmKYK+GzPnN@redhat.com>
 <b3438511-abad-b9bd-5343-7e6dacabda3c@gmail.com>
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

On Donnerstag, 10. M=E4rz 2022 12:40:06 CET Philippe Mathieu-Daud=E9 wrote:
> +Stefan for overall project resources.
>=20
> On 10/3/22 12:07, Daniel P. Berrang=E9 wrote:
> > On Thu, Mar 10, 2022 at 12:00:35PM +0100, Christian Schoenebeck wrote:
> >> On Mittwoch, 9. M=E4rz 2022 12:44:16 CET Daniel P. Berrang=E9 wrote:
> >>> On Wed, Mar 09, 2022 at 11:40:42AM +0100, Christian Schoenebeck wrote:
> >>>> On Mittwoch, 9. M=E4rz 2022 11:05:02 CET Philippe Mathieu-Daud=E9 wr=
ote:
> >>>>> Not sure what you have in mind. I'm totally new to the macOS/Darwin
> >>>>> world, and have no choice but to use it as primary workstation and
> >>>>> for CI builds, so I can help with overall testing / maintenance.
> >>>>>=20
> >>>>> Peter, since you take some macOS patches, would you like to maintain
> >>>>> this officially? Since I doubt you want to take yet another
> >>>>> responsibility, what about having a co-maintained section, including
> >>>>> technical expertise from Akihiko / Joelle / Christian? (Cc'ed)
> >>>>>=20
> >>>>> Regards,
> >>>>=20
> >>>> Also CCing Cameron on this, just in case someone at Apple could spend
> >>>> some
> >>>> slices on QEMU macOS patches in general as well.
> >>>>=20
> >>>> As for my part: I try to help out more on the macOS front. As there's
> >>>> now
> >>>> macOS host support for 9p I have to start QEMU testing on macOS loca=
lly
> >>>> anyway. Too bad that macOS CI tests on Github are no longer available
> >>>> BTW.
> >>>=20
> >>> Note QEMU gets macOS CI coverage in GitLab. We use a clever trick by
> >>> which we use 'cirrus-run' from the GitLab job to trigger a build in
> >>> Cirrus CI's macOS builders, and pull the results back when its done.
> >>>=20
> >>> Any contributor can get this working on their QEMU fork too, if they
> >>> configure the needed Cirrus CI API token. See the docs in
> >>>=20
> >>>     .gitlab-ci.d/cirrus/README.rst
> >>>=20
> >>> This is enough for build + automated tests.
> >>=20
> >> Does this mean that people no longer have to pull their credit card ju=
st
> >> for running CI tests on Gitlab?
> >=20
> > Not really. The CC validation is something GitLab have had to force
> > onto all new accounts due to cryptominer abuse of their free shared
> > CI runners :-( If you have VMs somewhere you could theoretically
> > spin up your own CI runners instead of using the shared runners and
> > that could avoid the CC validation need.
>=20
> Not that trivial, first you need to figure out the list of dependencies
> GitLab images come with, then you realize you need 50GiB+ of available
> storage a single pipeline (due to all the Docker images pulled / built)
> and you also need a decent internet link otherwise various jobs timeout
> randomly, then you have to wait 20h+ with a quad-core CPU / 16GiB RAM,

Considering that CI jobs currently take about 1 hour on Gitlab, which=20
processor generation are you referring to that would take 20 hours?

> and eventually you realize you lost 3 days of your life to not register
> your CC which you'll be forced to give anyway.

It's an obstacle. And that keeps people away. Plus the trend seems to be th=
at=20
free CI services disappear one by one, so I am not so sure that giving your=
=20
credit card once solves this issue for good.

> Long term maintainers don't realize that because they had the luxury to
> open their GitLab account soon enough and are now privileged.

Would it be possible to deploy all CI jobs via Cirrus-CI?

> It is unfortunate the project strongly suggest new maintainers to pass
> by that hassle and doesn't provide access to project resources instead.
>=20
> But then I know, while the project has access to FOSS hardware resources
> it doesn't have human resources to maintain them so can't use them, back
> to square one.
>=20
> Regards,
>=20
> Phil.



