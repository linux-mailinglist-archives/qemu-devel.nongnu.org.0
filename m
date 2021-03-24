Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFF6347F48
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 18:25:14 +0100 (CET)
Received: from localhost ([::1]:37286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP7Fp-0000Et-96
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 13:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP7EF-00082c-57; Wed, 24 Mar 2021 13:23:35 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:45962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP7ED-0007XR-Ir; Wed, 24 Mar 2021 13:23:34 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 r10-20020a05600c35cab029010c946c95easo1633841wmq.4; 
 Wed, 24 Mar 2021 10:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iBHZAX2dXF7tsxOkqd7OAaB5ezrAWC1wP7e6j9Ka9IE=;
 b=js+uFQiMSf+eFfFThJvU8hqcIAfpC4+BFGswzP8GMgMLJpiM3tp+FmYQdg66bRe+BN
 z/A7O7Bo/iGil4DDWT5B2v7G5Tom0z1DGzTqtdmh6Hlp1B+iJnlxbAYsPuenOXp4qZ/k
 ZXxe7P3pxM4PeEZuJpAeBVoJq+DChTVdq/UlSXt3WKubEJmh9MKWiLNpE88jwUMI+3FC
 SqPRQIQHavMBPNGSmMYAhv0xSfE8Lo13cA1wP7/Ek4p16L6QkvqVqCn0D70gH2WjKAnw
 PcTEyHKW6ynOi+t+jsiiZLwv0O3C8J3t5IO4+BzG1gEP13Ay2Ipx7Fmv5aQGNFumVNDn
 exiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iBHZAX2dXF7tsxOkqd7OAaB5ezrAWC1wP7e6j9Ka9IE=;
 b=fFuQMtEQx67SPikWyDPewuDtaF4eW68e9SPn+fACuXe3oe1DRfrjEGDozqNqeH770v
 3azs0TXr7rWNPcpseDghAHJ+xhF2X3BA+6cHzgf5oexFoooUqLQkV+PV9oU0IGXAo/hH
 y6r00WaFY2PekyOxX/EthlkG30AIrBAEftw3P+pZahD6D6O27dVwcLhvoTzTdtSvg4C4
 gV2MWNlaaExUgY4Au+HTOfVscwh3gG+X2zyMz+xCuXx3ddhAd1/hqD0C9ESd3Y3qsvJd
 PfUCO/jpk8vY4eIK34CrLhhOj/CQtMV6GVm4LG9uQbKpsm3e+YOXCU/NauBAkxgscNrH
 79CQ==
X-Gm-Message-State: AOAM530t5iRKgmRXaFnpVFSr/RgW73WO3Ys5o5OjUamn6qGK/jpd5QgE
 oSlyxQ5sCg63MvJLFj8Hlkg=
X-Google-Smtp-Source: ABdhPJwpXnD9K8HbE2o4UXEXl+VNYWJ5E6OMRGQTtri3K2T3VTJyG6Bq7VZvzE1/dJkDUHrjtCQM/g==
X-Received: by 2002:a7b:c195:: with SMTP id y21mr3975020wmi.178.1616606611206; 
 Wed, 24 Mar 2021 10:23:31 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id z66sm3365467wmc.4.2021.03.24.10.23.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 10:23:30 -0700 (PDT)
Subject: Re: [PATCH v2 05/12] mc146818rtc: put it into the 'misc' category
To: qemu-trivial@nongnu.org
References: <20201130083630.2520597-1-ganqixin@huawei.com>
 <20201130083630.2520597-6-ganqixin@huawei.com>
 <8c45ab34-2534-d5ad-ca0b-43b49a681e55@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <65fe4d98-7f79-191e-34c5-c3e5021d2f36@amsat.org>
Date: Wed, 24 Mar 2021 18:23:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <8c45ab34-2534-d5ad-ca0b-43b49a681e55@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, zhang.zhanghailiang@huawei.com,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Gan Qixin <ganqixin@huawei.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/20 12:53 PM, Thomas Huth wrote:
> On 30/11/2020 09.36, Gan Qixin wrote:
>> The category of the mc146818rtc device is not set, put it into the 'misc'
>> category.
>>
>> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
>> ---
>> Cc: Michael S. Tsirkin <mst@redhat.com>
>> ---
>>  hw/rtc/mc146818rtc.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
>> index 7a38540cb9..39edca0996 100644
>> --- a/hw/rtc/mc146818rtc.c
>> +++ b/hw/rtc/mc146818rtc.c
>> @@ -1039,6 +1039,7 @@ static void rtc_class_initfn(ObjectClass *klass, void *data)
>>      dc->vmsd = &vmstate_rtc;
>>      isa->build_aml = rtc_build_aml;
>>      device_class_set_props(dc, mc146818rtc_properties);
>> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>>  }
> 
> I wonder whether this device should be user_creatable at all (e.g. it uses a
> hard-coded IO port)... Anyway setting the category certainly does not hurt,
> thus:
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Can this go via qemu-trivial?

