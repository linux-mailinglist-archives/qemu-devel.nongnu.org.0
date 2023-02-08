Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B29668E73D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 05:50:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPcOa-0002Wn-Ru; Tue, 07 Feb 2023 23:49:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pPcOX-0002UX-FP
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 23:49:21 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pPcOV-00048w-Op
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 23:49:21 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 bg10-20020a17090b0d8a00b00230c7f312d4so1080868pjb.3
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 20:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/qKMln83+m3EOuan2AfwQRkmnnBaN4eOAIbd9JnOpKM=;
 b=adduCvNbmIcLrfdobmYrxFYdU6gvDdqz+eovas3eFvI8I88wvmlHEwThTpaEb4+Wq3
 YnVRlPoqkN7ZmLnmuuYDdZuV7OlY/5u1fZaLpVU05KM1skwYGBIdl1Rp14r8PK0abXRn
 bnJG9+VUNMsJvtl+M6OxXEsmZnanqjgUMcGQT9EyChWHhPWsPvMDxa6qJZkYUPBG/YSC
 ORjQX9wnZCf4U3e5Mha5WMIIDw36y0/vGmU3ZQimgWtaopoFKZaR4spJmQgl3EtwC6K8
 ADFNt2q33beuMKoer13PrGVkEcmT155FIOgiIRMD1ieZeNEkvOvC57gGHhhokZc++8nN
 F8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/qKMln83+m3EOuan2AfwQRkmnnBaN4eOAIbd9JnOpKM=;
 b=JE/w47+dW8BCCP9fJOWPcFqXmbLuhecfGmdQG6+WxMkPeMOeDnc4cB0eP12DyAbSdo
 t51vCP2bbwE0H4Ze7XRk1IaOf7BW174y1/+3zZe9FEfGzUA5ijk7Eh1bkVCjsWgnkI3A
 Nq0SE2TvxJw0yeqNPGj1p9iGVavYf9m7d1K40AZ1xreZhxK9cuGp/CM/6hxVQCWgoeuO
 HZcDOy+Y+nmSjHCdGOqrlMKqb/gDHAmZsDNVC4CtLoOvv04ld/UDI7j9JwMjU3tE5sgW
 vrCCnHJF7y8SnQBzEb7efnvWNQ97ZwL/N2KfZN9d6Q23oWfl4ijTqoTetY9ctUtHhV3o
 UzDg==
X-Gm-Message-State: AO0yUKVUsZlW9mHw6AgcqxHvl4o+pcVyDyVdIbp7HIwho+qqZR5HelhB
 Mj+31vDCEGvtmWheOgrXt4A7hA==
X-Google-Smtp-Source: AK7set/6+ljbtBrlJRWIWM5mjpWwwPUlv7Fq/D8eQ5/X+UfVZywe1lJyrjZGxjwmJMztPIU5YiIiNQ==
X-Received: by 2002:a17:902:c20d:b0:199:3fcd:1755 with SMTP id
 13-20020a170902c20d00b001993fcd1755mr1566163pll.46.1675831758115; 
 Tue, 07 Feb 2023 20:49:18 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 v23-20020a1709028d9700b0019926c7757asm3206321plo.289.2023.02.07.20.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 20:49:17 -0800 (PST)
Date: Wed, 8 Feb 2023 10:19:10 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 04/10] hw/riscv/virt: virt-acpi-build.c: Add basic ACPI
 tables
Message-ID: <Y+Mpxv0rmHN4pZ9b@sunil-laptop>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-5-sunilvl@ventanamicro.com>
 <CAEUhbmXhXw7juMQTW7-XxSLwhcJrOiZ=4fiwFFAyoXj+sL0jUQ@mail.gmail.com>
 <Y+D/frPU/TE1aj7y@sunil-laptop>
 <CAEUhbmU2cofq767-9Lfs2CF+DzpZ6FCHz1ox1TC1siPs5uUdWQ@mail.gmail.com>
 <Y+KVPaVQPcoItBbV@sunil-laptop>
 <CAEUhbmX6J5ja+_zdRQ8wuqKyU4uquM6ytnJMtqSfN2CSfLv=MA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUhbmX6J5ja+_zdRQ8wuqKyU4uquM6ytnJMtqSfN2CSfLv=MA@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102c.google.com
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

On Wed, Feb 08, 2023 at 09:06:48AM +0800, Bin Meng wrote:
> On Wed, Feb 8, 2023 at 2:15 AM Sunil V L <sunilvl@ventanamicro.com> wrote:
> >
> > On Wed, Feb 08, 2023 at 12:10:55AM +0800, Bin Meng wrote:
> > > On Mon, Feb 6, 2023 at 9:24 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
> > > >
> > > > On Mon, Feb 06, 2023 at 06:17:50PM +0800, Bin Meng wrote:
> > > > > On Thu, Feb 2, 2023 at 12:54 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
> > > > > >
> > > > > > Add few basic ACPI tables and DSDT with few devices in a
> > > > > > new file virt-acpi-build.c.
> > > > > >
> > > > > > These are mostly leveraged from arm64.
> > > > >
> > > > > There are lots of same ACPI codes existing in x86/arm/riscv. I believe
> > > > > some refactoring work is needed before ACPI support fully lands on
> > > > > RISC-V.
> > > > > For example, we can extract the common part among x86/arm/riscv into a
> > > > > separate file, like hw/acpi/acpi-build.c?
> > > > >
> > > >
> > > > While it appears like there is same code in multiple places, those
> > > > functions take architecture specific MachineState parameter. Some tables
> > > > like MADT though with same name, will have different contents for
> > > > different architectures.
> > > >
> > > > Only one function which Daniel also pointed is the wrapper
> > > > acpi_align_size() which can be made common. I am not
> > > > sure whether it is worth of refactoring.
> > > >
> > >
> > > It's more than that. For example,
> > >
> > > With acpi_dsdt_add_cpus(), the only meaningful parameter is the number
> > > of cpus, so there is no need to pass the architecture specific
> > > MachineState as the parameter.
> > >
> > I would not make this function common. The reason is, an architecture may
> > choose to attach different ACPI objects under the CPU node.
> >
> 
> Is it possible to insert architect specific CPU nodes after this
> common API builds the basic CPU node in DSDT?
> 
No. They need to be added in the same loop. Otherwise, it will cause
issues to the AML interpreter.

> > > Likewise, acpi_dsdt_add_fw_cfg() can be made generic as well.
> > >
> > The issue is, these things are not exactly common across all architectures.
> > x86 has bit different data in these objects. While today it appears they
> > are same for riscv and arm, in future things may change for an architecture.
> > It doesn't look like it is a standard practice to build files under
> > hw/acpi for specific architectures. Hence, IMO, it is better to keep these
> > things in architecture specific folders to allow them to do differently in
> > future.
> >
> 
> It looks like hw/acpi/ghes.c is for Arm from MAINTAINERS.
> 
APEI is a standard feature but it is up to the architecture to use it or
not. Probably, it is maintained by ARM since they adopted first. But if
you look at hw/acpi/meson.build, it is not architecture specific.

> > But I look forward for the feedback from other architecture maintainers on
> > this topic. My experience in qemu is very limited. So, I need help from
> > experts.
> 
> + Michael and Igor
> 
Thanks!
Sunil

