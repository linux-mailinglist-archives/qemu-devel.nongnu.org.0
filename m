Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DDC371560
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 14:47:19 +0200 (CEST)
Received: from localhost ([::1]:46604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldXyo-0003w2-6G
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 08:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldXwI-0003Cp-7W
 for qemu-devel@nongnu.org; Mon, 03 May 2021 08:44:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldXwF-0008PB-Jx
 for qemu-devel@nongnu.org; Mon, 03 May 2021 08:44:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620045877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TDIFMIv2HDgnwSB56LAPxJuCIXyOpTcjE3AUuJERz04=;
 b=Ea1Z3SPBO/sSb+cVifJMRlCsEu9V59FeCky/jjOX3t9BSUap2ZZZ3w75t0DH9r7HsuDn5y
 hsyyaaSkkhdHx+tHL6u4X9zJm5BI3d3tJzPLF9quuuqkbCIE1GzJMKPNcuuaCnhxodRdJA
 QR0LtyZ0Q1Mx47+RbAGf0eBW0oF9iOk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-bJ1ZRVWeN_-8oV0m-T3hOA-1; Mon, 03 May 2021 08:44:36 -0400
X-MC-Unique: bJ1ZRVWeN_-8oV0m-T3hOA-1
Received: by mail-wr1-f71.google.com with SMTP id
 x10-20020adfc18a0000b029010d83c83f2aso3868409wre.8
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 05:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TDIFMIv2HDgnwSB56LAPxJuCIXyOpTcjE3AUuJERz04=;
 b=c0oX0HItjgOlWXOrdopJzQtK3azin7XGX5LszJgxWN3uQOF4wUs34E7cyfbleNsnRI
 uboroFCaEzMwc1prUt5HCTus/s8te0SHbuF59rewaApYE9QZGXloDHSxDAs/jrtmRsLF
 BzgLnn8v9hcT8+FJEq8XjAN6LwUKbdZA5tAeLSiXiNs2wmWSIygnGwUHkY8FwvALiczC
 cJ9z6Ap7/+UDAhLFMPV7lIV5KfPHWPDt+/B1u0vxF+sgt3dEsM/eTXlExD8raGpUdKZ3
 LBLhAz21wgi//JHgEK7+VrNa31eTKw4ivQGhulaYUyj/ayMPMnkil1+JGdqX/pJuSxFJ
 Aw+A==
X-Gm-Message-State: AOAM533vmC1pjK9ZpTpaZY7TmRVnLo4ee6+tPNvMKThPPNICZQ6enSJw
 WC+B8i6RxNSKzxRE9YGh9pO+lr68b/N1Ke/PBQpFJSfES1W58uFZcJ4LFixUeEIDL0vimk/0/nc
 uIu9MkBVhNbJdOAo=
X-Received: by 2002:a05:600c:d6:: with SMTP id
 u22mr17407639wmm.161.1620045875136; 
 Mon, 03 May 2021 05:44:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrwRv/7aJL608XYVXjEzfXFb5CA428FaCg2R7cOJ5Ac0/A7o/aBrQmhMxvD/AWWjIH0ss9/g==
X-Received: by 2002:a05:600c:d6:: with SMTP id
 u22mr17407602wmm.161.1620045874835; 
 Mon, 03 May 2021 05:44:34 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id f18sm19294822wmg.26.2021.05.03.05.44.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 05:44:34 -0700 (PDT)
Subject: Re: [PATCH v5 08/10] qtest/bios-tables-test: Make test
 build-independent from accelerator
To: Igor Mammedov <imammedo@redhat.com>
References: <20210501223638.510712-1-philmd@redhat.com>
 <20210501223638.510712-9-philmd@redhat.com>
 <20210503143639.57e7c52c@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <dd561115-0586-3920-6236-32a3abd043f2@redhat.com>
Date: Mon, 3 May 2021 14:44:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503143639.57e7c52c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor,

On 5/3/21 2:36 PM, Igor Mammedov wrote:
> On Sun,  2 May 2021 00:36:36 +0200
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> Now than we can probe if the TCG accelerator is available
>> at runtime with a QMP command, do it once at the beginning
>> and only register the tests we can run.
>> We can then replace the #ifdef'ry by an assertion.
>>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  tests/qtest/bios-tables-test.c | 99 ++++++++++++++++++----------------
>>  1 file changed, 52 insertions(+), 47 deletions(-)
>>
>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
>> index 156d4174aa3..a4c7bddf6f3 100644
>> --- a/tests/qtest/bios-tables-test.c
>> +++ b/tests/qtest/bios-tables-test.c
>> @@ -97,6 +97,7 @@ typedef struct {
>>      QTestState *qts;
>>  } test_data;
>>  
>> +static bool tcg_accel_available;
>>  static char disk[] = "tests/acpi-test-disk-XXXXXX";
>>  static const char *data_dir = "tests/data/acpi";
>>  #ifdef CONFIG_IASL
>> @@ -718,15 +719,11 @@ static void test_acpi_one(const char *params, test_data *data)
>>      char *args;
>>      bool use_uefi = data->uefi_fl1 && data->uefi_fl2;
>>  
>> -#ifndef CONFIG_TCG
>> -    if (data->tcg_only) {
>> -        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
>> -        return;
>> -    }
>> -#endif /* CONFIG_TCG */
>> +    assert(!data->tcg_only || tcg_accel_available);
>>  
>>      args = test_acpi_create_args(data, params, use_uefi);
>>      data->qts = qtest_init(args);
>> +
> stray new line?

Oops.

> 
>>      test_acpi_load_tables(data, use_uefi);
>>  
>>      if (getenv(ACPI_REBUILD_EXPECTED_AML)) {
>> @@ -1504,6 +1501,8 @@ int main(int argc, char *argv[])
>>      const char *arch = qtest_get_arch();
>>      int ret;
>>  
>> +    tcg_accel_available = qtest_has_accel("tcg");
>> +
>>      g_test_init(&argc, &argv, NULL);
>>  
>>      if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>> @@ -1512,56 +1511,62 @@ int main(int argc, char *argv[])
>>              return ret;
>>          }
>>          qtest_add_func("acpi/q35/oem-fields", test_acpi_oem_fields_q35);
>> -        qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tcg_tpm_tis);
>> -        qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
>>          qtest_add_func("acpi/oem-fields", test_acpi_oem_fields_pc);
>> -        qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
>> +        qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
>>          qtest_add_func("acpi/piix4/pci-hotplug/no_root_hotplug",
>>                         test_acpi_piix4_no_root_hotplug);
>>          qtest_add_func("acpi/piix4/pci-hotplug/no_bridge_hotplug",
>>                         test_acpi_piix4_no_bridge_hotplug);
>>          qtest_add_func("acpi/piix4/pci-hotplug/off",
>>                         test_acpi_piix4_no_acpi_pci_hotplug);
>> -        qtest_add_func("acpi/q35", test_acpi_q35_tcg);
>> -        qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
>> -        qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
>> -        qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
>> -        qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
>> -        qtest_add_func("acpi/piix4/cpuhp", test_acpi_piix4_tcg_cphp);
>> -        qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_tcg_cphp);
>> -        qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp);
>> -        qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
>> -        qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem);
>> -        qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
>> -        qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm);
>> -        qtest_add_func("acpi/piix4/smm-compat",
>> -                       test_acpi_piix4_tcg_smm_compat);
>> -        qtest_add_func("acpi/piix4/smm-compat-nosmm",
>> -                       test_acpi_piix4_tcg_smm_compat_nosmm);
>> -        qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_tcg_nohpet);
>> -        qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
>> -        qtest_add_func("acpi/q35/smm-compat",
>> -                       test_acpi_q35_tcg_smm_compat);
>> -        qtest_add_func("acpi/q35/smm-compat-nosmm",
>> -                       test_acpi_q35_tcg_smm_compat_nosmm);
>> -        qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
>> -        qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
>> -        qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
>> -        qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
>> -        qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
>> -        qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
>> -        qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
>> -        qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
>> -        qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2_tcg);
>> -        qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
>> -        if (strcmp(arch, "x86_64") == 0) {
>> -            qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
>> +        if (tcg_accel_available) {
> 
> most of this can run without TCG if KVM is available, so why are you limiting it to TCG only
> or am I missing something?

This patch is a simple API change, these tests are already restricted by
the 'g_test_skip("TCG disabled, skipping ACPI tcg_only test");' call.

If someone is willing to send a patch to have them run without TCG, I'm
fine to rebase my series on top. Else it can also be done on top of my
series. Whichever you prefer, but I'd rather not delay Claudio's work
too long...

> 
>> +            qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tcg_tpm_tis);
>> +            qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
>> +            qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
>> +            qtest_add_func("acpi/q35", test_acpi_q35_tcg);
>> +            qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
>> +            qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
>> +            qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
>> +            qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
>> +            qtest_add_func("acpi/piix4/cpuhp", test_acpi_piix4_tcg_cphp);
>> +            qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_tcg_cphp);
>> +            qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp);
>> +            qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
>> +            qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem);
>> +            qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
>> +            qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm);
>> +            qtest_add_func("acpi/piix4/smm-compat",
>> +                           test_acpi_piix4_tcg_smm_compat);
>> +            qtest_add_func("acpi/piix4/smm-compat-nosmm",
>> +                           test_acpi_piix4_tcg_smm_compat_nosmm);
>> +            qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_tcg_nohpet);
>> +            qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
>> +            qtest_add_func("acpi/q35/smm-compat",
>> +                           test_acpi_q35_tcg_smm_compat);
>> +            qtest_add_func("acpi/q35/smm-compat-nosmm",
>> +                           test_acpi_q35_tcg_smm_compat_nosmm);
>> +            qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
>> +            qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
>> +            qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
>> +            qtest_add_func("acpi/piix4/acpihmat",
>> +                           test_acpi_piix4_tcg_acpi_hmat);
>> +            qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
>> +            qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
>> +            qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
>> +            qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
>> +            qtest_add_func("acpi/microvm/ioapic2",
>> +                           test_acpi_microvm_ioapic2_tcg);
>> +            if (strcmp(arch, "x86_64") == 0) {
>> +                qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
>> +            }
>>          }
>>      } else if (strcmp(arch, "aarch64") == 0) {
>> -        qtest_add_func("acpi/virt", test_acpi_virt_tcg);
>> -        qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
>> -        qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
>> -        qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
>> +        if (tcg_accel_available) {
>> +            qtest_add_func("acpi/virt", test_acpi_virt_tcg);
>> +            qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
>> +            qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
>> +            qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
>> +        }
>>          qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
>>      }
>>      ret = g_test_run();
> 


