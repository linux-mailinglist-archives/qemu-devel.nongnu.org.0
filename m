Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DCF11448E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Dec 2019 17:14:56 +0100 (CET)
Received: from localhost ([::1]:57034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ictmJ-0000hv-7g
	for lists+qemu-devel@lfdr.de; Thu, 05 Dec 2019 11:14:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41200)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1icthD-0004Zz-Ba
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 11:09:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1icthB-000826-Vh
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 11:09:38 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39127
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1icthB-000806-Pr
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 11:09:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575562175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aGalizfwmSIPEH9H505AFCk6XaXeoS9BCoK4p/HGGEI=;
 b=Jezf4rJEoceYXHM3s8AgXrCX3UvY/k5gT46wSANra6hLX1AQqahimmJDGaF1cIKGV1Yw01
 BVXrx/xF1yTBDAZtJODdiDIrupM+BMlchbFYLTX3EhiWvYR0vVuYD3VJLToWsUGl+pRZ4/
 GGgXZ/X/RIx4bcg0ratTZ/CaTI37SLw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-t6rzFpjYN6-pjx3B9CIp7Q-1; Thu, 05 Dec 2019 11:09:32 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E733C8E96B1;
 Thu,  5 Dec 2019 16:09:30 +0000 (UTC)
Received: from gondolin (unknown [10.36.118.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57ED76A028;
 Thu,  5 Dec 2019 16:09:26 +0000 (UTC)
Date: Thu, 5 Dec 2019 17:09:23 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v7 20/21] hw/vfio/ap: drop local_err from vfio_ap_realize
Message-ID: <20191205170923.3a710a71.cohuck@redhat.com>
In-Reply-To: <20191205152019.8454-21-vsementsov@virtuozzo.com>
References: <20191205152019.8454-1-vsementsov@virtuozzo.com>
 <20191205152019.8454-21-vsementsov@virtuozzo.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: t6rzFpjYN6-pjx3B9CIp7Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  5 Dec 2019 18:20:18 +0300
Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:

> No reason for local_err here, use errp directly instead.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/vfio/ap.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


