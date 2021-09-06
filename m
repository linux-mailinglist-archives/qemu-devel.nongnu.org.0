Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A33F8401B56
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 14:44:24 +0200 (CEST)
Received: from localhost ([::1]:46870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNDz5-0008SC-GO
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 08:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNDvi-0005WO-Tz; Mon, 06 Sep 2021 08:40:54 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:41695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNDvg-00075t-Lu; Mon, 06 Sep 2021 08:40:54 -0400
Received: by mail-qv1-xf36.google.com with SMTP id p17so3883671qvo.8;
 Mon, 06 Sep 2021 05:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KC/Kw7lLAl7nQOkdvwM60e6SJZCtL4nZBM7xv1v15i8=;
 b=VRUSj7ArZMB197+IHToBu39t/LlmUTQVfKohqH4tYp1MRwzQS8dsLbwgkX8dWYRo8Q
 3FJZLKu/JrMefIv/bhRWbgbG4jOLwOzF7b6UgjrpZmr8A8uJn5OS+veDstUBNSYG8+Q/
 eXhu7a3vupgjUkoWNmnyBq1NeRQ91wSktDz698yWYtY5qJ8VT+jIUSmzrGtrNUGVvGs6
 xAgdzVjvNUB9zXQUuxNNEDjj7R79EAeomf9pcT+2QCBFjwunkbvAC5qqeQkA+CNDU3AH
 ZmqFwoTubq3zN7ekTDxDjo18tbuLxD/b9S+FKHsySDuvtXBhq7yH1LP2Y4OnEwqwA+Hs
 8e4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KC/Kw7lLAl7nQOkdvwM60e6SJZCtL4nZBM7xv1v15i8=;
 b=XAsjBqHaWRdiRKr7OXf1TU0k7g8MeD4JpKiEO6D8FBydMIFq/QIUnlzU6KDVOsD1Sy
 iSpn8iKtihnKQWLPzST4VhHq+Jskt8fphcL19yo/vcpgr0HDUDnpjlZv7+ON1df2Z/Y0
 fg489QXTuxvarylQ9uOfsE4oitPNU/sfla1sVWCCS7ZQ7ovAK+XQ4B0uL76qQpP0ulSQ
 +nYtOkZeydHdgA8Bz5BZmbmebqIt0orXM3l7M+EiIQE7jWCMhi9mSVodrrnBFrL55h5L
 Vlins9TjySF2PRFO3zyk4v5w9eqr/9JL268pMzrFSyPWeAg/OKZSYg5NkDN8ga2k1JRi
 USew==
X-Gm-Message-State: AOAM532S91PCX4N+W/0FzpG20Spk9Hfr5ucukxS17RODJZSk5ROGn0G7
 cXFIuzAmP94Cnnl9vo9UEoU=
X-Google-Smtp-Source: ABdhPJwNtUVCS/5gPGZj19KIJDB1LYDiF3qt54/EkBCNeIZH6bzYjzmtLXSDnG3+gSVK7LEoNg4mMA==
X-Received: by 2002:a0c:aa52:: with SMTP id e18mr11339723qvb.38.1630932050414; 
 Mon, 06 Sep 2021 05:40:50 -0700 (PDT)
Received: from [192.168.10.222] ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id t194sm6724983qka.72.2021.09.06.05.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 05:40:50 -0700 (PDT)
Subject: Re: [PATCH v7 5/7] qapi/qdev.json: add DEVICE_UNPLUG_GUEST_ERROR QAPI
 event
To: Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210825004835.472919-1-danielhb413@gmail.com>
 <20210825004835.472919-6-danielhb413@gmail.com>
 <87tuj4a0wx.fsf@dusky.pond.sub.org> <YTLtvn5ywJce0iqE@yekko>
 <874kb0pnlq.fsf@dusky.pond.sub.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <3dad103a-0019-2643-815a-ac9fb08b743e@gmail.com>
Date: Mon, 6 Sep 2021 09:40:47 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <874kb0pnlq.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.332,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/4/21 8:49 AM, Markus Armbruster wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
> 
>> On Wed, Sep 01, 2021 at 03:19:26PM +0200, Markus Armbruster wrote:
>>> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>>>
>>>> At this moment we only provide one event to report a hotunplug error,
>>>> MEM_UNPLUG_ERROR. As of Linux kernel 5.12 and QEMU 6.0.0, the pseries
>>>> machine is now able to report unplug errors for other device types, such
>>>> as CPUs.
>>>>
>>>> Instead of creating a (device_type)_UNPLUG_ERROR for each new device,
>>>> create a generic DEVICE_UNPLUG_GUEST_ERROR event that can be used by all
>>>> guest side unplug errors in the future. This event has a similar API as
>>>> the existing DEVICE_DELETED event, always providing the QOM path of the
>>>> device and dev->id if there's any.
>>>>
>>>> With this new generic event, MEM_UNPLUG_ERROR is now marked as deprecated.
>>>>
>>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> diff --git a/qapi/qdev.json b/qapi/qdev.json
>>>> index 0e9cb2ae88..8b1a1dd43b 100644
>>>> --- a/qapi/qdev.json
>>>> +++ b/qapi/qdev.json
>>>> @@ -84,7 +84,9 @@
>>>>   #        This command merely requests that the guest begin the hot removal
>>>>   #        process.  Completion of the device removal process is signaled with a
>>>>   #        DEVICE_DELETED event. Guest reset will automatically complete removal
>>>> -#        for all devices.
>>>> +#        for all devices.  If a guest-side error in the hot removal process is
>>>> +#        detected, the device will not be removed and a DEVICE_UNPLUG_GUEST_ERROR
>>>> +#        event is sent.  Some errors cannot be detected.
>>>>   #
>>>>   # Since: 0.14
>>>>   #
>>>> @@ -124,3 +126,27 @@
>>>>   ##
>>>>   { 'event': 'DEVICE_DELETED',
>>>>     'data': { '*device': 'str', 'path': 'str' } }
>>>> +
>>>> +##
>>>> +# @DEVICE_UNPLUG_GUEST_ERROR:
>>>> +#
>>>> +# Emitted when a device hot unplug fails due to an internal guest
>>>> +# error.
>>>
>>> Suggest to scratch "internal".
>>
>> I'd suggest s/internal guest/guest reported/.  "guest error" is a bit
>> vague, this doesn't neccessarily indicate a bug in the guest.  The key
>> point is that we're reporting this event because the guest performed
>> some explicit action to tell us something went wrong with the plug
>> attempt.
> 
> Yes, that's better.


I agree.  David, let me know if you need another spin with this change.



Thanks,


Daniel

> 
> [...]
> 

