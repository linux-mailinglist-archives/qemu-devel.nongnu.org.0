Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E282D115B45
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Dec 2019 06:57:19 +0100 (CET)
Received: from localhost ([::1]:48114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idT5i-0001Oi-GR
	for lists+qemu-devel@lfdr.de; Sat, 07 Dec 2019 00:57:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37675)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Aijaz.Baig@protonmail.com>) id 1idT4F-0000vl-Sq
 for qemu-devel@nongnu.org; Sat, 07 Dec 2019 00:55:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Aijaz.Baig@protonmail.com>) id 1idT4E-0003am-IS
 for qemu-devel@nongnu.org; Sat, 07 Dec 2019 00:55:47 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:35450)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Aijaz.Baig@protonmail.com>)
 id 1idT4D-0003Q3-U4
 for qemu-devel@nongnu.org; Sat, 07 Dec 2019 00:55:46 -0500
Date: Sat, 07 Dec 2019 05:55:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1575698137;
 bh=c1BXMQ1ISJyPXCDMul9QnHV48O7GIwud/H97kck1huk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=i3WcTZhA2wNIVd9e9zUdoqt8oFj321Cywaio1uQlCYlVfTN7zL29juGpZyxhkZuby
 3wEAiIVSlde2yodUS9yM/JBZagFplAurb7Hw8XSJRZZaecFCaDXiCcGi+U1Sq8pGGS
 YjG1xRb9ApP5rAfudagjReC6CgZrklH0qTWD8yyU=
To: =?UTF-8?Q?=27Daniel_P=2E_Berrang=C3=A9=27?= <berrange@redhat.com>
From: Aijaz.Baig@protonmail.com
Cc: qemu-devel@nongnu.org
Subject: RE: Error compiling Qemu-4.1 on Linux
Message-ID: <000001d5acc2$e7e07ee0$b7a17ca0$@protonmail.com>
In-Reply-To: <20191206170747.GD3291374@redhat.com>
References: <003101d5ab71$8424dc40$8c6e94c0$@protonmail.com>
 <20191205143622.GB3080934@redhat.com>
 <000101d5ac55$f8422620$e8c67260$@protonmail.com>
 <20191206170747.GD3291374@redhat.com>
Feedback-ID: uV088Vx4DnI5bE9OhCrN2z9v4XaPDWRvhVd_wxvMCaCwdybi5HTK8G-X2_UlIAM_J1SHtE1ybSTtLXuQ3x_qHQ==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 185.70.40.134
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
Reply-To: Aijaz.Baig@protonmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

That file IS present and its contents are:

prefix=3D/usr
exec_prefix=3D${prefix}
libdir=3D${prefix}/lib/x86_64-linux-gnu
includedir=3D${prefix}/include

Name: GThread
Description: Thread support for GLib
Requires: glib-2.0
Version: 2.50.3
Libs: -L${libdir} -lgthread-2.0 -pthread
Cflags: -pthread

Let me know what is falling short here

Regards

-----Original Message-----
From: Daniel P. Berrang=C3=A9 <berrange@redhat.com>=20
Sent: Friday, December 6, 2019 10:38 PM
To: Aijaz.Baig@protonmail.com
Cc: qemu-devel@nongnu.org
Subject: Re: Error compiling Qemu-4.1 on Linux


On Fri, Dec 06, 2019 at 04:55:37PM +0000, Aijaz.Baig@protonmail.com wrote:
> Here is the content of config.log: https://pastebin.com/6zrSXWAG
>
> I am configuring it for 'arm-softmmu'  as can be seen from the above=20
> paste

Looks like it is failing on

  $ pkg-config  --atleast-version=3D2.40 gthread-2.0

returning non-zero exit status.


This suggests the file:

  /usr/lib/x86_64-linux-gnu/pkgconfig/gthread-2.0.pc

is missing on your install.

Or do you have some PKG_CONFIG_LIBDIR env variable set that is mistakenly p=
ointing to a different directory.


Regards,
Daniel
--
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|




