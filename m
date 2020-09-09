Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3B3263651
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 20:57:50 +0200 (CEST)
Received: from localhost ([::1]:58044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kG5Hx-0006CI-RH
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 14:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kG5H4-0005TB-RX
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 14:56:55 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:53753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kG5H2-0001BW-Qt
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 14:56:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=ZicT5RbDUyKrwmjQxRtDEZReu41KXfikoDsRFx8x83k=; b=ZUPf4lZk2I2XoCgn14WDXah3tl
 3qNuVk9pXfrk/Bzoy6UglPQq4dUfem12mE79NWaZC2FmIX621XkYLtQURrhpWw70128mvXmVn+9RI
 ormPezlmb+A7G8gSmzzGWEW2qiJoLoJEKoiZ+sikhPfcvlb2jY1obFNezKie68c0JUBtVI/NjgV4I
 04WwKdYFuQopXhgfrTx3Y5CQXICmtkEkUQBS7iICzsnVPHtJREpo8ouJPIyWfOhRPQNtO+plTERVl
 Kl2Dup6dFF6ViHxJyz++1U9fC4BFwLUYkUKOpfBkdHgY1DEOPGPiRcqKND5UlKRbxl4OoxrO3d684
 ldcIuaug==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Liviu Ionescu <ilg@livius.net>, G 3 <programmingkidx@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Subject: Re: [RFC] QEMU as Xcode project on macOS
Date: Wed, 09 Sep 2020 20:56:48 +0200
Message-ID: <1695914.5EixHECA2G@silver>
In-Reply-To: <20200909181355.GV1011023@redhat.com>
References: <2764135.D4k31Gy3CM@silver> <13443969.F0S6BcH2UH@silver>
 <20200909181355.GV1011023@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 13:32:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 9. September 2020 20:13:55 CEST Daniel P. Berrang=E9 wrote:
> > On Mittwoch, 9. September 2020 15:40:05 CEST Daniel P. Berrang=E9 wrote:
> > > Ideally any xcode setup would just invoke whatever our standard
> > > build tools are IMHO, so it has zero possibility of introducing
> > > new build problems.
> >=20
> > Then you would not win anything on Mac. The problematic on macOS is that
> > Apple froze many standard FOSS tools that switched to GPL3. So by defau=
lt
> > you just have e.g. GNU make 3.81 (2006), Bash 3.2.57 (2007), ...  unless
> > you start to manually install them (e.g. from Homebrew & Co). And being
> > forced to use Meson on Mac with all its Python dependencies does not ma=
ke
> > it easier.
>=20
> It is going to need to use homebrew (or an equivalent) to bring in various
> 3rd party libraries QEMU depends on at build time, not least glib.

External libraries are not the problem. AFAICS that's just libffi, glib and=
=20
pixman. These could be added as submodules.

The more relevant ones would be the build tools that those QEMU scripts are=
=20
running to auto generate source files.

> So avoiding homebrew for the build system doesn't appear like an obvious =
win
> to me.

I would see several benefits:

1. High potential of attracting much more devs on macOS if it's just click =
and=20
   run.

2. Increased quality on Mac due to more devs.

3. Being able to delegate QEMU related macOS bugs to Apple.

4. *Much* more efficient work-flow when developing with the Xcode IDE
   (-> both increased development speed & quality).

On Mittwoch, 9. September 2020 19:45:04 CEST Liviu Ionescu wrote:
> FYI, I'm working on a cross-platform standalone meson package, a .tar.gz
> that you can install in any location and includes the python run-time.
>=20
> I already have the build scripts functional for Windows (which is general=
ly
> the most difficult platform); the build scripts for Linux/macOS will foll=
ow
> soon.
>=20
> https://github.com/xpack-dev-tools/meson-build-xpack/blob/xpack-develop/s=
cri
> pts/common-apps-functions-source.sh

Interesting! That would defuse the homebrew problematic. However you would=
=20
still be opted out from (4.) all those Xcode IDE features that make=20
development such efficient.

Best regards,
Christian Schoenebeck



