Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A2F4FC77F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 00:17:45 +0200 (CEST)
Received: from localhost ([::1]:55996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne2Lv-0002mZ-Uc
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 18:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ne2KN-0001Jo-GK
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 18:16:07 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:39780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ne2KM-0006S5-0N
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 18:16:07 -0400
Received: by mail-lf1-x133.google.com with SMTP id y32so29088321lfa.6
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 15:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=K9NsrhjZL3m2QkYfPATxfkw/i9Ew0n9ok+fNUXzMvP8=;
 b=klf5tr2GpaEbeFnopsZ5eRVvzyJL1XaARy4jWcg5pjv03GW5tHue962nK0DeNsecEH
 OVI2bbzeUdx0xlFqaFOsJ0r8b/Nt2u0yLc6cQ/lHQfg/05m3X1X+cnobsv6aljk8i/V/
 ps6Q/TeL2l3peEqXture8VTgc+0wq4jxPwgag+JXs25D/wPotV4ghymb+qlfjwHxOmt8
 xGga1nCisnamj6B1pSjUfhGp5ZU7599tjEEmxpX3tPaEzGQx9aOK1nLwwOtIkkAa1AhC
 Ft68n3hcg0NVOqtNYPooeiZ1F9m9ChVIJSU7Q5SjPu+TIm0oipszhNVyJuVcHjFS7d52
 g6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=K9NsrhjZL3m2QkYfPATxfkw/i9Ew0n9ok+fNUXzMvP8=;
 b=b+rVy+ehLwZbf2uQG7RWlXSwvN+VAQyx44cZ7Jwaa9gza35S3pIcJaHS9KB2JdKGUO
 DzLa0jS5I2SeZdO0wbXQDJCmrdV1inwccaplnYqmdi4vgQcRWImk7yMk36iBIpNMsqDF
 j0gTZ4yUf8/qIoER1/N3VXhksEl6qesiiOpb9klIpY2A3Hd0U75uEMUyGttfIXxyL73y
 fe7PDe8PrQ84Pb5G+ApnBC9gUwa/Gp1bJ3VsDpppjSDv0R9M6rq8TkC+I8iB97PfCoTg
 0XvW/I1b4eeeSuDAIB1BDmW0l+DA693O0Dxj7gVQGz3ZhdINOX5CeFBAVeY/t1/LQsj/
 CuCg==
X-Gm-Message-State: AOAM531xeh4xQC0P6u3nd3clGy41HMpFcrs+uxrdMMGdsBsWc9LoB3X3
 2kzZwmOjOP8N0n+wOS9koa8=
X-Google-Smtp-Source: ABdhPJwpU9u7E9s2MxW0KeEYUVvo/Hk2aKb03rVMj5SoeoQXBF8+KXUQ5nQ9YAwWsE8LS3JyeFPX6A==
X-Received: by 2002:a05:6512:b1b:b0:44a:9ae9:b9bf with SMTP id
 w27-20020a0565120b1b00b0044a9ae9b9bfmr22648833lfu.365.1649715364118; 
 Mon, 11 Apr 2022 15:16:04 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a2eb5a2000000b0024b52055ce1sm1081920ljn.104.2022.04.11.15.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 15:16:03 -0700 (PDT)
Date: Tue, 12 Apr 2022 00:16:02 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH v1 1/1] include/hw/pci/pcie_host: Correct
 PCIE_MMCFG_BUS_MASK
Message-ID: <20220411221601.GA17303@fralle-msi>
References: <20220411193818.8845-1-frasse.iglesias@gmail.com>
 <20220411171149-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220411171149-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,

On [2022 Apr 11] Mon 17:12:47, Michael S. Tsirkin wrote:
> On Mon, Apr 11, 2022 at 09:38:18PM +0200, Francisco Iglesias wrote:
> > According to [1] address bits 27 - 20 are mapped to the bus number (the
> > TLPs bus number field is 8 bits).
> > 
> > [1] PCI Express® Base Specification Revision 5.0 Version 1.0
> > 
> > Signed-off-by: Francisco Iglesias <frasse.iglesias@gmail.com>
> > ---
> >  include/hw/pci/pcie_host.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/hw/pci/pcie_host.h b/include/hw/pci/pcie_host.h
> > index 076457b270..b3c8ce973c 100644
> > --- a/include/hw/pci/pcie_host.h
> > +++ b/include/hw/pci/pcie_host.h
> > @@ -60,7 +60,7 @@ void pcie_host_mmcfg_update(PCIExpressHost *e,
> >  /*
> >   * PCI express ECAM (Enhanced Configuration Address Mapping) format.
> >   * AKA mmcfg address
> > - * bit 20 - 28: bus number
> > + * bit 20 - 27: bus number
> >   * bit 15 - 19: device number
> >   * bit 12 - 14: function number
> >   * bit  0 - 11: offset in configuration space of a given device
> 
> this is correct, or to be more precise:
> A[(20 + n – 1):20] and 1 <= n <= 8

Thank you for having a look! I'll create a patch for this and also a
second proposing a correction for PCIE_MMCFG_SIZE_MAX and repost!

Best regards,
Francisco

> 
> 
> > @@ -68,7 +68,7 @@ void pcie_host_mmcfg_update(PCIExpressHost *e,
> >  #define PCIE_MMCFG_SIZE_MAX             (1ULL << 29)
> >  #define PCIE_MMCFG_SIZE_MIN             (1ULL << 20)
> >  #define PCIE_MMCFG_BUS_BIT              20
> > -#define PCIE_MMCFG_BUS_MASK             0x1ff
> > +#define PCIE_MMCFG_BUS_MASK             0xff
> >  #define PCIE_MMCFG_DEVFN_BIT            12
> >  #define PCIE_MMCFG_DEVFN_MASK           0xff
> >  #define PCIE_MMCFG_CONFOFFSET_MASK      0xfff
> > -- 
> > 2.20.1
> 

