Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F996ACE73
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 20:51:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZGr2-0000Np-5G; Mon, 06 Mar 2023 14:50:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pZGqv-0000MX-4P
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 14:50:36 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pZGqs-0006OB-VA
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 14:50:32 -0500
Received: by mail-pg1-x52a.google.com with SMTP id q23so6270481pgt.7
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 11:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678132225;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=lBSahiWvRrtw7/sV1VqThr9gD6H1fViGRYyxj88Bpcs=;
 b=HXCVeVdjJtNscRQir/alO3qDu3w96MYCvKyJjMyMI9dxrscMiZy3icovUBLNs3bG9b
 yULMigXR7QAcrFEFjF2l3zmShMXX2TSBomUj+g1LGuQDgG6lqYu9ANyWcozR3n7ciGAz
 Qwmj1yA7NYbr0XL8rDfuH2Gibve/2liCwi/5YtOn/GzU1ChYgLGDEZ35ABOwIOjjs6oA
 Wt66q/itJio8gZtKJwMSwEbqfwZJpvDwMQxaC+XJMJv8kbCOsPFDB5jXuvx67wiqVBE0
 tsG9kOWWiPlwfTWfgDeUJuoEjmBxDXErloqZrR4DtAn00cu5YGzUv09sgJOpB1ptE4rl
 AmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678132225;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lBSahiWvRrtw7/sV1VqThr9gD6H1fViGRYyxj88Bpcs=;
 b=cD3tkmSNASBjAg7gBYTrgD6ohXMQWJtLal706XvPA4k5sYEiICh/MWqnYHLjfHaq8v
 paYLL3SEwLB66qEGLvvPdyH+WXCthDspw1UMDSxeoJx+19SbHpytifE8Q/ZiFeaYNTUH
 4JUU9McpD1uFzfm4lr59XO8l/VLvjwSmn+/pS3dFYpyEeikkSFupzD8eNN74mT6j5wY0
 pyENUQaaz9bD1PEAvm3Cw6ymjVhCb5GZ+IW4B2eIZxX3Yu9HyUKG5EMXS0LftMuy2mKn
 CbN1HZ+T1ZrjOdlB+qqWQtVrkJ2rN3ubuIhgIAqEJenFE8JCOhriz6TnuQdLd933iagd
 CVJw==
X-Gm-Message-State: AO0yUKV6RjOHP1ANHEDFwQuNDGllA9l+H5F+uYAeEpw9sEcNJ6Z8Ta2L
 czQ93w+33uHo2yTTJ0tlcg7EnQ==
X-Google-Smtp-Source: AK7set+3gPgs9/+3f3Jkswwovbiuj2E3XvPMT4KHRBgnDcH1+Hk/R9pMsvRYAXLWoOJ76b8k9eMEHA==
X-Received: by 2002:a62:1e05:0:b0:5a0:c4b6:edd6 with SMTP id
 e5-20020a621e05000000b005a0c4b6edd6mr10312025pfe.0.1678132225114; 
 Mon, 06 Mar 2023 11:50:25 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 e18-20020aa78c52000000b005e5861932c9sm6656404pfd.129.2023.03.06.11.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 11:50:24 -0800 (PST)
Date: Mon, 06 Mar 2023 11:50:24 -0800 (PST)
X-Google-Original-Date: Mon, 06 Mar 2023 11:49:17 PST (-0800)
Subject: Re: [PATCH V5 0/8] Add basic ACPI support for risc-v virt
In-Reply-To: <mhng-7afa2599-95f6-43e9-a968-9e7e4f939faa@palmer-ri-x1c9a>
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, ajones@ventanamicro.com, apatel@ventanamicro.com,
 Atish Patra <atishp@rivosinc.com>, sunilvl@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: sunilvl@ventanamicro.com, imammedo@redhat.com
