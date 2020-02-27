Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889A617151C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 11:37:45 +0100 (CET)
Received: from localhost ([::1]:56968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7GY4-00038q-JN
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 05:37:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48082)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1j7GWh-0002DI-9O
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 05:36:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1j7GWg-0005YO-EH
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 05:36:19 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:22554
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1j7GWg-0005Wh-AD
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 05:36:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582799776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JILzDXFzULTdhG901zVUqSOj7HSBQlTVMMYzuuuzfG4=;
 b=aa4vgDIl0FDTrEKwKlCe3U6ncdWGMomM+T0hQV1TI0TzTUWwpfAqLRY4zI/RYecnOlTsAS
 3TQmaZ8E0bd0cRj5VlihWzkitGnVA/XPrsjQXuP4Zf6+wIwN7A1nOec/rWP4xtZG/WcPuw
 gwU8CBFhPW+YX5AxL0a8rcV/r1F8oWY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-vtGcmaXQPYSYT-ZoCzlJJA-1; Thu, 27 Feb 2020 05:36:15 -0500
X-MC-Unique: vtGcmaXQPYSYT-ZoCzlJJA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07E378017CC;
 Thu, 27 Feb 2020 10:36:14 +0000 (UTC)
Received: from gondolin (ovpn-117-2.ams2.redhat.com [10.36.117.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EA7B1001B09;
 Thu, 27 Feb 2020 10:36:10 +0000 (UTC)
Date: Thu, 27 Feb 2020 11:36:08 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v6] s390x: Rename and use constants for short PSW
 address and mask
Message-ID: <20200227113608.0c6dae95.cohuck@redhat.com>
In-Reply-To: <20200227092341.38558-1-frankja@linux.ibm.com>
References: <20200227100632.5292d773.cohuck@redhat.com>
 <20200227092341.38558-1-frankja@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Feb 2020 04:23:41 -0500
Janosch Frank <frankja@linux.ibm.com> wrote:

> Let's rename PSW_MASK_ESA_ADDR to PSW_MASK_SHORT_ADDR because we're
> not working with a ESA PSW which would not support the extended
> addressing bit. Also let's actually use it.
> 
> Additionally we introduce PSW_MASK_SHORT_CTRL and use it throughout
> the codebase.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
> ---
>  hw/s390x/ipl.c     | 2 +-
>  target/s390x/cpu.c | 4 ++--
>  target/s390x/cpu.h | 3 ++-
>  3 files changed, 5 insertions(+), 4 deletions(-)

Thanks, applied.


