Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1274D750FE
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 16:25:50 +0200 (CEST)
Received: from localhost ([::1]:60630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqegm-000780-Su
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 10:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33917)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hqegT-0006Yh-Vj
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 10:25:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hqegS-000568-W5
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 10:25:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42234)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hqegP-00051y-Hl; Thu, 25 Jul 2019 10:25:25 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C385185539;
 Thu, 25 Jul 2019 14:25:23 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-146.ams2.redhat.com [10.36.117.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1748F60C05;
 Thu, 25 Jul 2019 14:25:01 +0000 (UTC)
Date: Thu, 25 Jul 2019 16:25:00 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Message-ID: <20190725142500.GD8294@linux.fritz.box>
References: <1564056050-505695-1-git-send-email-andrey.shinkevich@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1564056050-505695-1-git-send-email-andrey.shinkevich@virtuozzo.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Thu, 25 Jul 2019 14:25:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2] Fixes: add read-zeroes to 051.out
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
Cc: peter.maydell@linaro.org, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, borntraeger@de.ibm.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.07.2019 um 14:00 hat Andrey Shinkevich geschrieben:
> The patch "iotests: Set read-zeroes on in null block driver for Valgrind"
> with the commit ID a6862418fec4072 needs the change in 051.out when
> compared against on the s390 system.
> 
> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> Tested-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Reviewed-by: John Snow <jsnow@redhat.com>

Thanks, applied to the block branch.

Kevin

