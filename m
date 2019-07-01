Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEE0230F4
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 12:12:28 +0200 (CEST)
Received: from localhost ([127.0.0.1]:32872 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSfHO-000291-8b
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 06:12:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36439)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hSfGH-0001og-4O
	for qemu-devel@nongnu.org; Mon, 20 May 2019 06:11:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hSfGG-0000HK-D1
	for qemu-devel@nongnu.org; Mon, 20 May 2019 06:11:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44916)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hSfGE-0000En-Et; Mon, 20 May 2019 06:11:14 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9260E3007148;
	Mon, 20 May 2019 10:11:11 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-208.ams2.redhat.com
	[10.36.117.208])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA8DD61D0E;
	Mon, 20 May 2019 10:11:05 +0000 (UTC)
Date: Mon, 20 May 2019 12:11:04 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Klaus Birkelund Jensen <klaus@birkelund.eu>
Message-ID: <20190520101104.GC5699@localhost.localdomain>
References: <20190518073905.17178-1-klaus@birkelund.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190518073905.17178-1-klaus@birkelund.eu>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Mon, 20 May 2019 10:11:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] nvme: fix copy direction in DMA reads
 going to CMB
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
Cc: Keith Busch <keith.busch@intel.com>, "Heitke,
	Kenneth" <kenneth.heitke@intel.com>, qemu-devel@nongnu.org,
	qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.05.2019 um 09:39 hat Klaus Birkelund Jensen geschrieben:
> `nvme_dma_read_prp` erronously used `qemu_iovec_*to*_buf` instead of
> `qemu_iovec_*from*_buf` when the request involved the controller memory
> buffer.
> 
> Signed-off-by: Klaus Birkelund Jensen <klaus.jensen@cnexlabs.com>

Thanks, applied to the block branch.

Kevin

