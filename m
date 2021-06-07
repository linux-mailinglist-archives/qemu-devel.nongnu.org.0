Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A199239DE07
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 15:48:25 +0200 (CEST)
Received: from localhost ([::1]:39732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqFc8-0007dJ-OA
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 09:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqFbK-0006le-Eg
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:47:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqFbI-0005Yv-Pn
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:47:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623073652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LD6nAFjs4B1GZxkldEAJrh4Se1ifzzJRoEJKMHX6Snw=;
 b=fHPlG5xtWgxnIAfV9wsUchD+JdZWPTyMtNBxVtJy9v1PyZmgyRqghMdzqJTja9PVl8yfLh
 xKo9vS1dn341JbkFw79tcRz806TB5vLIAzxGOheRhU9zK6Mw9W1OqDrY45FAnv9zuG3IB7
 4G8rtjZ5LRzI1NZiwlqKYhMyJ3wzapc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-CeSjM2PcPROEvDFPW67Gmg-1; Mon, 07 Jun 2021 09:47:30 -0400
X-MC-Unique: CeSjM2PcPROEvDFPW67Gmg-1
Received: by mail-wr1-f72.google.com with SMTP id
 x9-20020adfffc90000b02901178add5f60so7891482wrs.5
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 06:47:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LD6nAFjs4B1GZxkldEAJrh4Se1ifzzJRoEJKMHX6Snw=;
 b=KjQsJXwV4RqBwXGo5IwH7wIV387ri3HjptldOATDojguF5ZlmPj3jbvGvDifcbdE26
 UsHP0HPhw9OZoqJ+n5mLlA/THivGKLXD5zigniMEcovYfwmBLYLajXtTbTZw6RPpyGyJ
 mFXl8J0K2f7rZFBFTN2cgjxcC6Y3kg3my1LFZIrwZ8wukeh7U+aeXA4F+j+zVlqrB88I
 RSVw0DSHgj8JjkImY5kjNb7qpkaOBiWqXNiPHkYAFpDeA+r1MyrSezRx1Sqbmy9sMd0T
 r3SH7MVAIOoKiYZ6KbS0KVM1shr28kaYC/krIw4xM1qd1XqLILjVq+UZFmb/OK4H+pbG
 LVjQ==
X-Gm-Message-State: AOAM532k3BdnqHVXdTySad7VpTCgoOFcGOdriRzEVA4TnnHHzIJWouzP
 AQ+C9ObuvnrWR1fPppXkrFcyUQ0bkwBKiQe2h2ZGx0JLihDMBRc0wG2WZBJ5C1MjN9YXsXxaiTS
 TnAHCLqxLW1vFMRY=
X-Received: by 2002:a1c:7c13:: with SMTP id x19mr17096442wmc.96.1623073649877; 
 Mon, 07 Jun 2021 06:47:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYSGVT3JTdjzcyNneKsYsGyv2U2IEfTuYuShwdf62nNk6uthUwR4COxe7kiSWvVHLEWhjNLg==
X-Received: by 2002:a1c:7c13:: with SMTP id x19mr17096429wmc.96.1623073649753; 
 Mon, 07 Jun 2021 06:47:29 -0700 (PDT)
Received: from thuth.remote.csb (pd9575779.dip0.t-ipconnect.de.
 [217.87.87.121])
 by smtp.gmail.com with ESMTPSA id 32sm17761074wrs.5.2021.06.07.06.47.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 06:47:29 -0700 (PDT)
Subject: Re: [PATCH v16 11/99] qtest/bios-tables-test: Make test
 build-independent from accelerator
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-12-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8cd09a51-cb6b-79f1-1848-d71fe42b0044@redhat.com>
Date: Mon, 7 Jun 2021 15:47:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-12-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/06/2021 17.51, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Now that we can probe if the TCG accelerator is available
> at runtime with a QMP command, do it once at the beginning
> and only register the tests we can run.
> We can then replace the #ifdef'ry by an assertion.
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210505125806.1263441-12-philmd@redhat.com>
> ---
>   tests/qtest/bios-tables-test.c | 14 ++++++--------
>   1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index ad877baeb1..762d154b34 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -97,6 +97,7 @@ typedef struct {
>       QTestState *qts;
>   } test_data;
>   
> +static bool tcg_accel_available;
>   static char disk[] = "tests/acpi-test-disk-XXXXXX";
>   static const char *data_dir = "tests/data/acpi";
>   #ifdef CONFIG_IASL
> @@ -718,12 +719,7 @@ static void test_acpi_one(const char *params, test_data *data)
>       char *args;
>       bool use_uefi = data->uefi_fl1 && data->uefi_fl2;
>   
> -#ifndef CONFIG_TCG
> -    if (data->tcg_only) {
> -        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
> -        return;
> -    }
> -#endif /* CONFIG_TCG */
> +    assert(!data->tcg_only || tcg_accel_available);
>   
>       args = test_acpi_create_args(data, params, use_uefi);
>       data->qts = qtest_init(args);
> @@ -1506,6 +1502,8 @@ int main(int argc, char *argv[])
>   
>       g_test_init(&argc, &argv, NULL);
>   
> +    tcg_accel_available = qtest_has_accel("tcg");
> +
>       if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>           ret = boot_sector_init(disk);
>           if (ret) {
> @@ -1554,10 +1552,10 @@ int main(int argc, char *argv[])
>           qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc);
>           qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2);
>           qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
> -        if (strcmp(arch, "x86_64") == 0) {
> +        if (strcmp(arch, "x86_64") == 0 && tcg_accel_available) {
>               qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
>           }
> -    } else if (strcmp(arch, "aarch64") == 0) {
> +    } else if (strcmp(arch, "aarch64") == 0 && tcg_accel_available) {
>           qtest_add_func("acpi/virt", test_acpi_virt_tcg);
>           qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
>           qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


