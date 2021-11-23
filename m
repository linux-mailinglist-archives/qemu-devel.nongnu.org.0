Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3615D45A056
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 11:36:34 +0100 (CET)
Received: from localhost ([::1]:33110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpTA9-0006gd-06
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 05:36:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1mpT86-0004KB-2N
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:34:26 -0500
Received: from [2a00:1450:4864:20::234] (port=37690
 helo=mail-lj1-x234.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1mpT84-0000ez-6e
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:34:25 -0500
Received: by mail-lj1-x234.google.com with SMTP id k2so10154450lji.4
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 02:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Hr3B2hBc5RRTG/83BO77UoriOJz1TOZJRxgMoOfkcrY=;
 b=hByWb6l0rREy/Dj4IddKHf4tGsQ/YnTXVcQrIGmH1szWZ5iZPi/rEnLQHkarpQfAcO
 AyBRNw74y61PFXarh5S3Rs2m/mTyZkRr8fYa/gWRZ/OixcEfXsDDMh9DNLt7/58bXFS/
 BzHtT3TEyfejzy8OAeIjPRNp4WDP6Y/huBapJjG7ZcIMz+882tfIaailSrmLUl9Ggkru
 bFlEQUFHcwRqAIlxmKY+MAjBIVg+dkKhbkNYDkFBSrJUJGlKNA9jHNUzy589hhMAlHuP
 U48y+jDZMwG1ZFLBuzpDxydP8U58FgWa7ivqn3BEGGNcQDUSv7cXnF3o/62kJQLMEvmN
 hRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Hr3B2hBc5RRTG/83BO77UoriOJz1TOZJRxgMoOfkcrY=;
 b=qrHCyUaFT6W8zI8oTe/yvr6ip+rOnljad7wxEJIWT8qRuMPO4oaREd79A+ess7Smze
 eNASIdy9rXI2C1adwlKMehKKfc8PDlD1EKgZiRvKW71C/fYkd2Cs2kmE9E2rftGsboBI
 7G1zUmV+5pckYKaZfPp65tfmgoinSRlzSBpao/11vlfvYwaovj+ptsW1sOn1PcuEcXRY
 BnMk8hmMEmQ23feJ+EsKgejb3bNff5axwg4Jbk1Mjr7Ds0xQj7aYxuoGtoPls+/LaNLd
 T8DphuujOo94LadSSArQ3J/OUexqAfgDaaLyiR3bmU9JX88lUuC3Ow9PWnFfSg1bYaXd
 eKiQ==
X-Gm-Message-State: AOAM531VNx2y/eXAROdH9hvU5nWX5QpMx8uxtj/UgWyAfnsJsk4GHz4Y
 +cc4QIBkwP1VVZRrmrUjEls=
X-Google-Smtp-Source: ABdhPJyKd5xpBLEWsL7N3vx4C6R5efFL0OF528DN0NFzKGLy6Wpl7y2rNcK8Zuz4cIFk+yH6qGi0lQ==
X-Received: by 2002:a2e:a4d1:: with SMTP id p17mr3905928ljm.207.1637663661086; 
 Tue, 23 Nov 2021 02:34:21 -0800 (PST)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 p3sm1250009lfg.205.2021.11.23.02.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 02:34:20 -0800 (PST)
Date: Tue, 23 Nov 2021 11:34:19 +0100
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Subject: Re: [PATCH v1 9/9] hw/arm/xlnx-versal-virt: Connect mt35xu01g
 flashes to the OSPI
Message-ID: <20211123103418.GA6734@fralle-msi>
References: <20211117141841.4696-1-francisco.iglesias@xilinx.com>
 <20211117141841.4696-10-francisco.iglesias@xilinx.com>
 <20211119171623.GH2341@toto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119171623.GH2341@toto>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::234
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x234.google.com
X-Spam_score_int: -1012
X-Spam_score: -101.3
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-101.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 Francisco Iglesias <francisco.iglesias@xilinx.com>, alistair@alistair23.me,
 qemu-devel@nongnu.org, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Edgar,

Thank you for having a look at the series! I made the updates in v2!

Best regards,
Francisco Iglesias

On [2021 Nov 19] Fri 18:16:23, Edgar E. Iglesias wrote:
> On Wed, Nov 17, 2021 at 02:18:41PM +0000, Francisco Iglesias wrote:
> > Connect Micron Xccela mt35xu01g flashes to the OSPI flash memory
> > controller.
> > 
> > Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> > ---
> >  hw/arm/xlnx-versal-virt.c | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> > 
> > diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> > index d2f55e29b6..f2f12a781e 100644
> > --- a/hw/arm/xlnx-versal-virt.c
> > +++ b/hw/arm/xlnx-versal-virt.c
> > @@ -25,6 +25,8 @@
> >  #define TYPE_XLNX_VERSAL_VIRT_MACHINE MACHINE_TYPE_NAME("xlnx-versal-virt")
> >  OBJECT_DECLARE_SIMPLE_TYPE(VersalVirt, XLNX_VERSAL_VIRT_MACHINE)
> >  
> > +#define XLNX_VERSAL_NUM_OSPI_FLASH 4
> > +
> >  struct VersalVirt {
> >      MachineState parent_obj;
> >  
> > @@ -690,6 +692,27 @@ static void versal_virt_init(MachineState *machine)
> >              exit(EXIT_FAILURE);
> >          }
> >      }
> > +
> > +    for (i = 0; i < XLNX_VERSAL_NUM_OSPI_FLASH; i++) {
> > +        BusState *spi_bus;
> > +        DeviceState *flash_dev;
> > +        qemu_irq cs_line;
> > +        DriveInfo *dinfo = drive_get_next(IF_MTD);
> 
> There's a patch from Markus on the list that is getting rid of
> drive_get_next(), we'll need to merge with that at some point...
> 
> 
> 
> 
> > +
> > +        spi_bus = qdev_get_child_bus(DEVICE(&s->soc.pmc.iou.ospi), "spi0");
> > +
> > +        flash_dev = qdev_new("mt35xu01g");
> > +        if (dinfo) {
> > +            qdev_prop_set_drive_err(flash_dev, "drive",
> > +                                    blk_by_legacy_dinfo(dinfo), &error_fatal);
> > +        }
> > +        qdev_realize_and_unref(flash_dev, spi_bus, &error_fatal);
> > +
> > +        cs_line = qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
> > +
> > +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->soc.pmc.iou.ospi),
> > +                           i + 1, cs_line);
> > +    }
> >  }
> >  
> >  static void versal_virt_machine_instance_init(Object *obj)
> > -- 
> > 2.11.0
> > 

