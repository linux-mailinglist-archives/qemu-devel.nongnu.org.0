Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6021E12DE
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 09:11:40 +0200 (CEST)
Received: from localhost ([::1]:55794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNAnz-000659-66
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 03:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40542)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iNAmV-0004Ui-91
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 03:10:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iNAmS-00067X-UN
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 03:10:05 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:38827
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iNAmS-00067J-Qq
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 03:10:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571814604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ytDKlgvFOi50K53nmGnkQQSCLS1b7en+DJwYHMAE3t0=;
 b=IK1WkwrvH3W67peMvzGNyliwD96B2M36gEs75gMWPUfj91JD/FY5/Fb0QVnl2+Cu271KI0
 URf7LDj5hE3wOeZoVeQ2TNt06cr3LWvOZJj6IT04RuE8gYdIRLCYgo1GSCz0OGlawqPF2U
 yY3AZFpikf2oe7mlkbQUP6xu+nNS2Zg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-5841dEcEPOuAL26cpdptsw-1; Wed, 23 Oct 2019 03:09:59 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EC751800DD0;
 Wed, 23 Oct 2019 07:09:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 660C01001B3F;
 Wed, 23 Oct 2019 07:09:58 +0000 (UTC)
Received: from zmail25.collab.prod.int.phx2.redhat.com
 (zmail25.collab.prod.int.phx2.redhat.com [10.5.83.31])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3FEE518089C8;
 Wed, 23 Oct 2019 07:09:58 +0000 (UTC)
Date: Wed, 23 Oct 2019 03:09:57 -0400 (EDT)
From: Thomas Huth <thuth@redhat.com>
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Message-ID: <1768294380.8112839.1571814597964.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAL1e-=ihiQiFptBKHyVEo_DZv5xHwa7eGuM7UFLo_c5DbYtxhA@mail.gmail.com>
References: <20191008082815.8267-1-thuth@redhat.com>
 <CAL1e-=ihiQiFptBKHyVEo_DZv5xHwa7eGuM7UFLo_c5DbYtxhA@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile: Remove generated files when doing
 'distclean' (and 'clean')
MIME-Version: 1.0
X-Originating-IP: [149.14.88.107, 10.4.196.23, 10.5.101.130, 10.4.195.6]
Thread-Topic: Makefile: Remove generated files when doing 'distclean' (and
 'clean')
Thread-Index: BrJFxTLj9mIwu04hoMXhe0HoQqhK6A==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 5841dEcEPOuAL26cpdptsw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

----- Original Message -----
> From: "Aleksandar Markovic" <aleksandar.m.mail@gmail.com>
> Sent: Tuesday, October 22, 2019 10:35:51 PM
>=20
> On Tuesday, October 8, 2019, Thomas Huth <thuth@redhat.com> wrote:
>=20
> > When running "make distclean" we currently leave a lot of generated
> > files in the build directory. These should be completely removed.
> > Some of the generated files are removed in the "clean" target (which
> > is a prerequisite for the "distclean" target), since binary files
> > should be removed in this step already.
> >
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  v2:
> >  - Remove tests/qemu-iotests/common.env in "distclean", not in "clean"
> >  - Improved patch description
> >
> >  Makefile               |  6 +++---
> >  tests/Makefile.include | 12 +++++++++++-
> >  2 files changed, 14 insertions(+), 4 deletions(-)
> >
> > Hello, Thomas,
>=20
> Do you intend to send a new version of this patch?
>=20
> It looks to me this is a very nice clean up that definitely should go int=
o
> 4.2, no?

I'm still planning to send a v3 of this patch, but currently I don't have t=
ime to work on this during the next two weeks. So this will likely miss the=
 deadline for 4.2. Feel free to pick up my patch and send a fixed version i=
f you think that this should still go into 4.2. Otherwise, I'll take care o=
f it in 5.0.

 Thomas


