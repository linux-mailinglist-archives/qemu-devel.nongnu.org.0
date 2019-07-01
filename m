Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7813286F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 08:24:37 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58369 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXgOa-0007bm-2N
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 02:24:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44648)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hXgMJ-0006TE-Rm
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 02:22:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hXgLs-0005tc-3F
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 02:21:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53978)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hXgLr-0005pw-PY
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 02:21:48 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ABE19309265A
	for <qemu-devel@nongnu.org>; Mon,  3 Jun 2019 06:21:46 +0000 (UTC)
Received: from xz-x1 (dhcp-15-205.nay.redhat.com [10.66.15.205])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4FDD101E59F;
	Mon,  3 Jun 2019 06:21:44 +0000 (UTC)
Date: Mon, 3 Jun 2019 14:21:42 +0800
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Message-ID: <20190603062142.GA31512@xz-x1>
References: <20190530092919.26059-1-peterx@redhat.com>
	<20190530092919.26059-2-peterx@redhat.com>
	<87r28eok96.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87r28eok96.fsf@trasno.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Mon, 03 Jun 2019 06:21:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 01/12] checkpatch: Allow
 SPDX-License-Identifier
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 31, 2019 at 02:56:21PM +0200, Juan Quintela wrote:
> Peter Xu <peterx@redhat.com> wrote:
> > According to: https://spdx.org/ids-how, let's still allow QEMU to use
> > the SPDX license identifier:
> >
> > // SPDX-License-Identifier: ***
> >
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> 
> Althought this patch don't belong to the series O:-)

Right. :)  And Paolo should have queued the patch.

To make life easier, I plan to simply drop this patch in next spin and
change the only user of "// SPDX-License-Identifier" patch in the
series to simply use "/* ... */" since I just noticed vast codes in
QEMU is using that... then we don't have to depend on this patch.

-- 
Peter Xu

