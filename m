Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4698B5BBDBF
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 14:20:31 +0200 (CEST)
Received: from localhost ([::1]:41910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZtHh-0006cw-RB
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 08:20:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZtCk-0001aK-VD; Sun, 18 Sep 2022 08:15:22 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZtCh-0005V9-Ih; Sun, 18 Sep 2022 08:15:21 -0400
Received: by mail-wr1-x42e.google.com with SMTP id cc5so33168621wrb.6;
 Sun, 18 Sep 2022 05:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=bb74TBGA2nVYyGmxtO3ca/i0kSv1/RE6mr/DwS0jHBs=;
 b=Pqjb6EZU9xcmYaTcphgmKBGOACOXN1Mbx0tz4PWUORzvy+eGDM/QeAmFQx/SbJdiAg
 f+JlceCNf7GhysG7GXuLo31tGBxEiz3quM+nDK5he5GjkXID2Cxs/OkT+zJLSDU1jVAr
 W2kd/7QCNW3EWCIejcAsMGRfYkYtt9nIaW6qoUuUFWzHXiMxt6F2OjG3xyB44N7Lkafu
 nDBYiUPbrKX7ACKVSVCW8lAZ73Wizlkd8ddJ2ddZ2J3ZZPGtF6/4sYu1WTlTAghNw9fI
 EJVQblaM1oDH3QjqeuqqFIVSiBtUM4NQIvfpN5UqLf8LDhOEfFOg1ufDQS6oHg6Y2Nmk
 25Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=bb74TBGA2nVYyGmxtO3ca/i0kSv1/RE6mr/DwS0jHBs=;
 b=BepzA/YizG24KSXVyNAuB9fBVDipn7jnQW22uBWaYRLa7GIXhxdn0llXwmMGBGKuTu
 gcPbH3GtUg5EDIJt3PTDWfd0rX8u4awWXp09kEQGjgECjYFkiuDyBD3ZdNdPjrkhGoZ9
 crNF147C/c5z3ceGxeQ1oLd5786uGKgOKLS6oRlBNyb+pJl6OCVTunmVLu+ZrnMEPrJz
 gpIFc5jK3/6Cl7kx8tq8MRzURLWCLxgYGf8Xq7ok6INg9leyHSd4Tx8dQOSI3ejQAGpS
 G7N3sIIf+2d3zH74lB9ryYYHjuCh5mGfxD5KuaEnwGKFI8Td2OHswX7JPbCVmj/U6xhy
 xUNQ==
X-Gm-Message-State: ACrzQf3AlmaKif2zU+2SBemp2DGu1vdr0V1VLbRgz3w08qqmykVzNDRm
 1qyYShtCabbwl16pe7txhOA=
X-Google-Smtp-Source: AMsMyM5OT1dZ18/REYbg7G2i1ugMdP/JljOiBuqsWPuCDRIDub6ig0sxuc6KvWa2HIrXqY/69wJGhQ==
X-Received: by 2002:a5d:4301:0:b0:21b:8af6:4a21 with SMTP id
 h1-20020a5d4301000000b0021b8af64a21mr8245435wrq.296.1663503316634; 
 Sun, 18 Sep 2022 05:15:16 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 co15-20020a0560000a0f00b002253d865715sm10818518wrb.87.2022.09.18.05.15.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 05:15:16 -0700 (PDT)
Message-ID: <2dd879bd-24dd-855a-ebfa-c9803427ecd3@amsat.org>
Date: Sun, 18 Sep 2022 14:15:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 01/11] hw/ppc/meson: Allow e500 boards to be enabled
 separately
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org
References: <20220915152520.21948-1-shentey@gmail.com>
 <20220915152520.21948-2-shentey@gmail.com>
In-Reply-To: <20220915152520.21948-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.657,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 15/9/22 17:25, Bernhard Beschow wrote:
> Gives users more fine-grained control over what should be compiled into
> QEMU.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   configs/devices/ppc-softmmu/default.mak | 3 ++-
>   hw/ppc/Kconfig                          | 8 ++++++++
>   hw/ppc/meson.build                      | 6 ++----
>   3 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/configs/devices/ppc-softmmu/default.mak b/configs/devices/ppc-softmmu/default.mak
> index 658a454426..a887f5438b 100644
> --- a/configs/devices/ppc-softmmu/default.mak
> +++ b/configs/devices/ppc-softmmu/default.mak
> @@ -1,7 +1,8 @@
>   # Default configuration for ppc-softmmu
>   
>   # For embedded PPCs:
> -CONFIG_E500=y
> +CONFIG_E500PLAT=y
> +CONFIG_MPC8544DS=y
>   CONFIG_PPC405=y
>   CONFIG_PPC440=y
>   CONFIG_VIRTEX=y
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index 3a4418a69e..22a64745d4 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -132,6 +132,14 @@ config E500
>       select FDT_PPC
>       select DS1338
>   
> +config E500PLAT
> +    bool
> +    select E500
> +
> +config MPC8544DS
> +    bool
> +    select E500
> +
>   config VIRTEX
>       bool
>       select PPC4XX
> diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
> index 62801923f3..32babc9b48 100644
> --- a/hw/ppc/meson.build
> +++ b/hw/ppc/meson.build
> @@ -71,12 +71,10 @@ ppc_ss.add(when: 'CONFIG_MAC_OLDWORLD', if_true: files('mac_oldworld.c'))
>   # NewWorld PowerMac
>   ppc_ss.add(when: 'CONFIG_MAC_NEWWORLD', if_true: files('mac_newworld.c'))
>   # e500
> +ppc_ss.add(when: 'CONFIG_E500PLAT', if_true: files('e500plat.c'))
> +ppc_ss.add(when: 'CONFIG_MPC8544DS', if_true: files('mpc8544ds.c'))
>   ppc_ss.add(when: 'CONFIG_E500', if_true: files(
>     'e500.c',
> -  'mpc8544ds.c',
> -  'e500plat.c'
> -))
> -ppc_ss.add(when: 'CONFIG_E500', if_true: files(
>     'mpc8544_guts.c',

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>     'ppce500_spin.c'
>   ))


