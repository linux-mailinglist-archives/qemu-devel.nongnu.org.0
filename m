Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F533227B8
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 10:25:44 +0100 (CET)
Received: from localhost ([::1]:53688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lETwt-0002tV-Qf
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 04:25:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lETsu-0007cT-6z; Tue, 23 Feb 2021 04:21:38 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:34273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lETso-00077l-RZ; Tue, 23 Feb 2021 04:21:35 -0500
Received: by mail-lf1-x135.google.com with SMTP id h26so10199621lfm.1;
 Tue, 23 Feb 2021 01:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=F9LntpN1FWIwRqg17Dh9EBAlrmROQwLs9HKGXdGU3sg=;
 b=WxWImGwHzfz2DRTUV04m/mXKzP/LG68n7dDP0rd+/UX+59MF8Pavev2hqJ9dxbXuWg
 vpN188M6Ez6N2BVm2jT6ii59d2C1W676323csp48x7Jns9W+2WyAMA3QQjx0onYqjYJB
 O2xXlzjr07YRGd1kNYDL5MTWRKdi9F31S0MZPDRq7nsWdNnkfRpIrh+ACJ3O7In3VHB4
 ixjAIRS83s5RNk/Kc4iw/ufh11+n75kZCsWQYBx+wHZx9CuXnXiGGtVYohAQ1CEEYbwU
 isKOgYnQNI+wZ6uSmuG1Btwqn+s3sY2X1S762SlDnwCiM8OlwRWpPmYRRLzTcaUKeMa8
 f2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F9LntpN1FWIwRqg17Dh9EBAlrmROQwLs9HKGXdGU3sg=;
 b=H2fCofYUhntlY6pq0/JqllYgzXpRekcrG9FMB+PvHsi6//AEYAJDoSakqxMg2K7Dyi
 79CsE1k/LKV0ff5WDI2oE95l1j7Ah/oi7GAG5sSdmPcpvrTzwMHiOnMq25VOCTiUThAr
 WTRuP1rfXmsLxLMI0oTui6JVnr6cfTmlKFTSmcw3BrY0mA1v+qbWu3DH9N2MUAQnn27j
 OfD5u8JVokc7druHgI186HdCO7TRHVssK08xFBePVvdteBVMw8N5eBuOaQoBr49I5vql
 qjq1annv7dV1Kfw3OX99QaGOu1dMTLXkpZrE4bxcNTiO2v6BNE0DvsQCdPiZKDKwoMsQ
 xasQ==
X-Gm-Message-State: AOAM53048Yz79FxIXjaBxlj4cpgFpFfAdevCItvbvqT7tS42MC2WqzHE
 PYqnSAgmVxASSmdLf56vSEE=
X-Google-Smtp-Source: ABdhPJwP0TkaabUOSWJUSR+6ekI2CEra8ISOkkrjItIR8zlmevhTuru3Il6pNF2IVjOJ881GiNtGNQ==
X-Received: by 2002:a05:6512:1051:: with SMTP id
 c17mr16135947lfb.418.1614072088693; 
 Tue, 23 Feb 2021 01:21:28 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id k8sm2504430lfg.41.2021.02.23.01.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 01:21:28 -0800 (PST)
Date: Tue, 23 Feb 2021 10:21:27 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v4 1/5] hw/dma: xlnx_csu_dma: Implement a Xilinx CSU DMA
 model
Message-ID: <20210223092127.GU477672@toto>
References: <20210222130514.2167-1-bmeng.cn@gmail.com>
 <20210222130514.2167-2-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210222130514.2167-2-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x135.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Francisco Iglesias <francisco.iglesias@xilinx.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 22, 2021 at 09:05:10PM +0800, Bin Meng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> ZynqMP QSPI supports SPI transfer using DMA mode, but currently this
> is unimplemented. When QSPI is programmed to use DMA mode, QEMU will
> crash. This is observed when testing VxWorks 7.
> 
> This adds a Xilinx CSU DMA model and the implementation is based on
> https://github.com/Xilinx/qemu/blob/master/hw/dma/csu_stream_dma.c.
> The DST part of the model is verified along with ZynqMP GQSPI model.
> 
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v4:
> - Add complete CSU DMA model based on Edgar's branch
> - Differences with Edgar's branch:
>   1. Match the registers' FIELD to UG1807.
>   2. Remove "byte-align" property. Per UG1807, SIZE and ADDR registers
>      must be word aligned.

The relaxation of alignment is a new feature, not included on the ZynqMP but
it will be included in future versions. Would be nice to keep it but we can
also add it later since it's not really related to QSPI.

>   3. Make the values of int_enable and int_disable mutually exclusive
>      otherwise IRQ cannot be delivered.

This doesn't sound right. The enable and disable regs are stateless.
They both indirectly modify the MASK register.

I.e, setting a bit in the enable register will clear the correspoding bit in the
mask register, atomically, without the need for read-modify-write of MASK.

The disable register does the opposite.

>   4. Clear int_status after int_disable is set.

This doesn't sound right either. Status is a w1c register, i.e bits get set
when the interrupt event happens in the DMA and bits only get cleared when
SW writes a 1 to the STATUS reg to clear bits (write one to clear, w1c).

Other than the interrupt issues, I think this looks good.

Cheers,
Edgar

