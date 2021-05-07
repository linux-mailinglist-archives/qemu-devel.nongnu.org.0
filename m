Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB153764BA
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 13:53:46 +0200 (CEST)
Received: from localhost ([::1]:39914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lez3B-0005Qx-Dg
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 07:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lez22-0004aa-Mu; Fri, 07 May 2021 07:52:34 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:34481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lez20-00055D-VA; Fri, 07 May 2021 07:52:34 -0400
Received: by mail-lj1-x233.google.com with SMTP id p12so11210710ljg.1;
 Fri, 07 May 2021 04:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=slbWWk2Y39cU/AdGIxISFDdichHsEEYEnOwaEDeM5zM=;
 b=EcwDgSRFnxiQHmTsexe+BvKboWpauVbgrjJHq0t7ntIya+GIFLHu5ocW76P+JRHq3F
 csoueE7vz3SSpHWnU8C6YvaA1jReajhFQBqk9bKqKi7W3Bx0xaZuhga6Mzh7pYihIaTC
 y9j3brw3unehfuNAzmK6GGhNAlZqp/tDEYI0183oBBErvZUAifgThr7kW7I9dmn8rFkm
 2J9mcTtKVaveq3qAI5XaMtOt/oC3fC7BDLc05kjtpLy6nt2ztEe/9hEkAB4axd+Lj3TD
 FPmOSm9lg+e1nwRwWn25jYE5LTlJMUzd5gdOdWqbzlXvc6wKV3eyM2E7yH+SI+c8kqIu
 wV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=slbWWk2Y39cU/AdGIxISFDdichHsEEYEnOwaEDeM5zM=;
 b=tag87mitoGW1gqYUPiQ/SvkYx5sayM9EBMKQd9Q/Prn6gOiP7Nm49OSMnofRTeP1kI
 mG5HQE9r94VSQICMkbUzfi5vD/6msjtP6J1oQYBk791nMdGZJR+ObgBmuVt0p/XlyFqz
 GRPQOwYXAbVHPWZlU5YLlKAVr0gUXRCMWSnep6h5LsMEAptkIsxxwzM5TLtEvumSWab0
 UII0WghS+/lfZVpKzBMl788/umYWgSEQxS2Hnvf+MVlX31jdZic1pVcf/vdp39gNSATh
 GKPxdZD3AWBkPqyU3/jbs5sK9YEqy2SqfOzmT2tqmpfLnKYenSnEPcgww4tIFjBRUc9l
 lJyw==
X-Gm-Message-State: AOAM533fkJUMYdJTLB4hxsFH5nFbgWWKFgkpXdrTXVuurenTx61UKvLC
 J18JjQiNIa30Cgpm/xevRjA=
X-Google-Smtp-Source: ABdhPJzAMvUYR5mHOVUN/Xp6bUZlFDVCIy2E800lLlR2wRJb9XKzMNqfp1CRk7JMlkS63r3W7qXpDg==
X-Received: by 2002:a2e:1541:: with SMTP id 1mr7538370ljv.80.1620388350201;
 Fri, 07 May 2021 04:52:30 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id x207sm1349250lff.234.2021.05.07.04.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 04:52:29 -0700 (PDT)
Date: Fri, 7 May 2021 13:52:28 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hw/arm/xlnx: Fix PHY address for xilinx-zynq-a9
Message-ID: <20210507115228.GF477672@toto>
References: <20210504124140.1100346-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210504124140.1100346-1-linux@roeck-us.net>
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 04, 2021 at 05:41:40AM -0700, Guenter Roeck wrote:
> Commit dfc388797cc4 ("hw/arm: xlnx: Set all boards' GEM 'phy-addr'
> property value to 23") configured the PHY address for xilinx-zynq-a9
> to 23. When trying to boot xilinx-zynq-a9 with zynq-zc702.dtb or
> zynq-zc706.dtb, this results in the following error message when
> trying to use the Ethernet interface.
> 
> macb e000b000.ethernet eth0: Could not attach PHY (-19)
> 
> The devicetree files for ZC702 and ZC706 configure PHY address 7. The
> documentation for the ZC702 and ZC706 evaluation boards suggest that the
> PHY address is 7, not 23. Other boards use PHY address 0, 1, 3, or 7.
> I was unable to find a documentation or a devicetree file suggesting
> or using PHY address 23. The Ethernet interface starts working with
> zynq-zc702.dtb and zynq-zc706.dtb when setting the PHY address to 7,
> so let's use it.
> 
> Cc: Bin Meng <bin.meng@windriver.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>




> ---
>  hw/arm/xilinx_zynq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 8db6cfd47f..5ac0294f9e 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -119,7 +119,7 @@ static void gem_init(NICInfo *nd, uint32_t base, qemu_irq irq)
>          qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
>          qdev_set_nic_properties(dev, nd);
>      }
> -    object_property_set_int(OBJECT(dev), "phy-addr", 23, &error_abort);
> +    object_property_set_int(OBJECT(dev), "phy-addr", 7, &error_abort);
>      s = SYS_BUS_DEVICE(dev);
>      sysbus_realize_and_unref(s, &error_fatal);
>      sysbus_mmio_map(s, 0, base);
> -- 
> 2.25.1
> 

