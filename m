Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8470C3D0AED
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 11:02:34 +0200 (CEST)
Received: from localhost ([::1]:43678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m687d-0007Sb-9a
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 05:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m683i-0003Ae-2N
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:58:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m683b-0007Xu-Sr
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:58:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626857901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ttevrHMIVMQpr3EPJslWR5gt5xFM/Gk6uNjToNsV9Rg=;
 b=irQ63IFqlo/jjbpeKBCQQrR+xALqi7607eLuYput0ArYD2anxxga6Vb9LpA0YHUbrT7u5h
 Q3TI4JVNzabS0S7DG8wfYbVjYqv1z+4n+LhtPQuyXgqjAWWtwvVrEB4qIaj4oehrWdP1NH
 GE6/0oI2obKZ7vtpU1Nk49qZ3Hk/6XA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-zyNTcmOVNVKIgyM68AAWFg-1; Wed, 21 Jul 2021 04:58:20 -0400
X-MC-Unique: zyNTcmOVNVKIgyM68AAWFg-1
Received: by mail-wm1-f72.google.com with SMTP id
 n11-20020a05600c294bb029022095f349f3so328622wmd.0
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 01:58:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ttevrHMIVMQpr3EPJslWR5gt5xFM/Gk6uNjToNsV9Rg=;
 b=X+Xo9zPtMHXDhTpWuuMTUgP7RuMAVPmMHg9Z6Ks1LfoEkjb33FoThqq5vgcf1zHL2i
 pcSLUpDvz9oA02G5yK2/HXfAK/MNwJc5U4+AimAv6IIH4/SqEI/ACq0v6POjNyN1af1S
 O6QOEpqZSwKttZZYCOKO/VB0CBzzyWSVBut86p+lPPs3EotTy8UhPguixv6VIMrg67vS
 1ywD2DHTl1D/pwcBOv5srpWMgbERGigw2r1qWSw40/P8oXoG+rHgNTbrLPgIJouKyotx
 XzSFjkkVEOXflezYPZ7piq0sKw4Naf8WAgxtnMyBySRj73+w5flUvMZg6bAVtbb1E+BX
 b8Yg==
X-Gm-Message-State: AOAM530wisflP9AYK+YI7WAcnWopAxnZqePwCaR0Nfw/losLJnWKS9GJ
 bW3LpREPr1kO307lgGY5WKKBaXyJlXNO97n0nfDjOq1LfpTiNxDfQmzU5wqXm1t8pTPEHPnG+x8
 TErWtRnQkBoq0KqE=
X-Received: by 2002:a5d:4b46:: with SMTP id w6mr42004584wrs.352.1626857899444; 
 Wed, 21 Jul 2021 01:58:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvLBikL5pmCMFag07ppfLBLBaBefeOgqVPKboFzy3nf0KQCxtWHvL79Erc2AR1E+3CJAzuLg==
X-Received: by 2002:a5d:4b46:: with SMTP id w6mr42004569wrs.352.1626857899316; 
 Wed, 21 Jul 2021 01:58:19 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id k20sm29440633wrd.70.2021.07.21.01.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 01:58:18 -0700 (PDT)
Date: Wed, 21 Jul 2021 10:58:17 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] failover: unregister ram on unplug
Message-ID: <20210721105817.0a4afc21@redhat.com>
In-Reply-To: <20210720181644.196315-1-lvivier@redhat.com>
References: <20210720181644.196315-1-lvivier@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, "Dr . David
 Alan Gilbert" <dgilbert@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 20 Jul 2021 20:16:44 +0200
Laurent Vivier <lvivier@redhat.com> wrote:

> This simple change allows to test failover with a simulated device
> like e1000e rather than a vfio device.
> 
> This is interesting to developers that want to test failover on
> a system with no vfio device. Moreover it simplifies host networking
> configuration as we can use the same bridge for virtio-net and
> the other failover networking device.
> 
> Without this change the migration of a system configured with failover
> fails with:
> 
>   Unknown ramblock "0000:00:01.1:00.0/e1000e.rom", cannot accept migration
>   error while loading state for instance 0x0 of device 'ram'
>   load of migration failed: Invalid argument
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/net/virtio-net.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 16d20cdee52a..8f7735bad4f2 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3256,6 +3256,9 @@ static void virtio_net_handle_migration_primary(VirtIONet *n, MigrationState *s)
>      if (migration_in_setup(s) && !should_be_hidden) {
>          if (failover_unplug_primary(n, dev)) {
>              vmstate_unregister(VMSTATE_IF(dev), qdev_get_vmsd(dev), dev);
> +            if (PCI_DEVICE(dev)->has_rom) {
> +                vmstate_unregister_ram(&PCI_DEVICE(dev)->rom , dev);
> +            }
>              qapi_event_send_unplug_primary(dev->id);
>              qatomic_set(&n->failover_primary_hidden, true);
>          } else {


