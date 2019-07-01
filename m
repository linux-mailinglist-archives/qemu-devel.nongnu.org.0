Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F0438967
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 13:52:16 +0200 (CEST)
Received: from localhost ([::1]:48852 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZDPr-00089f-QH
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 07:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59890)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hZBm8-0004a4-NC
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 06:07:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hZBm6-0001mD-9d
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 06:07:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55522)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hZBly-0001H0-To; Fri, 07 Jun 2019 06:07:00 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9E84F308620E;
 Fri,  7 Jun 2019 10:06:52 +0000 (UTC)
Received: from gondolin (dhcp-192-191.str.redhat.com [10.33.192.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D69635DEE2;
 Fri,  7 Jun 2019 10:06:51 +0000 (UTC)
Date: Fri, 7 Jun 2019 12:06:49 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190607120649.1d18297b.cohuck@redhat.com>
In-Reply-To: <CAFEAcA9hMt4TZC0DEzJ6JTV9OxLbXZbmHKshWv_20sLxLw4M6Q@mail.gmail.com>
References: <20190607095237.11364-1-cohuck@redhat.com>
 <CAFEAcA8FXh-jPMwpGN-4ES4v=nE4ZOSNB8+rkdB03E=BBDh-jw@mail.gmail.com>
 <CAFEAcA9hMt4TZC0DEzJ6JTV9OxLbXZbmHKshWv_20sLxLw4M6Q@mail.gmail.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 07 Jun 2019 10:06:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PULL 00/35] s390x updates
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 7 Jun 2019 10:58:03 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Fri, 7 Jun 2019 at 10:57, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Fri, 7 Jun 2019 at 10:52, Cornelia Huck <cohuck@redhat.com> wrote:  
> > >
> > > The following changes since commit 47fbad45d47af8af784bb12a5719489edcd89b4c:
> > >
> > >   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2019-06-04 17:22:42 +0100)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://github.com/cohuck/qemu tags/s390x-20190607-1
> > >
> > > for you to fetch changes up to 39f04d18406862bd98d6bef5415dbe7360c652de:
> > >
> > >   Merge tag 's390x-tcg-2019-06-05' into s390-next-staging (2019-06-07 11:38:42 +0200)
> > >
> > > ----------------------------------------------------------------
> > > s390x updates:
> > > - tcg: finalize implementation for the vector facility and
> > >   add it to the 'qemu' cpu model
> > > - linux-user: properly generate ELF_HWCAP
> > > - vfio-ccw: support async command subregion (for halt/clear
> > >   subchannel handling)
> > >
> > > ----------------------------------------------------------------  
> >
> > Hi -- this fails to link on the windows build for me:
> >   LINK    s390x-softmmu/qemu-system-s390xw.exe
> > hw/s390x/css.o: In function `sch_handle_halt_func_passthrough':
> > /home/petmay01/qemu-for-merges/hw/s390x/css.c:1213: undefined
> > reference to `vfio_ccw_handle_halt'
> > hw/s390x/css.o: In function `sch_handle_clear_func_passthrough':
> > /home/petmay01/qemu-for-merges/hw/s390x/css.c:1223: undefined
> > reference to `vfio_ccw_handle_clear'
> > collect2: error: ld returned 1 exit status  
> 
> ...and same link error on OSX host.
> 
> -- PMM

Hmpf, it seems I need to rework the vfio-ccw patch to use a callback in
the class...  hoped I could keep the code simple :/

