Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBA56C14A8
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 15:25:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peGRO-0004nS-0w; Mon, 20 Mar 2023 10:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peGRL-0004iQ-4O
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 10:24:47 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peGRJ-0000LY-Di
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 10:24:46 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso7648886wmo.0
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 07:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679322284;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OcBwyyJCzTCgmblNjI0dvsp2ZbyooI12dlGfQm/MrMY=;
 b=VFqQWj1g37MKKalzANwcMjtBCGtS5g9cDcK8wggTQJY9QuL0k05M5gENkM2AhvUZPa
 QjxWhm26h8J1yYyakXOnIN9KK1s6NwuvDcrFxkDTvyNv3KM/hSKVVyCaKRnZ1TEfMRW2
 oAsEtYi88v+esJ3TvCg/tRxS7RwZk9tBZtnwtThEJJND35aoSwoPp3SQDusa6QjiyKrP
 rNS7RqN+FYJ1z4Hwd80jxlCt19UtW/tLpoX1QojFwzy1If+nkKbb/26oQTW3TKY3b2NF
 0BNU6EeoK3ht4MY21VYePHcMbYAhreOej3wRlhRVJS2NdBy+m/VnxRVOa/Zi7JK+lyVu
 55vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679322284;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OcBwyyJCzTCgmblNjI0dvsp2ZbyooI12dlGfQm/MrMY=;
 b=WiSnK/b/DgZeORe3G0/FNHN7kOhCd0sd6CHa8CPSl80Q8MAHiRkh3RPZ6zfPA61C7Z
 k0sZ2On5qzU+LbaANQOMcjHCjpXI3MoyYKx0jfd7h5h5rT7XIY4XFMjtpFlm+t8V9vQq
 VGC/QlFN7QWahs63Ze65HruJG1yKM1HC3lXvEZZWIaMBBlhxs7z7JLWQTvA+Ch8UFF97
 hasb72bcDtZS1Ohy6UzEv6Qs4N5ZyfA+/KHY7TnUf5droapAeDB8k6HslpViuF1/H7os
 ME6mqYgf9FplYojlpL0oMxfavZU9ws+FB08zy+j+TWTJQxi1Tl4RRyXSIoQl60SEIJG3
 E6kA==
X-Gm-Message-State: AO0yUKXGmwyGmz3GROGH3mOLJNIVZl+iOyNhg9O3TdHtO5U/FCyY15L+
 viXPcP+IrPe0OfarOY+TZN8X/Q==
X-Google-Smtp-Source: AK7set8otthNas5MYLHYB7q0JW9GkCZbC2TfrzD9IF17xl9Q5BlyHU3vSFtsqSdZ5cUrrdN2qAQVyQ==
X-Received: by 2002:a05:600c:2303:b0:3ed:b048:73f4 with SMTP id
 3-20020a05600c230300b003edb04873f4mr6984711wmo.5.1679322283760; 
 Mon, 20 Mar 2023 07:24:43 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 z9-20020a05600c0a0900b003ede04deb14sm4683478wmp.48.2023.03.20.07.24.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 07:24:43 -0700 (PDT)
Message-ID: <c3f5aaf7-7689-29c8-e7e0-1651b341aca2@linaro.org>
Date: Mon, 20 Mar 2023 15:24:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH-for-8.0] qemu/osdep.h: Do not declare function prototypes
 using extern keyword
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Sebastian Wilhelmi <wilhelmi@google.com>,
 Eric Blake <eblake@redhat.com>, Sebastian Wilhelmi <seppi@seppi.de>,
 =?UTF-8?Q?Simon_W=c3=b6rner?= <contact@simon-woerner.de>,
 Bernhard Beschow <shentey@gmail.com>
References: <20230320131426.16348-1-philmd@linaro.org>
 <ZBhfRmJc0M93s1F5@redhat.com>
 <42cc3cee-b148-aab0-cfd5-a684ce55d7f6@linaro.org>
 <7921104c-65e4-3b09-3a01-16b5f4ceb76c@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <7921104c-65e4-3b09-3a01-16b5f4ceb76c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 20/3/23 15:04, Thomas Huth wrote:
> On 20/03/2023 14.47, Philippe Mathieu-Daudé wrote:
>> On 20/3/23 14:27, Daniel P. Berrangé wrote:
>>> On Mon, Mar 20, 2023 at 02:14:26PM +0100, Philippe Mathieu-Daudé wrote:
>>>> By default, C function prototypes declared in headers are visible,
>>>> so there is no need to declare them as 'extern' functions. Remove
>>>> this redundancy. This also fixes when building under MSYS2:
>>>>
>>>>    C:/msys64/mingw64/include/glib-2.0/glib/gmacros.h:1075:21: error: 
>>>> standard attributes in middle of decl-specifiers
>>>>    1075 | # define G_NORETURN [[noreturn]]
>>>>          |                     ^
>>>>    C:/msys64/code/qemu/src/include/qemu/osdep.h:240:8: note: in 
>>>> expansion of macro 'G_NORETURN'
>>>>    240 | extern G_NORETURN
>>>>          |        ^~~~~~~~~~
>>>>
>>>> Reported-by: Simon Wörner <contact@simon-woerner.de>
>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1541
>>>
>>> There's already a fix for that issue included in a PULL request from
>>> Thomas:
>>>
>>> https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg05225.html
>>
>> Not the same patch. I'll rebase and post for 8.1 then I guess :)
>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>>   include/qemu/osdep.h | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
>>>> index f68b5d8708..79c26c748a 100644
>>>> --- a/include/qemu/osdep.h
>>>> +++ b/include/qemu/osdep.h
>>>> @@ -237,7 +237,7 @@ extern "C" {
>>>>    * supports QEMU_ERROR, this will be reported at compile time; 
>>>> otherwise
>>>>    * this will be reported at link time due to the missing symbol.
>>>>    */
>>>> -extern G_NORETURN
>>>> +G_NORETURN
> 
> Removing the "extern" sounds like a better idea than swapping it... 
> since my PR was not in the staging branch yet, I went ahead and replaced 
> the patch.

Thank you!


