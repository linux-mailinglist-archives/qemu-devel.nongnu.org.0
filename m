Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F9A10E806
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 10:55:46 +0100 (CET)
Received: from localhost ([::1]:33040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibiQj-0006gL-Qb
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 04:55:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57271)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jfreimann@redhat.com>) id 1ibiOy-0004ns-1f
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 04:53:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jfreimann@redhat.com>) id 1ibiOx-0006yF-2J
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 04:53:55 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:32554
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jfreimann@redhat.com>)
 id 1ibiOw-0006xu-Uw
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 04:53:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575280434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h0pxok+s49p+Y9nNVs1ed5C2uHdFt3siRqZMg7ztotk=;
 b=h0KpvQfWUvuYi8DrCFFVYkemoEXXI/gQ+5g5d0kNjDgQd6928ypg2CdGGAFGW5CTsw8FeF
 /MB9WnkcC/xWyN49C6g3zi5s5s8JfKPAzdfQ948tfVztt9Qu5sjn4HIUofiDAyNd/kzxa+
 J54Vgy6XvnAN+OPZW5xTN+gfuX7c20A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-sYXAxFTEOAiLXYpWulRRew-1; Mon, 02 Dec 2019 04:53:53 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B1FE100551D;
 Mon,  2 Dec 2019 09:53:52 +0000 (UTC)
Received: from localhost (dhcp-192-223.str.redhat.com [10.33.192.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D9195D6A0;
 Mon,  2 Dec 2019 09:53:49 +0000 (UTC)
Date: Mon, 2 Dec 2019 10:53:48 +0100
From: Jens Freimann <jfreimann@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 01/21] net/virtio: Drop useless n->primary_dev not null
 checks
Message-ID: <20191202095348.oftwz72pbajxirjg@jenstp.localdomain>
References: <20191130194240.10517-1-armbru@redhat.com>
 <20191130194240.10517-2-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191130194240.10517-2-armbru@redhat.com>
User-Agent: NeoMutt/20180716-1376-5d6ed1
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: sYXAxFTEOAiLXYpWulRRew-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Nov 30, 2019 at 08:42:20PM +0100, Markus Armbruster wrote:
>virtio_net_handle_migration_primary() returns early when it can't
>ensure n->primary_dev is non-null.  Checking it again right after that
>early return is redundant.  Drop.
>
>If n->primary_dev is null on entering failover_replug_primary(), @pdev
>will become null, and pdev->partially_hotplugged will crash.  Checking
>n->primary_dev later is useless.  It can't actually be null, because
>its caller virtio_net_handle_migration_primary() ensures it isn't.
>Drop the useless check.
>
>Cc: Jens Freimann <jfreimann@redhat.com>
>Cc: Michael S. Tsirkin <mst@redhat.com>
>Signed-off-by: Markus Armbruster <armbru@redhat.com>
>---
> hw/net/virtio-net.c | 8 +-------
> 1 file changed, 1 insertion(+), 7 deletions(-)
>

Thanks Markus!

Reviewed-by: Jens Freimann <jfreimann@redhat.com>

regards
Jens


