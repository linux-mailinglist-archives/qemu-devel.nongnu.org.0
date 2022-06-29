Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182AD5602A9
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 16:27:25 +0200 (CEST)
Received: from localhost ([::1]:34830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Yf5-0006si-HR
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 10:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o6Y7R-0006X8-HA
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 09:52:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o6Y7P-0000HI-7c
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 09:52:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656510754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IFy+DUyplWiZkTeOtWfps6XGPHPpGCzQqT7JJdgA18s=;
 b=Pr/Yqu1b2H8FNKSvOoiuvbGLp0MDgGAV25Ndx2PN7v2YZhZEPNycpWCY5/gQCGUJXl1iHG
 vppkY8B9xKJBn57OpeDpBoiCq8CLYRvI5bE/+JoheT1pv/PCdNE8aijeVH04T+YD/Y1mDh
 KzeHAeX9XKlmlxFq/OUw1n1DsgbHJ/4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-q3tfXPr9NpG3Ua3f-JkYKQ-1; Wed, 29 Jun 2022 09:52:32 -0400
X-MC-Unique: q3tfXPr9NpG3Ua3f-JkYKQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 a1-20020adfbc41000000b0021b90d6d69aso2446405wrh.1
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 06:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IFy+DUyplWiZkTeOtWfps6XGPHPpGCzQqT7JJdgA18s=;
 b=ozCL4PewehEUyj8Duo+j3qaFM+8zhd0OThX02QS6nu7b3r6qLMHaRA2FjCz6qh0VY7
 SBV8iayqlHPbecpgBLDklURDEG79m1uV+K1DYPeTTYoilDqRFsg653yl45D9L4gqxt3f
 rKqgANUYDkx2e457ejB2uB+41++7LnC4trQJU2JDS/zNqtZBlnQI7+duw9ly6jlbR5py
 ApCEEfG6iNa+SlB/7Bz/Xj8Xu/e0OosYaT0tv8MBiP8lJiuUKJGB+tUw4bvuSs90d46L
 suNSlLpBqbefdjmYLUnenxYNxkwM2q09T7aWybLAAJ9DbC/LS0rDFBWOO4pK4exHwkba
 /G/Q==
X-Gm-Message-State: AJIora91k3rkAp9omxQCJX9UjYWSSsX1+wHPxybkyJ6vJNvMTk9xFjOi
 sue/TnS6FwelkAQBUZFEgFPPJZdnHkPkPRl/rZzOFWwnLMWk7qF4fEkmTVy+j89DxG9MT5T+lc7
 kdNK0vfhHw8hew50=
X-Received: by 2002:adf:cf01:0:b0:21d:2e0a:2cb3 with SMTP id
 o1-20020adfcf01000000b0021d2e0a2cb3mr2138830wrj.402.1656510749383; 
 Wed, 29 Jun 2022 06:52:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uq3UQ0owAevd4uwUDIPoe5+68L7MjsD4rb4iET514N3Org/DyIXg/pVmnxOmRYp6u2Tee1pw==
X-Received: by 2002:adf:cf01:0:b0:21d:2e0a:2cb3 with SMTP id
 o1-20020adfcf01000000b0021d2e0a2cb3mr2138805wrj.402.1656510749120; 
 Wed, 29 Jun 2022 06:52:29 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a5d5142000000b0021b966abc19sm16666406wrt.19.2022.06.29.06.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 06:52:28 -0700 (PDT)
Date: Wed, 29 Jun 2022 15:52:25 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Brice Goglin <Brice.Goglin@inria.fr>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Liu Jingqi
 <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?UTF-8?B?TWF0aGlldS1E?=
 =?UTF-8?B?YXVkw6k=?= <f4bug@amsat.org>, Yanan Wang
 <wangyanan55@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v3 3/4] tests: acpi: q35: add test for hmat nodes
 without initiators
Message-ID: <20220629155225.78fd533a@redhat.com>
In-Reply-To: <a15cad76-df3e-b5c7-44e2-db4a470885d8@inria.fr>
References: <1e9d4c01-0ce3-4514-1e5b-ffccc6e88f9e@inria.fr>
 <a15cad76-df3e-b5c7-44e2-db4a470885d8@inria.fr>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Wed, 29 Jun 2022 11:35:10 +0200
