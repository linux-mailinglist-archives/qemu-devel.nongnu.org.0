Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDF94B0D91
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 13:28:39 +0100 (CET)
Received: from localhost ([::1]:41696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI8Yw-000373-KV
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 07:28:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nI8My-0005dr-Ch
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 07:16:18 -0500
Received: from [2607:f8b0:4864:20::42d] (port=45723
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nI8Mv-0001lG-HG
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 07:16:16 -0500
Received: by mail-pf1-x42d.google.com with SMTP id 9so6988593pfx.12
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 04:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=s0DO2y4KJDM7msw2JFOZCIsqOP4uR34mXgzkBoALsGQ=;
 b=cj5tC/zFbB3AM7/zbt3t/xypUPfkwQcX9D2JpMgb9DQm6FK/nQzu4xMAU6It562iAR
 pwboTCHkctxzNfiaYp2cf/qr5yrO1Jqkgjw28byWp8cxgeqL04CpkzW7eIjD/2wygSgq
 bvwBAaUCw0G7nElnuh8k4cUKRPbGEr6uUbqdmocCaxU06pZ4tekSTPAqT2L2oefISBsM
 rI8NPI0v/fWN3CSdc+YtCMFvqaF+788NFBUTDXAE1OX1PmsdOYKPR7W4MGY8CCz2ASdQ
 iEWrz3I5IrPzMRdqrrD5Xt0ImPB79LGg4+neq11im/ktBJooXIa2x4vAWOE9rWAWjKk7
 sMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=s0DO2y4KJDM7msw2JFOZCIsqOP4uR34mXgzkBoALsGQ=;
 b=K9FqT8jAi0o2LXyyLDClTMI8sTckwfuHSl201KAF3+zE6ur55Y77BvFWlPN9rwKNuZ
 Ui0L2o40l7S8JH8Lv5nQPNPq5v278FTlykHcdY7689MdKB/gGV5/b4Ktw1GhYgtl2R4W
 nG9xUSQr4RAxgfm6jcLPQ0av+r4krmRdNa9kuk0V2jkhqGxNCG9Vsy/h9F3EofwjsoQ1
 svXaIuZBAYa/STqCNmvkVpV/D7Oy7e21lEtGfWOYg9oiVWbPGJgU8a2Q/GKyVY1dNQ5A
 QsJcYuyWWFXDD0oxvSopsVMF+0mRzEobm8geY/oyO+grlGw6gldTuxVn7xXRoX5l0fsa
 LZEA==
X-Gm-Message-State: AOAM533Px1a7smZ7+TxvaISmsi8FMbMKB0m0X87wJC90Y08pR9jcBs05
 Z15tqcp4VBWPBFuMUAGCgq8=
X-Google-Smtp-Source: ABdhPJy3fwuAqpOnHumyf5ejCjDQRILIPlXGAWWKb/bfdNUOd0vN15ILdPrR8J8mnvDVBYJc6BSMQA==
X-Received: by 2002:a05:6a00:1914:: with SMTP id
 y20mr7242897pfi.39.1644495371247; 
 Thu, 10 Feb 2022 04:16:11 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id 13sm22868117pfm.161.2022.02.10.04.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 04:16:10 -0800 (PST)
Date: Thu, 10 Feb 2022 21:16:08 +0900
From: Stafford Horne <shorne@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/4] hw/openrisc/openrisc_sim: Create machine state for
 or1ksim
Message-ID: <YgUCCOmt2J83ii/p@antec>
References: <20220210063009.1048751-1-shorne@gmail.com>
 <20220210063009.1048751-2-shorne@gmail.com>
 <e0ea2b85-1ba3-c9d2-3afb-a3eb3ed4aea3@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0ea2b85-1ba3-c9d2-3afb-a3eb3ed4aea3@amsat.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=shorne@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: QEMU Development <qemu-devel@nongnu.org>, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 10, 2022 at 12:05:22PM +0100, Philippe Mathieu-Daudé wrote:
> On 10/2/22 07:30, Stafford Horne wrote:
> > This will allow us to attach machine state attributes like
> > the device tree fdt.
> > 
> > Signed-off-by: Stafford Horne <shorne@gmail.com>
> > ---
> >   hw/openrisc/openrisc_sim.c | 31 +++++++++++++++++++++++++++++--
> >   1 file changed, 29 insertions(+), 2 deletions(-)
> 
> > @@ -141,6 +153,7 @@ static void openrisc_sim_init(MachineState *machine)
> >       ram_addr_t ram_size = machine->ram_size;
> >       const char *kernel_filename = machine->kernel_filename;
> >       OpenRISCCPU *cpus[2] = {};
> > +    Or1ksimState *s = OR1KSIM_MACHINE(machine);
> 
> This change belong to patch #3.

Yes, when I was splitting this patch out I left it here because I was
"preparing".  But it is not being used, so fair enough.

> Otherwise:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks

> >       MemoryRegion *ram;
> >       qemu_irq serial_irq;
> >       int n;
> > @@ -183,8 +196,10 @@ static void openrisc_sim_init(MachineState *machine)
> >       openrisc_load_kernel(ram_size, kernel_filename);
> >   }

