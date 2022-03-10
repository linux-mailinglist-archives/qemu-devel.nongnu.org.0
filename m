Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C344D4561
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:11:52 +0100 (CET)
Received: from localhost ([::1]:42206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSGhz-0000KQ-47
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:11:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nSGXG-0003ZS-DB
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:00:48 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:33563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nSGXB-0003ZK-N3
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:00:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=CU29sLcXR7lWNcItDAxKSk7NhfwTNy7vuk5CqZz8SME=; b=U8Y5YwnbkkXY7sZOpcFZsDFKIv
 NxG6ng1JqvSTbcJm4js41xK/qBOz5hG3c29qUecl7TM9FdhHYayTZeO2i4yf373zl9oD07UrRWHOo
 SlHJP6TIX/rwVrK3mQJ2uCBEbkcygYis7YkwTwaUrz6jD23egVU6hFDvFnklncvS/oP0anOoO/EI+
 AaIx+m/zAZh1BOK9Jv0WbtuiO/6V3DWNcEokvx49HwC5hcEO/sPRd6UcO94ee9+Cu/E+IzmzWcufb
 bd02AA2PLjlyHuCKislxmlWqMHLxZ0Dkc12XaqFxlW7tDW0xnfOvHndeXHjAeS+Ist/r2YfP6zQYG
 YhX4wukiXv9hTCCs/B52NqMZvRX3Ga5PAuwpYYQSdzknq3mA1xKH3f28HTVcQ578pCMHlVixQSDEF
 btyx71ZhCOlP1TPM7+Gyg5Tp0jeIRStdvh1FKtF8jDS149lU4y4emnuLJgHJek4ufUas9fZQVsJIx
 KQnJEZtsTNy3EoRZTASTvr96pTT2z0ahTJlsXB/q+KPociQmNQ1mCrFNzGBGOdOx76dU4IaAfIm75
 0ruIz4vU8pe4lPzxq3LBcxtraM9oGtUcjZApnK0qm+S59BaJRMedlzBgNActHgKkQi56UehVMsw+M
 5qbSPPgxQS+Ebx1b9NMZQ5C8dux98pbJ144dLgk5Y=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philippe.mathieu.daude@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Joelle van Dyne <j@getutm.app>
Subject: Re: MAINTAINERS: macOS host support (was: MAINTAINERS: take edk2)
Date: Thu, 10 Mar 2022 12:00:35 +0100
Message-ID: <4171087.x6ZCljQdK5@silver>
In-Reply-To: <YiiTEAAqRIdRAlEf@redhat.com>
References: <20220308145521.3106395-1-kraxel@redhat.com>
 <2263450.oHEczLTUl7@silver> <YiiTEAAqRIdRAlEf@redhat.com>
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

On Mittwoch, 9. M=E4rz 2022 12:44:16 CET Daniel P. Berrang=E9 wrote:
> On Wed, Mar 09, 2022 at 11:40:42AM +0100, Christian Schoenebeck wrote:
> > On Mittwoch, 9. M=E4rz 2022 11:05:02 CET Philippe Mathieu-Daud=E9 wrote:
> > > Not sure what you have in mind. I'm totally new to the macOS/Darwin
> > > world, and have no choice but to use it as primary workstation and
> > > for CI builds, so I can help with overall testing / maintenance.
> > >=20
> > > Peter, since you take some macOS patches, would you like to maintain
> > > this officially? Since I doubt you want to take yet another
> > > responsibility, what about having a co-maintained section, including
> > > technical expertise from Akihiko / Joelle / Christian? (Cc'ed)
> > >=20
> > > Regards,
> >=20
> > Also CCing Cameron on this, just in case someone at Apple could spend s=
ome
> > slices on QEMU macOS patches in general as well.
> >=20
> > As for my part: I try to help out more on the macOS front. As there's n=
ow
> > macOS host support for 9p I have to start QEMU testing on macOS locally
> > anyway. Too bad that macOS CI tests on Github are no longer available B=
TW.
>=20
> Note QEMU gets macOS CI coverage in GitLab. We use a clever trick by
> which we use 'cirrus-run' from the GitLab job to trigger a build in
> Cirrus CI's macOS builders, and pull the results back when its done.
>=20
> Any contributor can get this working on their QEMU fork too, if they
> configure the needed Cirrus CI API token. See the docs in
>=20
>    .gitlab-ci.d/cirrus/README.rst
>=20
> This is enough for build + automated tests.

Does this mean that people no longer have to pull their credit card just fo=
r=20
running CI tests on Gitlab?

And as this approach seems to use an indirection with Cirrus CI via Github.=
=20
Will it be sufficient to just run QEMU CI jobs on Github?

Why have the previously existing QEMU CI jobs been pulled from Github anywa=
y?

Best regards,
Christian Schoenebeck



