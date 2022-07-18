Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 365AD578720
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 18:21:16 +0200 (CEST)
Received: from localhost ([::1]:50632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDTUh-0001Xt-5H
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 12:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDTRg-0006Hl-BP
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 12:18:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDTRd-0008QA-8N
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 12:18:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658161084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5gBjJj+lQofDeENmXcPF4XxOkbeER3FzHyFLFUMHP/M=;
 b=GlHFVF+ithkxwvxzz+Oozuq+LLpsFRFIh0r6aMFLyzEggZIMRQQ1ki/AFXZbVSTNYTh6ek
 37F4Khfj85KHnkXeNJgo5uZmrWuCXpdnwBjMgdQJP30fSXTqAb5Xn67kvdZlPC3rJx7XZ1
 0koPDAm4wx5TBZ15iREqtkDoNjTGwh4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-yTy4jqmhNMWknZnC2BsiAQ-1; Mon, 18 Jul 2022 12:17:57 -0400
X-MC-Unique: yTy4jqmhNMWknZnC2BsiAQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 189-20020a1c02c6000000b003a2d01897e4so4621513wmc.9
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 09:17:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5gBjJj+lQofDeENmXcPF4XxOkbeER3FzHyFLFUMHP/M=;
 b=waF6Pd08J3By7ywk0WlEyZE89e2xXP2OE2/AwXiwTTneXUUqG3v3enP8ugHIxqsLqu
 5xeLE0jUmTi9PcJM1pM32C6Dfl2sIPzHuyPnCf0W0nkCl3fdKBxYnjV1Q9adlNLcIITi
 YWh72MaGgsiMJROzsPVRwvSRTIyWs+fRqnSYW6kw/AWjEVDyuatLs05jFocJmzZ30xnI
 vvauqpBx4qDUJ3JTUk8nzotGC8atfo2cZ1LIl0+w+RFLdZN/1vFmsRP/eDKpIClIRO9z
 HkYkHBO23/jxCMbzv8Xc7i78idBBaATO4r3Ot+2jVceYDCCltqx6j8J7+Yq7CABDiSpY
 2K8w==
X-Gm-Message-State: AJIora9hEY1RMazRhL9H/ykEzeAX9AjN1uRyHkEtbtB4eu0/nhqVrcMr
 PiKr8mYKzh+gOWqLfbo8FjD720Y39vypkARZiKS9OyygDd9LCKjDbF3/OpJ0HmvbpmxkpQjym9t
 R63jhyNzl/VVSHoU=
X-Received: by 2002:adf:d1e2:0:b0:21d:d40b:d816 with SMTP id
 g2-20020adfd1e2000000b0021dd40bd816mr13246223wrd.682.1658161076247; 
 Mon, 18 Jul 2022 09:17:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vGflLjHeoKYsouobJDCvYxy030MsXX83HJzh4EtoAU8cKDQiGZ97Hlq7W+Oj0me37S7QdlAg==
X-Received: by 2002:adf:d1e2:0:b0:21d:d40b:d816 with SMTP id
 g2-20020adfd1e2000000b0021dd40bd816mr13246202wrd.682.1658161076019; 
 Mon, 18 Jul 2022 09:17:56 -0700 (PDT)
Received: from [192.168.8.104] (tmo-096-80.customers.d1-online.com.
 [80.187.96.80]) by smtp.gmail.com with ESMTPSA id
 f20-20020a7bc8d4000000b003a2e42ae9a4sm2489676wml.14.2022.07.18.09.17.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 09:17:55 -0700 (PDT)
Message-ID: <0a1823db-1f22-3bfb-d756-832b0bca970a@redhat.com>
Date: Mon, 18 Jul 2022 18:17:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 03/12] qga: Replace '--blacklist' command line option by
 '--denylist'
