Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0C16D7D60
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 15:07:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk2qQ-00049G-Lv; Wed, 05 Apr 2023 09:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pk2qO-00048A-RW
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 09:06:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pk2qL-0002S6-Is
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 09:06:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680699988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pSDT8lMXTtJUundA7gE8qB6mvA4XVqfIgtpGgr/CE2A=;
 b=YYWXPUstBZQtahOhjO64rLYrkHB4LNogGzKzrfzJB4XAJCepF9Y0oziqZo3Qv1Fe4U9f7c
 oeGM4Teelfzgs0Jhkq45MZa+n2UFR+JQFUIGOjXa5PCRuPXKZl4UR8EyAk2C403eaPVMHj
 X4VILBf6fhj7RUc8WcdXx4Yyl8KLcTY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-X06KsA8mN121u5HZgeNZTQ-1; Wed, 05 Apr 2023 09:06:26 -0400
X-MC-Unique: X06KsA8mN121u5HZgeNZTQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83F04385054E;
 Wed,  5 Apr 2023 13:06:25 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EEFE1415117;
 Wed,  5 Apr 2023 13:06:25 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: David 'Digit' Turner <digit@google.com>, qemu-devel@nongnu.org
Cc: David 'Digit' Turner <digit@google.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/2] Add missing Linux kernel headers.
In-Reply-To: <20230405125920.2951721-3-digit@google.com>
Organization: Red Hat GmbH
References: <20230405125920.2951721-1-digit@google.com>
 <20230405125920.2951721-3-digit@google.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 05 Apr 2023 15:06:24 +0200
Message-ID: <87h6tuqy0f.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Apr 05 2023, "David 'Digit' Turner" <digit@google.com> wrote:

> Add <linux/memfd.h>, used by hw/display/virtio-gpu-udmabuf.c
> Add <linux/nvme_ioctl.h>, used by qga/commands-posix.c
> Add <linux/const.h> used by kvm-all.c, which requires
> the _BITUL() macro definition to be available.
>
> Without these, QEMU will not compile on Debian 10 systems.

Hm, I wonder why we hadn't seen errors in the CI then.

>
> The script has then been run against the official
> 6.2.8 kernel source tree (current stable release),
> which explains why comments in <linux/vfio.h>
> have been updated too.

I think we usually run the script against a release or release
candidate, not stable.

>
> Signed-off-by: David 'Digit' Turner <digit@google.com>
> ---
>  linux-headers/linux/const.h      |  36 ++++++++++
>  linux-headers/linux/memfd.h      |  35 ++++++++++
>  linux-headers/linux/nvme_ioctl.h | 114 +++++++++++++++++++++++++++++++
>  linux-headers/linux/vfio.h       |  15 ++--
>  scripts/update-linux-headers.sh  |   4 +-
>  5 files changed, 196 insertions(+), 8 deletions(-)
>  create mode 100644 linux-headers/linux/const.h
>  create mode 100644 linux-headers/linux/memfd.h
>  create mode 100644 linux-headers/linux/nvme_ioctl.h


