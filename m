Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911E2FE88D
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Nov 2019 00:20:31 +0100 (CET)
Received: from localhost ([::1]:45570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVktC-0003Hw-Ku
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 18:20:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32895)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iVksH-0002lr-CW
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 18:19:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iVksE-0003rh-1d
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 18:19:33 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44478
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1iVksD-0003pV-En
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 18:19:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573859966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lpwedSADHBI6ePJyl5F+ZeTFqdSCmYSLExPDdr7komo=;
 b=NBcw+YNzrTFNaDT4ZO2QyqhgwH5eup/X6sg5sDsLb4iZcKR/wpPxIFlifEkHDgyEy05Rk8
 /Q7ACr1KquPbrw3E/3coYWfMTJOuvrZXOQS2hTWPB8LbmBFx2PlF/lg2uxoMzkhHgiCewZ
 B7/CA+Lw8XL26CwpNEkaMoZmtLRxH3I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-OhItLXi3OGyrl1-9zNyvBQ-1; Fri, 15 Nov 2019 18:19:25 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB9AE107ACC9;
 Fri, 15 Nov 2019 23:19:23 +0000 (UTC)
Received: from localhost.localdomain (ovpn-125-0.rdu2.redhat.com [10.10.125.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 627895D717;
 Fri, 15 Nov 2019 23:19:16 +0000 (UTC)
Date: Fri, 15 Nov 2019 18:19:14 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v7 6/8] Acceptance tests: add the build directory to the
 system PATH
Message-ID: <20191115231914.GI19559@localhost.localdomain>
References: <20191104151323.9883-1-crosa@redhat.com>
 <20191104151323.9883-7-crosa@redhat.com>
 <b93b5913-22f1-6aa9-75a1-4b577153288e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b93b5913-22f1-6aa9-75a1-4b577153288e@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: OhItLXi3OGyrl1-9zNyvBQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 08, 2019 at 02:13:02PM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 11/4/19 4:13 PM, Cleber Rosa wrote:
> > So that when binaries such as qemu-img are searched for, those in the
> > build tree will be favored.  As a clarification, SRC_ROOT_DIR is
> > dependent on the location from where tests are executed, so they are
> > equal to the build directory if one is being used.
> >=20
> > The original motivation is that Avocado libraries such as
> > avocado.utils.vmimage.get() may use the matching binaries, but it may
> > also apply to any other binary that test code may eventually attempt
> > to execute.
> >=20
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >   tests/acceptance/avocado_qemu/__init__.py | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >=20
> > diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptan=
ce/avocado_qemu/__init__.py
> > index 17ce583c87..a4bb796a47 100644
> > --- a/tests/acceptance/avocado_qemu/__init__.py
> > +++ b/tests/acceptance/avocado_qemu/__init__.py
> > @@ -110,6 +110,12 @@ class Test(avocado.Test):
> >           return None
> >       def setUp(self):
> > +        # Some utility code uses binaries from the system's PATH.  For
> > +        # instance, avocado.utils.vmimage.get() uses qemu-img, to
> > +        # create a snapshot image.  This is a transparent way of
> > +        # making sure those utilities find and use binaries on the
> > +        # build tree by default.
> > +        os.environ['PATH'] =3D '%s:%s' % (SRC_ROOT_DIR, os.environ['PA=
TH'])
>=20
> But qemu-img is compiled in BUILD_ROOT_DIR, isn't it?
>=20
> Maybe we should pass its path by argument, such --qemu-img /path/to/it.
>

Hi Philippe,

On the next version we should see a properly named variable for the
build directory, and (as explained in the previous response) also
a more explicit setting of the qemu-img binary used (although not
a parameter or command line argument at this point).

Looking forward for your opinion on the next version, and thanks
again!

- Cleber.

> >           self._vms =3D {}
> >           self.arch =3D self.params.get('arch',
> >=20


