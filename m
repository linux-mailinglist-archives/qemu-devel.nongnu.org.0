Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4185E0D5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 11:18:28 +0200 (CEST)
Received: from localhost ([::1]:34018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hibPH-0001WB-AC
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 05:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51690)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hiaq8-0006Qu-Rv
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 04:42:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hiaq6-0008Fm-9D
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 04:42:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46532)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hiaq5-00086Q-OA; Wed, 03 Jul 2019 04:42:06 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5A562308339E;
 Wed,  3 Jul 2019 08:42:03 +0000 (UTC)
Received: from gondolin (dhcp-192-192.str.redhat.com [10.33.192.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98EB358CB7;
 Wed,  3 Jul 2019 08:41:57 +0000 (UTC)
Date: Wed, 3 Jul 2019 10:41:55 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Message-ID: <20190703104155.5ccdacf8.cohuck@redhat.com>
In-Reply-To: <156209642116.14915.9598593247782519613.stgit@gimli.home>
References: <156209642116.14915.9598593247782519613.stgit@gimli.home>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Wed, 03 Jul 2019 08:42:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] vfio-ccw: Test vfio_set_irq_signaling()
 return value
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
Cc: eric.auger@redhat.com, farman@linux.ibm.com, alifm@linux.ibm.com,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 02 Jul 2019 13:41:34 -0600
Alex Williamson <alex.williamson@redhat.com> wrote:

> Coverity doesn't like that most callers of vfio_set_irq_signaling() check
> the return value and doesn't understand the equivalence of testing the
> error pointer instead.  Test the return value consistently.
> 
> Reported-by: Coverity (CID 1402783)
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> ---
>  hw/vfio/ccw.c |    5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Thanks, queued to s390-fixes.

