Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FD610CED9
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Nov 2019 20:20:58 +0100 (CET)
Received: from localhost ([::1]:52550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iaPLU-0007QU-GZ
	for lists+qemu-devel@lfdr.de; Thu, 28 Nov 2019 14:20:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48558)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iaNUu-0003Na-69
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 12:22:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iaNUb-0006gI-S0
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 12:22:14 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:51247
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iaNUb-0006Qr-M7
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 12:22:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574961729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ksAb3F9Sngts0fNrzsK0szqayvIyt88ee4IoesROT0Y=;
 b=NHIS1DL5nkC39RP9YnyR4M3kuBx2ozKcfTX3w1syAfF3Iy24nDkeldzazxaJjaiq2iAxcI
 FUqkNwa5L6RJBUAQ3HxEJ15uBBFqKYDla48bTmbHrdzQXpEnhBptpKesfZ+MNOV+7dz5Eq
 lr7oG57GAUAWfwYrm7co0E5zg98WuVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-Hf6T3dUHPKW983HntuBC8g-1; Thu, 28 Nov 2019 12:22:08 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 215CC184CAA0;
 Thu, 28 Nov 2019 17:22:07 +0000 (UTC)
Received: from gondolin (ovpn-116-200.ams2.redhat.com [10.36.116.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2144AA203;
 Thu, 28 Nov 2019 17:22:02 +0000 (UTC)
Date: Thu, 28 Nov 2019 18:22:00 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Boris Fiuczynski <fiuczy@linux.ibm.com>
Subject: Re: [PATCH] vfio-ccw: Fix error message
Message-ID: <20191128182200.2e24c384.cohuck@redhat.com>
In-Reply-To: <20191128143015.5231-1-fiuczy@linux.ibm.com>
References: <20191128143015.5231-1-fiuczy@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Hf6T3dUHPKW983HntuBC8g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: farman@linux.ibm.com, qemu-s390x@nongnu.org, alex.williamson@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Nov 2019 15:30:14 +0100
Boris Fiuczynski <fiuczy@linux.ibm.com> wrote:

> Signed-off-by: Boris Fiuczynski <fiuczy@linux.ibm.com>
> Reviewed-by: Eric Farman <farman@linux.ibm.com>
> ---
>  hw/vfio/ccw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> index 6863f6c69f..3b5520ae75 100644
> --- a/hw/vfio/ccw.c
> +++ b/hw/vfio/ccw.c
> @@ -102,7 +102,7 @@ again:
>          if (errno == EAGAIN) {
>              goto again;
>          }
> -        error_report("vfio-ccw: wirte I/O region failed with errno=%d", errno);
> +        error_report("vfio-ccw: write I/O region failed with errno=%d", errno);
>          ret = -errno;
>      } else {
>          ret = region->ret_code;

Heh, that's a long-standing one :)

Thanks, applied.


