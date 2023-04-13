Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C09206E06EC
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 08:25:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmqNT-0006iU-R8; Thu, 13 Apr 2023 02:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pmqNR-0006iG-AM
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 02:24:13 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pmqNP-0004sZ-9j
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 02:24:13 -0400
Received: by mail-lj1-x22d.google.com with SMTP id x34so793710ljq.1
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 23:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681367048; x=1683959048;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DxSah3v0QUK2Xi1JbKvaewnnw8PyRAzWVTgkAjDcVhI=;
 b=lH3B9dZ4T+gzQ66tib7OkR2noIJ4x/b0dTjEelAZA/X1aO6eFbpV8RudsKkowr+BwL
 xxkT8TDuXvJ66lMbbz5bXFHxL5aS3nARLCwwAjXpiLhlsoyF/5P/WU83EdjGiVzdtoXQ
 /hNjpd4pSFa4gcaaSMvAjV+DhLirB2Edklfj9Xeuz7jza5AOtt3Mhwf31N9B3SGuGAzp
 ATZvmAVH0ZH2tPz4//YPtrOIImqJqX6ozCuxWmJ7T2lYpJvitgKz77lUTF7kMWkwtzn6
 F0dpsj/U9h+5YkpIF2z2z5gVrutguIyaUb04ACYokvke75Iw83o9FtbPh1Ve9u1juHh4
 8JSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681367048; x=1683959048;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DxSah3v0QUK2Xi1JbKvaewnnw8PyRAzWVTgkAjDcVhI=;
 b=iaXA+yPNkV9tbBtBXcyzqezfVqP5nAcpWR7r2ckAEDI6Feyw5R1b1x0kJrZ+bMDmvI
 0RHnnwCdUko7lhIoDOIuhBEEjg0HpwFqyJmLrv3G2diFPLVbqbgToLMfeL2AF5zqLbjG
 ikQuGuSg8wQmqBZ0aRdp5/klElpTUERtsk3qRpeZeR+DC/8bSVbl22M8r4IeTmcnZrO7
 8c4m8M7T1vP3SAaKDiZ480NfVvxjXXz4BKkTYKJenuZDmzNxR30/WKuorxNZFToRc/V6
 0nUBdvT+uF+r157YJh7pZBtNpYSav2/fko3BT4XwZycA7Do9MGTaKEGAYEXkXEiIjVqa
 Zx8g==
X-Gm-Message-State: AAQBX9dhQMMNrJZ5izej9+D9kDNANbT4BaBeTgt4Jd0QptOgoKFengNq
 ioDIEYeKWNJQypedh06nkbXPj9xknbr9UrXKGWU9Jg==
X-Google-Smtp-Source: AKy350aS8f2WeNMnYO8F40Dnf0mDOKmIXXbZqeqBQiaxE+1qvHEo42Sr86REqwzMg8c+fZRU+7oWL8UA2VAw/gRRuDI=
X-Received: by 2002:a2e:9082:0:b0:29a:9053:ed21 with SMTP id
 l2-20020a2e9082000000b0029a9053ed21mr359185ljg.8.1681367048608; Wed, 12 Apr
 2023 23:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230330164944.75481-1-viktor@daynix.com>
In-Reply-To: <20230330164944.75481-1-viktor@daynix.com>
From: Viktor Prutyanov <viktor@daynix.com>
Date: Thu, 13 Apr 2023 09:23:57 +0300
Message-ID: <CAPv0NP6dMyB-CZgvrjW93aWbutj2dkFPT_2KYutMJLc6rFytzQ@mail.gmail.com>
Subject: Re: [RFC PATCH] vhost: enable IOMMU_NOTIFIER_UNMAP events handling
 when device-iotlb=on
To: mst@redhat.com, jasowang@redhat.com
Cc: qemu-devel@nongnu.org, yan@daynix.com, yuri.benditovich@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::22d;
 envelope-from=viktor@daynix.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Thu, Mar 30, 2023 at 7:49=E2=80=AFPM Viktor Prutyanov <viktor@daynix.com=
> wrote:
>
> Even if Device-TLB and PCI ATS is enabled, the guest can reject to use
> it. For example, this situation appears when Windows Server 2022 is
> running with intel-iommu with device-iotlb=3Don and virtio-net-pci with
> vhost=3Don. The guest implies that no address translation info cached in
> device IOTLB and doesn't send device IOTLB invalidation commands. So,
> it leads to irrelevant address translations in vhost-net in the host
> kernel. Therefore network frames from the guest in host tap interface
> contains wrong payload data.
>
> This patch enables IOTLB unmap events (IOMMU_NOTIFIER_UNMAP) along with
> Device-TLB unmap events (IOMMU_NOTIFIER_DEVIOTLB_UNMAP) handling for
> proper vhost IOTLB unmapping when the guest isn't aware of Device-TLB.
>
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D2001312
> Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
> ---
>
>  Tested on Windows Server 2022 and Fedora guests with
>  -device virtio-net-pci,bus=3Dpci.3,netdev=3Dnd0,iommu_platform=3Don,ats=
=3Don
>  -netdev tap,id=3Dnd0,ifname=3Dtap1,script=3Dno,downscript=3Dno,vhost=3Do=
n
>  -device intel-iommu,intremap=3Don,eim=3Don,device-iotlb=3Don/off
>
>  hw/virtio/vhost.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index a266396576..968ca18fce 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -796,7 +796,7 @@ static void vhost_iommu_region_add(MemoryListener *li=
stener,
>      iommu_idx =3D memory_region_iommu_attrs_to_index(iommu_mr,
>                                                     MEMTXATTRS_UNSPECIFIE=
D);
>      iommu_notifier_init(&iommu->n, vhost_iommu_unmap_notify,
> -                        IOMMU_NOTIFIER_DEVIOTLB_UNMAP,
> +                        IOMMU_NOTIFIER_DEVIOTLB_UNMAP | IOMMU_NOTIFIER_U=
NMAP,
>                          section->offset_within_region,
>                          int128_get64(end),
>                          iommu_idx);
> --
> 2.35.1
>

ping

