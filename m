Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E19537B4C3
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 05:59:04 +0200 (CEST)
Received: from localhost ([::1]:43452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgg1X-0004wl-72
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 23:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgg0X-0003nX-33
 for qemu-devel@nongnu.org; Tue, 11 May 2021 23:58:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgg0V-0003i2-30
 for qemu-devel@nongnu.org; Tue, 11 May 2021 23:58:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620791878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zARzJ3VY+v5cLeah1bkFjzw4VgZs19HGeS+bK/EIeQ8=;
 b=STDUuppw6dGfY92YB3oacnbKyOO2dHpUlRLUiE21sjZkbZ0on487CEyjCAiZG/wLTUtNHk
 Gq2TI7/LB0ov9rwF7du7kacpb0VWIEb7DfznTd7fmFHpfTMi82Ggt3Gape58uTjD1QL/Xm
 junjFgGdEmOOn11lHFq1SWToRILoTUQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-9vozfp9sPHmAa1rggW266w-1; Tue, 11 May 2021 23:57:57 -0400
X-MC-Unique: 9vozfp9sPHmAa1rggW266w-1
Received: by mail-wr1-f69.google.com with SMTP id
 c13-20020a5d6ccd0000b029010ec741b84bso916282wrc.23
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 20:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zARzJ3VY+v5cLeah1bkFjzw4VgZs19HGeS+bK/EIeQ8=;
 b=foqsnC/MK5Pfh5QVtDTeku1DoOl72EetCFFeZrwjC58Q1IU2uq2OAyESAN6IbknttP
 xgjjqK9rlMMdsdjWGTpWMG004D4NeEwIJfWi0bV78+J/z7YeUUb/Tp5ZFdqap/CNk7Wa
 rrZn1DGxKpRsia0nILVhKeHqo3MUksrcjGvFe2DjlDSLOPxZcbfTgJ8o8OVAnkEjKc5j
 b3RpLP+AFXioDkC70MSDIXn5gaWA5Xb9+s4SSUviORBsxd9DViTuxUv6468b6PMPuX3p
 wMy9W5G73TdmKcj46XgmKcmSD9OFpB85Ea53X6WsVzUKXg79iUT7liWxzFY4ofQFPDSH
 izOQ==
X-Gm-Message-State: AOAM533Pdx2ZsKMe53jQt0QCSbDto6L+h4lyFLlaIHmzz4EheB5wShd8
 ++0E82eMq4/Ys2MSefPGyJBfZZOLdlIKyKa90boXttek0jvArWImGa94f8vN4/HPyIpR+Kh/YbJ
 2HOOd+07f1Dc3h1A=
X-Received: by 2002:adf:cd8c:: with SMTP id q12mr42302835wrj.328.1620791875778; 
 Tue, 11 May 2021 20:57:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwazc81pSOKdVPUNDhqDUshi7M+/5oa+rVxXqpQHL1E6FUH3u52QGBywAK8AE1tFMKL7qcj6g==
X-Received: by 2002:adf:cd8c:: with SMTP id q12mr42302807wrj.328.1620791875530; 
 Tue, 11 May 2021 20:57:55 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id z19sm4949700wmf.47.2021.05.11.20.57.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 20:57:55 -0700 (PDT)
Subject: Re: [RFC PATCH 1/5] hw/mem/nvdimm: Use Kconfig 'imply' instead of
 'depends on'
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210511155354.3069141-1-philmd@redhat.com>
 <20210511155354.3069141-2-philmd@redhat.com> <YJs8anLs1zL3nPdS@yekko>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <21e0a306-ccfb-a627-1496-14f831fe80a7@redhat.com>
Date: Wed, 12 May 2021 05:57:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJs8anLs1zL3nPdS@yekko>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Igor Mammedov <imammedo@redhat.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 4:24 AM, David Gibson wrote:
> On Tue, May 11, 2021 at 05:53:50PM +0200, Philippe Mathieu-Daudé wrote:
>> Per the kconfig.rst:
>>
>>   A device should be listed [...] ``imply`` if (depending on
>>   the QEMU command line) the board may or  may not be started
>>   without it.
>>
>> This is the case with the NVDIMM device, so use the 'imply'
>> weak reverse dependency to select the symbol.
> 
> Uh.. It should definitely be possible to start a pseries machine
> without NVDIMM.  I would have guessed the same for PC.

Yes, this is what this patch does. With it we can build with:
CONFIG_NVDIMM=n

> 
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  default-configs/devices/ppc64-softmmu.mak | 1 -
>>  hw/arm/Kconfig                            | 1 +
>>  hw/i386/Kconfig                           | 1 +
>>  hw/mem/Kconfig                            | 2 --
>>  hw/ppc/Kconfig                            | 1 +
>>  5 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/default-configs/devices/ppc64-softmmu.mak b/default-configs/devices/ppc64-softmmu.mak
>> index ae0841fa3a1..cca52665d90 100644
>> --- a/default-configs/devices/ppc64-softmmu.mak
>> +++ b/default-configs/devices/ppc64-softmmu.mak
>> @@ -8,4 +8,3 @@ CONFIG_POWERNV=y
>>  
>>  # For pSeries
>>  CONFIG_PSERIES=y
>> -CONFIG_NVDIMM=y
>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>> index b887f6a5b17..67723d9ea6a 100644
>> --- a/hw/arm/Kconfig
>> +++ b/hw/arm/Kconfig
>> @@ -6,6 +6,7 @@ config ARM_VIRT
>>      imply VFIO_PLATFORM
>>      imply VFIO_XGMAC
>>      imply TPM_TIS_SYSBUS
>> +    imply NVDIMM
>>      select ARM_GIC
>>      select ACPI
>>      select ARM_SMMUV3
>> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
>> index 7f91f30877f..66838fa397b 100644
>> --- a/hw/i386/Kconfig
>> +++ b/hw/i386/Kconfig
>> @@ -23,6 +23,7 @@ config PC
>>      imply TPM_TIS_ISA
>>      imply VGA_PCI
>>      imply VIRTIO_VGA
>> +    imply NVDIMM
>>      select FDC
>>      select I8259
>>      select I8254
>> diff --git a/hw/mem/Kconfig b/hw/mem/Kconfig
>> index a0ef2cf648e..8b19fdc49f1 100644
>> --- a/hw/mem/Kconfig
>> +++ b/hw/mem/Kconfig
>> @@ -7,6 +7,4 @@ config MEM_DEVICE
>>  
>>  config NVDIMM
>>      bool
>> -    default y
>> -    depends on (PC || PSERIES || ARM_VIRT)
>>      select MEM_DEVICE
>> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
>> index e51e0e5e5ac..66e0b15d9ef 100644
>> --- a/hw/ppc/Kconfig
>> +++ b/hw/ppc/Kconfig
>> @@ -3,6 +3,7 @@ config PSERIES
>>      imply PCI_DEVICES
>>      imply TEST_DEVICES
>>      imply VIRTIO_VGA
>> +    imply NVDIMM
>>      select DIMM
>>      select PCI
>>      select SPAPR_VSCSI
> 


