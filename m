Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 042F45AC498
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 15:58:31 +0200 (CEST)
Received: from localhost ([::1]:48500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUq8s-0006Rl-4j
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 09:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUq7s-00056r-3M
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 09:57:28 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:53106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUq7q-0000vn-2T
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 09:57:27 -0400
Received: by mail-wm1-x330.google.com with SMTP id k17so3993867wmr.2
 for <qemu-devel@nongnu.org>; Sun, 04 Sep 2022 06:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=MWWCFDXKKOtvjsNg3fhsY0bpxIxAXE5tOVhfMCqml5c=;
 b=pmuEr0BOBvBIUnZVgXelyOnTEdVycgG2/YqqPeYUVum8Gmz0vhLoMlwJrTuWrpOdWe
 UHxxq3ZTj7adeUAGrV3dnO+ysk2cuqaNFeX5iyDZPkMRAO5+LtpVHaTrG4xZ9C5OoVjd
 9WiCXKSiqBnBLiEkwiWnEmMmAs0zgqeSxjGkoDQ/HGXFIheerNnIQpbzR1l7CJfAeLvz
 /IMOD3QLhQC/uUXzKZYelJvUFWtwp22J5ZICvh1JpQ5wnghmHBfWKPPgMAd4dGIDzMLL
 Vs+WJLGplulmB8caJl864BMiwJBH4QjPnULqtYMG6akIoxp0HeRk7zibrFA0Ki+eyRAh
 Je1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=MWWCFDXKKOtvjsNg3fhsY0bpxIxAXE5tOVhfMCqml5c=;
 b=lfJT/LlFs3FqGK67u6ot6rtlO3f5MzkHb+a7kEeS7GVYpIK5RCHciot05sGDEN0tOd
 2Q5nHbPuQsdQSTfzrh6X0R9MQb/nwOy+CTLM9T4KtHGImVqRuFd9w956khgSAlvArmOt
 BlhHleUl4bzAbQaxDEvyq7ZrXHk2eau3FCwFx//vjy9swvGLp5Qd9z0Z02KBreebtPK7
 JtnUFFlk3joJGsOaUXcZMqU3QbT0eyiGak09WLGjkBh86ogKmahcxf01Nw3YWIFbdGGX
 6N48NLUapxWTQr4GcVbRb4jfAjj0CHgaXmjVy82IY4Q9hcz4dR5gsKUIUESPX0/4xe4Y
 s/2g==
X-Gm-Message-State: ACgBeo31Ru7DXsvcicWrauedtAt6FRp6VoqUEX7pMKGw0Pe3hY0UkCav
 u9nnlZdgoMH1GSvvQN4hsDA=
X-Google-Smtp-Source: AA6agR5U34HCDUCvaOg6sJPdwwoMXH+rCsrHFNyKl9MAZf2zdDr99N3ZuVY3Rvc/PjOxNZIHyLcMeQ==
X-Received: by 2002:a05:600c:2058:b0:3a5:bd96:ba16 with SMTP id
 p24-20020a05600c205800b003a5bd96ba16mr8522132wmg.37.1662299844324; 
 Sun, 04 Sep 2022 06:57:24 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a5d6505000000b00228634628f1sm2540056wru.110.2022.09.04.06.57.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Sep 2022 06:57:23 -0700 (PDT)
Message-ID: <be20d01b-2a07-2ada-afe7-584d65b605f5@amsat.org>
Date: Sun, 4 Sep 2022 15:57:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 3/8] bios-tables-test: Only run test for machine types
 compiled in
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20220902173452.1904-1-quintela@redhat.com>
 <20220902173452.1904-4-quintela@redhat.com>