Brice Goglin <Brice.Goglin@inria.fr> wrote:

> Build a machine with 4 cores and 3 NUMA nodes.
> 1st NUMA is local to cores #0-1.
> 2nd NUMA is local to cores #2-3.
> 3rd NUMA has no initiator.
> HMAT SLLB says memory access performance of 3rd NUMA is lower,
> but it's identical for all cores hence all cores are its best initiator.
[...]

only commit message got fixed, the rest of comments weren't addressed (see prev rev)

> 
> Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>   tests/qtest/bios-tables-test.c | 45 ++++++++++++++++++++++++++++++++++
>   1 file changed, 45 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 359916c228..1252b166ff 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1461,6 +1461,50 @@ static void test_acpi_piix4_tcg_acpi_hmat(void)
>       test_acpi_tcg_acpi_hmat(MACHINE_PC);
>   }
>   
> +static void test_acpi_q35_tcg_acpi_hmat_noinitiator(void)
> +{
> +    test_data data;
> +
> +    memset(&data, 0, sizeof(data));
> +    data.machine = MACHINE_Q35;
> +    data.variant = ".acpihmat-noinitiator";
> +    test_acpi_one(" -machine hmat=on"
> +                  " -smp 4"
> +                  " -m 128M"
> +                  " -object memory-backend-ram,size=32M,id=ram0"
> +                  " -object memory-backend-ram,size=32M,id=ram1"
> +                  " -object memory-backend-ram,size=64M,id=ram2"
> +                  " -numa node,nodeid=0,memdev=ram0,cpus=0-1"
> +                  " -numa node,nodeid=1,memdev=ram1,cpus=2-3"
> +                  " -numa node,nodeid=2,memdev=ram2"
> +                  " -numa hmat-lb,initiator=0,target=0,hierarchy=memory,"
> +                  "data-type=access-latency,latency=10"
> +                  " -numa hmat-lb,initiator=0,target=0,hierarchy=memory,"
> +                  "data-type=access-bandwidth,bandwidth=10485760"
> +                  " -numa hmat-lb,initiator=0,target=1,hierarchy=memory,"
> +                  "data-type=access-latency,latency=20"
> +                  " -numa hmat-lb,initiator=0,target=1,hierarchy=memory,"
> +                  "data-type=access-bandwidth,bandwidth=5242880"
> +                  " -numa hmat-lb,initiator=0,target=2,hierarchy=memory,"
> +                  "data-type=access-latency,latency=30"
> +                  " -numa hmat-lb,initiator=0,target=2,hierarchy=memory,"
> +                  "data-type=access-bandwidth,bandwidth=1048576"
> +                  " -numa hmat-lb,initiator=1,target=0,hierarchy=memory,"
> +                  "data-type=access-latency,latency=20"
> +                  " -numa hmat-lb,initiator=1,target=0,hierarchy=memory,"
> +                  "data-type=access-bandwidth,bandwidth=5242880"
> +                  " -numa hmat-lb,initiator=1,target=1,hierarchy=memory,"
> +                  "data-type=access-latency,latency=10"
> +                  " -numa hmat-lb,initiator=1,target=1,hierarchy=memory,"
> +                  "data-type=access-bandwidth,bandwidth=10485760"
> +                  " -numa hmat-lb,initiator=1,target=2,hierarchy=memory,"
> +                  "data-type=access-latency,latency=30"
> +                  " -numa hmat-lb,initiator=1,target=2,hierarchy=memory,"
> +                  "data-type=access-bandwidth,bandwidth=1048576",
> +                  &data);
> +    free_test_data(&data);
> +}
> +
>   static void test_acpi_erst(const char *machine)
>   {
>       gchar *tmp_path = g_dir_make_tmp("qemu-test-erst.XXXXXX", NULL);
> @@ -1803,6 +1847,7 @@ int main(int argc, char *argv[])
>           qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
>           qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
>           qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
> +        qtest_add_func("acpi/q35/acpihmat-noinitiator", test_acpi_q35_tcg_acpi_hmat_noinitiator);
>           qtest_add_func("acpi/piix4/acpierst", test_acpi_piix4_acpi_erst);
>           qtest_add_func("acpi/q35/acpierst", test_acpi_q35_acpi_erst);
>           qtest_add_func("acpi/q35/applesmc", test_acpi_q35_applesmc);


