Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E9B8EFB1
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 17:45:39 +0200 (CEST)
Received: from localhost ([::1]:43320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyHwY-0005nj-0B
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 11:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39362)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1hyHqf-00085u-T7
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 11:39:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hyHqc-0001FJ-3P
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 11:39:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44488)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hyHqb-0001Ew-Ts; Thu, 15 Aug 2019 11:39:30 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2571E2A09DC;
 Thu, 15 Aug 2019 15:39:29 +0000 (UTC)
Received: from gondolin (ovpn-116-91.ams2.redhat.com [10.36.116.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0C373796;
 Thu, 15 Aug 2019 15:39:24 +0000 (UTC)
Date: Thu, 15 Aug 2019 17:39:22 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20190815173922.65d6c12a.cohuck@redhat.com>
In-Reply-To: <8f5a49d2-49f3-f7b4-220b-fe2542b751c2@redhat.com>
References: <20190814072355.15333-1-david@redhat.com>
 <20190814072355.15333-5-david@redhat.com>
 <8f5a49d2-49f3-f7b4-220b-fe2542b751c2@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Thu, 15 Aug 2019 15:39:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [qemu-s390x] [PATCH-for-4.2 v2 4/6] s390x/mmu:
 Trace the right value if setting/getting the storage key fails
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
Cc: Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Aug 2019 19:50:44 +0200
Thomas Huth <thuth@redhat.com> wrote:

> On 8/14/19 9:23 AM, David Hildenbrand wrote:
> > We want to trace the actual return value, not "0".
> > 
> > Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> > Signed-off-by: David Hildenbrand <david@redhat.com>
> > ---
> >  target/s390x/mmu_helper.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)

> Fixes: 0f5f669147b52f89928bdf180165f74c4219210e

Better:
Fixes: 0f5f669147b5 ("s390x: Enable new s390-storage-keys device")

> Reviewed-by: Thomas Huth <thuth@redhat.com>


