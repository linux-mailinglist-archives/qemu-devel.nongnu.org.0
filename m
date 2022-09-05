Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FFE5ACA89
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 08:26:21 +0200 (CEST)
Received: from localhost ([::1]:45412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV5Yq-0004Mv-K8
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 02:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oV5VX-0002w9-Ib
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 02:22:55 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oV5VV-0002tP-A6
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 02:22:55 -0400
Received: by mail-pl1-x634.google.com with SMTP id jm11so7537139plb.13
 for <qemu-devel@nongnu.org>; Sun, 04 Sep 2022 23:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:from:to:cc:subject:date;
 bh=MuD40hdKA6Ni71c4TNZKu3GJdvuQ/GVSYx6A8RQWM8o=;
 b=jVfGK1+lKf19oA5Rq1fpj+bXcsYkEXP3FhWyiSVkeevsC7EgRfICVyRV5E6bxBzHyA
 q57XF/MIj96WgeCvW9Xbq5WNhvZIsVT0PYDpVOc1WkK/TzwfMFCNJ0g1+vAV0v39HG90
 YxjvecixSN5KtEpI5RuDNHn8EQVDlXGjYHzdlFY5GKgHjE7EeiT0nFLg+QBCouF8yZwq
 mfhL9ExXPbI7+QTS2pufYG/uQQGm6em+YY0IWM7m2f2YyMrXe5ZiUx7t8pll5K4oOnpA
 sDKw6tmOiILiEq0Ww7u0idXCxrZY3906rFhQzS2yONhi9zwDc1tgEsq51OP0cDOz2YGN
 8tYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date;
 bh=MuD40hdKA6Ni71c4TNZKu3GJdvuQ/GVSYx6A8RQWM8o=;
 b=JyE8N2XuINqx2zuwKJLzZLcAFR+vvB18ZqSHSl859Wg+doy4CirIaqjD6PDn/SjTVX
 Wc8nQQM1zC21TKDBE1Nzlpny7Wqa4GbEt+8wHWcetP5blmrPA1VUNTALAsONwBG369Ut
 Tszz/XzouyG1xq0buDGcbOjPl3VrT/dZpt0okMAbzVatM/beQe8Q/NZFX2Av+CbOPPP0
 4+ycixRz4kK64zlIJT14d3i4kzW+GOzf+Tj2kowfn7VIuo3CFQObkS7L6fAZ3I2jahzA
 pJTwADrwceVigK4zVaiR8Q7UrRvre/3tUaq+6uuj7Wz59FkYCIFT83clXavYJdliTht/
 oesQ==
X-Gm-Message-State: ACgBeo2gswftrn6baY2LCeRsF9ATa2wyCHfcbAk88rFMftmd0Ax4Ue4O
 qpgsnARIfmf1Z+DPkQkKVPYaaA==
X-Google-Smtp-Source: AA6agR7t0ksWN3iTndoTYekf+URjUSnPmB2aeC7ymtHCu/BL5eKL6feggTxvb2m2ECSWN5a1JMqK2A==
X-Received: by 2002:a17:902:d4c7:b0:174:8eae:b265 with SMTP id
 o7-20020a170902d4c700b001748eaeb265mr38997633plg.9.1662358970171; 
 Sun, 04 Sep 2022 23:22:50 -0700 (PDT)
Received: from [172.16.185.128] ([115.96.134.171])
 by smtp.googlemail.com with ESMTPSA id
 a5-20020a621a05000000b0053679effc03sm6953984pfa.149.2022.09.04.23.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 23:22:49 -0700 (PDT)
Date: Mon, 5 Sep 2022 11:52:18 +0530 (IST)
From: Ani Sinha <ani@anisinha.ca>
To: Juan Quintela <quintela@redhat.com>
cc: qemu-devel@nongnu.org, Bandan Das <bsd@redhat.com>, 
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 2/8] bios-tables-test: Sort all x86_64 tests by machine
 type
In-Reply-To: <20220902173452.1904-3-quintela@redhat.com>
Message-ID: <1df0acc4-4b63-8846-8c33-59a66c31bf88@anisinha.ca>
References: <20220902173452.1904-1-quintela@redhat.com>
 <20220902173452.1904-3-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::634;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On Fri, 2 Sep 2022, Juan Quintela wrote:

