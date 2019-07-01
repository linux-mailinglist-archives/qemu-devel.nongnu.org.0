Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5656B4B407
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 10:28:10 +0200 (CEST)
Received: from localhost ([::1]:35842 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdVwv-0003Z9-Jm
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 04:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44178)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hdVvl-00036R-Lx
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 04:26:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hdVvk-0004uk-Ox
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 04:26:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52400)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hdVvk-0004lw-II; Wed, 19 Jun 2019 04:26:56 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F17D437F43;
 Wed, 19 Jun 2019 08:26:37 +0000 (UTC)
Received: from gondolin (dhcp-192-192.str.redhat.com [10.33.192.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1423600C7;
 Wed, 19 Jun 2019 08:26:35 +0000 (UTC)
Date: Wed, 19 Jun 2019 10:26:33 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>, Farhan Ali <alifm@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>
Message-ID: <20190619102633.7da2c85a.cohuck@redhat.com>
In-Reply-To: <20190613092542.2834-1-cohuck@redhat.com>
References: <20190613092542.2834-1-cohuck@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Wed, 19 Jun 2019 08:26:40 +0000 (UTC)
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 Jun 2019 11:25:42 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> A vfio-ccw device may provide an async command subregion for
> issuing halt/clear subchannel requests. If it is present, use
> it for sending halt/clear request to the device; if not, fall
> back to emulation (as done today).
> 
> Reviewed-by: Farhan Ali <alifm@linux.ibm.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> 
> v5->v6:
> - plug a memory leak [Farhan]
> 
> v4->v5:
> - It seems we need to take the indirection via the class for the
>   callbacks after all :(
> - Dropped Eric's R-b: for that reason
> 
> ---
>  hw/s390x/css.c              |  27 +++++++--
>  hw/s390x/s390-ccw.c         |  20 +++++++
>  hw/vfio/ccw.c               | 113 +++++++++++++++++++++++++++++++++++-
>  include/hw/s390x/css.h      |   3 +
>  include/hw/s390x/s390-ccw.h |   2 +
>  5 files changed, 159 insertions(+), 6 deletions(-)

Anyone else? I'd like to queue this.

