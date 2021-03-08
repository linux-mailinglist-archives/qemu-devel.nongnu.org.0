Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2423313FF
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:02:37 +0100 (CET)
Received: from localhost ([::1]:35816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJHA-0008Kl-Tv
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lJJ7P-0001Uy-SC
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:52:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lJJ7J-0006zi-V5
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:52:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615222344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RtMPrdyfRDgIxq+pQsRfVLUeuYxluTLSGub/pc5CElg=;
 b=R9uVpHEDsU1plF9KZyeN4bH4057PpL04QuXzVI8sYdgkRZXvUHDU1DNSRnZiL5fp4Jn5VJ
 L4PEznLAZpSkaQTd0o2bcCeWzNwe/0EMRum80izI+iZioRZPv9KoMI/QVzqgvW0hswNm5x
 R2BOvtAleuxYoowOf7Q/+2OAo4AgyN0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-WJ5CKJQIN7WSntF8gqXaww-1; Mon, 08 Mar 2021 11:52:21 -0500
X-MC-Unique: WJ5CKJQIN7WSntF8gqXaww-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2E9584B27B;
 Mon,  8 Mar 2021 16:52:20 +0000 (UTC)
Received: from gondolin (ovpn-112-94.ams2.redhat.com [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F27DF648A9;
 Mon,  8 Mar 2021 16:52:14 +0000 (UTC)
Date: Mon, 8 Mar 2021 17:49:09 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH v1 1/1] vfio: Make migration support non experimental by
 default.
Message-ID: <20210308174909.3021aa84.cohuck@redhat.com>
In-Reply-To: <20210308160949.4290-1-targupta@nvidia.com>
References: <20210308160949.4290-1-targupta@nvidia.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: cjia@nvidia.com, quintela@redhat.com, qemu-devel@nongnu.org,
 Kirti Wankhede <kwankhede@nvidia.com>, dgilbert@redhat.com,
 lushenming@huawei.com, alex.williamson@redhat.com, dnigam@nvidia.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Mar 2021 21:39:49 +0530
Tarun Gupta <targupta@nvidia.com> wrote:

> VFIO migration support in QEMU is experimental as of now, which was done to
> provide soak time and resolve concerns regarding bit-stream.
> But, with the patches discussed in
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg784931.html , we have
> corrected ordering of saving PCI config space and bit-stream.
> 
> So, this patch proposes to make vfio migration support in QEMU to be enabled
> by default. Tested by successfully migrating mdev device.
> 
> Signed-off-by: Tarun Gupta <targupta@nvidia.com>
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> ---
>  hw/vfio/pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index f74be78209..15e26f460b 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3199,7 +3199,7 @@ static Property vfio_pci_dev_properties[] = {
>      DEFINE_PROP_BIT("x-igd-opregion", VFIOPCIDevice, features,
>                      VFIO_FEATURE_ENABLE_IGD_OPREGION_BIT, false),
>      DEFINE_PROP_BOOL("x-enable-migration", VFIOPCIDevice,
> -                     vbasedev.enable_migration, false),
> +                     vbasedev.enable_migration, true),
>      DEFINE_PROP_BOOL("x-no-mmap", VFIOPCIDevice, vbasedev.no_mmap, false),
>      DEFINE_PROP_BOOL("x-balloon-allowed", VFIOPCIDevice,
>                       vbasedev.ram_block_discard_allowed, false),

I think we were still expecting some documentation for this feature,
and I don't recall any update there.

Also, I don't think we have any vendor driver implementation integrated
yet?


