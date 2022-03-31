Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC2A4ED849
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 13:15:42 +0200 (CEST)
Received: from localhost ([::1]:42756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZsmD-0006F9-Q3
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 07:15:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nZseJ-0003nN-Ch
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 07:07:31 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:51211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nZseH-0002Oj-Br
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 07:07:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=G67DsMBqyKPZj7iB4gqkyaxzdKL3r1MFn9K4CIcboFQ=; b=LgIprQCWEwOCItD6CroGk1c/VR
 tgLEUT4gsBBBavZXHiJjZ1E1dRRriNCrPZP7O2lrjEdTCLJDu7RXjGMnR5gUp5EBqJ5ms0C85FDB7
 wfK7Y2racyr1TadFeNGDYlv4VB/2YDFSzRCIjmVN5Vzf6P70lcNc30g7W74MnYl3cBtxLN8ILrCvG
 GeGZ75qm4XjJzGk7/FB5TQb9nHYI79WJvJ7TDOxmDOzs1sZnFE+fub1/owKvLh/b1uoYw0MYtQdKf
 d+mCOFxn34ql7ZI4nbTtv2R/ixVrS0PtQxKtrDHkU3Ek608Z9WqqwWyFrxpRmHkLMd7t3EyxfgD6E
 b1p3p9YD0AbL0lp0lrhO3HQxUbw7F4ljjYCq68OSc5ig6iseSSbLNOGY3wEe5Er1e21Gl4EBYLeHA
 o/ZkVwUfSOIO2VAnKXv8OmU97QOmtSdWjM6/P7wMdUYbIGoi0GV0JZ/3odhXP9j8kUGC4aefYQ6Wc
 HR3U/bX7CFVe0NdtYpu/Agr+qfO+znTK4QLcbykSD+SgaJjpyad/SLP2Nx8mkLl1ADMsaDKqN986r
 BcMr9vOTjqpDMgIzVLut2q8DwJKadxjqutwlCJa5kvIBu4sy6dMWSjcYLaXH/WQu5DxVpy90SD1PE
 GeJkLrCkcmKyg1Up7j8HRpvb6c6drqTFS7Bzs9jGs=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Will Cohen <wwcohen@gmail.com>, 
 Thomas Huth <thuth@redhat.com>, Fabian Franz <fabianfranz.oss@gmail.com>, 
 Greg Kurz <groug@kaod.org>, Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?=
 <philippe.mathieu.daude@gmail.com>, hi@alyssa.is
Subject: Re: [PATCH] 9p: move limits.h include from 9p.c to 9p.h
Date: Thu, 31 Mar 2022 13:07:20 +0200
Message-ID: <2350345.UNtK3Xum7i@silver>
In-Reply-To: <CAFEAcA8fdebk3Z9bUbHuYKL5VCFqtu9gqbHdB4i_Umuaabqr7g@mail.gmail.com>
References: <20220330181947.68497-1-wwcohen@gmail.com>
 <CAB26zV2zZg3Nri9i4LcnCvYkX-T33Pbn2FwU6hP_LEKiab_tVA@mail.gmail.com>
 <CAFEAcA8fdebk3Z9bUbHuYKL5VCFqtu9gqbHdB4i_Umuaabqr7g@mail.gmail.com>
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

On Donnerstag, 31. M=E4rz 2022 10:03:35 CEST Peter Maydell wrote:
> On Wed, 30 Mar 2022 at 22:55, Will Cohen <wwcohen@gmail.com> wrote:
> > On Wed, Mar 30, 2022 at 5:31 PM Peter Maydell <peter.maydell@linaro.org=
>=20
wrote:
> >> Is it possible to do this with a meson.build check for whatever
> >> host property we're relying on here rather than with a
> >> "which OS is this?" ifdef ?
> >=20
> > To confirm -- the game plan in this case would be to do a check for
> > something along the lines of
> > config_host_data.set('CONFIG_XATTR_SIZE_MAX',
> > cc.has_header_symbol('linux/limits.h', 'XATTR_SIZE_MAX')) and using that
> > in the corresponding ifs, right?
> >=20
> > That makes sense -- if there's no objections, I'll go this route for v2,
> > which I can submit tomorrow.
> Yeah, something like that.
>=20
> Looking a bit closer at the code it looks like the handling of
> XATTR_SIZE_MAX is kind of odd: on Linux we use this kernel-provided
> value, whatever it is, on macos we use a hardcoded 64K, and on
> any other host we fail to compile. The comment claims we only
> need to impose a limit to avoid doing an overly large malloc,
> but if that's the case this shouldn't be OS-specific. I suspect
> the problem here is we're trying to impose a non-existent fixed
> maximum size for something where the API on the host just doesn't
> guarantee one.
>=20
> But that would be a 7.1 thing to look at improving.

It's like this: macOS does not officially have a limit for xattr size in=20
general. HPFS has a xattr size limit on filesystem level it seems up to=20
INT32_MAX, whereas today's APFS's xattr size AFAIK is only limited by the m=
ax.=20
APFS file size (8 EB).

As 9p is only used for Linux guests so far, and Linux having a much smaller=
=20
xattr size limit of 64k, and 9p server still using a very simple RAM only=20
xattr implementation, the idea was to cap the xattr size for macOS hosts to=
=20
hard coded 64k for that reason for now, at least until there are e.g. macOS=
 9p=20
guests one day that would then actually start to profit from a streaming xa=
ttr=20
implementation in 9p server.

However right now 9p in QEMU only supports Linux hosts and macOS hosts, and=
=20
the idea of

#else
#error Missing definition for P9_XATTR_SIZE_MAX for this host system
#endif

was to ensure that whoever adds support for another 9p host system in futur=
e,=20
to check what's the limit on that host system, i.e. it might even be <64k. =
So=20
I wouldn't just blindly use a default value here for all systems.

Best regards,
Christian Schoenebeck



