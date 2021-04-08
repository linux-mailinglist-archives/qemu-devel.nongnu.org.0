Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FA2357F08
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 11:22:30 +0200 (CEST)
Received: from localhost ([::1]:58462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUQrt-0006q2-3W
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 05:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1lUQqv-00069C-9x; Thu, 08 Apr 2021 05:21:29 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:39667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1lUQqr-0002ei-M7; Thu, 08 Apr 2021 05:21:28 -0400
Received: by mail-lf1-x12d.google.com with SMTP id b4so2792905lfi.6;
 Thu, 08 Apr 2021 02:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=q/jQsbyeqoEZbP7l3W/OP4ma/fAOmnYAUwW7pk/Sxx0=;
 b=mysHfnMfKiiZoqC+XwRsVqLSgbeumgeT2a3kE0S7s9oasyfxYmRlQAmLQULUli7vX4
 sXi0Pw6vjDklCAwpomwfVo0nTAumTYPo+yzaaFmKOdBFIh9YLizLE67bLhh4BmTGpSpx
 ScJ0lIJWG2VMuhzetorCHGzUIJsWSlzoYqioXpBBNCQnBkGa4OZxybHw0dYfVuMqBA5u
 G7ckWGKYWXccVLBnxwvbP7tdljvN9YvN66AhU8WVSiVPmmHa6Yx0zY3TCUPPMVznbZ4j
 YUayK2+nej8IdnORJ9eylXo+YMLOEAb9efy6M2tTEf2/xeGj6OUSeQaNOVk6FagCWD8n
 O7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=q/jQsbyeqoEZbP7l3W/OP4ma/fAOmnYAUwW7pk/Sxx0=;
 b=WZtUbFegSMrST2Ru7wwfv+/9pqca8BViRV51ZhutG5orVTAOyCoJmT79xOS6+byYQe
 f06+ARM8eBUZylCjf9wQFL80/go3vAfLfq51sGCYS+GLwLz/TitQ8Wr15xxl3T3s/hJD
 GWLRB+ibg90gPOuyt0e0Pk7G5wRe4aMTL48ShTbG/1W0TK7gSECuxqPT642p7KaysGVT
 +fsmVqokNjI9gkoF7IAvHDaS2o7FN+lejDA4MGxn8rEauR/ZxdTY6uZD8HlCiYKak3bP
 SBJJFG5gT032GBa0/vWhvXEux5c9JVu8wuFJXm0kv3cqDXlImYCft1eXSgWrzI06GyeX
 2K+Q==
X-Gm-Message-State: AOAM531eaxaGC5qUHL4UPdllgVFLh9U2dh8L97jo17pb745/clTPPsLG
 AW3aWHRchf91C9Ssbq8KPFg=
X-Google-Smtp-Source: ABdhPJyR5+eDQWjlFNyNSPhvZ9EmSRs8AxjzxE85E7wOBtwMm4rXgU6rnED5YvPI+nFF0uJ3MeVXEQ==
X-Received: by 2002:a05:6512:2309:: with SMTP id
 o9mr2433049lfu.168.1617873682194; 
 Thu, 08 Apr 2021 02:21:22 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 u12sm2751423lff.126.2021.04.08.02.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 02:21:21 -0700 (PDT)
Date: Thu, 8 Apr 2021 11:21:20 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 21/24] hw/block: m25p80: Add support for mt25qu02g
Message-ID: <20210408092119.GA24687@fralle-msi>
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-22-clg@kaod.org>
 <20210408080001.2r4gxygjsuorvaxs@debian>
 <0d5e9101-7ae9-8892-cc00-d83f958ffca8@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d5e9101-7ae9-8892-cc00-d83f958ffca8@kaod.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, Francisco Iglesias <francisco.iglesias@xilinx.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cedric,

On [2021 Apr 08] Thu 10:40:18, Cédric Le Goater wrote:
> On 4/8/21 10:00 AM, Francisco Iglesias wrote:
> > Hello Cedric!
> > 
> > On Wed, Apr 07, 2021 at 07:16:34PM +0200, Cédric Le Goater wrote:
> >> The Micron mt25qu02g is a 3V 2Gb serial NOR flash memory supporting
> >> dual I/O and quad I/O, 4KB, 32KB, 64KB sector erase. It also supports
> >> 4B opcodes.
> >>
> >> Cc: Alistair Francis <alistair.francis@wdc.com>
> >> Cc: Francisco Iglesias <francisco.iglesias@xilinx.com>
> >> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> >> ---
> >>  hw/block/m25p80.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> >> index 183d3f44c259..2afb939ae28e 100644
> >> --- a/hw/block/m25p80.c
> >> +++ b/hw/block/m25p80.c
> >> @@ -259,6 +259,7 @@ static const FlashPartInfo known_devices[] = {
> >>      { INFO_STACKED("n25q00a",   0x20bb21, 0x1000, 64 << 10, 2048, ER_4K, 4) },
> >>      { INFO_STACKED("mt25ql01g", 0x20ba21, 0x1040, 64 << 10, 2048, ER_4K, 2) },
> >>      { INFO_STACKED("mt25qu01g", 0x20bb21, 0x1040, 64 << 10, 2048, ER_4K, 2) },
> >> +    { INFO_STACKED("mt25qu02g", 0x20ba22, 0x1040, 64 << 10, 4096, ER_4K, 2) },
> > 
> > Is it possible it should be as below instead?
> > 
> > { INFO_STACKED("mt25qu02g", 0x20bb22, 0x1040, 64 << 10, 4096, ER_4K | ER_32K, 2) },
> > 
> > 's/0x20ba22/0x20bb22/' (or 's/mt25qu02g/mt25ql02g/') since 'u' looks to stand
> > for 1.7-2.0 V and 'bb' for 1.8 V (see page 2 and 32 in [1]).
> 
> Here is what I am seeing : 
> 
>  mt25ql02g 0x20ba22 3V
>  mt25qu02g 0x20bb22 1.8V
> 
> Do we agree ? 

Yes :)

Best regards,
Francisco

> 
> > s/ER_4K/ER_4K | ER_32K/ since ERASE_32K is supported (see page 36). 
> 
> yes. I should have added that ! 
>  
> > If you find above changes ok and go with them please add:
> > 
> > Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> 
> Sure,
> 
> Thanks,
> 
> C.
> 
> 
> > Best regards,
> > Francisco Iglesias
> > 
> > [1] Micron Serial NOR Flash Memory 1.8V, Multiple I/O, 64KB Sector Erase MT25QU02GCBB
> >     https://4donline.ihs.com/images/VipMasterIC/IC/MICT/MICT-S-A0008500026/MICT-S-A0008511423-1.pdf?hkey=52A5661711E402568146F3353EA87419
> > 
> >>  
> >>      /* Spansion -- single (large) sector size only, at least
> >>       * for the chips listed here (without boot sectors).
> >> -- 
> >> 2.26.3
> >>
> 
> 

