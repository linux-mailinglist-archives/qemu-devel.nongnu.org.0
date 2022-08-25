Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 567425A0B1B
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 10:11:17 +0200 (CEST)
Received: from localhost ([::1]:58284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR7xL-0006wb-NT
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 04:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oR7js-0007Mq-D2
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 03:57:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oR7jm-0002cq-Tk
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 03:57:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661414233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jqklLx1VxiXg0Xs7Onl50FHdqEfdl/bv/6HdAzq0e6g=;
 b=Dh/79mWMhBsRJL6gxmvvPsqMS/9F73ly8YflmAyCmaecllwlmikwTfiWIAXdOoyM6mIxBK
 e153YF2HkpUM2dfeiiYsCt7A9ZeTmxsPEQg1fBb5jCSGy+h8SUwQ2pRUu2pu9OjtcjA02Y
 +DBP6istCFqToxEFBIyX6vUMrTVEWYw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-Rzf8bdp9P9uvuQ_N_rQQWw-1; Thu, 25 Aug 2022 03:57:12 -0400
X-MC-Unique: Rzf8bdp9P9uvuQ_N_rQQWw-1
Received: by mail-ej1-f70.google.com with SMTP id
 gn32-20020a1709070d2000b0073d7a2dbc62so3780160ejc.14
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 00:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=jqklLx1VxiXg0Xs7Onl50FHdqEfdl/bv/6HdAzq0e6g=;
 b=Vfw+bQAF41JqLVGGXldKlTKTTWbs8ezOScYwsml6906+HmheydKAimHxRFJg13+mO6
 WCOqAF6dq4e1RhTp4Yb6C6qJNINPI4r257o+Tdi7BDWK6H8KRE5G7nuU3qY28BvCC0kP
 WzMpR7hnUAFF14NppOghC8PsuIvLo/oZ9ufMk0IjOZZ3q6YnAtSlM4nnh/2oEgRWrhk8
 Ih3SitvN6bkLb3s+weoSG5dzkx0Y/eu1ORxkhbpbbJEJNF5iCC78aZwF8BYD7mcxTc4E
 /KzgJ8aA7TQ3sTtJbpMinY7SVvJclgpcGm8xkFyisJYTzkYwTw3NnBpUgblzpH6HGl3k
 U1dQ==
X-Gm-Message-State: ACgBeo28l/W43cEi8+iYMVx8zetrbQWma5AODdRZGu5moAXwBfVvJ+rH
 4hE2ZopxvLQhHhiSODSX/Q7Wy1GQ36Gg9eYiKeZC/3qw2Ri9dz3hLWY9nPOypSK2XEabeiGR3GR
 nBjPpSuhiy3LGlYw=
X-Received: by 2002:a05:6402:368c:b0:446:48d9:2be with SMTP id
 ej12-20020a056402368c00b0044648d902bemr2078548edb.167.1661414231080; 
 Thu, 25 Aug 2022 00:57:11 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7EQE34gvPorkOt1UTawL6PAlvCkWj4GHtsNIP6CsWTMRr8H6UXfXdpGtbeh0Qs8Y9Qf7cNzA==
X-Received: by 2002:a05:6402:368c:b0:446:48d9:2be with SMTP id
 ej12-20020a056402368c00b0044648d902bemr2078533edb.167.1661414230819; 
 Thu, 25 Aug 2022 00:57:10 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 ec43-20020a0564020d6b00b0043d5c9281a3sm4235127edb.96.2022.08.25.00.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 00:57:10 -0700 (PDT)
Date: Thu, 25 Aug 2022 09:57:09 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <ani@anisinha.ca>
Subject: Re: [PATCH v2 4/5] bios-tables-test: add test for number of cores >
 255
Message-ID: <20220825095709.4a949ea7@redhat.com>
In-Reply-To: <20220731162141.178443-5-jusual@redhat.com>
References: <20220731162141.178443-1-jusual@redhat.com>
 <20220731162141.178443-5-jusual@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Sun, 31 Jul 2022 18:21:40 +0200
Julia Suvorova <jusual@redhat.com> wrote:

> The new test is run with a large number of cpus and checks if the
> core_count field in smbios_cpu_test (structure type 4) is correct.
> 
> Choose q35 as it allows to run with -smp > 255.
> 
> Signed-off-by: Julia Suvorova <jusual@redhat.com>

pls, run checkpatch on patches and fix up whatever it complains about
before posting

> ---
>  tests/qtest/bios-tables-test.c | 53 +++++++++++++++++++++++++---------
>  1 file changed, 40 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index e352d5249f..cebfa430ac 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -92,6 +92,8 @@ typedef struct {
>      SmbiosEntryPoint smbios_ep_table;
>      uint16_t smbios_cpu_max_speed;
>      uint16_t smbios_cpu_curr_speed;
> +    uint8_t smbios_core_count;
> +    uint16_t smbios_core_count2;
>      uint8_t *required_struct_types;
>      int required_struct_types_len;
>      QTestState *qts;
> @@ -631,29 +633,38 @@ static inline bool smbios_single_instance(uint8_t type)
>      }
>  }
>  
> -static bool smbios_cpu_test(test_data *data, uint32_t addr)
> +static void smbios_cpu_test(test_data *data, uint32_t addr)
>  {
> -    uint16_t expect_speed[2];
> -    uint16_t real;
> +    uint8_t core_count, expected_core_count = data->smbios_core_count;
> +    uint16_t speed, core_count2, expected_core_count2 = data->smbios_core_count2;
> +    uint16_t expected_speed[2];
>      int offset[2];
>      int i;
>  
>      /* Check CPU speed for backward compatibility */
>      offset[0] = offsetof(struct smbios_type_4, max_speed);
>      offset[1] = offsetof(struct smbios_type_4, current_speed);
> -    expect_speed[0] = data->smbios_cpu_max_speed ? : 2000;
> -    expect_speed[1] = data->smbios_cpu_curr_speed ? : 2000;
> +    expected_speed[0] = data->smbios_cpu_max_speed ? : 2000;
> +    expected_speed[1] = data->smbios_cpu_curr_speed ? : 2000;
>  
>      for (i = 0; i < 2; i++) {
> -        real = qtest_readw(data->qts, addr + offset[i]);
> -        if (real != expect_speed[i]) {
> -            fprintf(stderr, "Unexpected SMBIOS CPU speed: real %u expect %u\n",
> -                    real, expect_speed[i]);
> -            return false;
> -        }
> +        speed = qtest_readw(data->qts, addr + offset[i]);
> +        g_assert_cmpuint(speed, ==, expected_speed[i]);
>      }
>  
> -    return true;
> +    core_count = qtest_readb(data->qts,
> +                             addr + offsetof(struct smbios_type_4, core_count));
> +    core_count2 = qtest_readw(data->qts,
> +                              addr + offsetof(struct smbios_type_4, core_count2));

it doesn't really matter here, that we read bogus core_count2 in case of v2 tables,
but to be cleaner I'd move reads above below respective 'if's 

> +    if (expected_core_count) {
> +        g_assert_cmpuint(core_count, ==, expected_core_count);
> +    }
> +
> +    /* Core Count has reached its limit, checking Core Count 2 */
> +    if (expected_core_count == 0xFF && expected_core_count2) {
> +        g_assert_cmpuint(core_count2, ==, expected_core_count2);
> +    }
>  }
>  
>  static void test_smbios_structs(test_data *data, SmbiosEntryPointType ep_type)
> @@ -686,7 +697,7 @@ static void test_smbios_structs(test_data *data, SmbiosEntryPointType ep_type)
>          set_bit(type, struct_bitmap);
>  
>          if (type == 4) {
> -            g_assert(smbios_cpu_test(data, addr));
> +            smbios_cpu_test(data, addr);
>          }
>  
>          /* seek to end of unformatted string area of this struct ("\0\0") */
> @@ -903,6 +914,21 @@ static void test_acpi_q35_tcg(void)
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
> @@ -1822,6 +1848,7 @@ int main(int argc, char *argv[])
>          qtest_add_func("acpi/piix4/pci-hotplug/off",
>                         test_acpi_piix4_no_acpi_pci_hotplug);
>          qtest_add_func("acpi/q35", test_acpi_q35_tcg);
> +        qtest_add_func("acpi/q35/core-count2", test_acpi_q35_tcg_core_count2);

shouldn't we have a test for #cpus < 256 as well?

>          qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
>          qtest_add_func("acpi/q35/multif-bridge", test_acpi_q35_multif_bridge);
>          qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);


