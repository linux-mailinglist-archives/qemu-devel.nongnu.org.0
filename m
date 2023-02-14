Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AEA696270
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 12:26:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRtSO-0003qk-FQ; Tue, 14 Feb 2023 06:26:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRtSM-0003lZ-Hr
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:26:42 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRtSJ-0003jC-VB
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:26:42 -0500
Received: by mail-wm1-x32c.google.com with SMTP id he5so2920494wmb.3
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 03:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k13HzA5vE3yfRwGzwiASLV6p8GKzKnfx7jWBwuoRDEE=;
 b=NNyEQ3ST26rJoG60b9NzIgx2giWAwiuyglqvIXtZc5zY9DVG/HKDJowvhWjEl258la
 swqe1IW+5ByI8AbpR0LrWJEIafEuHcM52eMZtcEUMmCEBTABjtX09Cw3MQ0QVPW1G1ZX
 9wL6Hx/M6h2KHS6i0sgLuUCXNu6Wlp85N24AhJKcpAEFliqvBgB8RtWabfXoYmI6t3pJ
 04rup68bKfjSI1DHlfVL2jDl3SuhKcXkmtkJTM27W6PuysCSd/OJWPgJ5U1iv9opN0Z1
 h9nCxiH4lCMRzN8bZFYlsxKkIaZVaISOwYpzkiX9wFvdjUarKUC1ZL6E8tnkkwaw3qQL
 TtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k13HzA5vE3yfRwGzwiASLV6p8GKzKnfx7jWBwuoRDEE=;
 b=hoife76QY9hDJUJu6vS6hYorfHuGsuEdJWnA0RDyC2KPstFvB2PWlx5F8kseTnEowo
 mxdpTT0prOLHeYszQ7VBpc4j5JTPUofZ9HVIft0VT9Bg24tVggvlMaVGCatq58vJuPi+
 qbc34V/b08aWkQXX7xmnZJOgYDhV+svzWfhkiNWWbGqNYeCzZJBFJy6CbOK6WFVw5k5g
 W9uEvdj5AYJLYTwgmV7WC+rTjzLvYoeu2HlIzeFPdgXxTqs/SZcSS9O+JCVT5pAD5AGd
 eBSxme2Bs2ZoMmTwlMnF8kg4lg/O65kO7sYdrTovb/TSX0zaKksJn8Vu19kwOr9GSqj0
 x5cw==
X-Gm-Message-State: AO0yUKV4rxJPeJD3+S2x7lJor1mPnLavGuWQi8BDcuS0yHT+LmFlr8oR
 N9Al0SDpZnBdfhnubnwW3BfkTQ==
X-Google-Smtp-Source: AK7set8tvV5yp45Nh3R0S7RRqeaff4H3iOn8XN+Mz3+TZipS3Im8qDte/CJ48InU3n5kKFXaESGiGg==
X-Received: by 2002:a05:600c:2208:b0:3df:9858:c038 with SMTP id
 z8-20020a05600c220800b003df9858c038mr9477321wml.13.1676373998169; 
 Tue, 14 Feb 2023 03:26:38 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k24-20020a5d5258000000b002c54c9bd71fsm9616442wrc.93.2023.02.14.03.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 03:26:37 -0800 (PST)
Message-ID: <eb5966c3-dc56-1919-55dd-f2cbba5b9bdc@linaro.org>
Date: Tue, 14 Feb 2023 12:26:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 3/4] hw: Use qdev_get_parent_bus() in
 qdev_get_own_fw_dev_path_from_handler()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20230212224730.51438-1-philmd@linaro.org>
 <20230212224730.51438-4-philmd@linaro.org>
 <cc4aa3f3-910e-09f5-e326-7ef5a6f80569@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <cc4aa3f3-910e-09f5-e326-7ef5a6f80569@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 14/2/23 00:29, Richard Henderson wrote:
> On 2/12/23 12:47, Philippe Mathieu-Daudé wrote:
>> -static char *qdev_get_fw_dev_path_from_handler(BusState *bus, 
>> DeviceState *dev)
>> +static char *qdev_get_fw_dev_path_from_handler(DeviceState *dev)
>>   {
>>       Object *obj = OBJECT(dev);
>> +    BusState *bus = qdev_get_parent_bus(dev);
>>       char *d = NULL;
>>       while (!d && obj->parent) {
> 
> This is a separate change from...
> 
>> -char *qdev_get_own_fw_dev_path_from_handler(BusState *bus, 
>> DeviceState *dev)
>> +char *qdev_get_own_fw_dev_path_from_handler(DeviceState *dev)
>>   {
>>       Object *obj = OBJECT(dev);
>> -    return fw_path_provider_try_get_dev_path(obj, bus, dev);
>> +    return fw_path_provider_try_get_dev_path(obj, 
>> qdev_get_parent_bus(dev), dev);
> 
> ... this, which is what $SUBJECT says.
> 
>> @@ -67,7 +68,7 @@ static int qdev_get_fw_dev_path_helper(DeviceState 
>> *dev, char *p, int size)
>>       if (dev && dev->parent_bus) {
>>           char *d;
>>           l = qdev_get_fw_dev_path_helper(dev->parent_bus->parent, p, 
>> size);
>> -        d = qdev_get_fw_dev_path_from_handler(dev->parent_bus, dev);
>> +        d = qdev_get_fw_dev_path_from_handler(dev);
> 
> We've already accessed parent_bus just above
> 
>>           if (!d) {
>>               d = bus_get_fw_dev_path(dev->parent_bus, dev);
> 
> ... and just below.  So, what's the cleanup?

qdev_get_own_fw_dev_path_from_handler() being a public API, I wanted to
clean it to avoid a funny case when it is called with
bus != qdev_get_parent_bus(dev). Maybe I merged 2 patches in one, I'll
revisit. Or I can just add assert(bus == qdev_get_parent_bus(dev)) to
prove the API is convoluted. I'll reword on before respin.


