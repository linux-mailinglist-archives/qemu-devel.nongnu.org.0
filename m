Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C80CA61F1C4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 12:25:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os0En-00058I-0y; Mon, 07 Nov 2022 06:24:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1os0EW-00057S-HS
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 06:24:09 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1os0EU-0001YP-I1
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 06:24:03 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 q1-20020a17090a750100b002139ec1e999so9995586pjk.1
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 03:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=In7EM83NQpw5FRQfyQChh1DJYtJcwIhOwu3buUisba0=;
 b=i9htem0j9rpPBVFI3RGz3ePVC+6QW3DgpOsleM+gGndF4wpKT0M07Ii38LvkGQzgW+
 aTZtULwgGECFLRAnpTC0yYj1a2XcMreM9guJS1Xs8k/33Q67qWKtuuEA6i/Q2EC2CHUa
 tUBySY49t38GhshNc/MuYv0rQtPsarFGXeopgUGEe8TYDV1gAvY3saW6yjcklQpl6Kr2
 Gu3Xw8m1KBWDWL6r1lE6tWkZaeBkBhzH0HlHoXQOWMqtJi7LCq1fDWMFLS7cdSFUzFr7
 pUwEtXf0ha0McCN60JX9yomyfuiI7YlSnGaeIzR9Rj9x2smt4Q429sBfd3CjcraiySMX
 TiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=In7EM83NQpw5FRQfyQChh1DJYtJcwIhOwu3buUisba0=;
 b=aKYx2CTbYCFHmvPgTTtS8mgvbBsDp4z6s31ZH4jHweLNHyzGYlcvplYf8mE7rMLQDd
 EAGJ024SUruAgp7iP5ArWV4Woh42ncsUWhJVBygDE3n99RZ4aYZi7KlutaiC/FaRvWKQ
 cYN4f763+iHnN9zAnE9d1FS4cx6HeuUBVClyrVsKw0bwm0KfJ9hqdsqdnABMBfzwtLzr
 AmuA1c3uC2+awvLBwr4Q98mJxN3cBKaxaZ5JRFT3DldsK9AfhvYaylOF5Dy8pu2b1m8h
 YgDaiM1Q+lZ3oR5a6FXfYbq9SgPSqD3iBmJS0TczHf+oXGp5lFq2/jsgcv3dXtuHy4Zn
 Sexg==
X-Gm-Message-State: ACrzQf0LxacIyBKhN1ZwduXCu1gs/TJ0gBjvjonm+WLQGazhUPklikRH
 4J5FH6BDWG1hu3n/2dFWwkqE8Q==
X-Google-Smtp-Source: AMsMyM6pPTmvT8O9NiCp5VWcK4eBDUJNhOhco/jMSnLOE5adwu1HcixUiUH1zgtS4rj+2ykNM4Vg0g==
X-Received: by 2002:a17:902:cecf:b0:187:fd2:79c3 with SMTP id
 d15-20020a170902cecf00b001870fd279c3mr33374706plg.34.1667820241118; 
 Mon, 07 Nov 2022 03:24:01 -0800 (PST)
Received: from sunil-laptop ([49.206.12.236]) by smtp.gmail.com with ESMTPSA id
 j12-20020a170902da8c00b00186b04776b0sm4783848plx.118.2022.11.07.03.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 03:24:00 -0800 (PST)
Date: Mon, 7 Nov 2022 16:53:53 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: maobibo <maobibo@loongson.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/riscv: virt: Remove size restriction for pflash
Message-ID: <Y2jqyYsiZPh1+TzE@sunil-laptop>
References: <20221106143900.2229449-1-sunilvl@ventanamicro.com>
 <80ccc060-32a7-bc38-bf2b-2ef5959a7e0c@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80ccc060-32a7-bc38-bf2b-2ef5959a7e0c@loongson.cn>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Nov 07, 2022 at 05:57:45PM +0800, maobibo wrote:
> 
> 
> 在 2022/11/6 22:39, Sunil V L 写道:
> > The pflash implementation currently assumes fixed size of the
> > backend storage. Due to this, the backend storage file needs to be
> > exactly of size 32M. Otherwise, there will be an error like below.
> > 
> > "device requires 33554432 bytes, block backend provides 3145728 bytes"
> > 
> > Fix this issue by using the actual size of the backing store.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  hw/riscv/virt.c | 33 +++++++++++++++++++++++++--------
> >  1 file changed, 25 insertions(+), 8 deletions(-)
> > 
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index a5bc7353b4..aad175fa31 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -49,6 +49,7 @@
> >  #include "hw/pci/pci.h"
> >  #include "hw/pci-host/gpex.h"
> >  #include "hw/display/ramfb.h"
> > +#include "sysemu/block-backend.h"
> >  
> >  /*
> >   * The virt machine physical address space used by some of the devices
> > @@ -144,10 +145,17 @@ static void virt_flash_map1(PFlashCFI01 *flash,
> >                              MemoryRegion *sysmem)
> >  {
> >      DeviceState *dev = DEVICE(flash);
> > +    BlockBackend *blk;
> > +    hwaddr real_size;
> >  
> > -    assert(QEMU_IS_ALIGNED(size, VIRT_FLASH_SECTOR_SIZE));
> > -    assert(size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
> > -    qdev_prop_set_uint32(dev, "num-blocks", size / VIRT_FLASH_SECTOR_SIZE);
> > +    blk = pflash_cfi01_get_blk(flash);
> > +
> > +    real_size = blk ? blk_getlength(blk): size;
> > +
> > +    assert(real_size);
> > +    assert(QEMU_IS_ALIGNED(real_size, VIRT_FLASH_SECTOR_SIZE));
> > +    assert(real_size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
> How about add one sentence?
>        assert(real_size <= size);   
> 
> As defined VIRT_FLASH memory space, the total memory space size 64M,
> Pflash0/Pflash1 cannot be more than 32M. Supposing real size of pflash0
> is 33M, there will be conflict with address space of pflash1.
> 
> regards
> bibo, mao
> 

Good catch!. Thank you. Will add it in V2.

Thanks
Sunil

