Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA27B84E27
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 16:06:36 +0200 (CEST)
Received: from localhost ([::1]:41546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvMaJ-0006a2-Q9
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 10:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35343)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hvMZn-00066X-OJ
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 10:06:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hvMZm-00009N-VE
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 10:06:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59136)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hvMZl-00007y-5P; Wed, 07 Aug 2019 10:06:01 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F092F7BDA7;
 Wed,  7 Aug 2019 14:05:59 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-121.ams2.redhat.com
 [10.36.117.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B95F5C231;
 Wed,  7 Aug 2019 14:05:58 +0000 (UTC)
Date: Wed, 7 Aug 2019 16:05:57 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Message-ID: <20190807140557.GB19892@localhost.localdomain>
References: <20190722133347.15122-1-mreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722133347.15122-1-mreitz@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Wed, 07 Aug 2019 14:06:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 0/5] block: Fixes for concurrent block
 jobs
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 22.07.2019 um 15:33 hat Max Reitz geschrieben:
> I think the patches speak for themselves now.
> 
> (The title of this series alludes to what the iotest added in the final
> patch tests.)
> 
> v3:
> - Rebased on master
> - Added two tests to test-bdrv-drain [Kevin]
> - Removed new iotest from auto [Thomas]

Thanks, applied to block-next.

Kevin

