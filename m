Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4923F1454D2
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 14:08:03 +0100 (CET)
Received: from localhost ([::1]:41764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuFjl-00014K-QA
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 08:08:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50030)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1iuFio-0000fU-JU
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 08:07:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1iuFin-0008TA-H9
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 08:07:02 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48431
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1iuFin-0008Sr-DY
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 08:07:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579698420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YdzQ5XQ9EtKzUM46zwtUHNkSRblrDf4zl9xHGKZuKkA=;
 b=d4qXCyl8HJS76gRoMsjNBwabLRdLtb6qMwhkaX4wBWkWU1RZdDdZsLW891m719QK9SG0fB
 0hHEeJ+ACm/FVUuCQb2MEdhvBeWQkYCsX2oCpQPx/47Efrc7ambeE/k41h+YW8DEIBAJO0
 ijWIhupIel6ZN+ci4wwkCYprv7p0mIo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-QJvMUGx8OF2d75Abiu8Xdg-1; Wed, 22 Jan 2020 08:06:59 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DBDD800D4E
 for <qemu-devel@nongnu.org>; Wed, 22 Jan 2020 13:06:58 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-68.gru2.redhat.com
 [10.97.116.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC88285732;
 Wed, 22 Jan 2020 13:06:54 +0000 (UTC)
Subject: Re: [PATCH] vhost: coding style fix
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20200122080840.592054-1-mst@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <2b0670f2-f14e-b4f6-ad01-d1b2b28bdf06@redhat.com>
Date: Wed, 22 Jan 2020 11:06:53 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200122080840.592054-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: QJvMUGx8OF2d75Abiu8Xdg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/22/20 6:08 AM, Michael S. Tsirkin wrote:
> Drop a trailing whitespace. Make line shorter.


hmmm... wondering why Patchew didn't catch that. Any idea?

- Wainer

>
> Fixes: 76525114736e8 ("vhost: Only align sections for vhost-user")
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   hw/virtio/vhost.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 25fd469179..9edfadc81d 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -551,7 +551,7 @@ static void vhost_region_add_section(struct vhost_dev *dev,
>       trace_vhost_region_add_section(section->mr->name, mrs_gpa, mrs_size,
>                                      mrs_host);
>   
> -    if (dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_USER) {
> +    if (dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_USER) {
>           /* Round the section to it's page size */
>           /* First align the start down to a page boundary */
>           size_t mrs_page = qemu_ram_pagesize(mrs_rb);
> @@ -566,8 +566,8 @@ static void vhost_region_add_section(struct vhost_dev *dev,
>           if (alignage) {
>               mrs_size += mrs_page - alignage;
>           }
> -        trace_vhost_region_add_section_aligned(section->mr->name, mrs_gpa, mrs_size,
> -                                               mrs_host);
> +        trace_vhost_region_add_section_aligned(section->mr->name, mrs_gpa,
> +                                               mrs_size, mrs_host);
>       }
>   
>       if (dev->n_tmp_sections) {


