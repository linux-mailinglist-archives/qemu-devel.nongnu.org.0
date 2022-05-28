Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAF9536AE7
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 07:23:58 +0200 (CEST)
Received: from localhost ([::1]:50224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuovd-0000Cz-Et
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 01:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nuou9-0007xK-2f
 for qemu-devel@nongnu.org; Sat, 28 May 2022 01:22:26 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:38567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nuou7-0001Xt-2P
 for qemu-devel@nongnu.org; Sat, 28 May 2022 01:22:24 -0400
Received: by mail-pl1-x630.google.com with SMTP id n18so5840566plg.5
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 22:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=M7awhN48pezK3Ezitvi64aNfs257vZr4B3g+2N63bLg=;
 b=B3t9gSt9MK26S3/lSyCMxi6qfha1mVzdQb6bNg3Us7vNNk2E1DvBcCKOaPvIrKKSPE
 NzLuNHIAZhWnEDmk9b/N7mhg6h/L0gcTVOyZ/iLTVEC3rqZAPuWP+VeB/u8eAgzhAqlF
 ZQ5wMdqioEQrKCYBPC+DFnXRdh2CaBs/wxYAJb5HMlgdjJNIXnfWJMEcYs5J1nnJ89YO
 GTapSRLH4M2Czmrir8aBzBTMOB/h2TKXfZuOk8TpLgfro/vgyz02VmaghMmx3cWJ9qiT
 0p8AVsEjRRHgYa/O33JZFlQWMO0DlUWjtWcQSFKc4IOMf87KxsipUp+SezF62d2gugwP
 u+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=M7awhN48pezK3Ezitvi64aNfs257vZr4B3g+2N63bLg=;
 b=MVSVQJ/CSNavwqh89D3pl/3gxlEz9X4EP0Shj515Ywd+2wGwUADiw5czDUkO+cXwHF
 of3mZdBYP7y4NSNKnNfvo3coP2aze8gFDPNfnXx5A/ivUCTHWAlOsC+XK4jQ1EwhWDYQ
 VTHxiYgIulFjZCdw0HYJ4mB8g0xMvMq6qY8vlo0Ln253p8pFuA+TnaILOIh5qkiJnZ59
 OHD7z44jgZ8BYSGv7XVGg0d6e5zOfcQc2TqzCqHmk4OPSwExr0H2Y17rYGAZC0ZdZm08
 Y139QJ9ffK3bTuGpUdUZpLHMuLMHJX/I8HgI8rEMr4iXVISWSD3sJViE0u+yqf/vBxyd
 8iPQ==
X-Gm-Message-State: AOAM532eJND1KpS3QDOF1fJRrY8hf9HuxECHb8sYYXv/i3hnh98vvNEB
 QmEkyCaChQlZrao6z2Gl3aXQ7A==
X-Google-Smtp-Source: ABdhPJy/Geuu4L1ToFNFOaoVZQvvOdrgsK7LSXXTmxvhre7FTgh2L2gyocPAN/2mFt9s+am+A+XydQ==
X-Received: by 2002:a17:902:e883:b0:163:7abd:d06b with SMTP id
 w3-20020a170902e88300b001637abdd06bmr10980458plg.51.1653715341565; 
 Fri, 27 May 2022 22:22:21 -0700 (PDT)
Received: from anisinha-lenovo ([116.73.134.210])
 by smtp.googlemail.com with ESMTPSA id
 76-20020a62174f000000b0051841842095sm4588485pfx.144.2022.05.27.22.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 22:22:21 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Sat, 28 May 2022 10:52:15 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Julia Suvorova <jusual@redhat.com>
cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH 4/5] bios-tables-test: add test for number of cores > 255
In-Reply-To: <20220527165651.28092-5-jusual@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2205281039380.153682@anisinha-lenovo>
References: <20220527165651.28092-1-jusual@redhat.com>
 <20220527165651.28092-5-jusual@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::630;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x630.google.com
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



On Fri, 27 May 2022, Julia Suvorova wrote:

> The new test is run with a large number of cpus and checks if the
> core_count field in smbios_cpu_test (structure type 4) is correct.
>
> Choose q35 as it allows to run with -smp > 255.
>
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> ---
>  tests/qtest/bios-tables-test.c | 35 +++++++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
>
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 0ba9d749a5..f2464adaa0 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -100,6 +100,8 @@ typedef struct {
>      smbios_entry_point smbios_ep_table;
>      uint16_t smbios_cpu_max_speed;
>      uint16_t smbios_cpu_curr_speed;
> +    uint8_t smbios_core_count;
> +    uint16_t smbios_core_count2;
>      uint8_t *required_struct_types;
>      int required_struct_types_len;
>      QTestState *qts;
> @@ -640,8 +642,9 @@ static inline bool smbios_single_instance(uint8_t type)
>
>  static bool smbios_cpu_test(test_data *data, uint32_t addr)
>  {
> +    uint8_t real_cc, expect_cc = data->smbios_core_count;
> +    uint16_t real, real_cc2, expect_cc2 = data->smbios_core_count2;
>      uint16_t expect_speed[2];
> -    uint16_t real;

while you are at it, I suggest renaming this to real_speed or some such so
that its better redeable.

>      int offset[2];
>      int i;
>
> @@ -660,6 +663,20 @@ static bool smbios_cpu_test(test_data *data, uint32_t addr)
>          }
>      }
>
> +    real_cc = qtest_readb(data->qts, addr + offsetof(struct smbios_type_4, core_count));
> +    real_cc2 = qtest_readw(data->qts, addr + offsetof(struct smbios_type_4, core_count2));
> +
> +    if (expect_cc && (real_cc != expect_cc)) {

I think better to say if ((expect_cc < 256) && (real_cc != expect_cc))

> +        fprintf(stderr, "Unexpected SMBIOS CPU count: real %u expect %u\n",
> +                real_cc, expect_cc);
> +        return false;
> +    }
> +    if ((expect_cc == 0xFF) && (real_cc2 != expect_cc2)) {
> +        fprintf(stderr, "Unexpected SMBIOS CPU count2: real %u expect %u\n",
> +                real_cc2, expect_cc2);
> +        return false;
> +    }
> +
>      return true;
>  }
>
> @@ -905,6 +922,21 @@ static void test_acpi_q35_tcg(void)
>      free_test_data(&data);
>  }
>
> +static void test_acpi_q35_tcg_core_count2(void)
> +{
> +    test_data data = {
> +        .machine = MACHINE_Q35,
> +        .variant = ".core-count2",
> +        .required_struct_types = base_required_struct_types,
> +        .required_struct_types_len = ARRAY_SIZE(base_required_struct_types),
> +        .smbios_core_count = 0xFF,
> +        .smbios_core_count2 = 275,
> +    };
> +
> +    test_acpi_one("-machine smbios-entry-point-type=64 -smp 275", &data);
> +    free_test_data(&data);
> +}
> +
>  static void test_acpi_q35_tcg_bridge(void)
>  {
>      test_data data;
> @@ -1787,6 +1819,7 @@ int main(int argc, char *argv[])
>          qtest_add_func("acpi/piix4/pci-hotplug/off",
>                         test_acpi_piix4_no_acpi_pci_hotplug);
>          qtest_add_func("acpi/q35", test_acpi_q35_tcg);
> +        qtest_add_func("acpi/q35/core-count2", test_acpi_q35_tcg_core_count2);

How about checking thread count as well in the same test or in a
different test?

>          qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
>          qtest_add_func("acpi/q35/multif-bridge", test_acpi_q35_multif_bridge);
>          qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
> --
> 2.35.1
>
>

