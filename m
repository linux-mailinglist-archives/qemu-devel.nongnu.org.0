Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCB739DDFD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 15:45:55 +0200 (CEST)
Received: from localhost ([::1]:36882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqFZj-0005ZX-0o
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 09:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqFYX-0004su-Tf
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:44:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqFYU-0003jt-EN
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:44:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623073477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QYMPUTxoQpoeG4LPw6WCV5k49Gz3rRB8kgSy/0zzUpY=;
 b=eLTyk86csRVxWeAQlVGKSzkVikFCSvMxOUpKCHOocRBZwKTNIulC+PfDwKamMvJPyJbusH
 M+nbGIaRFeIGRXHrWTRX2uL0CX7GqGDuSdJq+tzT3iuywEk55fv7haNtdOSJBllHwZG/pW
 jsnrDcObTT4c0Xr5pY7RVUKj5x9E0i4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-JXQ8pOk2PZWRfdyYmA_GdQ-1; Mon, 07 Jun 2021 09:44:36 -0400
X-MC-Unique: JXQ8pOk2PZWRfdyYmA_GdQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 o14-20020a1c4d0e0000b029019a2085ba40so2353423wmh.1
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 06:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QYMPUTxoQpoeG4LPw6WCV5k49Gz3rRB8kgSy/0zzUpY=;
 b=s+hJqPa6aX/kwmyH/T1J3LVA0XSjLvtujvLulJf3iyPMAnZ+c6rsgbfvWNth25urMp
 PSKhpCsAWEuPNhiwuSRfC3Dl4fTJKtPeZfkdkDPgBXtU71eGaN7HrsoX61qP7mTuKrLI
 PF12Spz4R8vmCQGMzSQQoj87K15w5J5c49Muyp8CLtXAckN5HNfBcK/15+vJvJB1ruCf
 d7uec8BTV/4LmN/x3h/jGqBETiVu9lAukL4LocGi+z/DoZDo9AHgoq4SMSnqc7BeURBI
 DK5uzBGu8Qi8OCS3+t2RdsuB5KP7trrXBLjF548AZFAf4/5X+qJn72MoT3KUNebXzBFQ
 1hzw==
X-Gm-Message-State: AOAM532Yv6JxZndk5s16akYPtRoVgvt/vN4q6/PC9tksasN8qyolzoNF
 Eztcc1bnchbQ2YOnStR/i3NUQ28zXY4bw0JjuV0RYORIz3/thO7bmcPu3iFCd9+/xq3hzahcS3p
 lFraJEsR+IRERqTk=
X-Received: by 2002:adf:de0e:: with SMTP id b14mr16671904wrm.321.1623073475313; 
 Mon, 07 Jun 2021 06:44:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyScOqER9fs/29uuu+2YuLj7Yga8ZNxsYLozr0aSODfmEhbCEM48DSY5Jgtvt+zwDtKjGOVpQ==
X-Received: by 2002:adf:de0e:: with SMTP id b14mr16671881wrm.321.1623073475151; 
 Mon, 07 Jun 2021 06:44:35 -0700 (PDT)
Received: from thuth.remote.csb (pd9575779.dip0.t-ipconnect.de.
 [217.87.87.121])
 by smtp.gmail.com with ESMTPSA id l31sm5770776wms.16.2021.06.07.06.44.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 06:44:34 -0700 (PDT)
Subject: Re: [PATCH v16 10/99] qtest/bios-tables-test: Rename TCG specific
 tests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-11-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2c735a29-037a-0027-b671-20e9a25433d7@redhat.com>
Date: Mon, 7 Jun 2021 15:44:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-11-alex.bennee@linaro.org>
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
> Some tests require TCG, but don't have '_tcg' in their name,
> while others do. Unify the test names by adding 'tcg' to the
> TCG specific tests.
> 
> Reported-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210505125806.1263441-11-philmd@redhat.com>
> ---
>   tests/qtest/bios-tables-test.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index ce498b3ff4..ad877baeb1 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1255,7 +1255,7 @@ static void test_acpi_microvm_rtc(void)
>       free_test_data(&data);
>   }
>   
> -static void test_acpi_microvm_pcie(void)
> +static void test_acpi_microvm_pcie_tcg(void)

Lol, that's the one you removed in the previous patch :-)

>   {
>       test_data data;
>   
> @@ -1475,7 +1475,7 @@ static void test_acpi_oem_fields_microvm(void)
>       g_free(args);
>   }
>   
> -static void test_acpi_oem_fields_virt(void)
> +static void test_acpi_oem_fields_virt_tcg(void)

This one is ok.

  Thomas


