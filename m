Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7280833AB39
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 06:49:07 +0100 (CET)
Received: from localhost ([::1]:50546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLg6E-00056U-HY
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 01:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1lLg5U-0004bB-AK
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 01:48:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1lLg5Q-0001n1-Qs
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 01:48:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615787295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RfrE5wFC+tipqvZEl8jzBYyW95VrV+Gs+ydEX0hOVv8=;
 b=ftf+iSbv7A5eE9VJEkTWDI2mAYMRAx753Ng6CxM+IuqyPHRUyvLmy7f8+2538QU6dcU2Kk
 1huFP87oXdy9sZ2yUOxvjGbSCFZMPFzOFso026RouSt0xgffjwk4hGRUCrxzz66As+1jZt
 F+Lk53yJ0Lev/gR5xBW/qDRivoTe42Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-Catb8Q6qN_ikw4nfezCtGg-1; Mon, 15 Mar 2021 01:48:12 -0400
X-MC-Unique: Catb8Q6qN_ikw4nfezCtGg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23AF481744F;
 Mon, 15 Mar 2021 05:48:10 +0000 (UTC)
Received: from lws.brq.redhat.com (unknown [10.40.193.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D2EA6A857;
 Mon, 15 Mar 2021 05:48:06 +0000 (UTC)
Date: Mon, 15 Mar 2021 06:48:04 +0100
From: Miroslav Rezanina <mrezanin@redhat.com>
To: Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v3] multi-process: Initialize variables declared with
 g_auto*
Message-ID: <20210315054804.6yxv6dvypipwa7wu@lws.brq.redhat.com>
References: <20210312112143.1369-1-yuzenghui@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210312112143.1369-1-yuzenghui@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 qemu-trivial@nongnu.org, mjt@tls.msk.ru, qemu-devel@nongnu.org,
 laurent@vivier.eu, wanghaibin.wang@huawei.com, berrange@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 12, 2021 at 07:21:43PM +0800, Zenghui Yu wrote:
> Quote docs/devel/style.rst (section "Automatic memory deallocation"):
> 
> * Variables declared with g_auto* MUST always be initialized,
>   otherwise the cleanup function will use uninitialized stack memory
> 
> Initialize @name properly to get rid of the compilation error (using
> gcc-7.3.0 on CentOS):
> 
> ../hw/remote/proxy.c: In function 'pci_proxy_dev_realize':
> /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: 'name' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>    g_free (*pp);
>    ^~~~~~~~~~~~
> ../hw/remote/proxy.c:350:30: note: 'name' was declared here
>              g_autofree char *name;
>                               ^~~~
> 
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> Reviewed-by: Jagannathan Raman <jag.raman@oracle.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> * From v2:
>   - Add OS distro and compiler version into commit message
>   - Add Philippe's R-b
>   - Cc: qemu-trivial@nongnu.org
> 
>  hw/remote/memory.c | 5 ++---
>  hw/remote/proxy.c  | 3 +--
>  2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/remote/memory.c b/hw/remote/memory.c
> index 32085b1e05..d97947d4b8 100644
> --- a/hw/remote/memory.c
> +++ b/hw/remote/memory.c
> @@ -42,10 +42,9 @@ void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp)
>  
>      remote_sysmem_reset();
>  
> -    for (region = 0; region < msg->num_fds; region++) {
> -        g_autofree char *name;
> +    for (region = 0; region < msg->num_fds; region++, suffix++) {
> +        g_autofree char *name = g_strdup_printf("remote-mem-%u", suffix);
>          subregion = g_new(MemoryRegion, 1);
> -        name = g_strdup_printf("remote-mem-%u", suffix++);
>          memory_region_init_ram_from_fd(subregion, NULL,
>                                         name, sysmem_info->sizes[region],
>                                         true, msg->fds[region],
> diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
> index 4fa4be079d..6dda705fc2 100644
> --- a/hw/remote/proxy.c
> +++ b/hw/remote/proxy.c
> @@ -347,13 +347,12 @@ static void probe_pci_info(PCIDevice *dev, Error **errp)
>                     PCI_BASE_ADDRESS_SPACE_IO : PCI_BASE_ADDRESS_SPACE_MEMORY;
>  
>          if (size) {
> -            g_autofree char *name;
> +            g_autofree char *name = g_strdup_printf("bar-region-%d", i);
>              pdev->region[i].dev = pdev;
>              pdev->region[i].present = true;
>              if (type == PCI_BASE_ADDRESS_SPACE_MEMORY) {
>                  pdev->region[i].memory = true;
>              }
> -            name = g_strdup_printf("bar-region-%d", i);
>              memory_region_init_io(&pdev->region[i].mr, OBJECT(pdev),
>                                    &proxy_mr_ops, &pdev->region[i],
>                                    name, size);
> -- 
> 2.19.1
> 
> 

Missing declaration without initialization in hw/s390x/s390-pci-vfio.c
othwerwise correct. Will you send v4 with missing initialization or
should I send then as another patch?

Mirek


