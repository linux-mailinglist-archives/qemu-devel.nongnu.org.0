Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4053923C0
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 02:24:56 +0200 (CEST)
Received: from localhost ([::1]:39448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3pX-0002zH-8m
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 20:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lm3ms-0001MU-UZ
 for qemu-devel@nongnu.org; Wed, 26 May 2021 20:22:11 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:40721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lm3mp-0007bt-HE
 for qemu-devel@nongnu.org; Wed, 26 May 2021 20:22:10 -0400
Received: by mail-qk1-x734.google.com with SMTP id o3so2266802qke.7
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 17:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uzZtHedp+cQlPLEdc8eg88u7IPR+/vapgBQQs+sWLuQ=;
 b=Os5C+3fTEN+0zGFHoPFbIeWRYnOuylPlai1+beDbXKfMRPjs4R8E5mocf4Sk1unFJM
 K5sWhnb/XaWQgx7PvhXLJIUPr+bQ/B5Mt8T+N88eGRBCv8OL11H4ZAw0mdSJ3wcNxqqN
 U41YrVuBZ3T1Z2hPpZ+m5Ajsd/Im4hWDNVagdi7Bc2RoHWf/A/qEMj+5OY3A9iRgjcm3
 xHA82/5kTN34QV3qH00TvSSClfGMKCmZPUVRcR/ECRCH/b1nYEV/VMK+mgMSBS5Yxv2h
 ChndRZJJtyu9roqsLi66Y76c++3v/DY4DpaCZisVa0y6LhIY3eYlBsgnbSHkeTud5HHZ
 f1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uzZtHedp+cQlPLEdc8eg88u7IPR+/vapgBQQs+sWLuQ=;
 b=cuswdOuYZUDs7dvXbp/mIPej/43T9MT59NQEYrd2TxYxG09XWImjuZeS/gb6P5FFOc
 8GQXNdD7XwMEZEiuZkRG/oQ7Qnl2cZc9yaZHYeNcMfGn57L9om1tWsftGaLCCadwd4fj
 l/sIZ3OpU0y1pBn8uhYD21HCw4yOtjevg6JtH6BPCfWtfbEj2iOVbxCXcxf5DQ2BLVuU
 KJh1Roa+Sh6viE4ptpBReXW1Ag59ciPNPRx0D0VdIwsv7atEA3hhTITBmAeKfBYs1AH1
 WG35D4rLJla/ISRgk0T2Kb+36VCUIFSmT0PJwEE8iugVcowLO9i6arqvVta4OfafKva1
 psUQ==
X-Gm-Message-State: AOAM530bR4oNc/XdoG9JyYmHCf7EN4dKoC8Ks6ApU40K7u4sHHZ5nICT
 xqn7FTbgseyV/Dln/l6CPML87w==
X-Google-Smtp-Source: ABdhPJw7oEKyIALBBjj/hLgZm6uNGFts1WX4dwTSr8XkUvpF8ZBIP8zsO/WuPHJQKE6avIkZBc1OCA==
X-Received: by 2002:a37:f502:: with SMTP id l2mr771618qkk.195.1622074924039;
 Wed, 26 May 2021 17:22:04 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-21-142-114-142-78.dsl.bell.ca. [142.114.142.78])
 by smtp.gmail.com with ESMTPSA id 90sm410371qtg.9.2021.05.26.17.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 17:22:03 -0700 (PDT)
Message-ID: <add9e05d69d51cc89950bc4dfddc955957a6c31f.camel@linaro.org>
Subject: Re: [PATCH v3 0/8] GICv3 LPI and ITS feature implementation
From: shashi.mallela@linaro.org
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Date: Wed, 26 May 2021 20:22:02 -0400
In-Reply-To: <87czte38p5.fsf@linaro.org>
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
 <87fsya3a7b.fsf@linaro.org> <87czte38p5.fsf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x734.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, leif@nuviainc.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, rad@semihalf.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Have identified the cause of slow down and redesigned the code to scan
LPI pending table and config table right after lpi pending state
changes(SET/RESET) through gicv3_redist_update_lpi() call to determine
the highest priority lpi among the active lpis and save the details.The
high priority interrupt determination logic in redistributor now uses
the saved high priority lpi details (alongside other interrupt types) 
instead of calling gicv3_redist_update_lpi() everytime(as in current
design).This significantly reduces the call overhead associated with
address_space_read of lpi config and pending tables.Testing with this
new design showed no boot delays.
Will share changes in next patch version v4.

