Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B6D33E291
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 01:18:26 +0100 (CET)
Received: from localhost ([::1]:44698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMJtJ-0001ni-3e
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 20:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMJru-0001DE-Cy
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 20:16:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMJrs-0002M3-3D
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 20:16:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615940213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gPxaUrgJTpkqTxod0daPMNseXWx1OJaVOiNLeL0Mjq4=;
 b=Kz84s+y+KUhR1o+Mt1xXDfjfegrBOP7BJFeNtmC/4p84pCS8DviHSKsn7w6Yqo5hrYAg6K
 O527Ew4GHOY1i+2LlAcxUCuibZXMv/VfVfX7T4zgqkKBxp8mqd3Mu5G/6rGAVt+QfWo4EG
 lk8m0Q4V6qsnZnmOrdK1rLUojQUBebY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-DESrzlm5NBeuBjk8XIJPFA-1; Tue, 16 Mar 2021 20:16:51 -0400
X-MC-Unique: DESrzlm5NBeuBjk8XIJPFA-1
Received: by mail-wr1-f69.google.com with SMTP id 75so17357362wrl.3
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 17:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gPxaUrgJTpkqTxod0daPMNseXWx1OJaVOiNLeL0Mjq4=;
 b=AIu6XPzkvwFFqViTL12n5KN11LKr3OgU/8StsH9Xvj3BRfG3XEJNPi8sWJwbrSQqNn
 wA0wLdQ3CkraoKDGsSxVK0sQGCtIry6u3DfwLH84xwVvX6lzab1DOKRmimmj4DfaxvJZ
 YQNUWj7BdhOOrZ9jvrH63jLlTihM/GfP+si6zqTjsLfe++xD+icuC1COOV5LF+yMyB9t
 7D74LOIidK0ZJmYiQ7uGm0OPBKS7yx5ko09gXRBqZPsX48hhG4IHGg6O9K5J1jZXyogu
 ejLUFo8MZQfwQAFp1jrc1sXCwW6QQDyYIBviZ5dyQcQfOBuaXA7gwTEx1KbcFgrsgG86
 JrbQ==
X-Gm-Message-State: AOAM533IBA8OVJNzo+k6VlXJkiJH/TVKIbMr06TJaBK5A1Prln99Agfz
 IsrFnwMXt6aVg1VKDrG/Ag8y2xWBAhI4WMN7g9xdJlpOjXXBqYhvlu2KsfBxIsRA2m3/VHDLyY3
 lcktTskhOQNnSHrk=
X-Received: by 2002:a5d:4708:: with SMTP id y8mr1552630wrq.382.1615940210721; 
 Tue, 16 Mar 2021 17:16:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrocL9jUxEN3TUc5sZWquXWQ0lm0uzy5CHm2VrcOCniDMwIAcG+Q/hYU0MwBofCcAkc0t9cA==
X-Received: by 2002:a5d:4708:: with SMTP id y8mr1552616wrq.382.1615940210563; 
 Tue, 16 Mar 2021 17:16:50 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id h20sm787637wmm.19.2021.03.16.17.16.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 17:16:50 -0700 (PDT)
Subject: Re: [PATCH v1] piix: fix regression during unplug in Xen HVM domUs
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20210316224412.11609-1-olaf@aepfle.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d8bc9849-8ffc-78aa-b39c-3fe9d6d9c6c0@redhat.com>
Date: Wed, 17 Mar 2021 01:16:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316224412.11609-1-olaf@aepfle.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 11:44 PM, Olaf Hering wrote:
> Commit ee358e919e385fdc79d59d0d47b4a81e349cd5c9 causes a regression in
> Xen HVM domUs which run xenlinux based kernels.
> 
> If the domU has an USB device assigned, for example with
> "usbdevice=['tablet']" in domU.cfg, the late unplug of devices will
> kill the emulated USB host. As a result the khubd thread hangs, and as
> a result the entire boot process.
> 
> For some reason this does not affect pvops based kernels. This is
> most likely caused by the fact that unplugging happens very early
> during boot.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  hw/ide/piix.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index b9860e35a5..2a380a90e9 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -34,6 +34,7 @@
>  #include "hw/ide/pci.h"
>  #include "trace.h"
>  
> +static bool pci_piix3_xen_ide_unplug_done;

This field belongs to the device state (PCIIDEState or BMDMAState).

>  static uint64_t bmdma_read(void *opaque, hwaddr addr, unsigned size)
>  {
>      BMDMAState *bm = opaque;
> @@ -109,6 +110,8 @@ static void piix_ide_reset(DeviceState *dev)
>      uint8_t *pci_conf = pd->config;
>      int i;
>  
> +    if (pci_piix3_xen_ide_unplug_done == true)
> +        return;
>      for (i = 0; i < 2; i++) {
>          ide_bus_reset(&d->bus[i]);
>      }
> @@ -169,6 +172,7 @@ int pci_piix3_xen_ide_unplug(DeviceState *dev, bool aux)
>      IDEBus *idebus;
>      BlockBackend *blk;
>  
> +    pci_piix3_xen_ide_unplug_done = true;
>      pci_ide = PCI_IDE(dev);
>  
>      for (i = aux ? 1 : 0; i < 4; i++) {
> @@ -259,6 +263,7 @@ static const TypeInfo piix4_ide_info = {
>  
>  static void piix_ide_register_types(void)
>  {
> +    pci_piix3_xen_ide_unplug_done = false;
>      type_register_static(&piix3_ide_info);
>      type_register_static(&piix3_ide_xen_info);
>      type_register_static(&piix4_ide_info);
> 


