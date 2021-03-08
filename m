Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF76331399
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 17:40:34 +0100 (CET)
Received: from localhost ([::1]:51736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJIvp-0007AD-3V
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 11:40:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJIsO-0004FD-PY
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:37:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJIsL-0000Jy-Ql
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:36:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615221416;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=IbLd/zT3nUYOF3HJXQ+uKoxTdrPiuZDTKFJuz7xLpJc=;
 b=ZaqedYOEvGJFCKUtERb/vGiKZAQWk2WQ+3O6z8a51+c+ye1WFEzibgQuMjW352fKWFwNh9
 52OqdATYOeJLD6XqemzdRuew1OFhepbduTk2J79VZF02V5CbK3Ma3ugYWoOdEiah4sUH/0
 /9hFejAh+8fjpwp+WaobLHSrEMxTcbE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-uFxikIvROeqMnQbLH4zK1Q-1; Mon, 08 Mar 2021 11:36:44 -0500
X-MC-Unique: uFxikIvROeqMnQbLH4zK1Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F8141966321;
 Mon,  8 Mar 2021 16:36:43 +0000 (UTC)
Received: from redhat.com (ovpn-114-69.ams2.redhat.com [10.36.114.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A300010013D7;
 Mon,  8 Mar 2021 16:36:37 +0000 (UTC)
Date: Mon, 8 Mar 2021 16:36:34 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH v1 1/1] vfio: Make migration support non experimental by
 default.
Message-ID: <YEZSkuQ1ximkfREp@redhat.com>
References: <20210308160949.4290-1-targupta@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210308160949.4290-1-targupta@nvidia.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: cjia@nvidia.com, quintela@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, Kirti Wankhede <kwankhede@nvidia.com>,
 dgilbert@redhat.com, lushenming@huawei.com, alex.williamson@redhat.com,
 dnigam@nvidia.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 08, 2021 at 09:39:49PM +0530, Tarun Gupta wrote:
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

If it isn't experimental then why do we even need an experimental 'x-'
property at all ?

IOW, rather than changing this to "true", shouldn't we just be deleting
the x-enable-migration property entirely and have the code just do the
right thing.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