Message-ID: <mhng-ca705dce-d180-4aaa-92f3-0113af965376@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=palmer@dabbelt.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Sun, 05 Mar 2023 15:45:05 PST (-0800), Palmer Dabbelt wrote:
> On Thu, 02 Mar 2023 01:12:04 PST (-0800), sunilvl@ventanamicro.com wrote:
>> This series adds the basic ACPI support for the RISC-V virt machine.
>> Currently only RINTC interrupt controller specification is approved by the
>> UEFI forum. External interrupt controller support in ACPI is in progress.
>>
>> This adds support for RINTC and RHCT tables as specified in below ECR links
>> which are approved by UEFI forum.
>> RINTC - https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xSEqK2l/view
>> RHCT - https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/view
>>
>> These changes are also available @
>> https://github.com/vlsunil/qemu/tree/acpi_b1_us_review_V5
>>
>> Changes since V4:
>> 	1) Used possible_cpus to create cpu topology in DSDT, MADT and RHCT as
>>            per Igor's feedback.
>
> Thanks.  These all look good to me, but given that Igor had some
> feedback on the v4 and it's pretty much just been weekend since t hese
> went out I'm going to hold off until tomorrow before merging anything.
> They're all staged and passing the tests on my end, so everything's good
> as far as I'm concerned.

I've queued these up on riscv-to-apply.next.  I know it's pretty last 
minute, but IMO we're better off having these a cycle earlier as a lot 
of the dependencies here are cross-project and it'll be better tested if 
released.

If anyone has an issue please say something, I'll be tagging a PR soon.

>
>>         2) Moved MAINTAINER entries below ACPI/SMBIOS entry as per Drew's
>>            feedback
>> Changes since V3:
>> 	1) Added back acpi_align_size() wrapper as per Drew's feedback
>> 	2) Updated RB tags
>>
>> Changes since V2:
>> 	1) Squashed commits and updated commit message as per feedback from Daniel.
>> 	2) Addressed comments from Drew.
>> 	3) Updated tags.
>>
>> Changes since V1:
>> 	1) Addressed comments from Bin Meng.
>> 	2) Made acpi switch default AUTO similar to other architectures.
>> 	3) Re-based and added RB and ACKs.
>>
>> The series is tested using SBI HVC console and initrd.
>>
>> Test instructions:
>> 1) Build Qemu with ACPI support (this series)
>>
>> 2) Build EDK2 as per instructions in
>> https://github.com/vlsunil/riscv-uefi-edk2-docs/wiki/RISC-V-Qemu-Virt-support
>>
>> 3) Build Linux with ACPI support using below branch
>> https://github.com/vlsunil/linux/commits/acpi_b1_us_review_ipi17_V2
>> after enabling SBI HVC and SBI earlycon options.
>>
>> CONFIG_RISCV_SBI_V01=y
>> CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
>> CONFIG_HVC_RISCV_SBI=y
>>
>> 4) Build buildroot.
>>
>> Run with below command.
>> qemu-system-riscv64   -nographic \
>> -drive file=Build/RiscVVirtQemu/RELEASE_GCC5/FV/RISCV_VIRT.fd,if=pflash,format=raw,unit=1 \
>> -machine virt -smp 16 -m 2G \
>> -kernel arch/riscv/boot/Image \
>> -initrd buildroot/output/images/rootfs.cpio \
>> -append "root=/dev/ram ro console=hvc0 earlycon=sbi"
>>
>>
>> Sunil V L (8):
>>   hw/riscv/virt: Add OEM_ID and OEM_TABLE_ID fields
>>   hw/riscv/virt: Add a switch to disable ACPI
>>   hw/riscv/virt: Add memmap pointer to RiscVVirtState
>>   hw/riscv/virt: Enable basic ACPI infrastructure
>>   hw/riscv/virt: virt-acpi-build.c: Add RINTC in MADT
>>   hw/riscv/virt: virt-acpi-build.c: Add RHCT Table
>>   hw/riscv/virt.c: Initialize the ACPI tables
>>   MAINTAINERS: Add entry for RISC-V ACPI
>>
>>  MAINTAINERS                |  18 +-
>>  hw/riscv/Kconfig           |   1 +
>>  hw/riscv/meson.build       |   1 +
>>  hw/riscv/virt-acpi-build.c | 416 +++++++++++++++++++++++++++++++++++++
>>  hw/riscv/virt.c            |  40 ++++
>>  include/hw/riscv/virt.h    |   6 +
>>  6 files changed, 476 insertions(+), 6 deletions(-)
>>  create mode 100644 hw/riscv/virt-acpi-build.c

