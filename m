Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5C732F9D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 14:29:13 +0200 (CEST)
Received: from localhost ([127.0.0.1]:34461 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXm5Q-000589-Pe
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 08:29:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35094)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mlevitsk@redhat.com>) id 1hXm3d-0004K9-7b
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 08:27:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mlevitsk@redhat.com>) id 1hXm3c-00008u-7m
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 08:27:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59506)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
	id 1hXm3Y-0007wb-40; Mon, 03 Jun 2019 08:27:16 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B3AD30C1AFC;
	Mon,  3 Jun 2019 12:26:49 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.49])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 47A7E45CD;
	Mon,  3 Jun 2019 12:26:45 +0000 (UTC)
Message-ID: <9f33152c244d64be67b80ad920c6f735a41b6f2f.camel@redhat.com>
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 03 Jun 2019 15:26:45 +0300
In-Reply-To: <20190417195355.16123-1-mlevitsk@redhat.com>
References: <20190417195355.16123-1-mlevitsk@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Mon, 03 Jun 2019 12:27:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 0/5] Few fixes for userspace NVME driver
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2019-04-17 at 22:53 +0300, Maxim Levitsky wrote:
> Hi!
> These are few assorted fixes and features for the userspace
> nvme driver.
> 
> Tested that on my laptop with my Samsung X5 thunderbolt drive, which
> happens to have 4K sectors, support for discard and write zeros.
> 
> Also bunch of fixes sitting in my queue from the period when I developed
> the nvme-mdev driver.
> 
> Best regards,
>         Maxim Levitsky
> 
> Maxim Levitsky (5):
>   block/nvme: don't flip CQ phase bits
>   block/nvme: fix doorbell stride
>   block/nvme: support larger that 512 bytes sector devices
>   block/nvme: add support for write zeros
>   block/nvme: add support for discard
> 
>  block/nvme.c         | 193 +++++++++++++++++++++++++++++++++++++++++--
>  block/trace-events   |   3 +
>  include/block/nvme.h |  19 ++++-
>  3 files changed, 205 insertions(+), 10 deletions(-)
> 

Ping.

Best regards,
	Maxim Levitsky


