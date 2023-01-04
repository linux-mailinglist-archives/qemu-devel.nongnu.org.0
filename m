Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9607565E03F
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 23:54:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDC5m-0006Da-QB; Wed, 04 Jan 2023 17:18:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDC5k-00069U-BX
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:18:36 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDC5f-0004QS-8v
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:18:32 -0500
Received: by mail-ej1-x629.google.com with SMTP id gh17so86122642ejb.6
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 14:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4ysHgPmEoM4C0MsKpxmajfVnShhx28Dsr3QVGstLB34=;
 b=VV0KG9555T9PoLAI8dAC21IQsnZ3lSR8DsLsgK/MtaWHYl/VxEiwDbH+RTDfrr5dQW
 WA4utGik6635RTmghS0a7WkHbgjPjuHiE+pO+hgiksDUq+n8V5BNHExlZHlUloYboqY7
 zrU8PN4gZjq2WnCGmIiIMR675pgNyuDdsxOet1Bt9y03U0vOuXBwptSClErZqrI/0bHR
 KFQQFiqETpzUcm2ka7wktHggBLgYZyP7Mvj21q6OfiyMwE7sHyIMp+Dz2BCx02mnBy6N
 5FNUZefTOV8iHE77uu4IjCU7RVsjQhh39eEJrTwmwNi2v/yN30VM+aOjm2Gsij5+8n96
 tXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4ysHgPmEoM4C0MsKpxmajfVnShhx28Dsr3QVGstLB34=;
 b=opRvg6hyFdabuaeV3yAa2ofxg4mUGPmcz/fMjxGWr9h5RT/JZGlS0PUOpKHudb1Z7T
 bDZGqVDyMX99mHbAA5UQiPORxKKqN87iSVZIpKQSpgQINwR1qSwl7kBuNHtYswltO6Pp
 AcRpVJVdPQvjHjg23nxgbZmHJYVKQ3g4vuH5gStzFge4n/4AtQ/0bnPgNS3VWlyXIZm3
 mSL8DnoSjNZCdiiQ1ExK96YBnkJ+8x3F3Eshbpn/8Gd+C0TOF/j2xi47HvaGkL1zEAw8
 t4yUFFgCGOArm8cVkPkmZh0DnLzTfdDeb2HpdHJ3qrAY/eVl9Jd9Ngsnjkozq0yTdn6G
 zQwQ==
X-Gm-Message-State: AFqh2kpJJZzh2QUSoGOz18WbgTcH1CvGpMS2Ui4rXKCoNUz51TqV3BBC
 IP+3PgxO2K2A4yeOZ7mTbwPrbQ==
X-Google-Smtp-Source: AMrXdXviPfF39VzEoGdqBpllgHy43HnZ0JUR7GccE1WHtt6JagF8scMFZzI1nxTausiLoRgwOJZm3A==
X-Received: by 2002:a17:906:94f:b0:7c1:4f7c:947f with SMTP id
 j15-20020a170906094f00b007c14f7c947fmr44428107ejd.72.1672870709605; 
 Wed, 04 Jan 2023 14:18:29 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a1709062e9100b007bd9e683639sm15718720eji.130.2023.01.04.14.18.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 14:18:28 -0800 (PST)
Message-ID: <877abde0-2e76-7fde-0212-eb7ce1384ea6@linaro.org>
Date: Wed, 4 Jan 2023 23:18:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/6] hw/isa/piix: Resolve redundant
 TYPE_PIIX3_XEN_DEVICE
Content-Language: en-US
To: Chuck Zmudzinski <brchuckz@aol.com>, Bernhard Beschow
 <shentey@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230104144437.27479-7-shentey@gmail.com>
 <1c2e0780-e5fb-1321-0d84-b0591db9fec7@linaro.org>
 <f596a7c1-10d0-3743-fe0b-d42003cf7440@aol.com>
 <be75758a-2547-d1ef-223e-157f3aa28b23@linaro.org>
 <92efe0f1-f22b-47bc-f27d-2f31cb3621ea@aol.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <92efe0f1-f22b-47bc-f27d-2f31cb3621ea@aol.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 4/1/23 20:29, Chuck Zmudzinski wrote:
> On 1/4/23 1:48 PM, Philippe Mathieu-Daudé wrote:

>> Here TYPE_PIIX3_DEVICE means for "PCI function part of the PIIX
>> south bridge chipset, which expose a PCI-to-ISA bridge". A better
>> name could be TYPE_PIIX3_ISA_PCI_DEVICE. Unfortunately this
>> device is named "PIIX3" with no indication of ISA bridge.
> 
> 
> Thanks, you are right, I see the PIIX3 device still exists after
> this patch set is applied.
> 
> chuckz@debian:~/sources-sid/qemu/qemu-7.50+dfsg/hw/i386$ grep -r PIIX3 *
> pc_piix.c:        pci_dev = pci_new_multifunction(-1, true, TYPE_PIIX3_DEVICE);
> 
> I also understand there is the PCI-to-ISA bridge at 00:01.0 on the PCI bus:
> 
> chuckz@debian:~$ lspci
> 00:00.0 Host bridge: Intel Corporation 440FX - 82441FX PMC [Natoma] (rev 02)

All these entries ('PCI functions') ...:

> 00:01.0 ISA bridge: Intel Corporation 82371SB PIIX3 ISA [Natoma/Triton II]
> 00:01.1 IDE interface: Intel Corporation 82371SB PIIX3 IDE [Natoma/Triton II]
> 00:01.2 USB controller: Intel Corporation 82371SB PIIX3 USB [Natoma/Triton II] (rev 01)
> 00:01.3 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 03)

... are part of the same *device*: the PIIX south bridge.

This device is enumerated as #1 on the PCI bus #0.
It currently exposes 4 functions: ISA/IDE/USB/ACPI.

> 00:02.0 Unassigned class [ff80]: XenSource, Inc. Xen Platform Device (rev 01)
> 00:03.0 VGA compatible controller: Device 1234:1111 (rev 02)
> 
> I also see with this patch, there is a bridge that is a PIIX4 ACPI at 00:01.3.
> I get the exact same output from lspci without the patch series, so that gives
> me confidence it is working as designed.

Historically the PIIX3 and PIIX4 QEMU models have been written by
different people with different goals.

- PIIX3 comes from x86 machines and is important for KVM/Xen
   accelerators
- PIIX4 was developed by hobbyist for MIPS machines

PIIX4 added the ACPI function which was proven helpful for x86 machines.

OS such Linux don't consider the PIIX south bridge as a whole chipset,
and enumerate each PCI function individually. So it was possible to add
the PIIX4 ACPI function to a PIIX3... A config that doesn't exist with
real hardware :/
While QEMU aims at modeling real HW, this config is still very useful
for KVM/Xen. So this Frankenstein config is accepted / maintained.

Bernhard is doing an incredible work merging the PIIX3/PIIX4 differences
into a more maintainable model :)

Regards,

Phil.