> No code change here, just move test around.
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  tests/qtest/bios-tables-test.c | 60 +++++++++++++++++++---------------
>  1 file changed, 33 insertions(+), 27 deletions(-)
>
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 1e808b0864..757db2bc40 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1766,11 +1766,6 @@ int main(int argc, char *argv[])
>          if (ret) {
>              return ret;
>          }
> -        qtest_add_func("acpi/q35/oem-fields", test_acpi_q35_oem_fields);
> -        if (tpm_model_is_available("-machine q35", "tpm-tis")) {
> -            qtest_add_func("acpi/q35/tpm2-tis", test_acpi_q35_tcg_tpm2_tis);
> -            qtest_add_func("acpi/q35/tpm12-tis", test_acpi_q35_tcg_tpm12_tis);
> -        }
>          qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
>          qtest_add_func("acpi/piix4/oem-fields", test_acpi_piix4_oem_fields);
>          qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
> @@ -1780,48 +1775,68 @@ int main(int argc, char *argv[])
>                         test_acpi_piix4_no_bridge_hotplug);
>          qtest_add_func("acpi/piix4/pci-hotplug/off",
>                         test_acpi_piix4_no_acpi_pci_hotplug);
> -        qtest_add_func("acpi/q35", test_acpi_q35_tcg);
> -        qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
> -        qtest_add_func("acpi/q35/multif-bridge", test_acpi_q35_multif_bridge);
> -        qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
>          qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
> -        qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
> -        qtest_add_func("acpi/q35/smbus/ipmi", test_acpi_q35_tcg_smbus_ipmi);
>          qtest_add_func("acpi/piix4/cpuhp", test_acpi_piix4_tcg_cphp);
> -        qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_tcg_cphp);
>          qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp);
> -        qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
>          qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem);
> -        qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
>          qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm);
>          qtest_add_func("acpi/piix4/smm-compat",
>                         test_acpi_piix4_tcg_smm_compat);
>          qtest_add_func("acpi/piix4/smm-compat-nosmm",
>                         test_acpi_piix4_tcg_smm_compat_nosmm);
>          qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_tcg_nohpet);
> +        qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
> +        qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
> +#ifdef CONFIG_POSIX
> +        qtest_add_func("acpi/piix4/acpierst", test_acpi_piix4_acpi_erst);
> +#endif
> +
> +        qtest_add_func("acpi/q35", test_acpi_q35_tcg);
> +        qtest_add_func("acpi/q35/oem-fields", test_acpi_q35_oem_fields);
> +        if (tpm_model_is_available("-machine q35", "tpm-tis")) {
> +            qtest_add_func("acpi/q35/tpm2-tis", test_acpi_q35_tcg_tpm2_tis);
> +            qtest_add_func("acpi/q35/tpm12-tis", test_acpi_q35_tcg_tpm12_tis);
> +        }
> +        qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
> +        qtest_add_func("acpi/q35/multif-bridge", test_acpi_q35_multif_bridge);
> +        qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
> +        qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
> +        qtest_add_func("acpi/q35/smbus/ipmi", test_acpi_q35_tcg_smbus_ipmi);
> +        qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_tcg_cphp);
> +        qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
> +        qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
>          qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
>          qtest_add_func("acpi/q35/smm-compat",
>                         test_acpi_q35_tcg_smm_compat);
>          qtest_add_func("acpi/q35/smm-compat-nosmm",
>                         test_acpi_q35_tcg_smm_compat_nosmm);
>          qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
> -        qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
>          qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
> -        qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
>          qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
>  #ifdef CONFIG_POSIX
> -        qtest_add_func("acpi/piix4/acpierst", test_acpi_piix4_acpi_erst);
>          qtest_add_func("acpi/q35/acpierst", test_acpi_q35_acpi_erst);
>  #endif
>          qtest_add_func("acpi/q35/applesmc", test_acpi_q35_applesmc);
>          qtest_add_func("acpi/q35/pvpanic-isa", test_acpi_q35_pvpanic_isa);
> +        if (has_tcg) {
> +            qtest_add_func("acpi/q35/ivrs", test_acpi_q35_tcg_ivrs);
> +        }
> +        if (has_kvm) {
> +            qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
> +            qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
> +        }
> +        qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
> +#ifdef CONFIG_POSIX
> +        qtest_add_func("acpi/q35/cxl", test_acpi_q35_cxl);
> +#endif
> +        qtest_add_func("acpi/q35/slic", test_acpi_q35_slic);
> +
>          qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
>          qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
>          qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
>          qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2_tcg);
>          qtest_add_func("acpi/microvm/oem-fields", test_acpi_microvm_oem_fields);
>          if (has_tcg) {
> -            qtest_add_func("acpi/q35/ivrs", test_acpi_q35_tcg_ivrs);
>              if (strcmp(arch, "x86_64") == 0) {
>                  qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
>  #ifdef CONFIG_POSIX
> @@ -1829,15 +1844,6 @@ int main(int argc, char *argv[])
>  #endif
>              }
>          }
> -        if (has_kvm) {
> -            qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
> -            qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
> -        }
> -        qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
> -#ifdef CONFIG_POSIX
> -        qtest_add_func("acpi/q35/cxl", test_acpi_q35_cxl);
> -#endif
> -        qtest_add_func("acpi/q35/slic", test_acpi_q35_slic);
>      } else if (strcmp(arch, "aarch64") == 0) {
>          if (has_tcg) {
>              qtest_add_func("acpi/virt", test_acpi_virt_tcg);
> --
> 2.37.2
>
>

