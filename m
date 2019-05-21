Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DF92458B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 03:16:59 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44525 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hStOj-0001qQ-K3
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 21:16:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36655)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hStNT-0001Bl-DE
	for qemu-devel@nongnu.org; Mon, 20 May 2019 21:15:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hStNP-0007mB-1g
	for qemu-devel@nongnu.org; Mon, 20 May 2019 21:15:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:26886)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hStNK-0007ka-WA
	for qemu-devel@nongnu.org; Mon, 20 May 2019 21:15:33 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 42F9F85545
	for <qemu-devel@nongnu.org>; Tue, 21 May 2019 01:15:25 +0000 (UTC)
Received: from xz-x1 (ovpn-12-18.pek2.redhat.com [10.72.12.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD02F1001DE7;
	Tue, 21 May 2019 01:15:21 +0000 (UTC)
Date: Tue, 21 May 2019 09:15:16 +0800
From: Peter Xu <peterx@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190521011516.GP16681@xz-x1>
References: <20190520030839.6795-1-peterx@redhat.com>
	<20190520030839.6795-14-peterx@redhat.com>
	<5d9174bc-0f3b-100f-e400-eeb94680020a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5d9174bc-0f3b-100f-e400-eeb94680020a@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 21 May 2019 01:15:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 13/15] qmp: Expose
 manual_dirty_log_protect via "query-kvm"
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
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 20, 2019 at 12:44:29PM +0200, Paolo Bonzini wrote:
> On 20/05/19 05:08, Peter Xu wrote:
> > Expose the new capability via "query-kvm" QMP command too so we know
> > whether that's turned on on the source VM when we want.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> Is this useful?  We could I guess make a migration capability in order
> to benchmark with the old code, but otherwise I would just make this a
> "hidden" optimization just like many others (same for patch 14).
> 
> In other words, there are many other capabilities that we could inform
> the user about, I don't see what makes manual_dirty_log_protect special.

Yes this is mostly used for me to make sure the new capability is
enabled when comparing with the old code.  I added QMP part too
because otherwise I'll need to justify why I only add HMP...

But I agree with above - let's drop these two QMP/HMP patches.

Thanks,

-- 
Peter Xu

