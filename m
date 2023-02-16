Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4B9699B44
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:28:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSi1x-0002fo-UP; Thu, 16 Feb 2023 12:26:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pSi1v-0002eE-Dg
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:26:47 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pSi1t-0004gB-Me
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:26:47 -0500
Received: by mail-pj1-x102d.google.com with SMTP id bx22so2559681pjb.3
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7qphZtO2dn1oVNFvUiCTp/wDCQcDSyw6ghvrNKd9FEc=;
 b=PtOlh0RYjMMbNNa9WqdLwpNtmtbMRsz9U7xMPy2s5sD5fTovXnAkbeWdzbHO1Yl9tG
 r90lmv+pY+6oSmR3VWeZQx37xnpSXD5dv2/TigjJl6nzTNn2uO7uCjeOxY3fLVY3eoU4
 HTaqyrwAAVnY6d4gnz8yxmYY3Ropodjy4aaB7TUGMroc3OrHR8xB7SWWrjVlakye1jqA
 sNYaWbnogn+GDWlB7uXk3+TI3vAs1KKF44StCkA6EUl78S/gHQyhTw4Iq4pTeZ1+JLPq
 EOKzbo+cJ8YMq5E3PVsWkEbfoNUOxzC7RNyfREj5yW8G0szJL3jEX8sMtDV6TJYtzslW
 9VBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7qphZtO2dn1oVNFvUiCTp/wDCQcDSyw6ghvrNKd9FEc=;
 b=Y4UPNsUORTxg+uUzivwuR/mkUEi43jJb/soS0MEsHTGc8jxFgYu9L2KR1Z9wJCvlwh
 6JulhKq/8LSn5Q+fA8BenNLgW4+IT5BRJ5zPrHrcpONuilScESETUpRu1PE95obb7kNm
 AeGy98AeizNmk9swt6NcG7Ak5uUDNi+MelrcHMoqWaz4KGoWiZfE1PR9ziNnFMHNe2wr
 QX+z2jVQQcNeeyyhkHzlBX+w7M2bnizVlhmDEzsagbSnTZvEQVFXDyWPPxkFePpYG4Wo
 SsRfJgvkmghx809tZS+Gtpjm+sVMnpSzwuaY1iltbuZcPMvBVJzG8052tAgKfrjidqnb
 VR0g==
X-Gm-Message-State: AO0yUKWFnIXysDtj8VOqxJRB5zsCfgySo1xZSo4jQCL2k6b5MPFFLzxz
 TiSyp/ZQSAOxPCvnnHmQYF739g==
X-Google-Smtp-Source: AK7set+4KwDuQ6otkfJiTqaE+xVET6FZvYKn7mfk3BII8vFrqez/tqdAVBoB73U2azGcOMg2fDVmfQ==
X-Received: by 2002:a17:90a:6485:b0:234:8c58:c325 with SMTP id
 h5-20020a17090a648500b002348c58c325mr3430474pjj.31.1676568404126; 
 Thu, 16 Feb 2023 09:26:44 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 bg3-20020a17090b0d8300b0023417fec520sm3476475pjb.44.2023.02.16.09.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:26:43 -0800 (PST)
Date: Thu, 16 Feb 2023 22:56:38 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: dbarboza@ventanamicro.com, Alistair Francis <Alistair.Francis@wdc.com>,
 bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, ajones@ventanamicro.com,
 apatel@ventanamicro.com, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH V2 04/10] hw/riscv/virt: virt-acpi-build.c: Add basic
 ACPI tables
Message-ID: <Y+5nTk5uRX3ZIpPW@sunil-laptop>
References: <Y+znStpBMx35sSop@sunil-laptop>
 <mhng-53c89287-c232-4852-94bc-b060a336c60f@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-53c89287-c232-4852-94bc-b060a336c60f@palmer-ri-x1c9a>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102d.google.com
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

On Thu, Feb 16, 2023 at 08:26:21AM -0800, Palmer Dabbelt wrote:
> On Wed, 15 Feb 2023 06:08:10 PST (-0800), sunilvl@ventanamicro.com wrote:
> > On Tue, Feb 14, 2023 at 05:44:44AM -0300, Daniel Henrique Barboza wrote:
> > > 
> > > 
> > > On 2/14/23 00:43, Sunil V L wrote:
> > > > On Mon, Feb 13, 2023 at 03:48:04PM -0300, Daniel Henrique Barboza wrote:
> > > 
> > > Nah. Doing that now will make this series rely on acks for every other ACPI arch to
> > > push the RISC-V side.
> > > 
> > > Let's make this happen as is now to get ACPI in RISC-V working. We can think about
> > > reducing overall ACPI duplication later. IMO it's enough for now to, mention in this
> > > commit msg, which bits of the arm64 virt-acpi-build.c you changed for this RISC-V
> > > version.
> > > 
> > 
> > Okay. Thanks!. Will update the commit message and send the V3 soon.
> 
> I'm checking up on this one as I don't see a v3 on the lists.  No rush on my
> end, I'm just trying to make sure I don't drop the ball on anything from the
> backlog as I'm catching up.
> 
Thanks!, Plamer. I have sent V3 which is based on Alistair's
riscv-to-apply.next branch.

Thanks,
Sunil

