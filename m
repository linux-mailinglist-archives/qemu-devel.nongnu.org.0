Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC34375BF5
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 21:52:03 +0200 (CEST)
Received: from localhost ([::1]:42844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lek2U-0004Dj-55
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 15:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lek0l-0003iw-SX
 for qemu-devel@nongnu.org; Thu, 06 May 2021 15:50:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lek0d-0000jW-L7
 for qemu-devel@nongnu.org; Thu, 06 May 2021 15:50:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620330606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NJ+lO2lcQllGTdQDSBCFme0P16+OR4qYjYPJWj6LSJo=;
 b=S3Om/NevsSGac0MSJtHs+4lsbfY2YdjA5zZZTwAQmJ6LbHfmU4f/n+BTwj8io1Id/EdJc2
 l6LTAlKjrLnh/6UBLdEcZ9CYOYk2hX9BdcChhZOA12EDpA0lL0yj6Nmohdm34MRcItMhC7
 G6t6fsscsG9qid2M80B2nwZcsECxIbs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-BtvUeooyPzGxCEw5SGBAtQ-1; Thu, 06 May 2021 15:50:04 -0400
X-MC-Unique: BtvUeooyPzGxCEw5SGBAtQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 v186-20020a1cacc30000b0290137364410e2so1189442wme.3
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 12:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NJ+lO2lcQllGTdQDSBCFme0P16+OR4qYjYPJWj6LSJo=;
 b=kb/R4mDtQkpb10RP0wLtHunob3F44p01EZWoJ77GhF+nMhQPBJ8/w/bbgxqp8uAYfo
 bf9otQx1mDxlAgcQq/3XcupH69cncftm1KCEC67rnkFj2+AHKjny4okhH8hE9syoXjXv
 BZ/PHn3QzvMu1HzCW3+/9PSbKBheY1x86IyzuXVNGpGrBLxEsDcjQege8ghcsev/9tzq
 FFiMViMRpaz7t+OQrWkftnhRsgfRU8xDDq7nkD5GVNBHfrW7CuNkTgdYw+AIdijWbcWu
 GNaFEwvV8y/Q+GvphOulqItBpCprsa+MlsfgaLRf7/S27dGc3Sm3X1377rAWvZ5B8vn0
 Na4g==
X-Gm-Message-State: AOAM532FJMrk6oheDsgMvnAr68B2HjHeORc8AdDMNlx8BPvqMqYBb2ei
 VpSrMUHymh/1nlsHKeIeodUQeJbqf7G8oA2Bkzhd5Qmq2BvUpt8d/0isE9mjL1adaguEjwzlZ+b
 /FZ12tTUifHjadKARAYHNTCipa9bgAmsxWU3op5rUbCJZBExBMVoXsGTKdKtGxqWw
X-Received: by 2002:adf:ed43:: with SMTP id u3mr7555568wro.334.1620330603293; 
 Thu, 06 May 2021 12:50:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkK3+W7qj92JTFHUmRtXY4jgvJO/xVTBbco4PpQLH7bsfuiJKXs0+eSDNQ2xSCjgEbrEOTJQ==
X-Received: by 2002:adf:ed43:: with SMTP id u3mr7555549wro.334.1620330603091; 
 Thu, 06 May 2021 12:50:03 -0700 (PDT)
Received: from [192.168.1.19] (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr.
 [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id o15sm5590398wru.42.2021.05.06.12.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 12:50:02 -0700 (PDT)
Subject: Re: [PATCH] scripts: add a script to list virtio devices in a system
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20210506193341.140141-1-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6b7500f7-2e24-6da1-028e-d7e77ca17f27@redhat.com>
Date: Thu, 6 May 2021 21:50:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210506193341.140141-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/21 9:33 PM, Laurent Vivier wrote:
> Add "lsvirtio" that lists all virtio devices in a system
> the same way lspci does for the PCI cards.
> 
> For instance:
> 
>  $ ./lsvirtio
>  0000:01:00.0 virtio0 Red Hat, Inc. (PCI) Virtio Network Card
> 	 Subsystem: virtio
> 	 Modalias: virtio:d00000001v00001AF4

"ModAlias" maybe?

> 	 Status: ACKNOWLEDGE DRIVER_OK DRIVER FEATURES_OK
> 	 Feature: CSUM
> 	 Feature: GUEST_CSUM
> 	 Feature: CTRL_GUEST_OFFLOADS
> 	 Feature: MAC
> 	 Feature: GUEST_TSO4
> 	 Feature: GUEST_TSO6
> 	 Feature: GUEST_ECN
> 	 Feature: GUEST_UFO
> 	 Feature: HOST_TSO4
> 	 Feature: HOST_TSO6
> 	 Feature: HOST_ECN
> 	 Feature: HOST_UFO
> 	 Feature: MRG_RXBUF
> 	 Feature: STATUS
> 	 Feature: CTRL_VQ
> 	 Feature: CTRL_RX
> 	 Feature: CTRL_VLAN
> 	 Feature: GUEST_ANNOUNCE
> 	 Feature: CTRL_MAC_ADDR
> 	 Feature: RING_INDIRECT_DESC
> 	 Feature: RING_EVENT_IDX
> 	 Feature: VERSION_1
> 	 Kernel driver in use: virtio_net
>          Interfaces: enp1s0
> 
>  0000:03:00.0 virtio1 Red Hat, Inc. (PCI) Virtio Console
> 	 Subsystem: virtio
> 	 Modalias: virtio:d00000003v00001AF4
> 	 Status: ACKNOWLEDGE DRIVER_OK DRIVER FEATURES_OK
> 	 Feature: MULTIPORT
> 	 Feature: RING_INDIRECT_DESC
> 	 Feature: RING_EVENT_IDX
> 	 Feature: VERSION_1
> 	 Kernel driver in use: virtio_console
>          Interfaces: vport1p1
>  ...
> 
> This is useful to have the list of virtio devices when they are not
> mapped by a PCI card:
> 
>  $ ./lsvirtio
>  virtio-mmio.121 virtio0 Virt (MMIO) Virtio 9P transport
> 	 Subsystem: virtio
> 	 Modalias: virtio:d00000009v554D4551
> 	 Status: FEATURES_OK ACKNOWLEDGE DRIVER DRIVER_OK
> 	 Feature: MOUNT_TAG
> 	 Feature: RING_INDIRECT_DESC
> 	 Feature: RING_EVENT_IDX
> 	 Feature: VERSION_1
> 	 Kernel driver in use: 9pnet_virtio
>          Interfaces: home0
> 
>  virtio-mmio.122 virtio1 Virt (MMIO) Virtio GPU Device
> 	 Subsystem: virtio
> 	 Modalias: virtio:d00000010v554D4551
> 	 Status: FEATURES_OK ACKNOWLEDGE DRIVER DRIVER_OK
> 	 Feature: EDID
> 	 Feature: RING_INDIRECT_DESC
> 	 Feature: RING_EVENT_IDX
> 	 Feature: VERSION_1
> 	 Kernel driver in use: virtio_gpu
>          Interfaces: fb0
>  ...
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  scripts/lsvirtio | 317 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 317 insertions(+)
>  create mode 100755 scripts/lsvirtio

Can you add an entry for the file in MAINTAINERS?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


