Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA81537759
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 10:52:23 +0200 (CEST)
Received: from localhost ([::1]:46416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvb8Q-0002Fe-No
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 04:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nvb4O-0001LW-GL
 for qemu-devel@nongnu.org; Mon, 30 May 2022 04:48:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nvb4L-00037Z-ET
 for qemu-devel@nongnu.org; Mon, 30 May 2022 04:48:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653900488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P/3Vtg0nuwvbnG9CN2A0esuTXP3tqVLkb0wItrDB6MM=;
 b=Jkwsg1wRimLKVSCrxmAjsUI3g7z+r47s2DJlDYRjbulrGKKnjix9n4DmjOqXAESIrPON82
 ZTTuR9AU09klyTz9XNGau/rzbLTJ+1WhooBb6lHUUhyov7wRLpvD7wXupA+owAQSoKdITk
 Oboa4IZyox/67C+UcL1unZakWhyG4II=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-KPHyXWnOM6Cjh-s_1umvsg-1; Mon, 30 May 2022 04:48:03 -0400
X-MC-Unique: KPHyXWnOM6Cjh-s_1umvsg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 298C0801228;
 Mon, 30 May 2022 08:48:03 +0000 (UTC)
Received: from localhost (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC4AC40EC003;
 Mon, 30 May 2022 08:48:02 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, Eric Farman
 <farman@linux.ibm.com>
Subject: Re: [PATCH] MAINTAINERS: Update s390 vhost entries
In-Reply-To: <20220525145814.2750501-1-farman@linux.ibm.com>
Organization: Red Hat GmbH
References: <20220525145814.2750501-1-farman@linux.ibm.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Mon, 30 May 2022 10:48:01 +0200
Message-ID: <877d63v22m.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 25 2022, Eric Farman <farman@linux.ibm.com> wrote:

> Commit 7a523d96a0 ("virtio-ccw: move vhost_ccw_scsi to a separate file")
> introduced a new file hw/s390x/vhost-scsi-ccw.c, which received a
> couple comments [1][2] to update MAINTAINERS that were missed.
>
> Fix that by making the vhost CCW entries a wildcard.
>
> [1] https://lore.kernel.org/r/d8d2bbd5021076bdba444d31a6da74f507baede3.camel@linux.ibm.com/
> [2] https://lore.kernel.org/r/87k0c4gb9f.fsf@redhat.com/
>
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> ---
>  MAINTAINERS | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dff0200f70..77238c9338 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2012,8 +2012,7 @@ M: Halil Pasic <pasic@linux.ibm.com>
>  M: Eric Farman <farman@linux.ibm.com>
>  S: Supported
>  F: hw/s390x/virtio-ccw*.[hc]
> -F: hw/s390x/vhost-vsock-ccw.c
> -F: hw/s390x/vhost-user-fs-ccw.c
> +F: hw/s390x/vhost-*-ccw.c

Catch them all! :)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

>  T: git https://gitlab.com/cohuck/qemu.git s390-next
>  T: git https://github.com/borntraeger/qemu.git s390-next
>  L: qemu-s390x@nongnu.org


