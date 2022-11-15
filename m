Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB613629B65
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 15:02:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouwV7-0008Ma-67; Tue, 15 Nov 2022 09:01:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouwV2-0008GS-Sa
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:01:17 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouwV1-0000sf-5A
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:01:16 -0500
Received: by mail-ed1-x52a.google.com with SMTP id v27so22016144eda.1
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 06:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LQPjKOgvgBjp/wUMLmKV2j8XaNOmcagCOprDHauNf1E=;
 b=X9wZrkjzUZcqIQ+aeD0KvQMiFmjZD8vdzuSNeYL4onV9q6fSnfImr+UZhponzF4gAc
 e08+lxLss3Lh5AT0nNCLCis08N5eiHNpicqddPEjSm9ZOgT53FuRXV4ZTYopbKevKcdT
 8DUL04fh0V3l0NSfBjdR3TMQzktumkbKpuryyaE4HUABZT2iytpMifUxXHKAbusgkiqW
 b8x0FRHg3JhqapIyd3+vmLNwxc+2EB5Kdk4XPe2Cac+jJZlGRf/hL8Cf/ThztYihvH6I
 dK1k8AyBSMmt2Aenp/HAiPOfZOnoL1W92lBB6Zux+cFmaXnFq2kCudqYZPdfsokfhnlJ
 oyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LQPjKOgvgBjp/wUMLmKV2j8XaNOmcagCOprDHauNf1E=;
 b=MnVIPJvJ8JGmN0pN5mFJ8LMU5X8/rCzh+WZ78cFM72JziRi0iEFPVJaQI1qgn536uW
 BsMZTrzNwIDvzzq3NcbPuClLwTFJKEbLcq+5yxyRj2lXM1HY7eOQKVx0e6/Pe/UtEhHk
 IntEQ8f8RSEay1uX7EGFsIgywdAGRO0JNdda0YjKKK6cIS97GnP3vi2m5cLGN4FW24Wp
 0N6AONH9st4tb7jSM8c8sSfZ+adsAmFKnaDV4lrXwLjm9KWFrJwQRryNdAzTxIrw0IUa
 M8YaKi62mgrthohUsDooZQMUlkrfw1/6oBfaNcFTndhv/8DGEbQknsYZ7CqEODm29l9Q
 zFQw==
X-Gm-Message-State: ANoB5plrcRk7qGkTh4stxQmAO6CA6Pz247yHvG6rG6715rVIFtlbcv3g
 zZIK7ruVQAW4ujLdCcfFlw4x3w==
X-Google-Smtp-Source: AA0mqf6tSOcv9TfAzBk4a/8GBh03Yw/8/BPC7ZIqbgqacx2PaMfF6iRjdgwCG9k+rAy0103cUFO5zQ==
X-Received: by 2002:a05:6402:1a49:b0:463:2d3c:ad37 with SMTP id
 bf9-20020a0564021a4900b004632d3cad37mr14938036edb.164.1668520869603; 
 Tue, 15 Nov 2022 06:01:09 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 wl6-20020a170907310600b007add28659b0sm5626547ejb.140.2022.11.15.06.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 06:01:08 -0800 (PST)
Message-ID: <8ab63a14-606e-0205-508e-2d0c6003f0fe@linaro.org>
Date: Tue, 15 Nov 2022 15:01:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PULL v4 00/83] pci,pc,virtio: features, tests, fixes, cleanups
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52a.google.com
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

Hi,

On 7/11/22 23:47, Michael S. Tsirkin wrote:

> ----------------------------------------------------------------
> pci,pc,virtio: features, tests, fixes, cleanups
> 
> lots of acpi rework
> first version of biosbits infrastructure
> ASID support in vhost-vdpa
> core_count2 support in smbios
> PCIe DOE emulation
> virtio vq reset
> HMAT support
> part of infrastructure for viommu support in vhost-vdpa
> VTD PASID support
> fixes, tests all over the place
Apparently unrelated to these fixes, but going from 6295a58ad1 to
v7.2.0-rc0 triggered rebuilding ACPI files and I now get:

  45/510 qemu:qtest+qtest-i386 / qtest-i386/bios-tables-test 
           ERROR          14.73s   killed by signal 6 SIGABRT
  74/510 qemu:qtest+qtest-x86_64 / qtest-x86_64/bios-tables-test 
           ERROR          12.56s   killed by signal 6 SIGABRT

Running manually:

$ QTEST_QEMU_BINARY=./qemu-system-x86_64 tests/qtest/bios-tables-test
...
# starting QEMU: exec ./qemu-system-x86_64 -qtest 
unix:/tmp/qtest-239233.sock -qtest-log /dev/null -chardev 
socket,path=/tmp/qtest-239233.qmp,id=char0 -mon 
chardev=char0,mode=control -display none -machine pc -accel kvm -accel 
tcg -net none -machine smm=off -drive 
id=hd0,if=none,file=tests/acpi-test-disk-QmvOOR,format=raw -device 
ide-hd,drive=hd0  -accel qtest
Could not access KVM kernel module: Permission denied
qemu-system-x86_64: -accel kvm: failed to initialize kvm: Permission denied
acpi-test: Warning! DSDT binary file mismatch. Actual 
[aml:/tmp/aml-Y06RV1], Expected [aml:tests/data/acpi/pc/DSDT.nosmm].
See source file tests/qtest/bios-tables-test.c for instructions on how 
to update expected files.
to see ASL diff between mismatched files install IASL, rebuild QEMU from 
scratch and re-run tests with V=1 environment variable set**
ERROR:../../tests/qtest/bios-tables-test.c:533:test_acpi_asl: assertion 
failed: (all_tables_match)
Bail out! ERROR:../../tests/qtest/bios-tables-test.c:533:test_acpi_asl: 
assertion failed: (all_tables_match)
Aborted

I blew/recreated my build directory and can reproduce.

$ uname -sm
Linux x86_64

Any clue?

