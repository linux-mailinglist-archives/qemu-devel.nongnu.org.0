Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F995666B85
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 08:19:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFrq9-0004AX-Rl; Thu, 12 Jan 2023 02:17:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFrq7-00046K-9Y
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 02:17:31 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFrq4-0006yb-1c
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 02:17:30 -0500
Received: by mail-wr1-x42a.google.com with SMTP id bk16so17129590wrb.11
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 23:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h5fkYGJtMm2cPCnHBO9sFn5Dmq8/tNh0hElJEz3tEOU=;
 b=yhPDI0Qxf3Wcwi2mF0WYKjr8ZD4WB5UlP54UyaZrpo3IPnFGpq1k0aSDgqlgUs8IP0
 /P5oh+8UHoac4EkshAcMQJRzCE48UtYcqjZRHs22JmObwHm4c6ZbGzS6HnrqgI0GuVlo
 ilqjMkkp155ky+pPr/TadJhLbR828VS2usBt21NBKB/luSTG3e6k9YuizEDZgVBifoLb
 7RmjiiUpkKlTOTNqLGNXhzumtfqKt3u7+a4vOkEhef33lIbvH2+POYYJt0mQVuAeIBlt
 DGaPe/zFHpCotTpSzRyZktoll7JgECsa3+hnt9zYEnTdyxA7S2v7gicLIZ+sZJgn6WgX
 zibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h5fkYGJtMm2cPCnHBO9sFn5Dmq8/tNh0hElJEz3tEOU=;
 b=Tlllq5qKa5Cy2JmyDY3Ky8IpEs+E6QHHuSGJcHRK+6HZ3yu0mFoolm7o9g/Iwqp+xD
 DDZ+X8OQ1MAMoNxk5yyItcDCkaZfFXZibn6f7/RCQwIcWL3znIZ9TuK+6gLzet9T6JOw
 0Iu4jpr9DYAtmnv7HgclSygRJ23CFWLlBq+U+Kb0LUZZkluzKobq0mSoSbs+MUri+Kt/
 GC+E4bF3Ie65zxPP5QiVIiqQf2kEc2Sz4XL2QArfDxyqMYjtkatDfZPoD91Fs9vos2CI
 Mg4/EF3jfwdQckkEFzkv4Zi7J49Om/ccoKHuh2CaJ12RNuOEPksUJgLkbg124yP3B0kY
 to/A==
X-Gm-Message-State: AFqh2kpT29GhwvVEBDtwaTVcdB2yYApKLB5ro5y03Tuof6YFt+XghiYN
 4diIx+HuQop4DmmRVWDHP37gPOdCQQrNghAn
X-Google-Smtp-Source: AMrXdXtQqk40qZ9AFsk5Cn8NE9pj7DAHwrOTiaPxCZHdl4muAUkwse3UxofM62lM4yi+CEgGB2TO6g==
X-Received: by 2002:a05:6000:1c11:b0:2bd:bcc6:c450 with SMTP id
 ba17-20020a0560001c1100b002bdbcc6c450mr5976721wrb.17.1673507845721; 
 Wed, 11 Jan 2023 23:17:25 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n16-20020a5d4010000000b002bbed1388a5sm10306421wrp.15.2023.01.11.23.17.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 23:17:25 -0800 (PST)
Message-ID: <b91019e8-1a75-d968-c842-1d040b32a431@linaro.org>
Date: Thu, 12 Jan 2023 08:17:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 05/18] target/arm: Move CPU QOM type definitions to
 "hw/arm/cpu.h"
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230110164406.94366-1-philmd@linaro.org>
 <20230110164406.94366-6-philmd@linaro.org>
 <325310d0-aad6-fc39-748a-80762d644dd8@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <325310d0-aad6-fc39-748a-80762d644dd8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/1/23 21:02, Richard Henderson wrote:
> On 1/10/23 08:43, Philippe Mathieu-Daudé wrote:
>> +++ b/target/arm/cpu.h
>> @@ -26,6 +26,7 @@
>>   #include "cpu-qom.h"
>>   #include "exec/cpu-defs.h"
>>   #include "qapi/qapi-types-common.h"
>> +#include "hw/arm/cpu.h"
> 
> I'm not a fan of this.
> 
> If you want a smaller version of cpu-qom.h here in target/arm/, for use 
> by hw/, that's one thing.  But target/ should not be reaching back into 
> hw/, IMO.

I concur, but currently we have:

$ git grep '#include "hw' target | wc -l
      220

$ git grep -h '#include "hw' target | sort | uniq -c
    1 #include "hw/acpi/acpi.h"
    1 #include "hw/acpi/ghes.h"
    1 #include "hw/arm/boot.h"
    1 #include "hw/arm/virt.h"
   19 #include "hw/boards.h"
    2 #include "hw/clock.h"
    3 #include "hw/core/accel-cpu.h"
   24 #include "hw/core/cpu.h"
   20 #include "hw/core/sysemu-cpu-ops.h"
   24 #include "hw/core/tcg-cpu-ops.h"
    1 #include "hw/hppa/hppa_hardware.h"
    3 #include "hw/hw.h"
    1 #include "hw/hyperv/hyperv-proto.h"
    2 #include "hw/hyperv/hyperv.h"
    2 #include "hw/i386/apic-msidef.h"
    2 #include "hw/i386/apic.h"
    8 #include "hw/i386/apic_internal.h"
    1 #include "hw/i386/e820_memory_layout.h"
    1 #include "hw/i386/intel_iommu.h"
    1 #include "hw/i386/ioapic.h"
    2 #include "hw/i386/pc.h"
    1 #include "hw/i386/sgx-epc.h"
    1 #include "hw/i386/topology.h"
    1 #include "hw/i386/x86-iommu.h"
    2 #include "hw/i386/x86.h"
    1 #include "hw/intc/riscv_aclint.h"
    8 #include "hw/irq.h"
    1 #include "hw/isa/isa.h"
    5 #include "hw/loader.h"
    1 #include "hw/loongarch/virt.h"
    2 #include "hw/mips/cpudevs.h"
    2 #include "hw/pci/msi.h"
    1 #include "hw/pci/msix.h"
    3 #include "hw/pci/pci.h"
    1 #include "hw/ppc/openpic_kvm.h"
    5 #include "hw/ppc/ppc.h"
    2 #include "hw/ppc/spapr.h"
    1 #include "hw/ppc/spapr_cpu_core.h"
    2 #include "hw/qdev-clock.h"
   12 #include "hw/qdev-properties.h"
   11 #include "hw/registerfields.h"
    2 #include "hw/s390x/ebcdic.h"
    5 #include "hw/s390x/ioinst.h"
    2 #include "hw/s390x/ipl.h"
    8 #include "hw/s390x/pv.h"
    2 #include "hw/s390x/s390-pci-bus.h"
    2 #include "hw/s390x/s390-pci-inst.h"
    2 #include "hw/s390x/s390-virtio-ccw.h"
    2 #include "hw/s390x/s390-virtio-hcall.h"
    3 #include "hw/s390x/s390_flic.h"
    1 #include "hw/s390x/sclp.h"
    2 #include "hw/s390x/storage-keys.h"
    1 #include "hw/s390x/tod.h"
    1 #include "hw/sh4/sh_intc.h"
    2 #include "hw/sysbus.h"
    1 #include "hw/watchdog/wdt_diag288.h"
    1 #include "hw/xtensa/xtensa-isa.h"

Assuming we want to have a self-contained libtarget$arch, how can we
deal with HW tied to the arch such CPU timers or NVIC?

