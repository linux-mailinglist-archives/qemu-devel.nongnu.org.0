Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0006486843
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Aug 2019 19:45:26 +0200 (CEST)
Received: from localhost ([::1]:54346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvmTe-0001pi-8F
	for lists+qemu-devel@lfdr.de; Thu, 08 Aug 2019 13:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36789)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hvmT3-0001Os-PO
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 13:44:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hvmT2-0008T3-U8
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 13:44:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48974)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hvmT2-0008ST-Oe
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 13:44:48 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CF3E1369CC;
 Thu,  8 Aug 2019 17:44:47 +0000 (UTC)
Received: from work-vm (ovpn-117-208.ams2.redhat.com [10.36.117.208])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F3A2160BE1;
 Thu,  8 Aug 2019 17:44:46 +0000 (UTC)
Date: Thu, 8 Aug 2019 18:44:44 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190808174444.GN2852@work-vm>
References: <20190805053146.32326-1-richardw.yang@linux.intel.com>
 <20190807183534.GN27871@work-vm> <20190808020231.GA26938@richard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808020231.GA26938@richard>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Thu, 08 Aug 2019 17:44:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3] migration/postcopy: use mis->bh instead
 of allocating a QEMUBH
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Wei Yang (richardw.yang@linux.intel.com) wrote:
> On Wed, Aug 07, 2019 at 07:35:34PM +0100, Dr. David Alan Gilbert wrote:
> >* Wei Yang (richardw.yang@linux.intel.com) wrote:
> >> For migration incoming side, it either quit in precopy or postcopy. It
> >> is safe to use the mis->bh for both instead of allocating a dedicated
> >> QEMUBH for postcopy.
> >> 
> >> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> >> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >
> >Hi Wei,
> >  Can you check this, the patchew tests came back with a failure which
> >seems bh related; I've not tried it, but can you just see if you can
> >reproduce it?
> >
> 
> I tried make check, which looks good.
> 
> (Some other upstream commit introduced error. I revert them to make check work)

OK, I'll pick it up and see how we go.

Dave

> 
> >Dave
> >
> 
> -- 
> Wei Yang
> Help you, Help me
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

