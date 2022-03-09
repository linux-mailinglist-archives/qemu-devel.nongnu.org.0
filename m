Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AE14D2D5C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 11:48:34 +0100 (CET)
Received: from localhost ([::1]:50448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRtrt-00080V-8x
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 05:48:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nRtkQ-0000yn-4n
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:40:50 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:44683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nRtkN-0000x4-90
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:40:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=VnDJJS+FvwsKuLFIotzZ+N1uXMrCJjUdUin58IiaUKw=; b=DIPrcqft6ZKNQVpLeS2VxvVc4C
 c8CqnCOtBsCePHzc+nqF63aN7Z66Wx1fI6uDzfaq/HGCaWuwLcQma6HrzDsSmrtogEQO4ChbPTlFC
 H3nQczk4Bab2MRo8xTOKwSDE0O9ncP3O4y+8x1DBHVccmyV/34e/MBYWYQZmYY3sQ0oImwb4xagTl
 LWc9AhshTpilb38VV3dB34KABQRtJmh46qs2KzlEIXEx4bz4/IaN12FOjNCxn6QnuGP3MQmCMjach
 vR0bcWsya+jUiswZKEWAIiaphGqxoidS1FO/Vb4BaC43exTUNre4qOs9ITN6Fot7fRi4p6hcOohYc
 4926kU3IFep71j/MaFx3Q8uHv3vvPT4c0H68zFyuUD4NEs33PG3u6ugg8S6iawCTLeFLeBS0WmD6A
 DVRWJkBaNuexe4JxQa0KyzhcZNTIbqUjUmd4kqZ2LFI3M5403XbSL8F2SCoGVq4D9RXfLdEXx1Jn6
 fxZEFv2hyLY2J64VuZgRyHpkZ/mhUt/KDONHCdSB68/8MJpcRd3rRwDM3aam2FzX85R9k7jBARCUh
 /SE0+n6omTBuDEivQ9LDt+pV3QBS0HpChf5OhH3aJ1dtkDbcSs9to1hhpvqp7it8/b8nVCISZfXAr
 1Ghr+2DtBwuB3Ao7kyd4wlsmwWZ7jvVs7AkYI11mw=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?=
 <philippe.mathieu.daude@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Joelle van Dyne <j@getutm.app>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Cameron Esfahani <dirty@apple.com>
Subject: Re: MAINTAINERS: macOS host support (was: MAINTAINERS: take edk2)
Date: Wed, 09 Mar 2022 11:40:42 +0100
Message-ID: <2263450.oHEczLTUl7@silver>
In-Reply-To: <0fcec2e8-97dc-8cf5-3f9e-285a86c0b566@gmail.com>
References: <20220308145521.3106395-1-kraxel@redhat.com>
 <20220309081607.gzoucriu7a3qxtjf@sirius.home.kraxel.org>
 <0fcec2e8-97dc-8cf5-3f9e-285a86c0b566@gmail.com>
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

On Mittwoch, 9. M=E4rz 2022 11:05:02 CET Philippe Mathieu-Daud=E9 wrote:
> On 9/3/22 09:16, Gerd Hoffmann wrote:
> > On Tue, Mar 08, 2022 at 04:08:40PM +0100, Philippe Mathieu-Daud=E9 wrot=
e:
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>> index 68adaac373c7..ad1c9a7ea133 100644
> >>> --- a/MAINTAINERS
> >>> +++ b/MAINTAINERS
> >>> @@ -3144,7 +3144,7 @@ F: docs/interop/firmware.json
> >>>=20
> >>>    EDK2 Firmware
> >>>    M: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> >>>=20
> >>> -R: Gerd Hoffmann <kraxel@redhat.com>
> >>> +M: Gerd Hoffmann <kraxel@redhat.com>
> >>=20
> >> Thanks :)
> >=20
> > Any chance you can take over the macos support bits in return?
>=20
> I suppose you mean the "Core Audio framework backend" section?
>=20
> There is indeed a need for macOS host support maintenance, as patches
> hang on the list until Peter finally takes them via the arm tree.

Most of them are macOS UI patches I think. There are not many CoreAudio=20
patches coming in.

> Not sure what you have in mind. I'm totally new to the macOS/Darwin
> world, and have no choice but to use it as primary workstation and
> for CI builds, so I can help with overall testing / maintenance.
>=20
> Peter, since you take some macOS patches, would you like to maintain
> this officially? Since I doubt you want to take yet another
> responsibility, what about having a co-maintained section, including
> technical expertise from Akihiko / Joelle / Christian? (Cc'ed)
>=20
> Regards,

Also CCing Cameron on this, just in case someone at Apple could spend some=
=20
slices on QEMU macOS patches in general as well.

As for my part: I try to help out more on the macOS front. As there's now=20
macOS host support for 9p I have to start QEMU testing on macOS locally=20
anyway. Too bad that macOS CI tests on Github are no longer available BTW.

Best regards,
Christian Schoenebeck



