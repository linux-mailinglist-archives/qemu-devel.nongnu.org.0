Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DFD2623F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 12:51:23 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTOqA-0002Ti-Ew
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 06:51:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hTOn3-00013p-6A
	for qemu-devel@nongnu.org; Wed, 22 May 2019 06:48:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hTOn2-0002F8-2N
	for qemu-devel@nongnu.org; Wed, 22 May 2019 06:48:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49524)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hTOmz-0002CM-KK; Wed, 22 May 2019 06:48:05 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0A3A5300BCE9;
	Wed, 22 May 2019 10:47:59 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-92.ams2.redhat.com
	[10.36.117.92])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33ADE601B0;
	Wed, 22 May 2019 10:47:55 +0000 (UTC)
Date: Wed, 22 May 2019 12:47:53 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <20190522104753.GD6087@localhost.localdomain>
References: <20190408162617.258535-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190408162617.258535-1-vsementsov@virtuozzo.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Wed, 22 May 2019 10:47:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 for 4.1 0/2] avoid lseek on block_status
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
Cc: fam@euphon.net, qemu-block@nongnu.org, qemu-devel@nongnu.org,
	mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.04.2019 um 18:26 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Hi!
> 
> It's a continuation for
> "[PATCH] qcow2: avoid lseek on block_status if possible"
> https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg06598.html
> 
> performance results for block-status on tmpfs [tests originally by Kevin,
> now they are in 01]:
> 
> ./tests/perf/block/qcow2/convert-blockstatus /ramdisk/x
> 
> after 01:
> 
> plain: 81.77
> forward: 82.61
> prealloc: 0.01
> 
> after 02:
> 
> plain: 0.12
> forward: 0.12
> prealloc: 0.01

Thanks, applied to the block branch.

Kevin

