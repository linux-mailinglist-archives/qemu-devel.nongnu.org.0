Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0337B697DFC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 15:07:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSIQM-000589-0Z; Wed, 15 Feb 2023 09:06:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pSIQG-00056y-Kf
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:06:12 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pSIQB-0000jo-LP
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:06:12 -0500
Received: by mail-pj1-x1035.google.com with SMTP id bx22so18241089pjb.3
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 06:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=McznPg3QiLCKg93UZYSw9csxgwji/bl/Dcw9teER1hc=;
 b=mqSDlaoNwSaUb2T9SzvIE1rMsQV+/zfXz6uZ4zCFMjJ6R2CKg9h6XzfZgHf8Ic8jDy
 6SgkhyyUEyxy7kHohaQ6ZqBT7JzfcTcb3wu3LlYk6pdvT1qdfkEuS0KEZfpi2tS6RuY4
 DDpHeBJicMKMh323mwUrIplka0Go0lLYSZbjslDXG3Ob4sorkmrzrX5xakkBCbKhvck6
 JTs+scQSLdqWV3BHqstmeaWjVakrg6mmZNGuNCB9LmTCIBYNRFC/hHYoyrUvvnnPeqm6
 uL18V5Naz4hyRZMsf2AuKpPpy88uiAudaw+q6GRdrbZ+GghTTAE3J/547S0VyuHvKp6X
 J2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=McznPg3QiLCKg93UZYSw9csxgwji/bl/Dcw9teER1hc=;
 b=OZicoO7Jw0+ppM3GYB06Q04iWFPxI+oZh3e0flBYtRstrK8JQ39k+6Wwg5lfpmREo6
 ndfYA6kjBlN2g+Hs6sgI9d3YtU+Xn5mOMbx3yoZPO/Adz/A/okJBAX4WCYPryUefzGB+
 nlcxUoQ8WZlywi73/qacsyiZMNYNrq23d0FFDDMC/jJJVvPaNZbezlnQ1qhE3vryeURv
 uNsb6ye/T4MfAqOeCwC5jPKr/bwV9mvwsScfCWBoj9T7wabEzNIP2g53dx+zjQ5Bx/Jk
 IcPY7pxelIEYk9oQ62PLvync171/vE5THN77ljILP7ZXkNsFTqjLkcxTshTs61i07Mfa
 XRuQ==
X-Gm-Message-State: AO0yUKWSF+Vyn8godmqR07OyvPjG5pmo823ViD4buuCiFOIs3le2rBCi
 zNHXS0MFy7MPFGl5+no5nHqE7A==
X-Google-Smtp-Source: AK7set+HSj1JGIukd4yFK9DH1/ntVAzGNAOIwoXxotytPGyV2OQTbxaTmLsxuIpDZJ0HUtxzg8RwrA==
X-Received: by 2002:a17:903:1251:b0:19a:703d:c1cb with SMTP id
 u17-20020a170903125100b0019a703dc1cbmr2778032plh.11.1676469965928; 
 Wed, 15 Feb 2023 06:06:05 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 d12-20020a170902854c00b0019902f0336fsm1378383plo.286.2023.02.15.06.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 06:06:05 -0800 (PST)
Date: Wed, 15 Feb 2023 19:35:58 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: Re: [PATCH V2 08/10] hw/riscv/Kconfig: virt: Enable ACPI config option
Message-ID: <Y+zmxmcX1lakFxSn@sunil-laptop>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
 <20230213144038.2547584-9-sunilvl@ventanamicro.com>
 <20230215132424.e4vtxjkq2bpffbw2@orel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215132424.e4vtxjkq2bpffbw2@orel>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1035.google.com
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

On Wed, Feb 15, 2023 at 02:24:24PM +0100, Andrew Jones wrote:
> On Mon, Feb 13, 2023 at 08:10:36PM +0530, Sunil V L wrote:
> > Enable ACPI related config option to build ACPI subsystem
> > for virt machine.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  hw/riscv/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> > index 4550b3b938..6528ebfa3a 100644
> > --- a/hw/riscv/Kconfig
> > +++ b/hw/riscv/Kconfig
> > @@ -44,6 +44,7 @@ config RISCV_VIRT
> >      select VIRTIO_MMIO
> >      select FW_CFG_DMA
> >      select PLATFORM_BUS
> > +    select ACPI
> >  
> >  config SHAKTI_C
> >      bool
> > -- 
> > 2.34.1
> >
> 
> This could probably squashed together with the previous patch.
> 
Thank you!, Drew. Yes, I am going to squash these patches as per
feedback from Daniel. Will address your comments on other patches and
send V3 soon.

Thanks!
Sunil

