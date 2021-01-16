Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A44562F8D04
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 11:46:15 +0100 (CET)
Received: from localhost ([::1]:41192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0j5y-0005Lm-Pe
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 05:46:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l0j4D-0004Ya-OI
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 05:44:25 -0500
Received: from mail-ed1-f44.google.com ([209.85.208.44]:45207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l0j4C-0001f3-7V
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 05:44:25 -0500
Received: by mail-ed1-f44.google.com with SMTP id r5so12290709eda.12
 for <qemu-devel@nongnu.org>; Sat, 16 Jan 2021 02:44:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zGG5Z4/jHXPvKJjHnUV2vLV+QZT3LB7jqPFfgH2OhI4=;
 b=Vcf2DSeqPK2GXcq6dJh+zR6hEJzeTNIkx3NfuhGsHSO8tNyy6pC+z4BxixNcYK7PFu
 mREfvEKk/Rb01+8sIVLsDMyDIukPTF/z0Qyby9ujC6m4qoaV/+N6mWXwXXPFc7pVQ5Zs
 yxYY38jcwNDvNuDeIEMvSAn6VLGIRjQ8hAsec0ZTfEs2VzJXEZVjsgBOHy4RHsF3iFML
 5P3+yhRdymkTx7Zra6iKFosI3saSpbt/7e+44/XhkDWEZ07ZlAe/mBztBgEfTLXoXapH
 /DyvrPiA4xbgOVpRLQJIW2M4kE7OVAgQmBYedZVykyWZgTCMsD53R8M4D9VpAtVMWvDq
 UWZg==
X-Gm-Message-State: AOAM532Y6Plr3ab/g/Hr+MP3lBATjdQdWNXVgfN3LlTa8PNLDKgzsULF
 dyKzJ7Nwsz1qBVSK5z0QfZnBNOsh978=
X-Google-Smtp-Source: ABdhPJyEVOHv7z+Uyo42sKr38xm1kdIJNFD9J3Lc9ptBTbzLdKgm9qf6qUWYitJeS/oL6wljDVFsBg==
X-Received: by 2002:a05:6402:2707:: with SMTP id
 y7mr8636140edd.5.1610793862961; 
 Sat, 16 Jan 2021 02:44:22 -0800 (PST)
Received: from localhost (pd9e83641.dip0.t-ipconnect.de. [217.232.54.65])
 by smtp.gmail.com with ESMTPSA id o13sm6869384edr.94.2021.01.16.02.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jan 2021 02:44:22 -0800 (PST)
Date: Sat, 16 Jan 2021 11:44:21 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 10/11] hw/m68k/next-cube: Add vmstate for NeXTPC device
Message-ID: <20210116114421.3677ce98@tuxfamily.org>
In-Reply-To: <20210115201206.17347-11-peter.maydell@linaro.org>
References: <20210115201206.17347-1-peter.maydell@linaro.org>
 <20210115201206.17347-11-peter.maydell@linaro.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.208.44; envelope-from=th.huth@gmail.com;
 helo=mail-ed1-f44.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am Fri, 15 Jan 2021 20:12:05 +0000
schrieb Peter Maydell <peter.maydell@linaro.org>:

> Add the vmstate for the new NeXTPC devic; this is in theory
> a migration compatibility break, but this machine doesn't have
> working migration currently anyway.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/m68k/next-cube.c | 34 +++++++++++++++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
> index dd0a2a5aea0..9eb1e31752b 100644
> --- a/hw/m68k/next-cube.c
> +++ b/hw/m68k/next-cube.c
> @@ -28,6 +28,7 @@
>  #include "qapi/error.h"
>  #include "ui/console.h"
>  #include "target/m68k/cpu.h"
> +#include "migration/vmstate.h"
>  
>  /* #define DEBUG_NEXT */
>  #ifdef DEBUG_NEXT
> @@ -890,6 +891,37 @@ static Property next_pc_properties[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> +static const VMStateDescription next_rtc_vmstate = {
> +    .name = "next-rtc",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT8_ARRAY(ram, NextRtc, 32),
> +        VMSTATE_UINT8(command, NextRtc),
> +        VMSTATE_UINT8(value, NextRtc),
> +        VMSTATE_UINT8(status, NextRtc),
> +        VMSTATE_UINT8(control, NextRtc),
> +        VMSTATE_UINT8(retval, NextRtc),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
> +static const VMStateDescription next_pc_vmstate = {
> +    .name = "next-pc",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(scr1, NeXTPC),
> +        VMSTATE_UINT32(scr2, NeXTPC),
> +        VMSTATE_UINT32(int_mask, NeXTPC),
> +        VMSTATE_UINT32(int_status, NeXTPC),
> +        VMSTATE_UINT8(scsi_csr_1, NeXTPC),
> +        VMSTATE_UINT8(scsi_csr_2, NeXTPC),
> +        VMSTATE_STRUCT(rtc, NeXTPC, 0, next_rtc_vmstate, NextRtc),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
>  static void next_pc_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -898,7 +930,7 @@ static void next_pc_class_init(ObjectClass
> *klass, void *data) dc->realize = next_pc_realize;
>      dc->reset = next_pc_reset;
>      device_class_set_props(dc, next_pc_properties);
> -    /* We will add the VMState in a later commit */
> +    dc->vmsd = &next_pc_vmstate;
>  }
>  
>  static const TypeInfo next_pc_info = {

Acked-by: Thomas Huth <huth@tuxfamily.org>

