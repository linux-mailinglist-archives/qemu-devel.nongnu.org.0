Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDCB3489F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 15:27:43 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52658 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hY9Ta-00041d-Dj
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 09:27:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hY9SK-0003ef-QS
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 09:26:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hY9SK-0006NP-2F
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 09:26:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47200)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hY9NJ-0001CB-Bn; Tue, 04 Jun 2019 09:21:14 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 804D23079B9F;
	Tue,  4 Jun 2019 13:21:00 +0000 (UTC)
Received: from linux.fritz.box (ovpn-116-215.ams2.redhat.com [10.36.116.215])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AFA61001947;
	Tue,  4 Jun 2019 13:20:55 +0000 (UTC)
Date: Tue, 4 Jun 2019 15:20:53 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <20190604132053.GC14925@linux.fritz.box>
References: <20190604123948.48736-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604123948.48736-1-vsementsov@virtuozzo.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 04 Jun 2019 13:21:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v6] iotests: test big qcow2 shrink
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
Cc: fam@euphon.net, den@virtuozzo.com, qemu-block@nongnu.org,
	qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.06.2019 um 14:39 hat Vladimir Sementsov-Ogievskiy geschrieben:
> This test checks bug in qcow2_process_discards, fixed by previous
> commit.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Thanks, applied to the block branch.

Kevin

