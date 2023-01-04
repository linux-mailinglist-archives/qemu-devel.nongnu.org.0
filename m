Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 885D265CF98
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 10:34:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD0A5-0000Y3-Ca; Wed, 04 Jan 2023 04:34:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD0A3-0000WE-08
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 04:34:15 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD0A0-00044J-Pa
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 04:34:14 -0500
Received: by mail-wr1-x42c.google.com with SMTP id s9so323793wru.13
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 01:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6MV36S0d4PTXVcgSge6PBDMIbSp3KBM0TpGwS3HqoXs=;
 b=JXUUcgkakWfIM+vdCUAVjSvllG1bqNdoYQCljd1nsPk5tBxelXgoTGPBNZgrrEoque
 rlWTOC4V47vX+U42xo7+yi5ItQTFJKaw3JZh7s6cjeO0f+J5rXjJ05lpfUeSEuswEhYM
 G+8tKt59c+F9Paj+ZbMzc6632UlYSiBc/D8C2ypc/dTN8mVAhdruE4lQ9eMSq0ZQiLgv
 +xoNRQR7HthogzSky5Ivt8XCuFcYm7zLvQX12jXqy5gqDdjdgBYZFwDub181kjTi4H7a
 ZJ0L9fc54NH4dO8UK6mw3XiMaJDVbtN28a++9eEVNmtvPYjSaWayISYBKgEPJvE2juEq
 217w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6MV36S0d4PTXVcgSge6PBDMIbSp3KBM0TpGwS3HqoXs=;
 b=fPKIuJYdP7MW4N0C6TvyGIYM9eG84wgOrU1ONEP9Kka5aPQw/gLFiCnuxL6KzZqKvA
 Fr59PodWwT3eTsEupnZMTtrYSYlFKc0qBFbS4pYgvyHS4dzVnbtOLwC/J9lFlFlmsTKg
 pnId7GREG/+Wptta4igElId5nFHBe5hORlkYblZYdNBNVQAvAwnKd0fXA01zGwoNJGo6
 A/kI3wQT70Tcwc1tDKII8wkcUHUTmPSVNTNXATH/thmdONxLlhg7HGLCZ8rREreC+bMD
 9YRBHxo+VJ/dX6ca9Xxa1iyOXwCUwA43fybJZKNjMMDg10tecg7N/1OvfFm7PKUH+VMS
 8imA==
X-Gm-Message-State: AFqh2koUFaUm0OcQ0hHclN6XW0WiNHEo2ZpoPqmLSYtfRhwsp5JvAb26
 QZyF3hEVVxyhO+xQjA2KeXt7cA==
X-Google-Smtp-Source: AMrXdXsnBSrpzbdNMdnSqUv9D03C3vifFiKVJKei9UPf7TXs7O8gqXTIVCX55EQIiA1409/z5QD90w==
X-Received: by 2002:a5d:550e:0:b0:274:c846:4201 with SMTP id
 b14-20020a5d550e000000b00274c8464201mr22669929wrv.68.1672824850998; 
 Wed, 04 Jan 2023 01:34:10 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h6-20020a056000000600b002423dc3b1a9sm31911113wrx.52.2023.01.04.01.34.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 01:34:10 -0800 (PST)
Message-ID: <e81f78e2-301e-d920-cd03-6e17c591d677@linaro.org>
Date: Wed, 4 Jan 2023 10:34:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] acpi: cpuhp: fix guest-visible maximum access size to the
 legacy reg block
Content-Language: en-US
To: Laszlo Ersek <lersek@redhat.com>, qemu devel list <qemu-devel@nongnu.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Ard Biesheuvel <ardb@kernel.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-stable@nongnu.org,
 Zhu Guihua <zhugh.fnst@cn.fujitsu.com>, Gu Zheng <guz.fnst@cn.fujitsu.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>
References: <20230104090138.214862-1-lersek@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230104090138.214862-1-lersek@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.103,
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

