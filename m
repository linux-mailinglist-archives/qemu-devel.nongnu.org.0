Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBBCA83EC
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 15:46:31 +0200 (CEST)
Received: from localhost ([::1]:59280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5VcE-0003H0-Jh
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 09:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37230)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1i5VaD-0001ax-07
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 09:44:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1i5VaC-0002gZ-3i
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 09:44:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34446)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1i5Va8-0002dd-Ec; Wed, 04 Sep 2019 09:44:20 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B30CD7F767;
 Wed,  4 Sep 2019 13:44:18 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-221.ams2.redhat.com
 [10.36.116.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B631A19C4F;
 Wed,  4 Sep 2019 13:44:14 +0000 (UTC)
Date: Wed, 4 Sep 2019 15:44:13 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Message-ID: <20190904134413.GB21246@localhost.localdomain>
References: <1567588284-975381-1-git-send-email-andrey.shinkevich@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567588284-975381-1-git-send-email-andrey.shinkevich@virtuozzo.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Wed, 04 Sep 2019 13:44:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v8 0/6] Allow Valgrind checking all QEMU
 processes
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
Cc: vsementsov@virtuozzo.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.09.2019 um 11:11 hat Andrey Shinkevich geschrieben:
> In the current implementation of the QEMU bash iotests, only qemu-io
> processes may be run under the Valgrind with the switch '-valgrind'.
> Let's allow the common.rc bash script running all other QEMU processes,
> such as qemu-kvm, qemu-img, qemu-ndb and qemu-vxhs, under the Valgrind.
> 
> v8:
>   01: Fix for the optimization made in v7 where the iotests 039 and 051
>       did not pass being run under the Valgrind. NO_VALGRIND variable
>       has been introduced to complete the optimization logic (patch 2/6).

Thanks, applied to the block branch.

Kevin

