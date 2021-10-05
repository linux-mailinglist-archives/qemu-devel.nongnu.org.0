Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4057422397
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 12:30:12 +0200 (CEST)
Received: from localhost ([::1]:45862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXhi7-0007ch-7e
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 06:30:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mXhfV-00062M-Iq
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 06:27:29 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:33735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mXhfT-0004wV-9h
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 06:27:29 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 cs11-20020a17090af50b00b0019fe3df3dddso1697109pjb.0
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 03:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=gmvNn8dpsEMsyigwipfxPxHmgS5i+wmu6qf+EYFE8OA=;
 b=bUO4987++naSloSkYagYtFj1osMfL6og2+pIaSSxK1vvscSw8JICX2Y0X9xPpUooHk
 2WvQxq8AwJXMOXzM8T2dbbMMoEfxI2Hk3mSNnFZ337c3oxhoNHmy68fNcJFaSHYDj8W7
 1gsjWpCv3mOl8qF022hMaxVOVoh0GR9t+ej+oYzuZqs9oI6+mgNfOtmYOWme/IGAdYqp
 vnLs45wBJ3Cegn0PcgN++r5QUBFa17thIuRkfZFO8f84jgYgW7xcR3oYLJ6M73JmoPyY
 1uwJEbGBvfGJ/c/XNyK70Zd2UF1ATpiJIKCw7I9wkkhvSyU3DSncr7aZw7tOT0qBZOjQ
 knGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=gmvNn8dpsEMsyigwipfxPxHmgS5i+wmu6qf+EYFE8OA=;
 b=wi3oV1xNpDza/GASHh2p+bhZXuWfiDuw1dAEZdoz2l82DDMK0nClgxBJSP8oKnVU3V
 T/faJrmb4/rFthLzmRIPfOtPDoGoLXAEUhI9KhwXBhG2Yi5zDnQCdaXOIN4RHQxchuut
 OaBE+6S/pf+Ftk1b/Cm5yXhdqpr9dfmSUnq0xAzvfY5J+QKWpmQ/EiYJTm7cmcqUvqSD
 cpPMXmIpBwjCB33ka5Af6nBnwDEK9DZDHW+BiPV4TQPzfsdSMYAaV+BX6NsP8iP4W0oa
 qeakrrb+eWKCMvWu03GF5ZbpRRIhIOqVsrDxNIu69Kv+Sg5dkAo5g7BgR0NfSZUNjY7z
 P9/g==
X-Gm-Message-State: AOAM530F5MNDw30xXSStl0b2fEpenvTIz39sGQCXC+0o7NMRi8lnxtpO
 g0g9RGNy1vhHT2ywuZBB3li85g==
X-Google-Smtp-Source: ABdhPJzwo5ttiHQIgOhCbDFO0CLG1okscSJezdyC4Pa0Yf3Myfaavg0QEfdBeYPd91viHQk1H1AeAA==
X-Received: by 2002:a17:90a:30b:: with SMTP id
 11mr2859972pje.136.1633429645849; 
 Tue, 05 Oct 2021 03:27:25 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.152.16])
 by smtp.googlemail.com with ESMTPSA id a28sm5158652pfg.33.2021.10.05.03.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 03:27:24 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 5 Oct 2021 15:57:17 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v4 09/11] tests/acpi: add test cases for VIOT
In-Reply-To: <20211001173358.863017-10-jean-philippe@linaro.org>
Message-ID: <alpine.DEB.2.22.394.2110051556270.820442@anisinha-lenovo>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-10-jean-philippe@linaro.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Fri, 1 Oct 2021, Jean-Philippe Brucker wrote:

> Add two test cases for VIOT, one on the q35 machine and the other on
> virt. To test complex topologies the q35 test has two PCIe buses that
> bypass the IOMMU (and are therefore not described by VIOT), and two
> buses that are translated by virtio-iommu.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

This might be a stupid question but what about virtio-mmio and single mmio
cases? I see none of your tables has nodes for those and here too you do
not add test cases for it.

> ---
>  tests/qtest/bios-tables-test.c | 38 ++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 4f11d03055..b6cb383bd9 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1403,6 +1403,42 @@ static void test_acpi_virt_tcg(void)
>      free_test_data(&data);
>  }
>
> +static void test_acpi_q35_viot(void)
> +{
> +    test_data data = {
> +        .machine = MACHINE_Q35,
> +        .variant = ".viot",
> +    };
> +
> +    /*
> +     * To keep things interesting, two buses bypass the IOMMU.
> +     * VIOT should only describes the other two buses.
> +     */
> +    test_acpi_one("-machine default_bus_bypass_iommu=on "
> +                  "-device virtio-iommu "
> +                  "-device pxb-pcie,bus_nr=0x10,id=pcie.100,bus=pcie.0 "
> +                  "-device pxb-pcie,bus_nr=0x20,id=pcie.200,bus=pcie.0,bypass_iommu=on "
> +                  "-device pxb-pcie,bus_nr=0x30,id=pcie.300,bus=pcie.0",
> +                  &data);
> +    free_test_data(&data);
> +}
> +
> +static void test_acpi_virt_viot(void)
> +{
> +    test_data data = {
> +        .machine = "virt",
> +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
> +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> +        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
> +        .ram_start = 0x40000000ULL,
> +        .scan_len = 128ULL * 1024 * 1024,
> +    };
> +
> +    test_acpi_one("-cpu cortex-a57 "
> +                  "-device virtio-iommu", &data);
> +    free_test_data(&data);
> +}
> +
>  static void test_oem_fields(test_data *data)
>  {
>      int i;
> @@ -1567,12 +1603,14 @@ int main(int argc, char *argv[])
>          if (strcmp(arch, "x86_64") == 0) {
>              qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
>          }
> +        qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
>      } else if (strcmp(arch, "aarch64") == 0) {
>          qtest_add_func("acpi/virt", test_acpi_virt_tcg);
>          qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
>          qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
>          qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
>          qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
> +        qtest_add_func("acpi/virt/viot", test_acpi_virt_viot);
>      }
>      ret = g_test_run();
>      boot_sector_cleanup(disk);
> --
> 2.33.0
>
>

