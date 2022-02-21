Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A49304BED36
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 23:29:25 +0100 (CET)
Received: from localhost ([::1]:42784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMHBM-0003in-PO
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 17:29:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMHA7-00027h-W1
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:28:08 -0500
Received: from [2607:f8b0:4864:20::1032] (port=39707
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMHA4-0007Ll-KF
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:28:07 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 f19-20020a17090ac29300b001bc68ecce4aso455836pjt.4
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 14:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=UCSDmdEKSP567M1Ij2voL4rp8Wb/4ZViiaV9+u6nLwM=;
 b=CFWfGLZ0S3O1EmKOkRALL3bzsUG0/rddg/fBpcVxUQ+4E7TiNOkxXKCJJQCLBim1t4
 pP0nHWDzkV8Ekme58thVoSapUDGrdt/mUTx+Y/YO3PKrAEHCIPOO86XwPH1uikxf4h19
 d92Mk35POXHE4gNknF16poJzM59Z2jcHXhTeiuGNMKJ47DJfHWWsXtdRm7yZL4JrSk8k
 easmIJrIhOB8B7euNvMvm/E7Hk+aJoXKgHK7520+jliePtKQZegaLou5LzxFFvXHcbQF
 g6ZmJvMhEpKi9C+ckKYnk7VezSFJO3xjMHu8TorZrazy3QvW7mUado7LaDO0tpetXN7h
 R3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UCSDmdEKSP567M1Ij2voL4rp8Wb/4ZViiaV9+u6nLwM=;
 b=rJnFnP39j73jl2NZ5E10lWFQF9rUedBnZ/DSJoocGf/4MbYsm9Nl6b7yEtg6jqxIf3
 mu5GpxMUW4AFy8eD3xHU5v4O4aisny1WKCMLlPGpJ8tTgoVldztYy2g4Epu7hoYI0UxO
 cTxeLjsQrzwxncwTpEG42260qrnwYg/D50X4ZLYYBV+R5a00p+mmjJgTaSyWrIaI7ubQ
 DRHE5uY7ke5fgSrqZxSvbQZ0DC/2J53o78jYErtNIuFOkaM5cgqwrKkloan9FHkA3O5Z
 R+r8405ZP0RVZnQW7wp2akxA/zMG1/TO2Jgne8gmeZkviHBiPqMzb/DyEvQCUpPqxJNu
 sTOg==
X-Gm-Message-State: AOAM530K2WBB/GZDUsxhgKjoS8SzzUbMVMncla5a/t9wu9U6FUqk9SEJ
 ji8qF4TaIBHkE3chVqjRZw535ATvy90=
X-Google-Smtp-Source: ABdhPJx8j3HExb//htWyh5RxkqNWL+8BVlYKRFQa09zuOwrAl71E2tSF/JTJdodiYfIL9zc3s23pWA==
X-Received: by 2002:a17:90a:480e:b0:1bc:1d88:8d4e with SMTP id
 a14-20020a17090a480e00b001bc1d888d4emr988496pjh.157.1645482483298; 
 Mon, 21 Feb 2022 14:28:03 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id t137sm207729pgc.49.2022.02.21.14.28.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 14:28:03 -0800 (PST)
Message-ID: <a71843c3-0d0b-5d42-4712-386f2d189ff3@gmail.com>
Date: Mon, 21 Feb 2022 23:28:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH 0/2] Resolve some redundant property accessors
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
References: <20220217225351.140095-1-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220217225351.140095-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/2/22 23:53, Bernhard Beschow wrote:
> The QOM API already provides appropriate accessors, so reuse them.
> 
> Testing done:
> 
>    :$ make check
>    Ok:                 569
>    Expected Fail:      0
>    Fail:               0
>    Unexpected Pass:    0
>    Skipped:            178
>    Timeout:            0
> 
> Bernhard Beschow (2):
>    hw/vfio/pci-quirks: Resolve redundant property getters
>    hw/riscv/sifive_u: Resolve redundant property accessors

Good cleanup.

You might want to play with Coccinelle spatch [*] to clean all uses:

$ git grep object_property_add\(.*uint
hw/acpi/ich9.c:446:    object_property_add(obj, ACPI_PM_PROP_GPE0_BLK, 
"uint32",
hw/i386/sgx-epc.c:47:    object_property_add(obj, SGX_EPC_SIZE_PROP, 
"uint64", sgx_epc_get_size,
hw/intc/apic_common.c:462:    object_property_add(obj, "id", "uint32",
hw/mem/pc-dimm.c:175:    object_property_add(obj, PC_DIMM_SIZE_PROP, 
"uint64", pc_dimm_get_size,
hw/misc/aspeed_lpc.c:420:    object_property_add(obj, "idr1", "uint32", 
aspeed_kcs_get_register_property,
hw/misc/aspeed_lpc.c:422:    object_property_add(obj, "odr1", "uint32", 
aspeed_kcs_get_register_property,
hw/misc/aspeed_lpc.c:424:    object_property_add(obj, "str1", "uint32", 
aspeed_kcs_get_register_property,
hw/misc/aspeed_lpc.c:426:    object_property_add(obj, "idr2", "uint32", 
aspeed_kcs_get_register_property,
hw/misc/aspeed_lpc.c:428:    object_property_add(obj, "odr2", "uint32", 
aspeed_kcs_get_register_property,
hw/misc/aspeed_lpc.c:430:    object_property_add(obj, "str2", "uint32", 
aspeed_kcs_get_register_property,
hw/misc/aspeed_lpc.c:432:    object_property_add(obj, "idr3", "uint32", 
aspeed_kcs_get_register_property,
hw/misc/aspeed_lpc.c:434:    object_property_add(obj, "odr3", "uint32", 
aspeed_kcs_get_register_property,
hw/misc/aspeed_lpc.c:436:    object_property_add(obj, "str3", "uint32", 
aspeed_kcs_get_register_property,
hw/misc/aspeed_lpc.c:438:    object_property_add(obj, "idr4", "uint32", 
aspeed_kcs_get_register_property,
hw/misc/aspeed_lpc.c:440:    object_property_add(obj, "odr4", "uint32", 
aspeed_kcs_get_register_property,
hw/misc/aspeed_lpc.c:442:    object_property_add(obj, "str4", "uint32", 
aspeed_kcs_get_register_property,
hw/misc/npcm7xx_mft.c:493:        object_property_add(obj, "max_rpm[*]", 
"uint32",
hw/nvme/ctrl.c:6856:    object_property_add(obj, 
"smart_critical_warning", "uint8",
hw/pci-host/q35.c:224:    object_property_add(obj, 
PCI_HOST_PROP_PCI_HOLE_START, "uint32",
hw/pci-host/q35.c:228:    object_property_add(obj, 
PCI_HOST_PROP_PCI_HOLE_END, "uint32",
hw/pci-host/q35.c:232:    object_property_add(obj, 
PCI_HOST_PROP_PCI_HOLE64_START, "uint64",
hw/pci-host/q35.c:236:    object_property_add(obj, 
PCI_HOST_PROP_PCI_HOLE64_END, "uint64",
hw/ppc/spapr_drc.c:584:    object_property_add(obj, "index", "uint32", 
prop_get_index,
hw/riscv/sifive_u.c:736:    object_property_add(obj, "msel", "uint32",
hw/riscv/sifive_u.c:743:    object_property_add(obj, "serial", "uint32",
hw/sensor/adm1272.c:497:    object_property_add(obj, "vin", "uint16",
hw/sensor/adm1272.c:501:    object_property_add(obj, "vout", "uint16",
hw/sensor/adm1272.c:505:    object_property_add(obj, "iout", "uint16",
hw/sensor/adm1272.c:509:    object_property_add(obj, "pin", "uint16",
hw/sensor/max34451.c:730:        object_property_add(obj, "vout[*]", 
"uint16",
hw/sensor/max34451.c:740:        object_property_add(obj, 
"temperature[*]", "uint16",
hw/vfio/pci-quirks.c:1621:    object_property_add(OBJECT(vdev), 
"nvlink2-tgt", "uint64",
hw/vfio/pci-quirks.c:1682:    object_property_add(OBJECT(vdev), 
"nvlink2-tgt", "uint64",
hw/vfio/pci-quirks.c:1688:    object_property_add(OBJECT(vdev), 
"nvlink2-link-speed", "uint32",
net/colo-compare.c:1390:    object_property_add(obj, "compare_timeout", 
"uint64",
net/colo-compare.c:1394:    object_property_add(obj, 
"expired_scan_cycle", "uint32",
net/colo-compare.c:1398:    object_property_add(obj, "max_queue_size", 
"uint32",
softmmu/memory.c:1262:    object_property_add(OBJECT(mr), "priority", 
"uint32",
softmmu/memory.c:1266:    object_property_add(OBJECT(mr), "size", "uint64",
target/arm/cpu64.c:863:    object_property_add(obj, "sve-max-vq", 
"uint32", cpu_max_get_sve_max_vq,
tests/unit/test-qdev-global-props.c:155:    object_property_add(obj, 
"prop1", "uint32", prop1_accessor, prop1_accessor,
tests/unit/test-qdev-global-props.c:157:    object_property_add(obj, 
"prop2", "uint32", prop2_accessor, prop2_accessor,

[*] https://coccinelle.gitlabpages.inria.fr/website/

