Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFBDB8ED8
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 13:14:08 +0200 (CEST)
Received: from localhost ([::1]:57782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBGrX-0002Lf-DH
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 07:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35423)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mrezanin@redhat.com>) id 1iBGqJ-0001jL-3X
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 07:12:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrezanin@redhat.com>) id 1iBGqH-0007PN-JD
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 07:12:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56604)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mrezanin@redhat.com>) id 1iBGqH-0007P5-E5
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 07:12:49 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 314968AC6F5;
 Fri, 20 Sep 2019 11:12:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 264EF10018F8;
 Fri, 20 Sep 2019 11:12:48 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1C3FF4E589;
 Fri, 20 Sep 2019 11:12:48 +0000 (UTC)
Date: Fri, 20 Sep 2019 07:12:47 -0400 (EDT)
From: Miroslav Rezanina <mrezanin@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <1311887304.1189971.1568977967941.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAFEAcA862jNiTSZRgdugo6GEKG2GUmQg25Y0e9rME277-WXNvg@mail.gmail.com>
References: <20190905131040.8350-1-peter.maydell@linaro.org>
 <20190920085756.luzas76jivztgxzb@lws.brq.redhat.com>
 <CAFEAcA862jNiTSZRgdugo6GEKG2GUmQg25Y0e9rME277-WXNvg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v3] qemu-ga: Convert invocation
 documentation to rST
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.40.204.18, 10.4.195.28]
Thread-Topic: qemu-ga: Convert invocation documentation to rST
Thread-Index: OEME9b+iZXyQAEubw362l1ir94G8SA==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Fri, 20 Sep 2019 11:12:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



----- Original Message -----
> From: "Peter Maydell" <peter.maydell@linaro.org>
> To: "Miroslav Rezanina" <mrezanin@redhat.com>
> Cc: "QEMU Developers" <qemu-devel@nongnu.org>, "Michael Roth" <mdroth@linux.vnet.ibm.com>
> Sent: Friday, September 20, 2019 12:52:49 PM
> Subject: Re: [Qemu-devel] [PATCH v3] qemu-ga: Convert invocation documentation to rST
> 
> On Fri, 20 Sep 2019 at 09:57, Miroslav Rezanina <mrezanin@redhat.com> wrote:
> >
> > On Thu, Sep 05, 2019 at 02:10:40PM +0100, Peter Maydell wrote:
> > > The qemu-ga documentation is currently in qemu-ga.texi in
> > > Texinfo format, which we present to the user as:
> > >  * a qemu-ga manpage
> > >  * a section of the main qemu-doc HTML documentation
> > >
> > > Convert the documentation to rST format, and present it to
> > > the user as:
> > >  * a qemu-ga manpage
> > >  * part of the interop/ Sphinx manual
> > >
> > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > > Reviewed-by: Michael Roth <mdroth@linux.vnet.ibm.com>
> > > Tested-by: Michael Roth <mdroth@linux.vnet.ibm.com
> 
> 
> > This patch is breaking build for me. It fails on:
> >
> >     perl -Ww -- /builddir/build/BUILD/qemu-4.1.0/scripts/texi2pod.pl -I
> >     docs -I scripts -I docs/interop -DVERSION="4.1.50"
> >     -DCONFDIR="/etc/qemu-kvm" scripts/texi2pod.pl
> >     docs/interop/qemu-ga.8.pod && pod2man --utf8 --section=8 --center=" "
> >     --release=" " docs/interop/qemu-ga.8.pod > docs/interop/qemu-ga.8
> >
> > with:
> >
> >    No filename or title
> >
> > Not sure why this is happening.
> 
> Yes, it's a bug in the handling of in-tree builds (out-of-tree
> builds work fine and we generally recommend those as better anyway).
> I have a patch on list which should fix the in-tree build case:
> 
> https://patchew.org/QEMU/20190919155957.12618-1-peter.maydell@linaro.org/
> 

Thanks for info,
Mirek

> thanks
> -- PMM
> 

-- 
Miroslav Rezanina
Software Engineer - Virtualization Team Maintainer


