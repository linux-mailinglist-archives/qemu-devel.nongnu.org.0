Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F555AC310
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 08:49:37 +0200 (CEST)
Received: from localhost ([::1]:51500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUjRn-00076C-7L
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 02:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oUjMN-0004qd-SY
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 02:44:00 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:43735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oUjMI-0005gz-5k
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 02:43:56 -0400
Received: by mail-pg1-x52a.google.com with SMTP id v4so5521262pgi.10
 for <qemu-devel@nongnu.org>; Sat, 03 Sep 2022 23:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:from:to:cc:subject:date;
 bh=zybMCC3l40UZGO1mOy70w6Wi2EVSdUDfh9Wys1a2Xgo=;
 b=S4xNsZbLCWKC0Bz9zW634MWfwVXe4kodlKKeNFRvpxmpDxJs8PX0ANsU0z7Li/lIOB
 5M3t1BGxJVGH00vHby/KYGg9W/EfRfJjscFxz3it7vpm2NT6pzQESoHjUpzlcsq40nFR
 qSNMsMdKFf5HpyxBbRnOsMSBOJ5mPEB5fEfPIsKKCdHgQ+et8bW/csL+tjVEZWIn14/H
 UPG9casdJAv1b9D3CA5FEHo7kQZwEbgLOshZGUpwDlt5LC4A91Q4RYSDVBActcDCDy5d
 CjgaqtJNaZjQTOex9IdLtL1ne5vb6bC0sB6vHiXEvcFIHZ80QmF160khkvAmfqyWS9MG
 6dMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date;
 bh=zybMCC3l40UZGO1mOy70w6Wi2EVSdUDfh9Wys1a2Xgo=;
 b=291dkDjJbP9y5uUnxwHEeyLyidPIeJCaYJDH7dZAu0SH6AydQX2jDCsf0/16nmNDRn
 Ynr4CeJZ7GD20WhT4VLd/alIl/KqTHpyFAycakKNr8cY+nGioa1eJmDSGJmwpPwzo23W
 Bo/Wyxv2IjJhoTI4DV1JwUXDzaxiy3wqcEy2oNhU6+HGWBTNa2IVyB2QonR0TztW6Miw
 r2HdRwfBJxhcVJ6o8J5WYwzjy5ZYH0up33YFm35fDki1U/mocNP655rTPHc94stWlDJT
 eOxNiHH7VYKRQ8DSSAbz4P2VWMrOyOnivp//uZ1I3aGB21I5OhIKo8PWKT9h2h255Q4Q
 MIaw==
X-Gm-Message-State: ACgBeo0FCyUkTod5NMLNsw4fTqzSk7IK4I0b8yj/cuaUwWfOlIWWhNGK
 HIrMkDqwtinetjsi8BLLiz/l1g==
X-Google-Smtp-Source: AA6agR5sKsFFtJH89QCQpdV0fITypd36y8Ikd89sx5GBWh8AiNm96c73PIzGaQXrp3q5jGs9YZ2K3Q==
X-Received: by 2002:a63:5243:0:b0:42f:6447:27d9 with SMTP id
 s3-20020a635243000000b0042f644727d9mr21098289pgl.356.1662273831780; 
 Sat, 03 Sep 2022 23:43:51 -0700 (PDT)
Received: from ani-ubuntu ([115.96.132.96])
 by smtp.googlemail.com with ESMTPSA id
 pj12-20020a17090b4f4c00b001df264610c4sm24052073pjb.0.2022.09.03.23.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Sep 2022 23:43:51 -0700 (PDT)
Date: Sun, 4 Sep 2022 12:13:43 +0530 (IST)
From: Ani Sinha <ani@anisinha.ca>
To: Juan Quintela <quintela@redhat.com>
cc: qemu-devel@nongnu.org, Bandan Das <bsd@redhat.com>, 
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 1/8] bios-tables-test: Make oem-fields tests be consistent
In-Reply-To: <20220902173452.1904-2-quintela@redhat.com>
Message-ID: <518d2cb3-7c79-c79b-c5a4-c3273978bde8@anisinha.ca>
References: <20220902173452.1904-1-quintela@redhat.com>
 <20220902173452.1904-2-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::52a;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x52a.google.com
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

> Every other test function is named:
>
> 	test_acpi_<machine>_<test>()
>
> Just make this test the same.  Once there, rename "acpi/oem-fields" to
> "acpi/piix4/oem-fields" so it is consistent with everything else.
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  tests/qtest/bios-tables-test.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index a0853744ae..1e808b0864 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1671,7 +1671,7 @@ static void test_oem_fields(test_data *data)
>      }
>  }
>
> -static void test_acpi_oem_fields_pc(void)
> +static void test_acpi_piix4_oem_fields(void)
>  {
>      test_data data;
>      char *args;
> @@ -1691,7 +1691,7 @@ static void test_acpi_oem_fields_pc(void)
>      g_free(args);
>  }
>
> -static void test_acpi_oem_fields_q35(void)
> +static void test_acpi_q35_oem_fields(void)
>  {
>      test_data data;
>      char *args;
> @@ -1711,7 +1711,7 @@ static void test_acpi_oem_fields_q35(void)
>      g_free(args);
>  }
>
> -static void test_acpi_oem_fields_microvm(void)
> +static void test_acpi_microvm_oem_fields(void)
>  {
>      test_data data;
>      char *args;
> @@ -1728,7 +1728,7 @@ static void test_acpi_oem_fields_microvm(void)
>      g_free(args);
>  }
>
> -static void test_acpi_oem_fields_virt(void)
> +static void test_acpi_virt_oem_fields(void)
>  {
>      test_data data = {
>          .machine = "virt",
> @@ -1766,13 +1766,13 @@ int main(int argc, char *argv[])
>          if (ret) {
>              return ret;
>          }
> -        qtest_add_func("acpi/q35/oem-fields", test_acpi_oem_fields_q35);
> +        qtest_add_func("acpi/q35/oem-fields", test_acpi_q35_oem_fields);
>          if (tpm_model_is_available("-machine q35", "tpm-tis")) {
>              qtest_add_func("acpi/q35/tpm2-tis", test_acpi_q35_tcg_tpm2_tis);
>              qtest_add_func("acpi/q35/tpm12-tis", test_acpi_q35_tcg_tpm12_tis);
>          }
>          qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
> -        qtest_add_func("acpi/oem-fields", test_acpi_oem_fields_pc);
> +        qtest_add_func("acpi/piix4/oem-fields", test_acpi_piix4_oem_fields);
>          qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
>          qtest_add_func("acpi/piix4/pci-hotplug/no_root_hotplug",
>                         test_acpi_piix4_no_root_hotplug);
> @@ -1819,7 +1819,7 @@ int main(int argc, char *argv[])
>          qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
>          qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
>          qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2_tcg);
> -        qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
> +        qtest_add_func("acpi/microvm/oem-fields", test_acpi_microvm_oem_fields);
>          if (has_tcg) {
>              qtest_add_func("acpi/q35/ivrs", test_acpi_q35_tcg_ivrs);
>              if (strcmp(arch, "x86_64") == 0) {
> @@ -1844,7 +1844,7 @@ int main(int argc, char *argv[])
>              qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
>              qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
>              qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
> -            qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
> +            qtest_add_func("acpi/virt/oem-fields", test_acpi_virt_oem_fields);
>              qtest_add_func("acpi/virt/viot", test_acpi_virt_viot);
>          }
>      }
> --
> 2.37.2
>
>

