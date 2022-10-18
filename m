Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A4160292C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 12:13:19 +0200 (CEST)
Received: from localhost ([::1]:52034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okjb3-0007zV-Vx
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 06:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okjKo-0003ZQ-Bw
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 05:56:30 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:34326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okjKm-0008AG-9g
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 05:56:30 -0400
Received: by mail-wr1-x42c.google.com with SMTP id b4so22634241wrs.1
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 02:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lE6IRrIIG3sGoY63+z5OAQ4wQqD7FKOCrFrD7IxT2SI=;
 b=AsAcul2iSzSY/Xv/N6cTu1GOza205JyhQ+Vp7A8u5CiRFzpPG8etP40bDj1xxuvj1b
 7baTlmSnNSlk9SgB2GqVjhr+ZdVMBlNQKozWVB5hM2xfzyFC4pzrEtPkNaTANhlyvBGM
 ScICw1Wx3p8q8bGzVgM6fBC8PNX6NdarX1Ozlhu10s55cInwL6C//cCzDTYN5DGW1d41
 ZFaYDfHvVlUjE6CPEgzrXIIBpO35qGr+dw4HcFEw9acwf4IGfkQMrUI+7mL5itmoPjdC
 2RYQuT5toX6YTH1lt6zLY9ctI5tzjKvWT7gkzKWsNyWUfxoC6NCDmIga9dz2dqS0y2Wq
 H6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lE6IRrIIG3sGoY63+z5OAQ4wQqD7FKOCrFrD7IxT2SI=;
 b=Z29UfLYs5ykh6X79O4OKTwESzIMir/DyhNKUAqdQuyvITtKE2bKh8YK2BVSn1xmetD
 2r0S8tOuT5USfChpn41DN8/Ydg8/8y5IqmH17LyWN9x+X51hgwRI/Dh87KqiK5EOD9Wo
 NtCJSTzzHtxXacuTNK3KV7vfdHbZ6z27x3wwkuLz2zSozLkRDpD1hzipRTSOO01Obn5n
 QLButhaVBm2TV9BUNC8v9FLhXHXlEjqxSPGpQegLRzlEdI7+BPFVFkK9tKyppWaf75yq
 2vUTzsmrNoms5Z1TIbpPNkj0btJ4tvcv2HkMe5hFo8/bDj4jzLkDPEM/SbhWupj+ed8u
 nnIA==
X-Gm-Message-State: ACrzQf2ncHmoLPZlaywasMEjsVEL1e9VdAuKIRMs1ti9SBH3pX0KIBZK
 U3LnvzOxvO2o3Aw+iFzMWpvEpg==
X-Google-Smtp-Source: AMsMyM4SPk5iQUy9tWO3LahGNhHD2eMXkU1aIxY0ThKM7C4oDEaJOnmhJq/jSeoohOQV9JIAd2lmZA==
X-Received: by 2002:a5d:5a15:0:b0:22e:7771:3a07 with SMTP id
 bq21-20020a5d5a15000000b0022e77713a07mr1290137wrb.662.1666086985658; 
 Tue, 18 Oct 2022 02:56:25 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b0022b315b4649sm10655473wrr.26.2022.10.18.02.56.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 02:56:25 -0700 (PDT)
Message-ID: <b21fc9a7-fa3e-00e8-f2e4-c0e80ee755ec@linaro.org>
Date: Tue, 18 Oct 2022 11:56:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: x86, pflash, unassigned memory access
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org
Cc: nikunj@amd.com, "Roth, Michael" <Michael.Roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <89d24ddd-bff8-53dd-19c9-66ac43ab0b63@ozlabs.ru>
 <e293f12d-0ecf-77d1-28ce-b67c620c953a@ozlabs.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <e293f12d-0ecf-77d1-28ce-b67c620c953a@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/10/22 05:00, Alexey Kardashevskiy wrote:
> Anyone, ping?
> 
> On 27/09/2022 12:35, Alexey Kardashevskiy wrote:
>> Hi!
>>
>> I am trying qemu-system-x86_64 with OVMF with the q35 machine, the 
>> complete command line is below.
>>
>> It works fine (including SEV on AMD EPYC), but these 2 parameters make 
>> me wonder if I miss something:
>>
>> -drive 
>> if=pflash,format=raw,unit=0,file=/home/aik/OVMF_CODE.fd,readonly=on,id=MYPF 
>> \
>> -d guest_errors
>>
>> With this, I see a bunch of
>> ===
>> Invalid access at addr 0xFFC00000, size 1, region '(null)', reason: 
>> rejected
>> Invalid access at addr 0xFFC00001, size 1, region '(null)', reason: 
>> rejected
>> Invalid access at addr 0xFFC00002, size 1, region '(null)', reason: 
>> rejected
>> ...
>> Invalid access at addr 0xFFC00FFF, size 1, region '(null)', reason: 
>> rejected
>> QEMU Flash: Failed to find probe location
>> QEMU flash was not detected. Writable FVB is not being installed.

Could you be missing the VAR STORE flash?

-drive if=pflash,format=raw,unit=1,file=/home/aik/OVMF_VARS.fd,id=FVB

>> ===
>>
>> These are the indication of unassigned memory access which always 
>> meant a bug in my past experience (which is POWERPC so not so relevant 
>> here but nevertheless).
>>
>> OVMF is probing the flash at 0xFFC00000 (hardcoded in OVMF) in
>> https://github.com/tianocore/edk2/blob/master/OvmfPkg/QemuFlashFvbServicesRuntimeDxe/QemuFlash.c#L65 
>>
>> but cannot succeed - "info mtree -f" says that at no point there is 
>> anything at 0xFFC00000:
>>
>> ===
>> ...
>> 00000000fed1c000-00000000fed1ffff (prio 1, i/o): lpc-rcrb-mmio
>> 00000000fee00000-00000000feefffff (prio 4096, i/o): kvm-apic-msi
>> 00000000ffc84000-00000000ffffffff (prio 0, romd): system.flash0 KVM
>> 0000000800000000-0000000800000fff (prio 0, i/o): 
>> virtio-pci-common-virtio-net
>> ...
>> ===
>>
>> hw/block/pflash_cfi01.c suggests QEMU implements this protocol via 
>> pflash_cfi01_ops but it is never called as:
>> - it is the same memory region as the OVMF code and
>> - it is mapped at 0xffc84000 (which is 4G - 
>> size("./Build/OvmfX64/DEBUG_GCC5/FV/OVMF_CODE.fd"), not where OVMF 
>> expects it) and
>> - it has romd==true, it is a KVM memory slot and IO is never emulated 
>> in QEMU.
>>
>> Adding another IO memory region with pflash_cfi01_ops and mapping it 
>> at 0xFFC00000 makes it loop in OVMF somewhere.
>>
>> OVMF code is linked to hardcoded 0xffc84000 (FD_SIZE_IN_KB==4096).
>>
>>
>> So I wonder - are these illegal accesses a bug of some sort in QEMU or 
>> OVMF or command line? Thanks,
>>
>>
>>
>>
>> The complete command line is:
>>
>> /home/aik/pbuild/qemu-snp-localhost-x86_64/qemu-system-x86_64 \
>> -enable-kvm \
>> -m 2G \
>> -smp 2 \
>> -netdev user,id=USER0,hostfwd=tcp::2223-:22 \
>> -device 
>> virtio-net-pci,id=vnet0,iommu_platform=on,disable-legacy=on,romfile=,netdev=USER0 
>> \
>> -machine q35 \
>> -device 
>> virtio-scsi-pci,id=vscsi0,iommu_platform=on,disable-modern=off,disable-legacy=on 
>> \
>> -drive 
>> id=DRIVE0,if=none,file=img/u2204_128G_aikbook_sev.qcow2,format=qcow2 \
>> -device scsi-hd,id=scsi-hd0,drive=DRIVE0 \
>> -drive 
>> if=pflash,format=raw,unit=0,file=/home/aik/OVMF_CODE.fd,readonly=on,id=MYPF 
>> \
>> -nographic \
>> -chardev stdio,id=STDIO0,signal=off,mux=on \
>> -device isa-serial,id=isa-serial0,chardev=STDIO0 \
>> -mon id=MON0,chardev=STDIO0,mode=readline \
>> -kernel /boot/vmlinuz \
>> -append console=ttyS0,115200n1 earlyprintk root=/dev/sda3 \
>> -d guest_errors
>>
>>
> 

