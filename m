Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E0C39F121
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 10:41:50 +0200 (CEST)
Received: from localhost ([::1]:53958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqXIz-0006Xw-J5
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 04:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqXB9-0006j3-OF
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 04:33:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqXB6-0001cE-6w
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 04:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623141219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nwr7JmP8IaxJeEBeAOVdfRM2v1y/FhFYN/LoEBtDjjc=;
 b=IXwcSHp1tVPHCLMBJSPgv0yUgLsPoYYWZk9KYSRcIiT+wlp58pUzOs6FWGOznacWC18kYI
 CXsOBcL8wVvBt+i8PLZKBIVVo8cZhWoqW8A80Xd/eNjcHxiQZl6t51Ae4eWd7/a7/h+84M
 uW+2s+3z91d2SH4zlagaV81Ic6rgofk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-qKdOnx3tM42J39MwVY28pw-1; Tue, 08 Jun 2021 04:33:38 -0400
X-MC-Unique: qKdOnx3tM42J39MwVY28pw-1
Received: by mail-wr1-f69.google.com with SMTP id
 s8-20020adff8080000b0290114e1eeb8c6so9093461wrp.23
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 01:33:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nwr7JmP8IaxJeEBeAOVdfRM2v1y/FhFYN/LoEBtDjjc=;
 b=YMEv1dumWsG4BcEgE/vkAN0Tvrf9zaNctsTYiJZP/r0O1AAuzWzWyLEsDnR5YxEfHs
 O2eV5XMK0OV9ToZT8bwqL7hXsHkacpXUvZ3yJsop2LfC+A/MtBZjVbZZyF3uCdOmxYv5
 tOHLJsnDF14Q63Ve2ZyYMe3v1eJyhe29/2I8pIg42snIB2GAaAm2CMzzxrGATS56bQE0
 uwrO165LBw1+p80sQ3570h/6nGcdJGQzJjuQlSp6Bi2mgVUvrxkbuCMbTqhgEgmtCmZd
 J8MmViPlvEgoadTOJIxFsgZ66AXTBk7m1dHgypJD/MgrEoLz2LGLZlFEj9njZd7//7z2
 Ymug==
X-Gm-Message-State: AOAM532BB58fiW1HiGw3YRcJJSZqvq4hZSExPYmkPVSMLyocUY5p0cbD
 6KYJbxLzhi9eFPo2e4dkcezejhTKfTDZb/UoMva7Ei8GCjV+/dJBhISQuNUsn0OSZw7ch3Htabg
 Ac7Z2tsms23bzytQ=
X-Received: by 2002:adf:a489:: with SMTP id g9mr20983693wrb.103.1623141217136; 
 Tue, 08 Jun 2021 01:33:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHXhyM/WeZviwPj6oHCRZcCClsv+goH2dbi/HWQ8B5D50jJfgvw62DlI+xd2y04eAFVlWEQg==
X-Received: by 2002:adf:a489:: with SMTP id g9mr20983677wrb.103.1623141216983; 
 Tue, 08 Jun 2021 01:33:36 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id g21sm20092414wrb.46.2021.06.08.01.33.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 01:33:36 -0700 (PDT)
Subject: Re: [PATCH v16 09/99] qtest/bios-tables-test: Rename tests not TCG
 specific
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-10-alex.bennee@linaro.org>
 <b6c4efd5-4ba9-48e0-e9fb-c821df7db5cf@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8f2e1403-35d6-833a-080b-95b89ce43db3@redhat.com>
Date: Tue, 8 Jun 2021 10:33:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b6c4efd5-4ba9-48e0-e9fb-c821df7db5cf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 3:39 PM, Thomas Huth wrote:
> On 04/06/2021 17.51, Alex Bennée wrote:
>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> Various tests don't require TCG, but have '_tcg' in their name.
>> As this is misleading, remove 'tcg' from their name.
>>
>> Reported-by: Igor Mammedov <imammedo@redhat.com>
>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Message-Id: <20210505125806.1263441-10-philmd@redhat.com>
>> ---
>>   tests/qtest/bios-tables-test.c | 142 ++++++++++++++++-----------------
>>   1 file changed, 71 insertions(+), 71 deletions(-)
> [...]
>> @@ -1255,7 +1255,7 @@ static void test_acpi_microvm_rtc_tcg(void)
>>       free_test_data(&data);
>>   }
>>   -static void test_acpi_microvm_pcie_tcg(void)
>> +static void test_acpi_microvm_pcie(void)
>>   {
>>       test_data data;
> 
> This change is wrong: test_acpi_microvm_pcie_tcg() uses data.tcg_only =
> true, so the _tcg suffix indeed makes sense here.

I supposed I messed while rebasing...


