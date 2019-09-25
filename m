Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C1FBDBE4
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 12:12:52 +0200 (CEST)
Received: from localhost ([::1]:47846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iD4Hz-0007gj-4M
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 06:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38507)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iD4GM-0006bK-2m
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 06:11:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iD4GJ-0000Og-3F
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 06:11:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35162)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iD4GI-0000OE-UJ
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 06:11:07 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BB2B410CC205
 for <qemu-devel@nongnu.org>; Wed, 25 Sep 2019 10:11:05 +0000 (UTC)
Received: from work-vm (ovpn-117-251.ams2.redhat.com [10.36.117.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D5845D9CC;
 Wed, 25 Sep 2019 10:11:02 +0000 (UTC)
Date: Wed, 25 Sep 2019 11:11:00 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, quintela@redhat.com, peterx@redhat.com
Subject: Re: [Qemu-devel] [PATCH 0/2] migration/rdma disconnect fixes
Message-ID: <20190925101100.GC21544@work-vm>
References: <20190913163507.1403-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190913163507.1403-1-dgilbert@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Wed, 25 Sep 2019 10:11:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Hi,
>   This fixes a deadlock that can occur on the source after
> a failed RDMA migration and cleans up some warning messages
> that can appear during normal completion.
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=1746787

Queued

> Dr. David Alan Gilbert (2):
>   migration/rdma: Don't moan about disconnects at the end
>   migration/rdma.c: Swap synchronize_rcu for call_rcu
> 
>  migration/rdma.c | 51 +++++++++++++++++++++++++++++++++---------------
>  1 file changed, 35 insertions(+), 16 deletions(-)
> 
> -- 
> 2.21.0
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

