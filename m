Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B233C674DCF
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:09:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIlVj-0007jL-I6; Fri, 20 Jan 2023 02:08:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIlUJ-0006dl-45
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:07:02 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIlTM-0006EZ-DA
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:06:01 -0500
Received: by mail-wr1-x42c.google.com with SMTP id d14so295935wrr.9
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bMJ3V9AYtYIV6jg/SO4fWzGiyyLDrfEOLIuwcZNQWec=;
 b=QcJNOWMKqN8hdkOYKXMLV6i4SuWlU+QSEc9KDfp4C1GsbjJYVvEOJm9Biih6IbI7gn
 GzRo47r7Rvr8lYYwsJu8SqWmIqFqooCBp4LeQmi3LLKqNTFvO5gKRGCqSHXXWp7U5Sqk
 GZ2PvUOkWA3EGLFqRouePeVZVj07qGLD6oAVcpXPp5lx6BSYbko0D/cb/Hu6GBAk+Y16
 KVCDGp8Kc8eRRs+fh/Y0k2LfNCge+SAuhUSlbLlU+DFD4zUwMEvpjbOIVyZOixAwKiht
 k/Xim3nXnlEFYRalZ6SyA68nSsCIXS29mH19OPhC0jGbGh8FFoCI4ARatfwwUcnP2yXB
 6CFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bMJ3V9AYtYIV6jg/SO4fWzGiyyLDrfEOLIuwcZNQWec=;
 b=nqz4IeIhuJJYUfgEWB0hV4570PmKvC+IiYKvCy3FD7JRVOYWdkxgj/7PI+mqtlBWto
 Qga1r2Jc3w5tvQGgm51QWebCg2KRr/RAqOA4+TUh0+DFenUv5R7ZgC+uSlTlRf9zf9pU
 IX/+sMllwLeardOyRQ+a/fpZgwjy0MxWiCSIaWzqCipY6afwSWLHlHemt4P96UNtM/Uy
 E9v/my4NH+d+JaSXoVc1CvcoK7aB+2GQN6cpUInETMgNXEWDu/5CiszvnyttV4NOdgQr
 cBrjbIS3duz6K9FkmpcqyXXnWaflV2KIhqxJgXfKumjNTLY5nOrVi2eGCJaD3GemITub
 k1zQ==
X-Gm-Message-State: AFqh2kq8jfUXIzlTAtSbgsSS4rkQmA3DXFaCjLqaZnQhZN8P+259XPlZ
 qJZqYT9O3ndFhWUqUvA0ZV62Ow==
X-Google-Smtp-Source: AMrXdXvYAwvjRDbfvZo9Zjar3mxiLD+MNwDeBRy2x6vmTfQbylwab4ZNYScocFMP9TxSpGkW6WO3Ag==
X-Received: by 2002:adf:e88f:0:b0:2bd:f388:841c with SMTP id
 d15-20020adfe88f000000b002bdf388841cmr12306688wrm.42.1674198357935; 
 Thu, 19 Jan 2023 23:05:57 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o13-20020a5d670d000000b002bdc19f8e8asm23593549wru.79.2023.01.19.23.05.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 23:05:57 -0800 (PST)
Message-ID: <c5232976-2538-50f7-a6c8-8767fb62596d@linaro.org>
Date: Fri, 20 Jan 2023 08:05:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 09/11] tests/qtest/migration-test: Build command line
 using GString API (3/4)
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-10-philmd@linaro.org>
 <45067c0e-5f83-2ad4-ffdd-e187dab052a5@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <45067c0e-5f83-2ad4-ffdd-e187dab052a5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 19/1/23 22:17, Richard Henderson wrote:
> On 1/19/23 04:58, Philippe Mathieu-Daudé wrote:
>> Part 3/4: Convert accelerator options.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   tests/qtest/migration-test.c | 11 +++++------
>>   1 file changed, 5 insertions(+), 6 deletions(-)
>>
>> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
>> index 8377b3976a..015b774a9e 100644
>> --- a/tests/qtest/migration-test.c
>> +++ b/tests/qtest/migration-test.c
>> @@ -603,6 +603,9 @@ static int test_migrate_start(QTestState **from, 
>> QTestState **to,
>>       got_stop = false;
>>       cmd_common = g_string_new("");
>> +    g_string_append_printf(cmd_common, "-accel kvm%s ",
>> +                           args->use_dirty_ring ? 
>> ",dirty-ring-size=4096" : "");
>> +    g_string_append(cmd_common, "-accel tcg ");
> 
> Maybe clearer as
> 
>    if (args->use_dirty_ring) {
>        g_string_append(s, "-accel kvm,dirty-ring-size=4096 ");
>    } else {
>        g_string_append(s, "-accel kvm ");
>    }

Agreed, I first did that change, then went back to have simpler "one
big patch" in v1. Now since v2 splits the changes I'll do that.


