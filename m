Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB5726173
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 12:11:06 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39622 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTODB-0004Sa-Vl
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 06:11:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hTO78-0008E8-RN
	for qemu-devel@nongnu.org; Wed, 22 May 2019 06:04:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hTNwT-0001Wm-GS
	for qemu-devel@nongnu.org; Wed, 22 May 2019 05:53:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59084)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hTNwS-0001Va-B1; Wed, 22 May 2019 05:53:48 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A9406378;
	Wed, 22 May 2019 09:53:47 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-92.ams2.redhat.com
	[10.36.117.92])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04644604C8;
	Wed, 22 May 2019 09:53:42 +0000 (UTC)
Date: Wed, 22 May 2019 11:53:42 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Message-ID: <20190522095342.GB6087@localhost.localdomain>
References: <20190513150638.14622-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190513150638.14622-1-jsnow@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 22 May 2019 09:53:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2] blockdev: fix missed target unref for
 drive-backup
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
Cc: Markus Armbruster <armbru@redhat.com>, aihua liang <aliang@redhat.com>,
	qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.05.2019 um 17:06 hat John Snow geschrieben:
> If the bitmap can't be used for whatever reason, we skip putting down
> the reference. Fix that.
> 
> In practice, this means that if you attempt to gracefully exit QEMU
> after a backup command being rejected, bdrv_close_all will fail and
> tell you some unpleasant things via assert().
> 
> Reported-by: aihua liang <aliang@redhat.com>
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1703916
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>

Thanks, applied to the block branch.

Kevin

