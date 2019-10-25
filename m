Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A687E4FB4
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 16:59:31 +0200 (CEST)
Received: from localhost ([::1]:33334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iO13p-0006y0-Hp
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 10:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49488)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <michael@weiser.dinsnail.net>) id 1iO0sk-0006m7-QJ
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 10:48:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <michael@weiser.dinsnail.net>) id 1iO0sg-0005lI-G2
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 10:48:00 -0400
Received: from heinz.dinsnail.net
 ([2a01:238:43b4:3200:9392:5dcc:2f0e:a960]:44930)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <michael@weiser.dinsnail.net>)
 id 1iO0sY-0005hC-Mz; Fri, 25 Oct 2019 10:47:50 -0400
Received: from heinz.dinsnail.net ([IPv6:0:0:0:0:0:0:0:1])
 by heinz.dinsnail.net (8.15.2/8.15.2) with ESMTP id x9PEixHX001877;
 Fri, 25 Oct 2019 16:44:59 +0200
Received: from eldalonde.UUCP (uucp@localhost)
 by heinz.dinsnail.net (8.15.2/8.15.2/Submit) with bsmtp id x9PEiw6K001876;
 Fri, 25 Oct 2019 16:44:58 +0200
Received: from eldalonde.weiser.dinsnail.net (localhost [IPv6:0:0:0:0:0:0:0:1])
 by eldalonde.weiser.dinsnail.net (8.15.2/8.15.2) with ESMTP id x9PEgSPY003593; 
 Fri, 25 Oct 2019 16:42:28 +0200
Received: (from michael@localhost)
 by eldalonde.weiser.dinsnail.net (8.15.2/8.15.2/Submit) id x9PEgSnR003592;
 Fri, 25 Oct 2019 16:42:28 +0200
Date: Fri, 25 Oct 2019 16:42:28 +0200
From: Michael Weiser <michael@weiser.dinsnail.net>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 0/2] qcow2: Fix image corruption bug in 4.1
Message-ID: <20191025144228.GA3419@weiser.dinsnail.net>
References: <20191024142658.22306-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191024142658.22306-1-kwolf@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-dinsnail-net-MailScanner-Information: Please contact the ISP for more
 information
X-dinsnail-net-MailScanner-ID: x9PEixHX001877
X-dinsnail-net-MailScanner: Found to be clean
X-dinsnail-net-MailScanner-From: michael@weiser.dinsnail.net
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a01:238:43b4:3200:9392:5dcc:2f0e:a960
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
Cc: psyhomb@gmail.com, vsementsov@virtuozzo.com, den@virtuozzo.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 dgilbert@redhat.com, mreitz@redhat.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Kevin,

On Thu, Oct 24, 2019 at 04:26:56PM +0200, Kevin Wolf wrote:

> Kevin Wolf (2):
>   coroutine: Add qemu_co_mutex_assert_locked()
>   qcow2: Fix corruption bug in qcow2_detect_metadata_preallocation()

Tested-by: Michael Weiser <michael.weiser@gmx.de>

with offending 69f47505e and today's master
(58560ad254fbda71d4daa6622d71683190070ee2).

Corruption does not happen with series applied.
Assertion tiggers as expected if lock is not taken.

FWIW: Reviewed-by: Michael Weiser <michael.weiser@gmx.de>
-- 
Thanks,
Michael

