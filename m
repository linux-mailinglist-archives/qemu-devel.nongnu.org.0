Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CCF3D5ACB
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 15:56:47 +0200 (CEST)
Received: from localhost ([::1]:48052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8166-0003tp-7o
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 09:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m8153-0003DO-Sl
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 09:55:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m8150-0005OO-3C
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 09:55:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627307736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=plO/WXFynQg5mSx9vSs32U6b5pfwHDZCaF8QpgUIKmY=;
 b=BpI2FdSFzl+tTvxvNwR4ZYWrO2pnE/VAQkCu6Lx0IWpGXQtTE1Jqe+zKV+ctqTV3TmUWL/
 sHV1cDOKRpvfQf9mkYwRueYTLQYuiVb+GO3/Vvbvt8nMCmecNLak/+7q7QZhJLmhsPdGPF
 zZBFFO8E6X+bDd4XewMxRD02Jfy4DyM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-Uf-G5KYzNuGxhzfEKAbaCw-1; Mon, 26 Jul 2021 09:55:35 -0400
X-MC-Unique: Uf-G5KYzNuGxhzfEKAbaCw-1
Received: by mail-wr1-f69.google.com with SMTP id
 d13-20020adfc3cd0000b02901531b0b7c89so4238210wrg.23
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 06:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=plO/WXFynQg5mSx9vSs32U6b5pfwHDZCaF8QpgUIKmY=;
 b=FyT+Og/Q5WNByCiV6K1y2lY6MEqv2ki4AQfgaep9YhntOgymyXd2EMam096CXD++r2
 XCo8iBILlGhcMoRSgeQN5XDepZkDUlniYBQpuz0Lg3CHhLIGRaOXLOMQKPF7JlCzBWsc
 Hnw5ZGfweCvbuj/IOkYxIKZl+12jBxQLByKBj4Q6PDmphHw3TJ8foL2QmCEhjxCAvgf4
 DlRMflGlJIofGCdyKhaW8Lusl6R+ntWugFpS5Po9KN2u/k4u7LnrPWkTIiuBDFCERCV2
 gK1D3U04jvw/hQmgYu2xEkPW0KMH3r6vsi39EBVgYjng3FmQ/YkWG2hIdgn5KdIfZ7tt
 0Pkw==
X-Gm-Message-State: AOAM531yTQjX1dwFjrh+ae3AMYjAoQLYc+31dHN56yNTUt5Vc4Q5VQR4
 P6Xx+cc7qFy4wBOaqu7Ou4D/L4aUuLySnil6AeFAe+HaO0gctJMLRL5QL8LyYjNP6FeQHGIORCC
 mF7cUSsUsYwBMJ2Y=
X-Received: by 2002:adf:b1c5:: with SMTP id r5mr20176247wra.146.1627307733860; 
 Mon, 26 Jul 2021 06:55:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzi+19CpnqdmzKPSUMX3a8LNxku5C+dOkeeY5ggV358iIhxjeJBoGzSenPcAqTkw73n8m/h/w==
X-Received: by 2002:adf:b1c5:: with SMTP id r5mr20176231wra.146.1627307733642; 
 Mon, 26 Jul 2021 06:55:33 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id x19sm36175059wmi.10.2021.07.26.06.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 06:55:33 -0700 (PDT)
Date: Mon, 26 Jul 2021 15:55:32 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH] hw/pcie-root-port: Fix hotplug for PCI devices
 requiring IO
Message-ID: <20210726155532.58fb5fc2@redhat.com>
In-Reply-To: <20210722090009.383575-1-marcel@redhat.com>
References: <20210722090009.383575-1-marcel@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: marcel@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 22 Jul 2021 12:00:09 +0300
Marcel Apfelbaum <marcel.apfelbaum@gmail.com> wrote:

> Q35 has now ACPI hotplug enabled by default for PCI(e) devices.
> As opposed to native PCIe hotplug, some guests will not assign

could be 'some guests' be more specific, preferably with a way to
reproduce issue.

> IO range to pcie-root-ports not supporting native hotplug,
> resulting into a regression.
> 
> Fix it by setting the "reserve-io" hint capability of the
> pcie-root-ports so the firmware will allocate the IO range instead.
> 
> Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>

other than commit message nit, looks fine to me

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/pci-bridge/gen_pcie_root_port.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/pci-bridge/gen_pcie_root_port.c b/hw/pci-bridge/gen_pcie_root_port.c
> index ec9907917e..20099a8ae3 100644
> --- a/hw/pci-bridge/gen_pcie_root_port.c
> +++ b/hw/pci-bridge/gen_pcie_root_port.c
> @@ -28,6 +28,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(GenPCIERootPort, GEN_PCIE_ROOT_PORT)
>          (GEN_PCIE_ROOT_PORT_AER_OFFSET + PCI_ERR_SIZEOF)
>  
>  #define GEN_PCIE_ROOT_PORT_MSIX_NR_VECTOR       1
> +#define GEN_PCIE_ROOT_DEFAULT_IO_RANGE          4096
>  
>  struct GenPCIERootPort {
>      /*< private >*/
> @@ -75,6 +76,7 @@ static bool gen_rp_test_migrate_msix(void *opaque, int version_id)
>  static void gen_rp_realize(DeviceState *dev, Error **errp)
>  {
>      PCIDevice *d = PCI_DEVICE(dev);
> +    PCIESlot *s = PCIE_SLOT(d);
>      GenPCIERootPort *grp = GEN_PCIE_ROOT_PORT(d);
>      PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(d);
>      Error *local_err = NULL;
> @@ -85,6 +87,9 @@ static void gen_rp_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> +    if (grp->res_reserve.io == -1 && s->hotplug && !s->native_hotplug) {
> +        grp->res_reserve.io = GEN_PCIE_ROOT_DEFAULT_IO_RANGE;
> +    }
>      int rc = pci_bridge_qemu_reserve_cap_init(d, 0,
>                                                grp->res_reserve, errp);
>  


