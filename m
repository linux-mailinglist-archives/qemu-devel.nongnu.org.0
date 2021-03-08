Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF206331A6F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 23:53:06 +0100 (CET)
Received: from localhost ([::1]:37968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJOkL-0002XE-VQ
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 17:53:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lJOip-0001eA-0a
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 17:51:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lJOil-0005Bs-9S
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 17:51:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615243885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9+tqF9oKN6pDY0Ea8DUhpjhd7Hv8hkePNzerPgfQHag=;
 b=hjQqZOCp1pTeMAdk6FPJiZPbIM50s/i8ZkTNydJSF5Y0/rI+BRMw0bQ9eAxBIDkm8pp6Fb
 AddPDO3BfDJ7GhVnKPE6kFERCgedP6zup9TLgeSHNZrXfajhxt7aPsqMa7V/t6PHhQkyky
 nShTvR6DKBXxiSX1lgUhcXmdVOPpBYQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-WlHLjBBqNyOdN9Ypc-RY7w-1; Mon, 08 Mar 2021 17:51:21 -0500
X-MC-Unique: WlHLjBBqNyOdN9Ypc-RY7w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A50AB87A82A;
 Mon,  8 Mar 2021 22:51:19 +0000 (UTC)
Received: from omen.home.shazbot.org (ovpn-112-255.phx2.redhat.com
 [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F9CB9473;
 Mon,  8 Mar 2021 22:51:18 +0000 (UTC)
Date: Mon, 8 Mar 2021 15:51:17 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH v1 1/1] vfio: Make migration support non experimental by
 default.
Message-ID: <20210308155117.035c1408@omen.home.shazbot.org>
In-Reply-To: <20210308160949.4290-1-targupta@nvidia.com>
References: <20210308160949.4290-1-targupta@nvidia.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, cjia@nvidia.com, quintela@redhat.com,
 cohuck@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 lushenming@huawei.com, Kirti Wankhede <kwankhede@nvidia.com>,
 dnigam@nvidia.com, Yan Zhao <yan.y.zhao@intel.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Cc +Intel]

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

Looking back at the commit where this was added:

commit cf254988a50d4164c86a356c80b8d3ae0ccaa005
Author: Alex Williamson <alex.williamson@redhat.com>
Date:   Mon Nov 9 11:56:02 2020 -0700

    vfio: Make migration support experimental
    
    Support for migration of vfio devices is still in flux.  Developers
    are attempting to add support for new devices and new architectures,
    but none are yet readily available for validation.  We have concerns
    whether we're transferring device resources at the right point in the
    migration, whether we're guaranteeing that updates during pre-copy are
    migrated, and whether we can provide bit-stream compatibility should
    any of this change.  Even the question of whether devices should
    participate in dirty page tracking during pre-copy seems contentious.
    In short, migration support has not had enough soak time and it feels
    premature to mark it as supported.
    
    Create an experimental option such that we can continue to develop.
    
    [Retaining previous acks/reviews for a previously identical code
     change with different specifics in the commit log.]
    
    Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
    Acked-by: Cornelia Huck <cohuck@redhat.com>
    Signed-off-by: Alex Williamson <alex.williamson@redhat.com>


What has tangibly changed since then?  I think we have patches on-list
to address the known issue of PCI config space (MSI) ordering, which
related to enabling migration on ARM platforms.  Do we have
significantly more confidence in our ability to make compatible
enhancement to the migration bitstream?  This was a particularly
troublesome point for me if we have any hope of calling this
supportable.  As far as I know, there are still no open source vendor
drivers supporting migration for community testing.  We're also still
missing the documentation that was promised previously, as Connie noted.

Huawei and Intel, what's your confidence level and what can you share
regarding support for this implementation?  Thanks,

Alex


