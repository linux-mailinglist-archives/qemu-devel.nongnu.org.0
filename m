Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 269486B7A8D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 15:40:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbjKG-0007nC-6Q; Mon, 13 Mar 2023 10:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbjKE-0007ml-Rm
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 10:38:58 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbjKD-0002vG-7K
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 10:38:58 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 l7-20020a05600c1d0700b003eb5e6d906bso8002841wms.5
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 07:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678718335;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eefq9S8GWPBoVR+errFRXd3NvCDAUKXeBI7/FD+lL2k=;
 b=I8gfiRTRogf2QhB+YDqkcuVOpUdnxvxTwprgELJZayCqOii5n+xI6xfGig1NwOmpxp
 LuOPdKVUUpCMQ93eFJznvFgKeQg5r0n+b6ODl1pACqN3qQyWkApsMiqxFbccJybUuxBj
 kktgteoYVhAzvVch5/d3i3Tfq4cvdUT7ZE5q5IBIh0rc6iltbb7K/AfwE7wvfhMx4+M2
 iaPDLLIAOrQLWhtLC+OVYp9CA04y3ocxmu9vI076TVqCaZwk8pcHIW4yp42djjYiNWb/
 38EocylfZ9wIYhG0/2r512Ky/l3RJpWlwuwfAa06JiAwMV9QG8uC8um4Ie/YoEZFBJnx
 bZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678718335;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eefq9S8GWPBoVR+errFRXd3NvCDAUKXeBI7/FD+lL2k=;
 b=5G9thCPm3fJ1jUaZ6Eop0cfxTrkg7GGoJ2w0Hd9HNqU5Av5unYSsMLiY7eXa+ndDnG
 6hKvSiJBBxtn4gMVyJU7wlgFG/+qUb7njVjp9KA1QW+BUg6ErLdCXtvjkk0kaMGCLEh7
 BnoOl1GEeYmqZm3pr/os8VvBofk/V5y8vlHh7KPv2FHfeL8110yqxQk556irWlVhlZVK
 CWjJtGjS1ZgcQ43YqHlOv6OjgLDzfh61lPqNA3mQBfWF/x0Gd7Y4RhnWQuH8XcrHvbQw
 COvNYIyZ0mZuXvYrTjnOTjdV5CdV7B9TgL/C/0RPpdtSF1sJGhOG+NAk/0WdBA+6vhY+
 hxgw==
X-Gm-Message-State: AO0yUKXg/FOa5KWF75F3HiECX/floVSmEB8MG5FnuVcg1JHKPchGiIyU
 3Jvh8aNrWm6eqfhF8heeeaWdUA==
X-Google-Smtp-Source: AK7set+2qO/2jKIkOAvYerrNFkwoxH7jW2zu+iIbnLK5ui1TOczADBG6R7emIGhZHEZvjK6uJ1ZcGQ==
X-Received: by 2002:a05:600c:310d:b0:3eb:3945:d405 with SMTP id
 g13-20020a05600c310d00b003eb3945d405mr10746614wmo.38.1678718334944; 
 Mon, 13 Mar 2023 07:38:54 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e6-20020a056000120600b002c70bfe505esm8382524wrx.82.2023.03.13.07.38.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 07:38:54 -0700 (PDT)
Message-ID: <10381f45-062a-0f14-b40c-bf7c10920ff6@linaro.org>
Date: Mon, 13 Mar 2023 15:38:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] ui/cocoa: user friendly characters for release mouse
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, BALATON Zoltan <balaton@eik.bme.hu>
References: <E1pAClj-0003Jo-OB@lizzy.crudebyte.com>
 <4105880.gIe6kQ2GIU@silver> <a04086d1-474c-8fcb-025d-27bc8b847fa8@eik.bme.hu>
 <1983408.hr7SJzzTYm@silver>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <1983408.hr7SJzzTYm@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

On 13/3/23 14:53, Christian Schoenebeck wrote:
> On Monday, March 13, 2023 2:42:36 PM CET BALATON Zoltan wrote:
>> On Mon, 13 Mar 2023, Christian Schoenebeck wrote:
>>> On Monday, February 27, 2023 12:28:02 PM CET Christian Schoenebeck wrote:
>>>> On Tuesday, December 27, 2022 5:15:31 PM CET Christian Schoenebeck wrote:
>>>>> While mouse is grabbed, window title contains a hint for the user what
>>>>> keyboard keys to press to release the mouse. Make that hint text a bit
>>>>> more user friendly for a Mac user:
>>>>>
>>>>>   - Replace "Ctrl" and "Alt" by appropriate symbols for those keyboard
>>>>>     keys typically displayed for them on a Mac (encode those symbols by
>>>>>     using UTF-8 characters).
>>>>>
>>>>>   - Drop " + " in between the keys, as that's not common on macOS for
>>>>>     documenting keyboard shortcuts.
>>>>>
>>>>>   - Convert lower case "g" to upper case "G", as that's common on macOS.
>>>>>
>>>>>   - Add one additional space at start and end of key stroke set, to
>>>>>     visually separate the key strokes from the rest of the text.
>>>>>
>>>>> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
>>>>> ---
>>>>
>>>> Ping
>>>
>>> Gerd,
>>>
>>> given that I got a RB and TB from Philippe, would you queue this minor macOS
>>> patch please?
>>
>> Isn't this already merged as 23bdd0de97a18 ?
> 
> Ah yes, thanks! Sorry for the noise!

Sorry my bad, back then I forgot to reply to the patch mentioning
I'd queue this patch.

