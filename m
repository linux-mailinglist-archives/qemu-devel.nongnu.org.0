Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD50568DFBB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 19:17:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPSVH-00069G-Lr; Tue, 07 Feb 2023 13:15:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pPSVD-00068X-V0
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:15:36 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pPSVC-0003Pj-8x
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:15:35 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 rm7-20020a17090b3ec700b0022c05558d22so15869817pjb.5
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 10:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bTFMhpW/ICrjAdAfa2iboE6OQItLKAmRMMZON/DuZ2Q=;
 b=KXbHWWRJtQl2RrKQ/ZMieGZvOzMd8cAdbF6HbOVByeC4vkDYhElxwH8VT4V2rYifAO
 tE6CjS16HeXuF6hhdrKBbEqiWSFbfPDdJU7RjGBkT4RvKMD0o4yf2ReSl6XXyv6thnMg
 4Cmy1pmpRdyLZULU7hWY+LXMKShc1NF5B2/1JmUd1RWBISm53bqilYdmZlMSWl+3fSc3
 t2jgDV3PbBaTDxlbIiAHu6HnGyZ5uPnzZgUSYIcPK9dC1rAL8h40ur398QJzSMi4RV98
 Mi7FoVAZu+c8lRIkEno80qArTCsmMFay7JtPQCsYPMDSmgjf8WXMJLrOqXWt0uy0afgA
 zVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bTFMhpW/ICrjAdAfa2iboE6OQItLKAmRMMZON/DuZ2Q=;
 b=AAEG2YJzeEkyGX3RfJOMszaSgFbNe/8DF9HWG8t8GyOSYg/AvIbjNUl7+cIWRKWCEg
 1+ghe5qb0I8Nmo584Rj9TfTWDx8yz3zNnW46NNDOXbyff5rZ/pe4Ol5X7cVioeuNAL9G
 zeg3lf0i44Wwa9U2u3mQqltxtJn5SDwcfevxWXiQg848NjFZar+XmSNkjxoWfoYlfBVM
 tPFpM9Tzp/foM9iuShxNW0ZUfaF2kaII5rINepEji51fJQFD6dDeYKAVg24aWSAMOvDf
 N+CIrovzKrrZQ53JvQ/TZNxlEbCHAQSo/7yGX9/YY+3knUr0To+pDlCTeoJp1dVCO3lk
 8Ihw==
X-Gm-Message-State: AO0yUKVNpNQN1q47/9D+L/bYyum1KEFc7YnzV5HMOICaFbWr0m7Tsh7y
 LnByQ9ESGnRYyJl2l2YSAW11pg==
X-Google-Smtp-Source: AK7set/pw2H0H0kiiD3xZEVWlXliRXPXbSo7rDsaXx3+wXIiKvjgqN5+U7f7GCu3E0O6eyTDduG0yQ==
X-Received: by 2002:a05:6a21:2c91:b0:bf:ae32:5ed0 with SMTP id
 ua17-20020a056a212c9100b000bfae325ed0mr3180906pzb.13.1675793731993; 
 Tue, 07 Feb 2023 10:15:31 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 e11-20020aa78c4b000000b00581dd94be3asm9551306pfd.61.2023.02.07.10.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 10:15:31 -0800 (PST)
Date: Tue, 7 Feb 2023 23:45:25 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 04/10] hw/riscv/virt: virt-acpi-build.c: Add basic ACPI
 tables
Message-ID: <Y+KVPaVQPcoItBbV@sunil-laptop>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-5-sunilvl@ventanamicro.com>
 <CAEUhbmXhXw7juMQTW7-XxSLwhcJrOiZ=4fiwFFAyoXj+sL0jUQ@mail.gmail.com>
 <Y+D/frPU/TE1aj7y@sunil-laptop>
 <CAEUhbmU2cofq767-9Lfs2CF+DzpZ6FCHz1ox1TC1siPs5uUdWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUhbmU2cofq767-9Lfs2CF+DzpZ6FCHz1ox1TC1siPs5uUdWQ@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1032.google.com
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

On Wed, Feb 08, 2023 at 12:10:55AM +0800, Bin Meng wrote:
> On Mon, Feb 6, 2023 at 9:24 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
> >
> > On Mon, Feb 06, 2023 at 06:17:50PM +0800, Bin Meng wrote:
> > > On Thu, Feb 2, 2023 at 12:54 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
> > > >
> > > > Add few basic ACPI tables and DSDT with few devices in a
> > > > new file virt-acpi-build.c.
> > > >
> > > > These are mostly leveraged from arm64.
> > >
> > > There are lots of same ACPI codes existing in x86/arm/riscv. I believe
> > > some refactoring work is needed before ACPI support fully lands on
> > > RISC-V.
> > > For example, we can extract the common part among x86/arm/riscv into a
> > > separate file, like hw/acpi/acpi-build.c?
> > >
> >
> > While it appears like there is same code in multiple places, those
> > functions take architecture specific MachineState parameter. Some tables
> > like MADT though with same name, will have different contents for
> > different architectures.
> >
> > Only one function which Daniel also pointed is the wrapper
> > acpi_align_size() which can be made common. I am not
> > sure whether it is worth of refactoring.
> >
> 
> It's more than that. For example,
> 
> With acpi_dsdt_add_cpus(), the only meaningful parameter is the number
> of cpus, so there is no need to pass the architecture specific
> MachineState as the parameter.
> 
I would not make this function common. The reason is, an architecture may
choose to attach different ACPI objects under the CPU node.

> Likewise, acpi_dsdt_add_fw_cfg() can be made generic as well.
> 
The issue is, these things are not exactly common across all architectures.
x86 has bit different data in these objects. While today it appears they
are same for riscv and arm, in future things may change for an architecture.
It doesn't look like it is a standard practice to build files under
hw/acpi for specific architectures. Hence, IMO, it is better to keep these
things in architecture specific folders to allow them to do differently in
future.

But I look forward for the feedback from other architecture maintainers on
this topic. My experience in qemu is very limited. So, I need help from
experts.

Thanks!
Sunil

