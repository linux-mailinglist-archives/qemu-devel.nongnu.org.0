Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CE9691E17
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 12:21:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQRSC-0000NF-D2; Fri, 10 Feb 2023 06:20:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQRS9-0000Jz-4n
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 06:20:29 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQRS7-0001Tx-Dm
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 06:20:28 -0500
Received: by mail-wm1-x335.google.com with SMTP id u10so3569440wmj.3
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 03:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s6/m+SW4QLI2ZUo3Q5+2Yg0VsvgY9fu1meplRPt9Cbo=;
 b=j/McQTKr7Kcn44LD1AMa+P/DsgLKKt4+DL2n/7GorOMcAOWSRjrHDKbV/UBdvVAqhw
 GrfHPWkn/xH8vc1ht+x+gepPaEP+VBc8GRUR6H50E850GN+QV30mEmv2cRyC4SenWzU6
 MmaLsudrqAfGgH0MHthj9JFEnvcNCy782+DCysnRzPLWAwV95n1v24LRbvbzz5W+sUu/
 JR99GJPY7g9wX9SHiTNnmBQWdZ588C/Zpx78n15V0Tm7qc3Ik243S/6ME/1mPCe78orJ
 onyOrZ0D7XJMuhu/vLuk+GfaehF+y4n1vGR7UBxQhAQB7e2QQizDXc0ktyeht8rNssTt
 HXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s6/m+SW4QLI2ZUo3Q5+2Yg0VsvgY9fu1meplRPt9Cbo=;
 b=GXxcKzD4GFp5kAHsO6lrih12pBZfIKdxZufXUGfatVg1X3lGBWnMLLT5yz7NiLB4LK
 Dmv/najah0CdBRuKaMa2Jy9wohE/2yK6xhu41YUeDYlLwwbI4L/iwW0CMprNEAgQgjSj
 VHdPpkle+oOzi+eH27HLxvdlcHne/BQcRwAsrHO7REfCNGQRYyINYsnCfTaC4a8CK46M
 K/CHdBSD+y8Z0PzW0UyD5nmhgzR+/dQ5Xc/rnWqujZziQDOsOMiiRWHfrGdk3dwLxmcV
 dfdJQScVYhTWyfDpH46IGQaHiMLtUy6cz+XKjKFLFl3BzRL0mQmCnTtJiw/cO5Ynf5P9
 uNGg==
X-Gm-Message-State: AO0yUKXpMFW9iDKXQpc8CeR588GVQna+KbUhmacqE5w97ZqMJeOqvA5J
 4Z+iQszLj5UfyobDyNEzTD5OvA==
X-Google-Smtp-Source: AK7set90bte7I1UAbFf8OdYGpxr+Hlv4GlhrI6+QJTwzi1uHAxARNDMfHxFBHprLuKcb8BX0SvkN9Q==
X-Received: by 2002:a05:600c:4da5:b0:3df:fbc7:5b1d with SMTP id
 v37-20020a05600c4da500b003dffbc75b1dmr12610260wmp.2.1676028025770; 
 Fri, 10 Feb 2023 03:20:25 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g20-20020a7bc4d4000000b003a3442f1229sm7916315wmk.29.2023.02.10.03.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 03:20:25 -0800 (PST)
Message-ID: <66928ea5-039a-7c62-1776-a43a61cc578b@linaro.org>
Date: Fri, 10 Feb 2023 12:20:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v3 13/15] qapi: add HOTPLUG_STATE event
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, den-plotnikov@yandex-team.ru
References: <20230209200808.869275-1-vsementsov@yandex-team.ru>
 <20230209200808.869275-14-vsementsov@yandex-team.ru>
 <c6613d1d-b489-5094-fd8c-1795159d0a80@linaro.org>
 <5ac6f2a0-ff4f-1c18-dfed-9ec24056f18f@yandex-team.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <5ac6f2a0-ff4f-1c18-dfed-9ec24056f18f@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 10/2/23 11:47, Vladimir Sementsov-Ogievskiy wrote:
> On 10.02.23 00:28, Philippe Mathieu-Daudé wrote:
>> On 9/2/23 21:08, Vladimir Sementsov-Ogievskiy wrote:
>>> For PCIe and SHPC hotplug it's important to track led indicators,
>>> especially the power led. Add an event that helps.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>>> ---
>>>   qapi/qdev.json       | 62 ++++++++++++++++++++++++++++++++++++++++++++
>>>   include/hw/pci/pci.h | 15 +++++++++++
>>>   hw/pci/pci.c         | 33 +++++++++++++++++++++++
>>>   hw/pci/pcie.c        | 49 ++++++++++++++++++++++++++++++++++
>>>   hw/pci/shpc.c        | 42 ++++++++++++++++++++++++++++++
>>>   5 files changed, 201 insertions(+)
>>>
>>> diff --git a/qapi/qdev.json b/qapi/qdev.json
>>> index 2708fb4e99..40dc34f091 100644
>>> --- a/qapi/qdev.json
>>> +++ b/qapi/qdev.json
>>> @@ -158,3 +158,65 @@
>>>   ##
>>>   { 'event': 'DEVICE_UNPLUG_GUEST_ERROR',
>>>     'data': { '*device': 'str', 'path': 'str' } }
>>> +
>>> +##
>>> +# @HotplugLedState:
>>> +#
>>> +# Since: 8.0
>>> +##
>>> +{ 'enum': 'HotplugLedState',
>>> +  'data': [ 'on', 'blink', 'off' ] }
>>
>> Could this be more helpful as generic state in "hw/misc/led.h"?
> 
> Hmm. LEDState ? Doesn't look similar..

Name 'LedActivity' so we can reuse in LEDState?

   { 'enum': 'LedActivity',
     'data': [ 'on', 'blink', 'off' ] }

