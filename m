Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E500C68BFEA
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 15:20:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP2M4-0003E3-34; Mon, 06 Feb 2023 09:20:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pP2LV-0002cw-IL
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:19:51 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pP2LB-0005B3-5Q
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:19:48 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 bg10-20020a17090b0d8a00b00230c7f312d4so2080606pjb.3
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 06:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KURJL21wa1FUHPhUnCRF4eQkT8aMjQ4b6+/Ubcj9Zqw=;
 b=cQwCXlsiJY5LeIbgEnGd/J8/TUSTKwKIZG3Q98TouthHmuaDUXV0Thn5U9HJXdq+GZ
 jY5kR4ovDRKrULGjF8wJL5FCjB8aqa9tGYWLT5K+xxYnsDJcq5DnKliKiUKGoGXN9NU+
 Q8TfbtM3KMWyJ1aafsrgElfP/K9j7lFLKMfvTU8NCDkCR0IyTV7tI3bkUfu/6Gzm6EFG
 oF1aqCwwDsmasMlPFu5hX/u0l2TXOU84PZr6j6b8LdEcVBSTVkVI4V9f1iY/64TIQfjG
 BC+IYLOZNezvXMF0KdO8OMQicc5acGMkWWDcCDhhFPZ7sm87JudQ3sr7dLOH7jmhGxDF
 P5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KURJL21wa1FUHPhUnCRF4eQkT8aMjQ4b6+/Ubcj9Zqw=;
 b=YHEOtoHCJyn6TI93to6udFMzwW+AP8ZNk3v1WV1/etwZZhf4RerRvoxX4KRU8WFVIO
 X4QwL9Cj2CpGQJLp6+sIJA53vhaZ/EWHtBgowz+oeXg/vmsiIw65vU6N00VM78nW6xn+
 es9iGysOw9PQUCK8WKQ+RcUX6CH6GPV0fWrYdIEi2lehzXNsOeyWqH8wartawtEYXxGq
 cQel8+CojIzoSB4HWughA/ktAX7VEhDet0RTRaxBFdkJ4wJMfyuLpEHbnaaR0Rfwg77J
 Xp1YM25pL4+rTSsgmPm5Hr8SvdFst8SNPzeAZNdy5PlP5oCl9RYU63oB9R/HX6UZUIbG
 Htsg==
X-Gm-Message-State: AO0yUKWnr+ws4TE3aV5GSVpQ81XuvB4fTJEWBo+jED+XKroujpFVUKWR
 WK9Rf2+hpFE/h/V22A7letaPrQ==
X-Google-Smtp-Source: AK7set/OV34mtLqL9el7NX5JGIrijALBcoW0beuU1Y+TJmUGF7hbnBDg2WXa9P5DNFyiY1uIwFjklQ==
X-Received: by 2002:a05:6a20:65a6:b0:b8:8a94:5bf with SMTP id
 p38-20020a056a2065a600b000b88a9405bfmr17537908pzh.21.1675693167256; 
 Mon, 06 Feb 2023 06:19:27 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 i132-20020a62878a000000b005810c4286d6sm7132789pfe.0.2023.02.06.06.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 06:19:26 -0800 (PST)
Date: Mon, 6 Feb 2023 19:49:20 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 08/10] hw/riscv/Kconfig: virt: Enable ACPI config options
Message-ID: <Y+EMaGuphDk9mslw@sunil-laptop>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-9-sunilvl@ventanamicro.com>
 <CAEUhbmUGF3DR_XOB1fb6HbLUYM43RMHo92dewo=_94D2mFkcpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUhbmUGF3DR_XOB1fb6HbLUYM43RMHo92dewo=_94D2mFkcpA@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Feb 06, 2023 at 06:29:46PM +0800, Bin Meng wrote:
> On Thu, Feb 2, 2023 at 12:54 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
> >
> > Enable ACPI related config options to build ACPI subsystem
> > for virt machine.
> >
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  hw/riscv/Kconfig | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> > index 4550b3b938..92b1a9eb64 100644
> > --- a/hw/riscv/Kconfig
> > +++ b/hw/riscv/Kconfig
> > @@ -44,6 +44,9 @@ config RISCV_VIRT
> >      select VIRTIO_MMIO
> >      select FW_CFG_DMA
> >      select PLATFORM_BUS
> > +    select ACPI
> > +    select ACPI_HW_REDUCED
> 
> I don't see APIs in ACPI_HW_REDUCED get called by RISC-V virt codes.
> 
Yes, this and PCI are not required at this time. Will remove them when I
send the next revision of this series.

Thanks
Sunil
> > +    select ACPI_PCI
> 
> Regards,
> Bin

