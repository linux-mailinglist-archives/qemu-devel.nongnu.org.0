Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A27A0FE887
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Nov 2019 00:18:56 +0100 (CET)
Received: from localhost ([::1]:45556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVkrf-0002Bl-AT
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 18:18:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60937)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iVkqi-0001mO-7r
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 18:17:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iVkqf-0003NW-4z
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 18:17:54 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:48219
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1iVkqc-0003Ml-LD
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 18:17:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573859868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UJ35G41wwgy/lpMYtb8kk9S3EwR9KLITjVAXCXqXkWI=;
 b=DfFbWNrbbKvTMn2XmAS7aUqSbajO8V7SbFRh1coZaY+hv2zkqc2IZuV+d4ctU4jRzjBLiT
 TqSPxLSRn8K0CypSzKbHnGAwuVc2x5xyKvuiAo+Kb6h7tNPnkuLVtIw/mPBzwn1GFVz7i7
 PP28nfYmMbbdGM+I4DCLDQtn9pflkVo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-cESXy-3TMxOx7zMHcygc4A-1; Fri, 15 Nov 2019 18:17:47 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E00CDB20;
 Fri, 15 Nov 2019 23:17:45 +0000 (UTC)
Received: from localhost.localdomain (ovpn-125-0.rdu2.redhat.com [10.10.125.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 063A23C1D;
 Fri, 15 Nov 2019 23:17:37 +0000 (UTC)
Date: Fri, 15 Nov 2019 18:17:35 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v7 6/8] Acceptance tests: add the build directory to the
 system PATH
Message-ID: <20191115231735.GH19559@localhost.localdomain>
References: <20191104151323.9883-1-crosa@redhat.com>
 <20191104151323.9883-7-crosa@redhat.com>
 <0660a16e-2ffc-fd3f-bfc7-cb0c43f1aef9@redhat.com>
 <20191111224929.GF19559@localhost.localdomain>
 <74c176fe-5853-93d4-2329-8920af1f33a4@redhat.com>
MIME-Version: 1.0
In-Reply-To: <74c176fe-5853-93d4-2329-8920af1f33a4@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: cESXy-3TMxOx7zMHcygc4A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
 Willian Rampazzo <wrampazz@redhat.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 12, 2019 at 12:00:20PM -0200, Wainer dos Santos Moschetta wrote=
:
>=20
> On 11/11/19 8:49 PM, Cleber Rosa wrote:
> > On Thu, Nov 07, 2019 at 05:46:13PM -0200, Wainer dos Santos Moschetta w=
rote:
> > > On 11/4/19 1:13 PM, Cleber Rosa wrote:
> > > > So that when binaries such as qemu-img are searched for, those in t=
he
> > > > build tree will be favored.  As a clarification, SRC_ROOT_DIR is
> > > > dependent on the location from where tests are executed, so they ar=
e
> > > > equal to the build directory if one is being used.
> > > >=20
> > > > The original motivation is that Avocado libraries such as
> > > > avocado.utils.vmimage.get() may use the matching binaries, but it m=
ay
> > > > also apply to any other binary that test code may eventually attemp=
t
> > > > to execute.
> > > >=20
> > > > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > > > ---
> > > >    tests/acceptance/avocado_qemu/__init__.py | 6 ++++++
> > > >    1 file changed, 6 insertions(+)
> > > >=20
> > > > diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acce=
ptance/avocado_qemu/__init__.py
> > > > index 17ce583c87..a4bb796a47 100644
> > > > --- a/tests/acceptance/avocado_qemu/__init__.py
> > > > +++ b/tests/acceptance/avocado_qemu/__init__.py
> > > > @@ -110,6 +110,12 @@ class Test(avocado.Test):
> > > >            return None
> > > >        def setUp(self):
> > > > +        # Some utility code uses binaries from the system's PATH. =
 For
> > > > +        # instance, avocado.utils.vmimage.get() uses qemu-img, to
> > > > +        # create a snapshot image.  This is a transparent way of
> > > Because PATH is changed in a transparent way, wouldn't be better to a=
lso
> > > self.log.info() that fact?
> > >=20
> > I don't have a problem with logging it, but because it will happen for
> > *every single* test, it seems like it will become noise.  I think it's
> > better to properly document this aspect of "avocado_qemu.Test" instead
> > (which is currently missing here).  Something like:
> >=20
> > "Tests based on avocado_qemu.Test will have, as a convenience, the
> > QEMU build directory added to their PATH environment variable.  The goa=
l
> > is to allow tests to seamless use matching built binaries, instead of
> > binaries installed elsewhere in the system".
> >=20
> > How does it sound?
>=20
>=20
> It does.
>=20
>=20
> >=20
> > > > +        # making sure those utilities find and use binaries on the
> > > > +        # build tree by default.
> > > > +        os.environ['PATH'] =3D '%s:%s' % (SRC_ROOT_DIR, os.environ=
['PATH'])
> > > I think PATH should be set only once at class initialization. Perhaps=
 in
> > > setUpClass()?
> > >=20
> > > - Wainer
> > >=20
> > The Avocado test isolation model makes setUpClass() unnecessary,
> > unsupported and pointless, so we only support setUp().
> >=20
> > Every test already runs on its own process, and with the nrunner
> > model, should be able to run on completely different systems.  That's
> > why we don't want to support a setUpClass() like approach.
>=20
> Okay, thanks for the explanation.
>

And thanks for the review.  Given the level of controversy here, I've
decided to take a different approach on v8.  Basically, I'm adding an
interface to avocado.utils.vmimage[1], so that we can explicitly
control the qemu-img binary used.

Looking forward to your opinion on v8.

Thanks,
- Cleber.

[1] - https://github.com/avocado-framework/avocado/pull/3374

> Thanks,
>=20
> Wainer
>=20
> >=20
> > - Cleber.
> >=20
> >=20
>=20
>=20