Thanks
Shashi


On Tue, 2021-05-25 at 20:30 +0100, Alex Bennée wrote:
> Alex Bennée <alex.bennee@linaro.org> writes:
> 
> > Shashi Mallela <shashi.mallela@linaro.org> writes:
> > 
> > > This patchset implements qemu device model for enabling physical
> > > LPI support and ITS functionality in GIC as per GICv3
> > > specification.
> > > Both flat table and 2 level tables are implemented.The ITS
> > > commands
> > > for adding/deleting ITS table entries,trigerring LPI interrupts
> > > are
> > > implemented.Translated LPI interrupt ids are processed by
> > > redistributor
> > > to determine priority and set pending state appropriately before
> > > forwarding the same to cpu interface.
> > > The ITS feature support has been added to sbsa-ref platform as
> > > well as
> > > virt platform,wherein the emulated functionality co-exists with
> > > kvm
> > > kernel functionality.
> > 
> > So I'm definitely seeing a slow down in one of my testcases but it
> > doesn't seem to be HW access related. Via:
> > 
> <snip>
> > So I ran with the hotblocks plugin:
> > 
> >   ./qemu-system-aarch64 -cpu max,pauth-impdef=on -machine
> > type=virt,virtualization=on,gic-version=3 -display none -serial
> > mon:stdio -kernel
> > ~/lsrc/linux.git/builds/arm64.initramfs/arch/arm64/boot/Image
> > -append "console=ttyAMA0" -m 4096 -smp 1 -plugin
> > contrib/plugins/libhotblocks.so -d plugin -D hotblocks.log
> > 
> >   collected 130606 entries in the hash table
> >   pc, tcount, icount, ecount
> >   0xffffffc010627fd0, 4, 10, 3998721 - memcpy
> >   0xffffffc010628288, 2, 6, 3984790 - memset
> >   0xffffffc01062832c, 3, 4, 1812870 - memset
> >   0xffffffc0100a8df8, 4, 4, 1743432 - __my_cpu_offset
> >   0xffffffc01015c394, 2, 4, 1304617 - __my_cpu_offset
> >   0xffffffc010093348, 3, 3, 1228845 - decay_load
> >   0xffffffc010093354, 3, 3, 1228447 - decay_load
> >   0xffffffc01009338c, 3, 2, 1228447 - decay_load
> >   0xffffffc01009336c, 3, 7, 1180051 - decay_load
> >   0xffffffc010631300, 3, 4, 1114347 - __radix_tree_lookup
> >   0xffffffc0106312c8, 3, 12, 1114337 - __radix_tree_lookup
> >   0xffffffc0106312f8, 3, 2, 1114337 - 
> >   0xffffffc010132aec, 3, 4, 1080983
> >   0xffffffc010132afc, 3, 12, 1080983
> >   0xffffffc010132b30, 3, 2, 1080983
> >   0x000000004084b58c, 1, 1, 1052116
> >   0x000000004084b590, 1, 7, 1052116
> >   0x000000004084b57c, 1, 4, 1051127
> >   0xffffffc01001a118, 2, 6, 1049119
> >   0xffffffc01001a944, 2, 2, 1048689
> > 
> > So whatever is holding it up is because it's heavily spamming core
> > functions.
> 
> Well given I've seen it hit gic_handle_irq > 1000 times already while
> in
> the "PCI: CLS 0 bytes, default 64" phase of the kernel boot makes me
> think the IRQs are just re-asserting themselves and firing
> continuously.
> 
> Indeed -d trace:gicv3_redist_set_irq shows a lot of:
> 
>   gicv3_redist_set_irq GICv3 redistributor 0x0 interrupt 26 level
> changed to 0
>   gicv3_redist_set_irq GICv3 redistributor 0x0 interrupt 26 level
> changed to 1
>   gicv3_redist_set_irq GICv3 redistributor 0x0 interrupt 26 level
> changed to 0
>   gicv3_redist_set_irq GICv3 redistributor 0x0 interrupt 26 level
> changed to 1
>   gicv3_redist_set_irq GICv3 redistributor 0x0 interrupt 26 level
> changed to 0
>   gicv3_redist_set_irq GICv3 redistributor 0x0 interrupt 26 level
> changed to 1
> 