On 4/1/23 10:01, Laszlo Ersek wrote:
> The modern ACPI CPU hotplug interface was introduced in the following
> series (aa1dd39ca307..679dd1a957df), released in v2.7.0:
> 
>    1  abd49bc2ed2f docs: update ACPI CPU hotplug spec with new protocol
>    2  16bcab97eb9f pc: piix4/ich9: add 'cpu-hotplug-legacy' property
>    3  5e1b5d93887b acpi: cpuhp: add CPU devices AML with _STA method
>    4  ac35f13ba8f8 pc: acpi: introduce AcpiDeviceIfClass.madt_cpu hook
>    5  d2238cb6781d acpi: cpuhp: implement hot-add parts of CPU hotplug
>                    interface
>    6  8872c25a26cc acpi: cpuhp: implement hot-remove parts of CPU hotplug
>                    interface
>    7  76623d00ae57 acpi: cpuhp: add cpu._OST handling
>    8  679dd1a957df pc: use new CPU hotplug interface since 2.7 machine type
> 
> Before patch#1, "docs/specs/acpi_cpu_hotplug.txt" only specified 1-byte
> accesses for the hotplug register block.  Patch#1 preserved the same
> restriction for the legacy register block, but:
> 
> - it specified DWORD accesses for some of the modern registers,
> 
> - in particular, the switch from the legacy block to the modern block
>    would require a DWORD write to the *legacy* block.
> 
> The latter functionality was then implemented in cpu_status_write()
> [hw/acpi/cpu_hotplug.c], in patch#8.
> 
> Unfortunately, all DWORD accesses depended on a dormant bug: the one
> introced in earlier commit a014ed07bd5a ("memory: accept mismatching sizes

Typo "introduced",

> in memory_region_access_valid", 2013-05-29); first released in v1.6.0.
> Due to commit a014ed07bd5a, the DWORD accesses to the *legacy* CPU hotplug
> register block would work in spite of the above series *not* relaxing
> "valid.max_access_size = 1" in "hw/acpi/cpu_hotplug.c":
> 
>> static const MemoryRegionOps AcpiCpuHotplug_ops = {
>>      .read = cpu_status_read,
>>      .write = cpu_status_write,
>>      .endianness = DEVICE_LITTLE_ENDIAN,
>>      .valid = {
>>          .min_access_size = 1,
>>          .max_access_size = 1,
>>      },
>> };
> 
> Later, in commits e6d0c3ce6895 ("acpi: cpuhp: introduce 'Command data 2'
> field", 2020-01-22) and ae340aa3d256 ("acpi: cpuhp: spec: add typical
> usecases", 2020-01-22), first released in v5.0.0, the modern CPU hotplug
> interface (including the documentation) was extended with another DWORD
> *read* access, namely to the "Command data 2" register, which would be
> important for the guest to confirm whether it managed to switch the
> register block from legacy to modern.
> 
> This functionality too silently depended on the bug from commit
> a014ed07bd5a.
> 
> In commit 5d971f9e6725 ('memory: Revert "memory: accept mismatching sizes
> in memory_region_access_valid"', 2020-06-26), first released in v5.1.0,
> the bug from commit a014ed07bd5a was fixed (the commit was reverted).
> That swiftly exposed the bug in "AcpiCpuHotplug_ops", still present from
> the v2.7.0 series quoted at the top -- namely the fact that
> "valid.max_access_size = 1" didn't match what the guest was supposed to
> do, according to the spec ("docs/specs/acpi_cpu_hotplug.txt").
> 
> The symptom is that the "modern interface negotiation protocol"
> described in commit ae340aa3d256:
> 
>> +      Use following steps to detect and enable modern CPU hotplug interface:
>> +        1. Store 0x0 to the 'CPU selector' register,
>> +           attempting to switch to modern mode
>> +        2. Store 0x0 to the 'CPU selector' register,
>> +           to ensure valid selector value
>> +        3. Store 0x0 to the 'Command field' register,
>> +        4. Read the 'Command data 2' register.
>> +           If read value is 0x0, the modern interface is enabled.
>> +           Otherwise legacy or no CPU hotplug interface available
> 
> falls apart for the guest: steps 1 and 2 are lost, because they are DWORD
> writes; so no switching happens.  Step 3 (a single-byte write) is not
> lost, but it has no effect; see the condition in cpu_status_write() in
> patch#8.  And step 4 *misleads* the guest into thinking that the switch
> worked: the DWORD read is lost again -- it returns zero to the guest
> without ever reaching the device model, so the guest never learns the
> switch didn't work.
> 
> This means that guest behavior centered on the "Command data 2" register
> worked *only* in the v5.0.0 release; it got effectively regressed in
> v5.1.0.
> 
> To make things *even more* complicated, the breakage was (and remains, as
> of today) visible with TCG acceleration only.  Commit 5d971f9e6725 makes
> no difference with KVM acceleration -- the DWORD accesses still work,
> despite "valid.max_access_size = 1".
> 
> As commit 5d971f9e6725 suggests, fix the problem by raising
> "valid.max_access_size" to 4 -- the spec now clearly instructs the guest
> to perform DWORD accesses to the legacy register block too, for enabling
> (and verifying!) the modern block.  In order to keep compatibility for the
> device model implementation though, set "impl.max_access_size = 1", so
> that wide accesses be split before they reach the legacy read/write
> handlers, like they always have been on KVM, and like they were on TCG
> before 5d971f9e6725 (v5.1.0).
> 
> Tested with:
> 
> - OVMF IA32 + qemu-system-i386, CPU hotplug/hot-unplug with SMM,
>    intermixed with ACPI S3 suspend/resume, using KVM accel
>    (regression-test);
> 
> - OVMF IA32X64 + qemu-system-x86_64, CPU hotplug/hot-unplug with SMM,
>    intermixed with ACPI S3 suspend/resume, using KVM accel
>    (regression-test);
> 
> - OVMF IA32 + qemu-system-i386, SMM enabled, using TCG accel; verified the
>    register block switch and the present/possible CPU counting through the
>    modern hotplug interface, during OVMF boot (bugfix test);
> 
> - I do not have any testcase (guest payload) for regression-testing CPU
>    hotplug through the *legacy* CPU hotplug register block.
> 
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Ani Sinha <ani@anisinha.ca>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-stable@nongnu.org
> Ref: "IO port write width clamping differs between TCG and KVM"
> Link: http://mid.mail-archive.com/aaedee84-d3ed-a4f9-21e7-d221a28d1683@redhat.com
> Link: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg00199.html
> Reported-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> ---
> 
> Notes:
>      This should be applied to:
>      
>      - stable-5.2 (new branch)
>      
>      - stable-6.2 (new branch)
>      
>      - stable-7.2 (new branch)
>      
>      whichever is still considered maintained, as there is currently *no*
>      public QEMU release in which the modern CPU hotplug register block
>      works, when using TCG acceleration.  v5.0.0 works, but that minor
>      release has been obsoleted by v5.2.0, which does not work.
> 
>   hw/acpi/cpu_hotplug.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
> index 53654f863830..ff14c3f4106f 100644
> --- a/hw/acpi/cpu_hotplug.c
> +++ b/hw/acpi/cpu_hotplug.c
> @@ -52,6 +52,9 @@ static const MemoryRegionOps AcpiCpuHotplug_ops = {
>       .endianness = DEVICE_LITTLE_ENDIAN,
>       .valid = {
>           .min_access_size = 1,
> +        .max_access_size = 4,
> +    },
> +    .impl = {
>           .max_access_size = 1,

Arguably:
Fixes: b8622725cf ("acpi_piix4: Add infrastructure to send CPU hot-plug 
GPE to guest")

>       },
>   };

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


