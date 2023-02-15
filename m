Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F773697E02
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 15:09:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSISM-0007Qu-7f; Wed, 15 Feb 2023 09:08:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pSISK-0007Qa-OK
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:08:20 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pSISJ-00019I-5Z
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:08:20 -0500
Received: by mail-pj1-x1035.google.com with SMTP id bg2so8967591pjb.4
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 06:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uxWV3VwCM6YMLpTbdsEoc0XSuDWmcRMPT8GxlUKRo7o=;
 b=aV0o53KupfLYKYv3Gk1nagDJdDa0lLQp/Ktir5n3SnoEDQeOtD64k8mWindsdGlN6O
 oQDsgXv+0Vsf47vgYYy8LwZJw03BRWubs9D2piKe0WCQxguARYTMyVzEIsK0dDmNE/Ls
 1q2WncWwPrMVfCrL+eevTa11t0zOnzhtAcyExsuwahR6SjyCXzyH8KlUs3G2Po+tQoTL
 K8BnTZmu34/5H2DOElpHKOJbeUpbzqkLJ4Yb8yiGWNfhkcL4Cj/vI6oal8VWr6EAbvXK
 Uff9HhC4596D/R8ywfOoK5QlC6q3nlFCJM31ThwBvEsyYSILktUWfRWGBwFy1rsbXx6d
 3Ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uxWV3VwCM6YMLpTbdsEoc0XSuDWmcRMPT8GxlUKRo7o=;
 b=fHsRb7gfPLqIVVniJhFo74OSV/unE0ajXplVSJzKocNYyazshaU/2MiBf0Fp7EGBx+
 7JzuU3Xm4XY551ucBQHrzM77SWx+GkBptlBBroIsEWGwTvLRDul8Usq0bvkHUKIbnM0O
 ClPs1PuP/KFSUe3VljIZslOHws5fvxSXUGMbnsQgscfE+O3MIVDf7+TTVu6s8SFgBZnA
 LW6i6p504YykTAwdcihra7htx1k/rYFMi7E+fuyXFJGE6LphhWdK4GwZUPnXvygsfL9G
 CP0VnWdR3dl+atNEygWzCNGrIQ5MHTLfpaPoVkrfA48Z1WeJCLLm+7oigd3fMYhO8B5Q
 gLaA==
X-Gm-Message-State: AO0yUKVUAmQRIOlK7GBdn6xF5XdnnKtBRhC6PanSWMpufAvGbGcMbgS/
 MHUvMyG131F8CxOgc48AlyokFw==
X-Google-Smtp-Source: AK7set/xNnzb8c1Ll2PhCCH79IwH9CINRBpAosFxzbrHDJq48b86kbns22vXIWywAN2D7rVkqTMi5g==
X-Received: by 2002:a17:90b:1bcc:b0:233:be7b:e71c with SMTP id
 oa12-20020a17090b1bcc00b00233be7be71cmr3091545pjb.5.1676470097961; 
 Wed, 15 Feb 2023 06:08:17 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 e17-20020a17090ab39100b00233e8a83853sm1501870pjr.34.2023.02.15.06.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 06:08:17 -0800 (PST)
Date: Wed, 15 Feb 2023 19:38:10 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH V2 04/10] hw/riscv/virt: virt-acpi-build.c: Add basic
 ACPI tables
Message-ID: <Y+znStpBMx35sSop@sunil-laptop>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
 <20230213144038.2547584-5-sunilvl@ventanamicro.com>
 <9e7edd02-aa8e-c146-d67c-aa255a8aa6e5@ventanamicro.com>
 <Y+sDYFI+ku5/S1+J@sunil-laptop>
 <b5c4fb24-7bd2-a853-4116-58af222bbcad@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5c4fb24-7bd2-a853-4116-58af222bbcad@ventanamicro.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1035.google.com
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

On Tue, Feb 14, 2023 at 05:44:44AM -0300, Daniel Henrique Barboza wrote:
> 
> 
> On 2/14/23 00:43, Sunil V L wrote:
> > On Mon, Feb 13, 2023 at 03:48:04PM -0300, Daniel Henrique Barboza wrote:
> 
> Nah. Doing that now will make this series rely on acks for every other ACPI arch to
> push the RISC-V side.
> 
> Let's make this happen as is now to get ACPI in RISC-V working. We can think about
> reducing overall ACPI duplication later. IMO it's enough for now to, mention in this
> commit msg, which bits of the arm64 virt-acpi-build.c you changed for this RISC-V
> version.
> 

Okay. Thanks!. Will update the commit message and send the V3 soon.

Thanks
Sunil

