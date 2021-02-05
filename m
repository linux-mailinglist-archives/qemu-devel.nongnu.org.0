Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B09BE311049
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:48:24 +0100 (CET)
Received: from localhost ([::1]:45750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l869X-0004Nj-6Y
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:48:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l84ms-0002zg-HN; Fri, 05 Feb 2021 12:20:54 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:32851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l84mq-0004MZ-Df; Fri, 05 Feb 2021 12:20:54 -0500
Received: by mail-ej1-x62c.google.com with SMTP id sa23so13151442ejb.0;
 Fri, 05 Feb 2021 09:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sLa712d/xvbAqL4rld7olUxpRSh3DprVkjC3mAOjcIQ=;
 b=kskaPdt9G8TitmGISASC7aDEsV5Z02tnEuggcgwhF8FfwWzmUloh//WKgvGbppmtLq
 z1yvgTS+oAClHi4SQEv0t266WJsvF3yZINXe2CLKPMfoCgLwL1SU4thN/MS4uHBCoM8p
 Q1fi+5UcaFW5B4jz3G6nawqsecxEql1m1uW29BGJeFbiZCwv2TC7ZIeihSkmRTM079B+
 kosid8F/2Uh28omk5xfr+8qCkelkjJMGRpGt32MLayMeH/p9NmLw/UXYT24/gCSh0JhY
 3fNjMwh9uElD/zlRtQ7OXo9eX+z+AHbj6ujmAklHW2eT27963Jv+xBDAaqToZGJ4ywTD
 Pixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sLa712d/xvbAqL4rld7olUxpRSh3DprVkjC3mAOjcIQ=;
 b=Ccjj8w7pjpUWy0uQVOA8Igh0J4xlOULNlwlS0q6skKVG1jxJ1HcJNoEqKe59zR3d1a
 C/2ippavPLg4QdGZmnwBqMnsZVefHRPl2ccHc6Zqg7sREqDr10txCLvpQ7VC1KyEoPRD
 pE+bF/Grg5OF9auHLxbFD/Zmx53KKPQA9RNuA9SpePuiF1iLCLtaX5X1b0r7ozK7z6Qd
 zZoGSrb0FeBT/X4I1tZurJ9fOt53YQV2FKKiPki4S2roNV+ozU0TGpCY4f9Hge8Dy36H
 3F7ltMulzV/kqmflwufsI4QOjwC0CIC5FC9lQDqYdChoWm3glBmYIJstceU2lsnJC9NM
 XYQA==
X-Gm-Message-State: AOAM531zwfz2NzSZdO3lDS7Slatgo0UlNW3+Q52Kr7KxVNnPp9Rg06GK
 xbqUIZ9zKnf7JaUnVAKcw5w=
X-Google-Smtp-Source: ABdhPJwnmznYjzZGxI9p8kI7tsVaa1Xps9weoZUCe64SAiTHSqGjFRYRGHAsOABITTDDt6zDpYs/vA==
X-Received: by 2002:a17:906:6d94:: with SMTP id
 h20mr5174124ejt.231.1612545649071; 
 Fri, 05 Feb 2021 09:20:49 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id df15sm4175753edb.24.2021.02.05.09.20.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 09:20:48 -0800 (PST)
Subject: Re: [PATCH 2/9] tests/qtest: Restrict xlnx-can-test to TCG builds
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-3-f4bug@amsat.org>
 <CAFEAcA99NTiq+a7ZLiVVEbvpe0mgOcmrKrQLTHZeQ9ndNLOb8A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <62f48e45-c333-a004-e98a-7a7d977eef87@amsat.org>
Date: Fri, 5 Feb 2021 18:20:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA99NTiq+a7ZLiVVEbvpe0mgOcmrKrQLTHZeQ9ndNLOb8A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.33,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, Qemu-block <qemu-block@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, Andrew Jones <drjones@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 5:57 PM, Peter Maydell wrote:
> On Fri, 5 Feb 2021 at 14:43, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> The Xilinx CAN controller test is uses the ZCU102 board which is
>> based on a ZynqMP SoC. In the default configuration - used by this
>> test - this SoC creates 2 Cortex R5F cores. Such cores are not
>> v8A archicture, thus can not be run under KVM. Therefore restrict
>> this test to TCG.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> Cc: Alistair Francis <alistair@alistair23.me>
>> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
>> Cc: Vikram Garhwal <fnu.vikram@xilinx.com>
>> ---
>>  tests/qtest/meson.build | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>> index c83bc211b6a..d8ebd5bf98e 100644
>> --- a/tests/qtest/meson.build
>> +++ b/tests/qtest/meson.build
>> @@ -159,10 +159,10 @@
>>    (cpu != 'arm' ? ['bios-tables-test'] : []) +                                                  \
>>    (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
>>    (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
>> +  (config_all.has_key('CONFIG_TCG') ? ['xlnx-can-test'] : []) +  \
>>    ['arm-cpu-features',
>>     'numa-test',
>>     'boot-serial-test',
>> -   'xlnx-can-test',
>>     'migration-test']
> 
> The implementation in hw/net/can/meson.build is conditioned on
> CONFIG_XLNX_ZYNQMP -- does it work to use that here too?

Yes. Thanks, clever idea :)