Content-Language: en-US
To: Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: Eduardo Otubo <otubo@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20210202205824.1085853-1-philmd@redhat.com>
 <20210202205824.1085853-4-philmd@redhat.com>
 <20210203100952.GD300990@redhat.com>
 <50e2133b-a6a2-a878-366f-eadcfd453aa@eik.bme.hu>
 <20210203154708.GE5507@merkur.fritz.box>
 <20210203160231.3rjn5rxjjzcnk7jb@amd.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20210203160231.3rjn5rxjjzcnk7jb@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/02/2021 17.02, Michael Roth wrote:
> On Wed, Feb 03, 2021 at 04:47:08PM +0100, Kevin Wolf wrote:
>> Am 03.02.2021 um 13:45 hat BALATON Zoltan geschrieben:
>>> On Wed, 3 Feb 2021, Daniel P. Berrangé wrote:
>>>> On Tue, Feb 02, 2021 at 09:58:15PM +0100, Philippe Mathieu-Daudé wrote:
>>>>> Follow the inclusive terminology from the "Conscious Language in your
>>>>> Open Source Projects" guidelines [*] and replace the word "blacklist"
>>>>> appropriately.
>>>>>
>>>>> Keep the --blacklist available for backward compatibility.
>>>>>
>>>>> [*] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fconscious-lang%2Fconscious-lang-docs%2Fblob%2Fmain%2Ffaq.md&amp;data=04%7C01%7Cmichael.roth%40amd.com%7Cd17bb9d899914df4e04108d8c85b068f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637479640585250068%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=HM%2Fg%2B79VIjp%2BR9bIVBDPkYHHbFa9C3sGMvhomxhJdgE%3D&amp;reserved=0
>>>>>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>> ---
>>>>>   docs/interop/qemu-ga.rst | 2 +-
>>>>>   qga/main.c               | 6 ++++--
>>>>>   2 files changed, 5 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/docs/interop/qemu-ga.rst b/docs/interop/qemu-ga.rst
>>>>> index 9a590bf95cb..89596e646de 100644
>>>>> --- a/docs/interop/qemu-ga.rst
>>>>> +++ b/docs/interop/qemu-ga.rst
>>>>> @@ -79,7 +79,7 @@ Options
>>>>>
>>>>>     Daemonize after startup (detach from terminal).
>>>>>
>>>>> -.. option:: -b, --blacklist=LIST
>>>>> +.. option:: -b, --denylist=LIST
>>>>>
>>>>>     Comma-separated list of RPCs to disable (no spaces, ``?`` to list
>>>>>     available RPCs).
>>>>> diff --git a/qga/main.c b/qga/main.c
>>>>> index 249fe06e8e5..66177b9e93d 100644
>>>>> --- a/qga/main.c
>>>>> +++ b/qga/main.c
>>>>> @@ -257,7 +257,8 @@ QEMU_COPYRIGHT "\n"
>>>>>   #ifdef _WIN32
>>>>>   "  -s, --service     service commands: install, uninstall, vss-install, vss-uninstall\n"
>>>>>   #endif
>>>>> -"  -b, --blacklist   comma-separated list of RPCs to disable (no spaces, \"?\"\n"
>>>>> +"  --blacklist       backward compatible alias for --denylist (deprecated)\n"
>>>>> +"  -b, --denylist    comma-separated list of RPCs to disable (no spaces, \"?\"\n"
>>>>
>>>>
>>>> "-b" is a bit odd as a short name now, but i guess that's not the end
>>>> of the world.
>>>
>>> Maybe -b, --block  or --block-rpc? Not the best but at least preserves
>>> consistency with the short option.
>>
>> I was thinking about something like --blocked-rpcs, too, so +1 from me
>> for your latter option.
>>
>> If we're touching these names, let's try to actually make them good, not
>> just different. Neither --blacklist nor --denylist actually describe
>> well what the option does.
> 
> +1 on --blocked-rpcs

Looks like there was never a follow up on this patch? Philippe, could you 
maybe respin with the suggested changes?

  Thomas


