Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 712E874852
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 09:41:17 +0200 (CEST)
Received: from localhost ([::1]:56532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqYNI-00046V-5F
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 03:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60675)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hqYN1-0003E5-Nt
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 03:41:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hqYN0-0000LL-SY
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 03:40:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:14036)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hqYN0-0000L0-M2; Thu, 25 Jul 2019 03:40:58 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B8D43A836;
 Thu, 25 Jul 2019 07:40:56 +0000 (UTC)
Received: from gondolin (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 458A95D9DE;
 Thu, 25 Jul 2019 07:40:55 +0000 (UTC)
Date: Thu, 25 Jul 2019 09:40:53 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Farhan Ali <alifm@linux.ibm.com>
Message-ID: <20190725094053.2367e272.cohuck@redhat.com>
In-Reply-To: <355a4ac2923ff3dcf2171cb23d477440bd010b34.1564003698.git.alifm@linux.ibm.com>
References: <cover.1564003698.git.alifm@linux.ibm.com>
 <355a4ac2923ff3dcf2171cb23d477440bd010b34.1564003698.git.alifm@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 25 Jul 2019 07:40:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/1] MAINTAINERS: vfio-ccw: Remove myself
 as the maintainer
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
Cc: linux-s390@vger.kernel.org, farman@linux.ibm.com, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[added the missing qemu mailing lists]

On Wed, 24 Jul 2019 17:35:46 -0400
Farhan Ali <alifm@linux.ibm.com> wrote:

> I will not be able to continue with my maintainership responsibilities
> going forward, so remove myself as the maintainer.

Thank you again for your work!

> 
> Signed-off-by: Farhan Ali <alifm@linux.ibm.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index acbad13..fe2797a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1452,7 +1452,6 @@ F: include/hw/vfio/
>  vfio-ccw
>  M: Cornelia Huck <cohuck@redhat.com>
>  M: Eric Farman <farman@linux.ibm.com>
> -M: Farhan Ali <alifm@linux.ibm.com>
>  S: Supported
>  F: hw/vfio/ccw.c
>  F: hw/s390x/s390-ccw.c

Queued to s390-fixes.

