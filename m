Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D761B6A5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 15:04:42 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56968 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQAdF-0004LF-Jo
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 09:04:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hQAat-0003Am-Mt
	for qemu-devel@nongnu.org; Mon, 13 May 2019 09:02:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hQAXP-00053c-6w
	for qemu-devel@nongnu.org; Mon, 13 May 2019 08:58:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50666)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hQAXK-000528-Fl; Mon, 13 May 2019 08:58:35 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B511882F5;
	Mon, 13 May 2019 12:58:33 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-130.ams2.redhat.com [10.36.117.130])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63FA660856;
	Mon, 13 May 2019 12:58:32 +0000 (UTC)
Date: Mon, 13 May 2019 14:58:30 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Alberto Garcia <berto@igalia.com>
Message-ID: <20190513125830.GC19114@linux.fritz.box>
References: <20190510162254.8152-1-berto@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190510162254.8152-1-berto@igalia.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 13 May 2019 12:58:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] qcow2: Define and use
 QCOW2_COMPRESSED_SECTOR_SIZE
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 10.05.2019 um 18:22 hat Alberto Garcia geschrieben:
> When an L2 table entry points to a compressed cluster the space used
> by the data is specified in 512-byte sectors. This size is independent
> from BDRV_SECTOR_SIZE and is specific to the qcow2 file format.
> 
> The QCOW2_COMPRESSED_SECTOR_SIZE constant defined in this patch makes
> this explicit.
> 
> Signed-off-by: Alberto Garcia <berto@igalia.com>

Thanks, applied to the block branch.

Kevin