In-Reply-To: <20220902173452.1904-4-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.978,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 2/9/22 19:34, Juan Quintela wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>   tests/qtest/bios-tables-test.c | 145 ++++++++++++++++++---------------
>   1 file changed, 78 insertions(+), 67 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 757db2bc40..bc216cac95 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1766,82 +1766,93 @@ int main(int argc, char *argv[])
>           if (ret) {
>               return ret;
>           }
> -        qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
> -        qtest_add_func("acpi/piix4/oem-fields", test_acpi_piix4_oem_fields);
> -        qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
> -        qtest_add_func("acpi/piix4/pci-hotplug/no_root_hotplug",
> -                       test_acpi_piix4_no_root_hotplug);
> -        qtest_add_func("acpi/piix4/pci-hotplug/no_bridge_hotplug",
> -                       test_acpi_piix4_no_bridge_hotplug);
> -        qtest_add_func("acpi/piix4/pci-hotplug/off",
> -                       test_acpi_piix4_no_acpi_pci_hotplug);
> -        qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
> -        qtest_add_func("acpi/piix4/cpuhp", test_acpi_piix4_tcg_cphp);
> -        qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp);
> -        qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem);
> -        qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm);
> -        qtest_add_func("acpi/piix4/smm-compat",
> -                       test_acpi_piix4_tcg_smm_compat);
> -        qtest_add_func("acpi/piix4/smm-compat-nosmm",
> -                       test_acpi_piix4_tcg_smm_compat_nosmm);
> -        qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_tcg_nohpet);
> -        qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
> -        qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
> +        if (qtest_has_machine(MACHINE_PC)) {

Using qtest_has_device(TYPE_PIIX4_PM) seems more appropriate, anyhow:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +            qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
> +            qtest_add_func("acpi/piix4/oem-fields", test_acpi_piix4_oem_fields);
> +            qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
> +            qtest_add_func("acpi/piix4/pci-hotplug/no_root_hotplug",
> +                           test_acpi_piix4_no_root_hotplug);
> +            qtest_add_func("acpi/piix4/pci-hotplug/no_bridge_hotplug",
> +                           test_acpi_piix4_no_bridge_hotplug);
> +            qtest_add_func("acpi/piix4/pci-hotplug/off",
> +                           test_acpi_piix4_no_acpi_pci_hotplug);
> +            qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
> +            qtest_add_func("acpi/piix4/cpuhp", test_acpi_piix4_tcg_cphp);
> +            qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp);
> +            qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem);
> +            qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm);
> +            qtest_add_func("acpi/piix4/smm-compat",
> +                           test_acpi_piix4_tcg_smm_compat);
> +            qtest_add_func("acpi/piix4/smm-compat-nosmm",
> +                           test_acpi_piix4_tcg_smm_compat_nosmm);
> +            qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_tcg_nohpet);
> +            qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
> +            qtest_add_func("acpi/piix4/acpihmat",
> +                           test_acpi_piix4_tcg_acpi_hmat);
>   #ifdef CONFIG_POSIX
> -        qtest_add_func("acpi/piix4/acpierst", test_acpi_piix4_acpi_erst);
> +            qtest_add_func("acpi/piix4/acpierst", test_acpi_piix4_acpi_erst);
>   #endif
> -
> -        qtest_add_func("acpi/q35", test_acpi_q35_tcg);
> -        qtest_add_func("acpi/q35/oem-fields", test_acpi_q35_oem_fields);
> -        if (tpm_model_is_available("-machine q35", "tpm-tis")) {
> -            qtest_add_func("acpi/q35/tpm2-tis", test_acpi_q35_tcg_tpm2_tis);
> -            qtest_add_func("acpi/q35/tpm12-tis", test_acpi_q35_tcg_tpm12_tis);
>           }
> -        qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
> -        qtest_add_func("acpi/q35/multif-bridge", test_acpi_q35_multif_bridge);
> -        qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
> -        qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
> -        qtest_add_func("acpi/q35/smbus/ipmi", test_acpi_q35_tcg_smbus_ipmi);
> -        qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_tcg_cphp);
> -        qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
> -        qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
> -        qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
> -        qtest_add_func("acpi/q35/smm-compat",
> -                       test_acpi_q35_tcg_smm_compat);
> -        qtest_add_func("acpi/q35/smm-compat-nosmm",
> -                       test_acpi_q35_tcg_smm_compat_nosmm);
> -        qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
> -        qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
> -        qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
> +        if (qtest_has_machine(MACHINE_Q35)) {
> +            qtest_add_func("acpi/q35", test_acpi_q35_tcg);
> +            qtest_add_func("acpi/q35/oem-fields", test_acpi_q35_oem_fields);
> +            if (tpm_model_is_available("-machine q35", "tpm-tis")) {
> +                qtest_add_func("acpi/q35/tpm2-tis", test_acpi_q35_tcg_tpm2_tis);
> +                qtest_add_func("acpi/q35/tpm12-tis",
> +                               test_acpi_q35_tcg_tpm12_tis);
> +            }
> +            qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
> +            qtest_add_func("acpi/q35/multif-bridge",
> +                           test_acpi_q35_multif_bridge);
> +            qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
> +            qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
> +            qtest_add_func("acpi/q35/smbus/ipmi", test_acpi_q35_tcg_smbus_ipmi);
> +            qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_tcg_cphp);
> +            qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
> +            qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
> +            qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
> +            qtest_add_func("acpi/q35/smm-compat",
> +                           test_acpi_q35_tcg_smm_compat);
> +            qtest_add_func("acpi/q35/smm-compat-nosmm",
> +                           test_acpi_q35_tcg_smm_compat_nosmm);
> +            qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
> +            qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
> +            qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
>   #ifdef CONFIG_POSIX
> -        qtest_add_func("acpi/q35/acpierst", test_acpi_q35_acpi_erst);
> +            qtest_add_func("acpi/q35/acpierst", test_acpi_q35_acpi_erst);
>   #endif
> -        qtest_add_func("acpi/q35/applesmc", test_acpi_q35_applesmc);
> -        qtest_add_func("acpi/q35/pvpanic-isa", test_acpi_q35_pvpanic_isa);
> -        if (has_tcg) {
> -            qtest_add_func("acpi/q35/ivrs", test_acpi_q35_tcg_ivrs);
> -        }
> -        if (has_kvm) {
> -            qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
> -            qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
> -        }
> -        qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
> +            qtest_add_func("acpi/q35/applesmc", test_acpi_q35_applesmc);
> +            qtest_add_func("acpi/q35/pvpanic-isa", test_acpi_q35_pvpanic_isa);
> +            if (has_tcg) {
> +                qtest_add_func("acpi/q35/ivrs", test_acpi_q35_tcg_ivrs);
> +            }
> +            if (has_kvm) {
> +                qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
> +                qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
> +            }
> +            qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
>   #ifdef CONFIG_POSIX
> -        qtest_add_func("acpi/q35/cxl", test_acpi_q35_cxl);
> +            qtest_add_func("acpi/q35/cxl", test_acpi_q35_cxl);
>   #endif
> -        qtest_add_func("acpi/q35/slic", test_acpi_q35_slic);
> -
> -        qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
> -        qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
> -        qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
> -        qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2_tcg);
> -        qtest_add_func("acpi/microvm/oem-fields", test_acpi_microvm_oem_fields);
> -        if (has_tcg) {
> -            if (strcmp(arch, "x86_64") == 0) {
> -                qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
> +            qtest_add_func("acpi/q35/slic", test_acpi_q35_slic);
> +        }
> +        if (qtest_has_machine("microvm")) {
> +            qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
> +            qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
> +            qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
> +            qtest_add_func("acpi/microvm/ioapic2",
> +                           test_acpi_microvm_ioapic2_tcg);
> +            qtest_add_func("acpi/microvm/oem-fields",
> +                           test_acpi_microvm_oem_fields);
> +            if (has_tcg) {
> +                if (strcmp(arch, "x86_64") == 0) {
> +                    qtest_add_func("acpi/microvm/pcie",
> +                                   test_acpi_microvm_pcie_tcg);
>   #ifdef CONFIG_POSIX
> -                qtest_add_func("acpi/microvm/acpierst", test_acpi_microvm_acpi_erst);
> +                    qtest_add_func("acpi/microvm/acpierst",
> +                                   test_acpi_microvm_acpi_erst);
>   #endif
> +                }
>               }
>           }
>       } else if (strcmp(arch, "aarch64") == 0) {


