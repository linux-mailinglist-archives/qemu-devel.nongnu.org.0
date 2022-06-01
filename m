Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C438539C6C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 07:09:02 +0200 (CEST)
Received: from localhost ([::1]:48098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwGbN-0001ao-6G
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 01:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nwGZ8-0000Re-5T
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 01:06:42 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:46988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nwGZ6-0002b0-56
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 01:06:41 -0400
Received: by mail-ed1-x532.google.com with SMTP id z7so562861edm.13
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 22:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iklb6knX2HYoOLxKxgLLxpkJyRFrmTElqisxecjjy/Q=;
 b=lrwQbAvHFRTPwCqdqY42CqNuB6oS5/azs2wqXEmtuZ5BqdXYy24UNh3NR1DbOGsIMd
 xYkoD4X8sky8S3Jldh1ZBV8TpWuzZqKowQTnSnP+gRJmWve03Pmyrw6hpbHSriE6kqH6
 Q3i+I+Grt6WboEsBDAjPw2ZIuXXj4AGyuNZcrCGQUNDml4YfqR7plnL4E5Jso0/UxFQ5
 1VxUsdw/ABA4vJoJSlzcgyHLuMGIcwGOuVtz4Hi58JbuVbEM9TqliOq2Zl7Ocv1zhyk4
 XaK4GHIi1OY6a+F1hxn52CvHDQN8Gb53I5dzW/MNPZhUPFj9qTNEUZBAsDvhGZXgiZrJ
 NJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iklb6knX2HYoOLxKxgLLxpkJyRFrmTElqisxecjjy/Q=;
 b=44KBm95F9VSNgia+EQ/9a5XU8aMDPuroiOZ/Ic/UMeIB1uBIQJy7m6u5Krt5tAghIX
 pCGvgNC808ccpbTeBx41riFb51bPJSsCCq5vzdsRVtRY92SOIj/yAJ8BTzpDRL0FRqJH
 teJbiCKrLMK+HOSleHeFaWf7tnyJ7pApMVR2N47caa3jRKShAgQoDrZGFTmCco8CPzGp
 fwydtRMip53et7DgnadomMP7uNCvtglPtQ7NgcIq6KBv+Sdq9HQa1y7f9IWvnsQnwtTl
 lk1rWwPy9lhIH2Z9wKJU8O8eRdZxSLzMxFHBLxQ9sX2nj4aRhOhXe8SRIpD9vV5AklOP
 xh9Q==
X-Gm-Message-State: AOAM533uTbcGql+Wigon1YJQwmZlJLPpcsKABlDFnybbFEdTd9cMGIfW
 N6hI9wCj6/LG6PQDfCCVvmP/6ALMDIm0NsBXscTmhB2aF4c=
X-Google-Smtp-Source: ABdhPJzmd2zu5j60RxUJ/lJ6ne/Z/AekthCHJqeZVokDI2AX6nooApwQOorGJI2uRxDyPelZPq1iMEV21OFIHN+RAcY=
X-Received: by 2002:a17:907:381:b0:6fe:9ca8:c4b4 with SMTP id
 ss1-20020a170907038100b006fe9ca8c4b4mr54056081ejb.147.1654059987672; Tue, 31
 May 2022 22:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220527165651.28092-1-jusual@redhat.com>
 <20220527165651.28092-5-jusual@redhat.com>
In-Reply-To: <20220527165651.28092-5-jusual@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 1 Jun 2022 10:36:16 +0530
Message-ID: <CAARzgwz_Cg4JHcFtPe=ay+m1Hx2W8t6mwB4+xPydh+1bjKEckg@mail.gmail.com>
Subject: Re: [PATCH 4/5] bios-tables-test: add test for number of cores > 255
To: Julia Suvorova <jusual@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::532;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x532.google.com
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

On Fri, May 27, 2022 at 10:27 PM Julia Suvorova <jusual@redhat.com> wrote:
>
> The new test is run with a large number of cpus and checks if the
> core_count field in smbios_cpu_test (structure type 4) is correct.
>
> Choose q35 as it allows to run with -smp > 255.
>
> Signed-off-by: Julia Suvorova <jusual@redhat.com>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

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
>          qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
>          qtest_add_func("acpi/q35/multif-bridge", test_acpi_q35_multif_bridge);
>          qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
> --
> 2.35.1
>

