Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF8D4E6D2
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 13:10:53 +0200 (CEST)
Received: from localhost ([::1]:59386 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heHRU-0002U7-IR
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 07:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43485)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1heHPD-0000vX-0R
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:08:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1heHP8-00089o-A2
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:08:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:18752)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1heHP7-00088N-W6; Fri, 21 Jun 2019 07:08:26 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F1A69308623C;
 Fri, 21 Jun 2019 11:08:19 +0000 (UTC)
Received: from gondolin (dhcp-192-192.str.redhat.com [10.33.192.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FB3E61101;
 Fri, 21 Jun 2019 11:08:18 +0000 (UTC)
Date: Fri, 21 Jun 2019 13:08:16 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>
Message-ID: <20190621130816.58399a8c.cohuck@redhat.com>
In-Reply-To: <08cdcd56-e6a1-8d36-fe77-c683f526feb3@linux.ibm.com>
References: <20190613092542.2834-1-cohuck@redhat.com>
 <08cdcd56-e6a1-8d36-fe77-c683f526feb3@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 21 Jun 2019 11:08:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v6] vfio-ccw: support async command
 subregion
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
Cc: Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 Farhan Ali <alifm@linux.ibm.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 19 Jun 2019 15:05:25 -0400
Eric Farman <farman@linux.ibm.com> wrote:

> On 6/13/19 5:25 AM, Cornelia Huck wrote:
> > A vfio-ccw device may provide an async command subregion for
> > issuing halt/clear subchannel requests. If it is present, use
> > it for sending halt/clear request to the device; if not, fall
> > back to emulation (as done today).
> > 
> > Reviewed-by: Farhan Ali <alifm@linux.ibm.com>
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > ---
> > 
> > v5->v6:
> > - plug a memory leak [Farhan]
> > 
> > v4->v5:
> > - It seems we need to take the indirection via the class for the
> >   callbacks after all :(
> > - Dropped Eric's R-b: for that reason  
> 
> I've finally looked over this version, and think it looks good.  Feel
> free to add this back:
> 
> Reviewed-by: Eric Farman <farman@linux.ibm.com>
> 

Thanks!

Queued to s390-next.

