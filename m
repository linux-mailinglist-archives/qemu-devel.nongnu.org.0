Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17136D2E70
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 18:18:13 +0200 (CEST)
Received: from localhost ([::1]:41944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIb8l-0004Zp-Em
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 12:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41538)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iIb64-0002oi-5m
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 12:15:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iIb63-0000RS-8W
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 12:15:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:24469)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iIb61-0000Qy-1c; Thu, 10 Oct 2019 12:15:21 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2AB6085365;
 Thu, 10 Oct 2019 16:15:20 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C55EC600F8;
 Thu, 10 Oct 2019 16:15:18 +0000 (UTC)
Date: Thu, 10 Oct 2019 18:15:17 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Lieven <pl@kamp.de>
Subject: Re: [PATCH V4] block/vhdx: add check for truncated image files
Message-ID: <20191010161517.GG7616@localhost.localdomain>
References: <20190910152622.5432-1-pl@kamp.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190910152622.5432-1-pl@kamp.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Thu, 10 Oct 2019 16:15:20 +0000 (UTC)
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
Cc: codyprime@gmail.com, mreitz@redhat.com, jhf@kamp.de, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 10.09.2019 um 17:26 hat Peter Lieven geschrieben:
> qemu is currently not able to detect truncated vhdx image files.
> Add a basic check if all allocated blocks are reachable at open and
> report all errors during bdrv_co_check.
> 
> Signed-off-by: Peter Lieven <pl@kamp.de>

Thanks, applied to the block branch.

Kevin

