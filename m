Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F44D3C22
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 11:19:50 +0200 (CEST)
Received: from localhost ([::1]:47732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIr5R-0003xt-CU
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 05:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51046)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iIr3N-0002XX-O9
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 05:17:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iIr3M-0000ES-DO
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 05:17:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49384)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iIr3M-0000D5-6y
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 05:17:40 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C255682A4C9;
 Fri, 11 Oct 2019 09:17:38 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.36.118.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 30A6360BF4;
 Fri, 11 Oct 2019 09:17:30 +0000 (UTC)
Date: Fri, 11 Oct 2019 11:17:28 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Pavel Dovgalyuk <pavel.dovgaluk@gmail.com>
Subject: Re: [for-4.2 PATCH 0/6] Block-related record/replay fixes
Message-ID: <20191011091728.GC5158@localhost.localdomain>
References: <156872146565.1757.3033215873677512474.stgit@pasha-Precision-3630-Tower>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156872146565.1757.3033215873677512474.stgit@pasha-Precision-3630-Tower>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Fri, 11 Oct 2019 09:17:38 +0000 (UTC)
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
Cc: peter.maydell@linaro.org, pavel.dovgaluk@ispras.ru, pbonzini@redhat.com,
 quintela@redhat.com, ciro.santilli@gmail.com, jasowang@redhat.com,
 crosthwaite.peter@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 alex.bennee@linaro.org, maria.klimushenkova@ispras.ru, mst@redhat.com,
 kraxel@redhat.com, boost.lists@gmail.com, thomas.dullien@googlemail.com,
 dovgaluk@ispras.ru, mreitz@redhat.com, artem.k.pisarenko@gmail.com,
 dgilbert@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.09.2019 um 13:57 hat Pavel Dovgalyuk geschrieben:
> The set of patches include the block-related updates
> of the record/replay icount feature:
>  - application of 'snapshot' option on the file layer instead of
>    the top one: command line and documentation fix
>  - implementation of bdrv_snapshot_goto for blkreplay driver
>  - start/stop fix in replay mode with attached block devices
>  - record/replay of bh oneshot events, used in the block layer

Thanks, applied to the block branch.

Kevin

