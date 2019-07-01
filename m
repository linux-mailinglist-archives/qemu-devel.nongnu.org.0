Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A82224607
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 04:36:11 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45321 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSudO-0000DM-BL
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 22:36:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47269)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hSubv-0008AD-Ie
	for qemu-devel@nongnu.org; Mon, 20 May 2019 22:34:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hSubu-0008MN-22
	for qemu-devel@nongnu.org; Mon, 20 May 2019 22:34:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32816)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hSubt-0008HK-SD
	for qemu-devel@nongnu.org; Mon, 20 May 2019 22:34:37 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A01F8368FF
	for <qemu-devel@nongnu.org>; Tue, 21 May 2019 02:34:36 +0000 (UTC)
Received: from xz-x1 (dhcp-15-205.nay.redhat.com [10.66.15.205])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A87BF60142;
	Tue, 21 May 2019 02:34:34 +0000 (UTC)
Date: Tue, 21 May 2019 10:34:32 +0800
From: Peter Xu <peterx@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190521023432.GR16681@xz-x1>
References: <20190520030839.6795-1-peterx@redhat.com>
	<20190520030839.6795-12-peterx@redhat.com>
	<33678ffc-8556-5cb8-f29e-907cf031a50b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <33678ffc-8556-5cb8-f29e-907cf031a50b@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 21 May 2019 02:34:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 11/15] kvm: Introduce slots lock for
 memory listener
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

On Mon, May 20, 2019 at 12:49:39PM +0200, Paolo Bonzini wrote:
> On 20/05/19 05:08, Peter Xu wrote:
> > +/* Must be with slots_lock held */
> 
> Perhaps "Called with KVMMemoryListener slots_lock held."?

Yes sounds better.  I'm replacing the old comments with "Called with
KVMMemoryListener.slots_lock held" (with the dot).

Thanks,

-- 
Peter Xu

