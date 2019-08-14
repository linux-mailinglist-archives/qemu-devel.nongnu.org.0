Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E24F8D6BE
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Aug 2019 16:57:57 +0200 (CEST)
Received: from localhost ([::1]:33128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxuiq-0004jY-4I
	for lists+qemu-devel@lfdr.de; Wed, 14 Aug 2019 10:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35983)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1hxuf0-0003FN-3c
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 10:53:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hxuez-0006jQ-4O
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 10:53:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38361)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hxuey-0006jL-VM
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 10:53:57 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4589D3003A49
 for <qemu-devel@nongnu.org>; Wed, 14 Aug 2019 14:53:56 +0000 (UTC)
Received: from work-vm (ovpn-117-212.ams2.redhat.com [10.36.117.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91C39806BE;
 Wed, 14 Aug 2019 14:53:55 +0000 (UTC)
Date: Wed, 14 Aug 2019 15:53:53 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Message-ID: <20190814145353.GL2920@work-vm>
References: <20190814020218.1868-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190814020218.1868-1-quintela@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 14 Aug 2019 14:53:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 0/6] Fix multifd with big number of channels
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> Hi
> 
> When we have much more channels than cpus, we end having failures when
> writting to sockets. This series:
> - add some traces
> - fix some of the trouble with serialization of creating the
>   threads/channels in proper order.
> - Ask for help with the last patch.  See documentation there.
> 
> Please, review.

patchew is reporting a failure that looks like it came from one of
these; but I'm not sure which one yet!

> 
> Juan Quintela (6):
>   migration: Add traces for multifd terminate threads
>   migration: Make global sem_sync semaphore by channel
>   migration: Make sure that all multifd channels have been created
>   migration: Make multifd threads wait until all have been created
>   migration: add some multifd traces
>   RFH: We lost "connect" events
> 
>  migration/ram.c        | 60 +++++++++++++++++++++++++++++++++++-------
>  migration/trace-events |  8 ++++++
>  2 files changed, 59 insertions(+), 9 deletions(-)
> 
> -- 
> 2.21.0
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

