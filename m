Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 230384EDD95
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 17:42:55 +0200 (CEST)
Received: from localhost ([::1]:48128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZwwo-0001Lq-8Z
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 11:42:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nZwoe-0005Vc-KY
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:34:29 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:50357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nZwoc-0007cp-MH
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:34:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=QZ6kbUSh+MibRzy7z0GPRw3KRuZ0v+R7jPoKUfNgYus=; b=M7vx87lRbRSkOQehX0hbIJ9qIC
 J3xSy21OxoszGF4qbskreH15fU0LnTm66kWD6fbQCwAWHT0tOCtogfhD/N0AZOvSZxGLsR2/kL4F8
 VkREW3+Z4JnkXPtytIwYE/CSiyViOlWnrAXSHi/d1dtV+wxDAcZeN2nso0430HW1YfDxnQGEShZ1K
 5S3nfjkqA7aqOu5wFP8RSuNXY+XDhuval/fkJNN3XYPFnAxXGvl4VwKo27yg6UlukS/Yc02MxHHIc
 0fEjHkP605U6KNKv3RGoU8eqVYZqV8rVVHSE2A/RNnLFJ/BEjfw/9gpf8KLPauObroKXYTkamT8P/
 Sf5bFzWaL2O1CCsP0O4DNU6ZuSTvrwODdMqCMaHG8hZkMX5RkDGOIReBehlJqkUReBjzU+wxi3f+Q
 i1Kl1z5GPG04RG0Pk0kZsDAV8g+5LAMvyhISpgaXkov6+4gMEy5cma3NuM0amKM8ChCrnWyD5TPcX
 omCQ5of/HoMll5UCioEusJGcJwLOsjeuOF7UN0DZPnajOkI0iHHE0gvD6oY68q+PFs90TGadA3v3V
 iYdWXzltN2PSz8MpwSKR9kzjx0Xf5be4YiO97KRRnK0i8bclWQqIs/+LTQfkQJUdXyncljQ3ny5RY
 fCqDXmc8V/PJHjOSH+dTQSkcJLzA/MwB91AXQTpSI=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Fabian Franz <fabianfranz.oss@gmail.com>, 
 Greg Kurz <groug@kaod.org>, Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?=
 <philippe.mathieu.daude@gmail.com>, hi@alyssa.is
Subject: Re: [PATCH] 9p: move limits.h include from 9p.c to 9p.h
Date: Thu, 31 Mar 2022 17:34:12 +0200
Message-ID: <9263917.cZLeS7QfZr@silver>
In-Reply-To: <CAB26zV2pqfXts8ug7bi+RHC3gY3nKgMZu0cG1DkNWNO0J1BzVw@mail.gmail.com>
References: <20220330181947.68497-1-wwcohen@gmail.com>
 <2350345.UNtK3Xum7i@silver>
 <CAB26zV2pqfXts8ug7bi+RHC3gY3nKgMZu0cG1DkNWNO0J1BzVw@mail.gmail.com>
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

On Donnerstag, 31. M=E4rz 2022 15:19:24 CEST Will Cohen wrote:
> On Thu, Mar 31, 2022 at 7:07 AM Christian Schoenebeck <
>=20
> qemu_oss@crudebyte.com> wrote:
> > On Donnerstag, 31. M=E4rz 2022 10:03:35 CEST Peter Maydell wrote:
> > > On Wed, 30 Mar 2022 at 22:55, Will Cohen <wwcohen@gmail.com> wrote:
> > > > On Wed, Mar 30, 2022 at 5:31 PM Peter Maydell <
> >=20
> > peter.maydell@linaro.org>
> >=20
> > wrote:
> > > >> Is it possible to do this with a meson.build check for whatever
> > > >> host property we're relying on here rather than with a
> > > >> "which OS is this?" ifdef ?
> > > >=20
> > > > To confirm -- the game plan in this case would be to do a check for
> > > > something along the lines of
> > > > config_host_data.set('CONFIG_XATTR_SIZE_MAX',
> > > > cc.has_header_symbol('linux/limits.h', 'XATTR_SIZE_MAX')) and using
> >=20
> > that
> >=20
> > > > in the corresponding ifs, right?
> > > >=20
> > > > That makes sense -- if there's no objections, I'll go this route for
> >=20
> > v2,
> >=20
> > > > which I can submit tomorrow.
> > >=20
> > > Yeah, something like that.
> > >=20
> > > Looking a bit closer at the code it looks like the handling of
> > > XATTR_SIZE_MAX is kind of odd: on Linux we use this kernel-provided
> > > value, whatever it is, on macos we use a hardcoded 64K, and on
> > > any other host we fail to compile. The comment claims we only
> > > need to impose a limit to avoid doing an overly large malloc,
> > > but if that's the case this shouldn't be OS-specific. I suspect
> > > the problem here is we're trying to impose a non-existent fixed
> > > maximum size for something where the API on the host just doesn't
> > > guarantee one.
> > >=20
> > > But that would be a 7.1 thing to look at improving.
> >=20
> > It's like this: macOS does not officially have a limit for xattr size in
> > general. HPFS has a xattr size limit on filesystem level it seems up to
> > INT32_MAX, whereas today's APFS's xattr size AFAIK is only limited by t=
he
> > max.
> > APFS file size (8 EB).
> >=20
> > As 9p is only used for Linux guests so far, and Linux having a much
> > smaller
> > xattr size limit of 64k, and 9p server still using a very simple RAM on=
ly
> > xattr implementation, the idea was to cap the xattr size for macOS hosts
> > to
> > hard coded 64k for that reason for now, at least until there are e.g.
> > macOS 9p
> > guests one day that would then actually start to profit from a streaming
> > xattr
> > implementation in 9p server.
> >=20
> > However right now 9p in QEMU only supports Linux hosts and macOS hosts,
> > and
> > the idea of
> >=20
> > #else
> > #error Missing definition for P9_XATTR_SIZE_MAX for this host system
> > #endif
> >=20
> > was to ensure that whoever adds support for another 9p host system in
> > future,
> > to check what's the limit on that host system, i.e. it might even be <6=
4k.
> > So
> > I wouldn't just blindly use a default value here for all systems.
>=20
> Christian, do you have thoughts on the meson.build check, then? For all t=
he
> reasons you state directly above, there's still some macOS-specific logic
> inherent to this functionality. If I create a meson check for
> CONFIG_XATTR_SIZE_MAX, the code becomes something like the following:
>=20
> #if defined(CONFIG_XATTR_SIZE_MAX)
> /* Currently, only Linux has XATTR_SIZE_MAX */
> #define P9_XATTR_SIZE_MAX XATTR_SIZE_MAX
> #elif defined(CONFIG_DARWIN)
> ...
>=20
> On the one hand, I can see how this makes the intent a little clearer --
> there's some kind of conceptual pre-defined header symbol in "most" cases
> (currently only one operating system), with some os-specific fallback log=
ic.
> On the other hand, this isn't really shortening anything, it's just
> replacing CONFIG_LINUX with something which effectively resolves to
> CONFIG_LINUX through redirection.

Well, I don't see an advantage for a meson check in this case, because=20
XATTR_SIZE_MAX is a definition that only exists on Linux. Other systems eit=
her=20
have another macro name or none at all. A dedicated meson check makes sense=
=20
for individual features/macros/symbols that may exist across multiple OSes.

Best regards,
Christian Schoenebeck



