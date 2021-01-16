Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C0A2F8CDE
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 11:44:52 +0100 (CET)
Received: from localhost ([::1]:38118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0j4d-00045F-6m
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 05:44:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l0j3E-0003An-Vi
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 05:43:24 -0500
Received: from mail-ed1-f42.google.com ([209.85.208.42]:45133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l0j3D-0001Ef-7x
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 05:43:24 -0500
Received: by mail-ed1-f42.google.com with SMTP id r5so12289019eda.12
 for <qemu-devel@nongnu.org>; Sat, 16 Jan 2021 02:43:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=go700THSazPFAs5GX7Q+Sbiw89ZD2qW0Q8XNDEMIur0=;
 b=uC7Fu/fA3DJUmppJHUXo8fezH/te+gx3qTT3hyJFdqgN+cjQB8UMJrLqQy8DXJqSFH
 dgcaHYZKkyTIpdd3NlRW36bMBraTyBh+1PSDEbNaxlYA9pxi+6ELYDBCAJL6orBXFOSe
 fcIqL4siWzS5DW1Isz9RDZ40D8mRNsXeTwOU7NQqsaduYeZTV11dQ0Y7Y2FirmT6jVnl
 hya0eSkv+POybvDQBwoVRN6qMx2/XZXtcfVqIT6mREi3Z0Cf74RH6XHpNhd0MqbQru32
 R1FIOlJ3t5W9acMK/kpUFqI55viAlcwHBmYrvrCdXkMgxIasxGDX7+tuR72FqKialFu7
 wB8w==
X-Gm-Message-State: AOAM531jyR/jphFhcPo9ZMpZyCwsvKv6Oq8Y0dhjFroRJBhEH3mBuzo9
 Bw3l6sqt+2VxZ7tZhVa7r4I=
X-Google-Smtp-Source: ABdhPJxw6DxlzIAYvQ8IsPaFSHiktBQ7PDY2P4db8Zlu72bxleidl8IceWCCLB/Jpv9jheYmBPEoFQ==
X-Received: by 2002:a50:998f:: with SMTP id m15mr13018569edb.342.1610793801827; 
 Sat, 16 Jan 2021 02:43:21 -0800 (PST)
Received: from localhost (pd9e83641.dip0.t-ipconnect.de. [217.232.54.65])
 by smtp.gmail.com with ESMTPSA id r7sm6978802edh.86.2021.01.16.02.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jan 2021 02:43:21 -0800 (PST)
Date: Sat, 16 Jan 2021 11:43:19 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 09/11] hw/m68k/next-cube: Remove unused fields from
 NeXTState
Message-ID: <20210116114319.7e4ddfe1@tuxfamily.org>
In-Reply-To: <20210115201206.17347-10-peter.maydell@linaro.org>
References: <20210115201206.17347-1-peter.maydell@linaro.org>
 <20210115201206.17347-10-peter.maydell@linaro.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.208.42; envelope-from=th.huth@gmail.com;
 helo=mail-ed1-f42.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bryce Lanham <blanham@gmail.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am Fri, 15 Jan 2021 20:12:04 +0000
schrieb Peter Maydell <peter.maydell@linaro.org>:

> The fields scsi_irq, scsi_dma, scsi_reset and fd_irq in
> NeXTState are all unused, except in commented out
> "this should do something like this" code. Remove the
> unused fields. As and when the functionality that might
> use them is added, we can put in the correct kind of
> wiring (which might or might not need to be a qemu_irq,
> but which in any case will need to be in the NeXTPC
> device, not in NeXTState).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/m68k/next-cube.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
> index 3c83b874c56..dd0a2a5aea0 100644
> --- a/hw/m68k/next-cube.c
> +++ b/hw/m68k/next-cube.c
> @@ -74,10 +74,6 @@ struct NeXTState {
>      MachineState parent;
>  
>      next_dma dma[10];
> -    qemu_irq *scsi_irq;
> -    qemu_irq scsi_dma;
> -    qemu_irq scsi_reset;
> -    qemu_irq *fd_irq;
>  };
>  
>  #define TYPE_NEXT_PC "next-pc"

Yeah, I've never managed to get the SCSI controller running. Old patch
is available here:

 https://gitlab.com/huth/qemu/-/commit/14e9ff46f8261203a15f13d8c8bfb7faf6471d44

But yes, we can add the variables back in case somebody gets this
working again, so:

Reviewed-by: Thomas Huth <huth@tuxfamily.org>


