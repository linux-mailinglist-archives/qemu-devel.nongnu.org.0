Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DE852DEAC
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 22:48:54 +0200 (CEST)
Received: from localhost ([::1]:38750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrn4l-0001iM-Br
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 16:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dylan@rivosinc.com>)
 id 1nrn1W-0000oi-Cb
 for qemu-devel@nongnu.org; Thu, 19 May 2022 16:45:30 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:54045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dylan@rivosinc.com>)
 id 1nrn1U-00023H-6l
 for qemu-devel@nongnu.org; Thu, 19 May 2022 16:45:29 -0400
Received: by mail-pj1-x102a.google.com with SMTP id f10so6287824pjs.3
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 13:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=h8DlWYA44S0oP/bz7EYgh16WwQxrQuTelIjXdqNLtU0=;
 b=Z+RKzpa8Q9AV60rUFnfz9lGoC5Al1LENNO8EWGkNuCJN7qAoBxlKQFf/arNatMs2Q8
 AmzCigkWwbGDqgLoMl3Qr+kWESO+m616C8fzmKzYEUaJNnD82tkxrMbusodhnBicB4yW
 sHbM+JmovWuw29xhZ6WGo4Rp1+Thh9zIPzEXQxUKIk0BEBT1Jg0PchsnjyCjLAnuGeHJ
 Ehy6pLh5mIJr1DdES+fzJtS4csj+osrJPFPXosTsB+VNp9+jS3MYtvT2RNv9zFXx1V3B
 YrfcJP5yDK6mM8OssQ5CNCq0vF2ZcWFD51kUwuH9IH0q6EAWBlvNM5MTmgNtHcm1UR1U
 7kiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h8DlWYA44S0oP/bz7EYgh16WwQxrQuTelIjXdqNLtU0=;
 b=OY/HMEFMIr+3EzvYLUbyANRN775VdwPuRlZv44HF6ZsXbdZy5Xsdb5ONxpnrwGiBOx
 dw8RhrWw4t10l2qNvCa/RjhcgJRJLgvgvjDwm3/45wSkYI2HVmBCvMbLrAgNjsSwWPMy
 34bRzLY5xYMYi2Cq1GRDenC7yMN1Xzzh+nLxHblKpI79WNQ1PxSCnaZQR/PCz28D3j8h
 j1/FG1T/718Yu1NypqYCK+hLzmwVUb3V5n67n77FtzZTlR6jGTJzkAjCBxQblRi3OEkA
 sE3943l9nEqqiRh9fPlvBSDkM5Mml8uoVc92fK/2t/CbcM4ZgGfq34+Cx3FC2Wqy0Foa
 Pryg==
X-Gm-Message-State: AOAM532rxqSHfB4iy1af0DNr7aSGzUwJe30PlbQOG5tmTBCSN7RKv7ZT
 QW4O68u2Q6jdmX2c1Yv4Py7a3w==
X-Google-Smtp-Source: ABdhPJyi248FFAwfnvRV7qdS57SDqO3Otct8AfaeneoUfeZTRKLCqTqWJpzttRvm0ljSfiql0eOdEg==
X-Received: by 2002:a17:902:6b0b:b0:158:f889:edd9 with SMTP id
 o11-20020a1709026b0b00b00158f889edd9mr6416932plk.122.1652993126409; 
 Thu, 19 May 2022 13:45:26 -0700 (PDT)
Received: from rivosinc.com ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 n1-20020a170902e54100b0015e8d4eb219sm4300664plf.99.2022.05.19.13.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 13:45:25 -0700 (PDT)
Date: Thu, 19 May 2022 20:45:22 +0000
From: Dylan Reid <dylan@rivosinc.com>
To: Anup Patel <anup@brainfault.org>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Dylan Reid <dgreid@rivosinc.com>
Subject: Re: [PATCH] hw/riscv: virt: Avoid double FDT platform node
Message-ID: <20220519204522.nckblef43pcl5x4k@rivosinc.com>
References: <20220512182103.408627-1-dgreid@rivosinc.com>
 <CAAhSdy2Uoj0jGXJn1W_Vhewi9BLSN+9zd003qUf_ugKpDd2ihg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhSdy2Uoj0jGXJn1W_Vhewi9BLSN+9zd003qUf_ugKpDd2ihg@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=dylan@rivosinc.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, May 19, 2022 at 08:34:06PM +0530, Anup Patel wrote:
> On Fri, May 13, 2022 at 1:34 AM Dylan Reid <dylan@rivosinc.com> wrote:
> >
> > When starting the virt machine with `-machine virt,aia=aplic-imsic`,
> > both the imsic and aplic init code will add platform fdt nodes by
> > calling `platform_bus_add_all_fdt_nodes`. This leads to an error at
> > startup:
> > ```
> > qemu_fdt_add_subnode: Failed to create subnode /platform@4000000: FDT_ERR_EXISTS
> > ```
> >
> > The call from `create_fdt_imsic` is not needed as an imsic is currently
> > always combined with an aplic that will create the nodes.
> >
> > Fixes: 3029fab64309 ("hw/riscv: virt: Add support for generating platform FDT entries")
> > Signed-off-by: Dylan Reid <dgreid@rivosinc.com>
> > ---
> >  hw/riscv/virt.c | 5 -----
> >  1 file changed, 5 deletions(-)
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index 3326f4db96..d625f776a6 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -561,11 +561,6 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
> >      }
> >      qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_m_phandle);
> >
> > -    platform_bus_add_all_fdt_nodes(mc->fdt, imsic_name,
> > -                                   memmap[VIRT_PLATFORM_BUS].base,
> > -                                   memmap[VIRT_PLATFORM_BUS].size,
> > -                                   VIRT_PLATFORM_BUS_IRQ);
> > -
> 
> This patch only fixes for the case where there is only one socket.
> 
> I had send-out a similar fix which also handles multi-socket case.
> https://lore.kernel.org/all/20220511144528.393530-9-apatel@ventanamicro.com/

Thanks Anup, that looks good to me.

> 
> Regards,
> Anup
> 
> 
> >      g_free(imsic_name);
> >
> >      /* S-level IMSIC node */
> > --
> > 2.30.2
> >
> >

