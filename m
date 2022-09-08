Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D055B19F2
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 12:29:05 +0200 (CEST)
Received: from localhost ([::1]:44168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWEmO-0005e0-Cw
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 06:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oWEj9-0008Sg-GS
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 06:25:44 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:40449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oWEj6-0002Qn-LD
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 06:25:43 -0400
Received: by mail-pg1-x536.google.com with SMTP id r17so3854097pgr.7
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 03:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=Sbg1DxqdC5ouknAXHnYuqv1U0ABwaFQ0dmKuJ5LjuAY=;
 b=Knix+SyIxVOQ3dO0znMOAd5fl4jkGAu+I04zwwNMctcWUklZbIvfG98jz2Y0PMvRS/
 n7jYAX2g8wLiZlMP1jZvkdIvtTBSoGkVJeKWyQvBsJPlb699Yhot7cR8U7CESx6sstXk
 ToibvcMYghvamjzPhZ2O5hE7PUQ+8C12JqLSmTDx5ZwDebFZloVs+cmuoJEcuiDQaPgz
 7wasQOwCd7Dx+uXJ5D6l8JeV4jmCuEIQ5ujE65l1kaG1o6Qqxp3n/NThvukh/VMx8fnf
 b88yExytGRovRl4Ny1iMPJFc29QDERrbeQpOijRCiSThcc5Hku2xwEijQBMiSh4sZ6v0
 TOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=Sbg1DxqdC5ouknAXHnYuqv1U0ABwaFQ0dmKuJ5LjuAY=;
 b=3QwSG7sX7oRU6noemyDLKQfy+z5afHmYtkQt0967VTZwyeEgQiLSFkjfatMNStpwDc
 eYLEdUV+NtRnv6juWjlgo6n9qzVtCqc9y0+T+tmo/vpzOCrmCEjZNbDMVTqTsor1pkR3
 rZ0/OPtGY2RbEVea1UbVYmd/lepURaAiY3krrX2i/vcX4Okj/GSuKVs/H25T2xVkEV2h
 A7Ywbk0KbWGW8A9fRUd6O+h1VMN1aJhRZCWM8k02w76Lnp/d3yX44mJwH4jatiYRGSXy
 +A9Z0F0IFtDDir+oj3Ts2CTDLCTve7K2v8FdSQ/cfdngRusNQ7GkTJ8A1VhU2XPjBIR2
 vvuw==
X-Gm-Message-State: ACgBeo1JyqVT/pKdWipLpKXtQ2qpSJMGEv05Bo813rI1nREwisTH6JHj
 ixgxJQWC8YJdPWgB5C1eelnr/w==
X-Google-Smtp-Source: AA6agR7k0WB9tjjAIIEUD6B3MUag0n2zJ3y96uETlhnoSNNcU5kcJ+zAXgt4uxQc8WoF+C9BMWMRGg==
X-Received: by 2002:a63:2fc7:0:b0:42c:3683:7e50 with SMTP id
 v190-20020a632fc7000000b0042c36837e50mr7457403pgv.534.1662632736087; 
 Thu, 08 Sep 2022 03:25:36 -0700 (PDT)
Received: from sunil-laptop ([49.206.11.92]) by smtp.gmail.com with ESMTPSA id
 b1-20020a170902d50100b00177fb862a87sm245683plg.20.2022.09.08.03.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 03:25:35 -0700 (PDT)
Date: Thu, 8 Sep 2022 15:55:27 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Song Gao <gaosong@loongson.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Pawel Polawski <ppolawsk@redhat.com>
Subject: Re: [PATCH V4 0/3] hw/riscv: virt: Enable booting S-mode firmware
 from pflashy
Message-ID: <20220908102527.GB88864@sunil-laptop>
References: <20220906090219.412517-1-sunilvl@ventanamicro.com>
 <20220906104128.zlwzvbbswlzyplkc@sirius.home.kraxel.org>
 <20220906123200.GA237800@sunil-laptop>
 <20220907071037.tnnewqhi5v2xmiln@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907071037.tnnewqhi5v2xmiln@sirius.home.kraxel.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 07, 2022 at 09:10:37AM +0200, Gerd Hoffmann wrote:
> On Tue, Sep 06, 2022 at 06:02:00PM +0530, Sunil V L wrote:
> > Hi Gerd,
> > 
> > On Tue, Sep 06, 2022 at 12:41:28PM +0200, Gerd Hoffmann wrote:
> > >   Hi,
> > > 
> > > > 3)Make the EDK2 image size to match with what qemu flash expects
> > > > truncate -s 32M Build/RiscVVirt/DEBUG_GCC5/FV/RISCV_VIRT.fd
> > > 
> > > Hmm, we have that kind of padding on arm too (64M for code and 64M for
> > > vars) and only a fraction of the space is actually used, which isn't
> > > exactly ideal.  So not sure it is a good plan to repeat that on riscv.
> > 
> > Yeah.. but it looks like limitation from qemu flash emulation. Do you mean
> > this limitation exists for arm in general on real flash also?
> 
> Well, at least on x86 flash devices can have odd sizes.  I don't think
> the qemu pflash emulation dictates anything here.
> 
> I think the underlying problem we actually have in qemu is that the
> flash size indirectly dictates the memory layout.  We pack the flash
> devices next to each other, on x86 downwards from 4G, on arm upwards
> from zero, not sure what risc-v is dong here.
> 
> edk2 arm code expects the variable store being mapped at 64m.  So
> QEMU_EFI.fd (which is actually 2M in size) gets padded to 64m, which
> has the desired effect that the next flash device (the varstore) is
> mapped at 64m.  But also has the side effect that we map 62m of zeros
> into the guest address space ...
> 
> The vars file is padded to 64m for consistency with the code.  Not
> padding the vars file should have no bad side effects I think, except
> for live migration where the flash size change might cause
> compatibility problems.
> 
> Not padding the code file needs some alternative way to specify the
> memory layout, to make sure the vars flash continues to be mapped at
> 64m even when the code flash is smaller.  Cc'ed Pawel who investigates
> that right now.
> 
> One possible option is to just hard-code the flash memory layout per
> machine type or per architecture.  Another option would be to add
> some way to configure that on the command line.

Thanks Gerd. One question: Is it possible to have separate code + vars
even when there is TF-A? My understanding is, TF-A will take one drive
and will be hidden from the non-secure word. So, there is only one flash
left for edk2. Is that correct?

In RISC-V, I think we have the this situation always since M-mode is
mandatory. The first flash is always reserved for secure fw. So, we will
have to increase the number of flash supported to 3 to support edk2 use
case.

I have a fix RISC-V which resolves truncate issue leveraging logic from
x86. It also creates 2 flash drives within non-secure space.
EDK2 also needs to be modified to work with smaller code flash. But
because the patch takes care of the actual size, it allows to have
bigger code and smaller var images.
Same thing can be adopted to arm also since both seem to follow the same
logic. But I think that will be a separate patch than this series. I
will run that as a separate RFC patch. Is that fine?

Thanks!
Sunil
> 
> take care,
>   Gerd
> 

