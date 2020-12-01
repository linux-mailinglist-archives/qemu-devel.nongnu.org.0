Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7CA2CAAED
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 19:41:05 +0100 (CET)
Received: from localhost ([::1]:41374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkAaG-0000Rw-Ad
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 13:41:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kkAWx-0007HI-35; Tue, 01 Dec 2020 13:37:39 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:50030
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kkAWu-0005Ib-WB; Tue, 01 Dec 2020 13:37:38 -0500
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id C08235FC79;
 Tue,  1 Dec 2020 19:37:33 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi.denis.courmont@huawei.com>
To: qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [PATCHv3 00/17] ARMv8.4 Secure EL2
Date: Tue, 01 Dec 2020 20:37:32 +0200
Message-ID: <2120950.iZASKD2KPV@basile.remlab.net>
Organization: Huawei Technologies, Finland
In-Reply-To: <CAFEAcA8j9ZPLt95ObzMGF=yei_FLzduMSnFyS9MoDgQYPvGrhQ@mail.gmail.com>
References: <3333301.iIbC2pHGDl@basile.remlab.net>
 <2747838.e9J7NaK4W3@basile.remlab.net>
 <CAFEAcA8j9ZPLt95ObzMGF=yei_FLzduMSnFyS9MoDgQYPvGrhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

	Hi,

Le tiistaina 1. joulukuuta 2020, 20.23.46 EET Peter Maydell a =C3=A9crit :
> > The base tests fail without the patchset seem to assume an US American
> > locale, which is frankly infuriatingly culturally insensitive.
>=20
> I run them with en_GB.UTF-8, which works fine for me, but it's a bug
> in the test suite if something's locale dependent and not ensuring
> it is set correctly.

=46or a start, it seems to be barfing on strsignal() localisation by the sh=
ell,=20
printing French instead of "Killed" on SIGKILL.

% locale
LANG=3Dfr_FR.UTF-8
LANGUAGE=3Dfr:en_GB:fi
LC_CTYPE=3D"fi_FI.UTF-8"
=2E..

> > As for the acceptance tests fail equally early without the patchset wit=
h a
> > completely helpless diagnostic about unresolved references. Wiki does n=
ot
> > help either.
>=20
> I just run "make -C my-build-dir check-acceptance"; I don't know anything
> about the internals. It would help if you quoted the error messages
> you see.

 AVOCADO tests/acceptance
Unable to resolve reference(s) 'tests/acceptance' with plugins(s) 'file',=20
'tap', 'external', try running 'avocado list -V tests/acceptance' to see th=
e=20
details.
make: *** [/home/remi/dev/qemu/tests/Makefile.include:125 : check-acceptanc=
e]=20
Erreur 2

% avocado list -V tests/acceptance
bash: avocado : commande introuvable

% tests/venv/bin/avocado list -V tests/acceptance
usage: avocado list [-h] [--loaders [LIST.LOADERS ...]]

Wiki implies that dependencies are automatically installed, but I guess not?

Br,

=2D-=20
R=C3=A9mi Denis-Courmont



