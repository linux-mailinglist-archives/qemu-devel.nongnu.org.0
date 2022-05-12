Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251EC52466C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 09:05:27 +0200 (CEST)
Received: from localhost ([::1]:33028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np2t4-0002bb-66
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 03:05:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1np2nv-0000eL-KG
 for qemu-devel@nongnu.org; Thu, 12 May 2022 03:00:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1np2nt-0000n3-Lx
 for qemu-devel@nongnu.org; Thu, 12 May 2022 03:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652338804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TM+ITnLYvQ0VAufzQII/vr1ZlkZ8/4Ufh4s2lpHdMd0=;
 b=SnFsZrDSDlDhdqMPpOJulk/ZqSOi5CX1LDpDa9mYNgDHa8yASEESHYNzmdgnA6XCx4XTOj
 QTOFrvDRU2yYOsXbFQnxXzLA56PO+hERSB3NKQ7iTfW/UuQgMT0N3NvMd+KV+VgfvMt99m
 TbBhwdSoGse5BLrFG9buu6kiQzgLM1U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-fEtKxeMdOg2jI5_HgR-q-A-1; Thu, 12 May 2022 03:00:03 -0400
X-MC-Unique: fEtKxeMdOg2jI5_HgR-q-A-1
Received: by mail-wm1-f71.google.com with SMTP id
 n26-20020a1c721a000000b003941ea1ced7so1298823wmc.7
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 00:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=TM+ITnLYvQ0VAufzQII/vr1ZlkZ8/4Ufh4s2lpHdMd0=;
 b=Gm2Cz+4LMGcTN73l08TnKKn9gDg8qse9aHbKac0L9pv3nkwGQGmAUo8cpmTs41yejt
 8h8I6zdXPvqekO+lSq+OkfJCJ7j9dZQ2uuFBHgGWbelLA9ORazchYC1MUzi5Gk6QGTVq
 NnxQ+c+5TwuZeJfhNSjVLyx2N7yuGC/pB9QI0+TxhHmefMZ0tZHaMTwvVHcR8kRgZFRP
 7fwYox+cu3YX4HKHLwpvFrOx7eWYcjnjEkVnR3JZbyUEORbXrN9oOusgTWNhyDceufef
 Qv8aw+icZ6mZSwAkP/I+WXoYsKJ7G25YyDKAw34xj3p+U++Fhc8VeOE9wP5ogNK/Bvsp
 3GqA==
X-Gm-Message-State: AOAM533M7s0drUvR6AzjZVfOv6nNwDa9kmkfV7MN8tqWqRLHiubR11h8
 imQmSMrjWQ66QbdDxMVCJlyDfYxrMYONWnLriOZs8vKIGdJsOt6dMlLfTB73LcwfmmiXR27Itng
 K4mgZIKyWuHPuZRQ=
X-Received: by 2002:a05:600c:3542:b0:394:6e2f:ffa2 with SMTP id
 i2-20020a05600c354200b003946e2fffa2mr8569872wmq.132.1652338801803; 
 Thu, 12 May 2022 00:00:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxl9oTgGXt2iRmc4AZ21xty6Ttn8UONIIkfIcIRnz4hARnlg4ZrDpRJ0TLcrD9VKGf/WbYDvA==
X-Received: by 2002:a05:600c:3542:b0:394:6e2f:ffa2 with SMTP id
 i2-20020a05600c354200b003946e2fffa2mr8569849wmq.132.1652338801562; 
 Thu, 12 May 2022 00:00:01 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-176-144.web.vodafone.de.
 [109.43.176.144]) by smtp.gmail.com with ESMTPSA id
 l9-20020a5d4109000000b0020c5253d8e1sm3924592wrp.45.2022.05.12.00.00.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 00:00:00 -0700 (PDT)
Message-ID: <f215c46d-d2b7-6279-c301-82f389041ede@redhat.com>
Date: Thu, 12 May 2022 08:59:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Yonggang Luo <luoyonggang@gmail.com>,
 Stefan Weil <sw@weilnetz.de>
References: <20220505074841.406185-1-thuth@redhat.com>
 <YnOHgZWHZ3fdYXqM@redhat.com> <YnO7TUI4RV+6+WPH@redhat.com>
 <fb070833-d9d4-4842-8470-979cf7aa859d@redhat.com>
 <YnPoxFDyW+J3al8q@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] docs/about: Update the support statement for Windows
In-Reply-To: <YnPoxFDyW+J3al8q@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 05/05/2022 17.09, Daniel P. Berrangé wrote:
> On Thu, May 05, 2022 at 04:12:11PM +0200, Thomas Huth wrote:
>> On 05/05/2022 13.55, Daniel P. Berrangé wrote:
>>> On Thu, May 05, 2022 at 09:14:57AM +0100, Daniel P. Berrangé wrote:
>>>> On Thu, May 05, 2022 at 09:48:41AM +0200, Thomas Huth wrote:
>>>>> Our support statement for Windows currently talks about "Vista / Server
>>>>> 2008" - which is related to the API of Windows, and this is not easy
>>>>> to understand for the non-technical users. It might also not be quite
>>>>> true anymore, since we only compile-test QEMU with recent toolchains.
>>>>
>>>> We documented Vista / Server 2008 because that is what our code is
>>>> declaring it wants in terms of Windows public APIs:
>>>>
>>>> In osdep.h we have:
>>>>
>>>>     #ifdef _WIN32
>>>>     /* as defined in sdkddkver.h */
>>>>     #ifndef _WIN32_WINNT
>>>>     #define _WIN32_WINNT 0x0600 /* Vista */
>>>>     #endif
>>>>
>>>> which tells Mingw / MSys not to expose windows header file declarations
>>>> that post-date Vista.
>>>
>>> Of course we rely on 3rd party libraries and in particular GLib2 is
>>> mandatory, and it also set _WIN32_WINNT. So our constraint is the
>>> newer of the _WIN32_WINNT constraint set by QEMU and whatever version
>>> of GLib2 being compiled against.
>>>
>>> QEMU sets a min GLib of 2.56, and that version of GLib sets 0x0601
>>> which means Windows >= 7.  So even though QEMU only asks for Vista,
>>> in practice our minimum is 7.
>>
>> Windows 7 does not receive any security updates since 2020 anymore, so I'd
>> rather would bump it to the level of Windows 8.1 directly instead. Or
>> directly go for Windows 10 to mimic the behavior that we have with most of
>> the Linux distros (max. two major releases at a time).
> 
> I like the simplicity of having the same rule everywhere.
> 
> I'm a little wary of people being stuck on old versions, when I see
> current articles like this showing 20% of people still on Win7, way
> more than Win8 surprisingly.
> 
> https://www.statista.com/statistics/993868/worldwide-windows-operating-system-market-share/

I still think it would be better to not provide QEMU to people who fail to 
make sure that their host system is up to date with security patches...

> The thing with bumping the _WIN32_WINNT version higher though is that
> we're not really doing it for any compelling technical reasons. Usually
> when we bump min glib, it lets us cut out compatibility hacks and/or
> get access to new APIs.
> 
> Bumping _WIN32_WINNT can do that, but the interesting place where that's
> useful is mostly in GLib. I'm not sure what we'd make use of in the QEMU
> side from setting a newer _WIN32_WINNT. Hence my suggestion that we just
> let min GLib drive our min _WIN32_WINNT setting.

Ok, fair point. So let's raise the WIN32_WINNT setting to the same level as 
glib - but I think our support statement in our docs could be independent 
from that... I'll try to come up with a different phrasing in v2 of this patch.

  Thomas



