Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2DCB9770
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 20:57:04 +0200 (CEST)
Received: from localhost ([::1]:34740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBO5W-0001h0-Rx
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 14:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54691)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iBO2Z-0008NC-Af
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 14:54:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iBO2X-0006oR-DE
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 14:53:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37422)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iBO2X-0006nb-7q
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 14:53:57 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 964F581F07;
 Fri, 20 Sep 2019 18:53:54 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 904261001281;
 Fri, 20 Sep 2019 18:53:53 +0000 (UTC)
Date: Fri, 20 Sep 2019 19:53:51 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH 0/3] migration/postcopy: unsentmap is not necessary
Message-ID: <20190920185351.GD2687@work-vm>
References: <20190819061843.28642-1-richardw.yang@linux.intel.com>
 <20190916060642.GA13437@richard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190916060642.GA13437@richard>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 20 Sep 2019 18:53:54 +0000 (UTC)
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Wei Yang (richardw.yang@linux.intel.com) wrote:
> Hi, Dave and Juan
> 
> Would you mind taking a look at this one?

Yes, I'll have a look, I'm just fighting through a bunch of other stuff.

Dave

> On Mon, Aug 19, 2019 at 02:18:40PM +0800, Wei Yang wrote:
> >Three patches to cleanup postcopy:
> >
> >[1]: split canonicalize bitmap and discard page
> >[2]: remove unsentmap since it is not necessary
> >[3]: cleanup the get_queued_page_not_dirty
> >
> >Wei Yang (3):
> >  migration/postcopy: not necessary to do discard when canonicalizing
> >    bitmap
> >  migration/postcopy: unsentmap is not necessary for postcopy
> >  migration: remove sent parameter in get_queued_page_not_dirty
> >
> > include/exec/ram_addr.h |  6 ---
> > migration/ram.c         | 94 +++++++----------------------------------
> > migration/trace-events  |  2 +-
> > 3 files changed, 16 insertions(+), 86 deletions(-)
> >
> >-- 
> >2.17.1
> 
> -- 
> Wei Yang
> Help you, Help me
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

