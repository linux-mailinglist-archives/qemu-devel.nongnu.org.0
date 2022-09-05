Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C975AD200
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 14:03:46 +0200 (CEST)
Received: from localhost ([::1]:56698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVApI-0004dP-8d
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 08:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVA5w-0004Fo-1Q
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:16:48 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:40887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVA5u-0007HZ-D6
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:16:47 -0400
Received: by mail-pg1-x52f.google.com with SMTP id b196so7853039pga.7
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 04:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=HMX0g+sSjVT3I/oK4AbouctmEdlTvgJrb414nAtFG0Y=;
 b=emHhDbDI9ISvGyI+i+2CzNKSevI6/kojRoxsk5YPPs7a7OSTdWUiQab+jCFveIllI4
 T1rYkzYsLiV4I/pQRhlhxV0UwReq/BRg54IrMABzlHHcZA7Jb2AfM3sbufn3lgmynsBm
 4AJEpC81rJIWPbREbauU5So2zeJeunwlg4ZgA1JVIrJOJEy3gU7p0zx1M47tsK3qffQt
 WzsrMlA1yI/JY+Bh3fMc70dvBvPRxFN0giJrKVvGT6nnuDm+Oxu+LUd1whfdkLLBvvuS
 BwRZDamelFJoIF0Rnmc/eu3umjGCVU0+hszi/gdMRi7VqWM9EFis8qleLWbu+6/B4+37
 OuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=HMX0g+sSjVT3I/oK4AbouctmEdlTvgJrb414nAtFG0Y=;
 b=6IcHrFz5I7Gzxm7CjPFpA4gowj/Dea9gmrB6xBvqUevhEdL/5XsMYUssIHf+nESbpm
 7mL3u1Puz9DV6FwcV7mL8wrPemc42VA7nADrsMDxbecDWUP8tJ6vkRK0FDCicn90V7R8
 XHc74KzsBwYuuVO6zCum/gtMxTZ9vB7p4SdcTd3ue/Q87XVAiV74YFKN/ej0oEDpBfun
 MmI117noK8uIMOjmBbwdpRrSnYKSMf8WQIXTUJbaeDM/VFlV6xkQ6P/9MYPfBPUG2zvm
 LEpzs8THxKkld8JvH33PsLQ7/QuyRz1bnUsWU4TJovCWzV+J3J6lFxsekV89AtrSd7+P
 hPeg==
X-Gm-Message-State: ACgBeo2BQvZzBAh/06IJgpJuLFLs0LMflM9FNP4qxaw2JEp2683Y8BmR
 GWj8JJNbAQUjYYCalX7fCqW3Mg==
X-Google-Smtp-Source: AA6agR71XvLM+oHiyEH8gafheU4/inEL64oX8L2jWXWQDToEf/T0JKkmFzFk478hg5sXij6TqMofkg==
X-Received: by 2002:a63:5b61:0:b0:41d:3227:37b8 with SMTP id
 l33-20020a635b61000000b0041d322737b8mr41079280pgm.265.1662376603554; 
 Mon, 05 Sep 2022 04:16:43 -0700 (PDT)
Received: from sunil-laptop ([49.206.11.92]) by smtp.gmail.com with ESMTPSA id
 q9-20020a170902f78900b00172e19c2fa9sm7170018pln.9.2022.09.05.04.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 04:16:43 -0700 (PDT)
Date: Mon, 5 Sep 2022 16:46:37 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH] hw/riscv: virt: Enable booting S-mode firmware from pflash
Message-ID: <20220905111637.GA189777@sunil-laptop>
References: <20220905042940.146913-1-sunilvl@ventanamicro.com>
 <20220905080648.7wyzlk6fhwlxytze@kamzik>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220905080648.7wyzlk6fhwlxytze@kamzik>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, Sep 05, 2022 at 10:07:22AM +0200, Andrew Jones wrote:
> On Mon, Sep 05, 2022 at 09:59:40AM +0530, Sunil V L wrote:
> > To boot S-mode firmware payload like EDK2 from persistent
> > flash storage, qemu needs to pass the flash address as the
> > next_addr in fw_dynamic_info to the opensbi.
> > 
> > Update the kernel_entry with the flash address when no kernel
> > is specified via QEMU command line  so that opensbi
> > can jump to the flash address. This assumes flash drive unit 1 is
> > used to keep dynamic payload similar to other architectures.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  hw/riscv/virt.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index ff8c0df5cd..1ee855fded 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -1284,6 +1284,18 @@ static void virt_machine_done(Notifier *notifier, void *data)
> >          start_addr = virt_memmap[VIRT_FLASH].base;
> >      }
> >  
> > +    if (drive_get(IF_PFLASH, 0, 1)) {
> > +        /*
> > +         * Assume second pflash unit (unit=1) to hold the S-mode firmware
> > +         * like EDK2. Set kernel_entry to flash address if kernel argument
> > +         * is not set and pflash unit 1 is configured.
> > +         */
> > +        if (!kernel_entry) {
> > +            kernel_entry = virt_memmap[VIRT_FLASH].base +
> > +                             virt_memmap[VIRT_FLASH].size / 2;
> > +        }
> > +    }
> > +
> >      /*
> >       * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
> >       * tree cannot be altered and we get FDT_ERR_NOSPACE.
> > -- 
> > 2.25.1
> > 
> >
> 
> Hi Sunil,
> 
> We should ensure we can use both edk2 and the '-kernel' option. For
> example, guest installation will typically do direct kernel boot,
> and when it's desired / necessary to boot that kernel with ACPI, then
> we'll also need edk2.

Thank you very much, Drew. Let me revise the patch and send.

Thanks
Sunil
> 
> Thanks,
> drew

