Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D58E1E9DA
	for <lists+qemu-devel@lfdr.de>; Wed, 15 May 2019 10:08:39 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33155 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQoxq-0000og-Kj
	for lists+qemu-devel@lfdr.de; Wed, 15 May 2019 04:08:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hQowm-0000Sr-4H
	for qemu-devel@nongnu.org; Wed, 15 May 2019 04:07:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hQowl-0000h1-6V
	for qemu-devel@nongnu.org; Wed, 15 May 2019 04:07:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39938)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hQowi-0000bw-TU; Wed, 15 May 2019 04:07:29 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2F2E1307D840;
	Wed, 15 May 2019 08:07:28 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-220.ams2.redhat.com
	[10.36.116.220])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07823608BB;
	Wed, 15 May 2019 08:07:23 +0000 (UTC)
Date: Wed, 15 May 2019 10:07:22 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <20190515080722.GA7508@localhost.localdomain>
References: <20190124122525.145968-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190124122525.145968-1-vsementsov@virtuozzo.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Wed, 15 May 2019 08:07:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 0/2] fix qmp-cont vs migration-finish
 race-crash
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
	lcapitulino@redhat.com, mreitz@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.01.2019 um 13:25 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Hi.
> 
> It's a simple fix for problems reported in "Aborts in iotest 169"
> by Max:
> https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg05907.html
> 
> In thread Kevin described that a problem itself is bigger and needs
> more effort:
> https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg06136.html
> 
> So, we may continue discussion in "Aborts in iotest 169", and in
> parallel apply these patches at least as a temporary fix.
> 
> The problem of this fix is that we finally have a bit weird interface:
> 
> User gets event MIGRATION_COMPLETED, and after it he can get error
> message "Migration is not finalized yet". 
> 
> But it is better than crash, anyway.

Thanks, applied to the block branch.

Kevin

