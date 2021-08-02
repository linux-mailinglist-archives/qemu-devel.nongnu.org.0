Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522063DD70E
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 15:28:35 +0200 (CEST)
Received: from localhost ([::1]:54582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAXze-0000mO-DE
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 09:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mAXyl-0008Nm-9Q
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:27:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mAXyj-0003NG-Mx
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:27:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627910856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tduLZy3TSmlMByw2yMfDIeiOph0gEYrwn/iNgFd/KT0=;
 b=O5AHXTj+kfsvYUUdXCZehaqOVSRXcbjEcVhTGHkOWtL7t6kv7xKXFlJ7EVFEgjn+NwcqkR
 xMvWxWOiAs6xa2cP9kKmtWe9RwRc4ZgrCN3oDj51PVoC/dQcVGop1dd1WoAoV0Z1LOIKsB
 9mz63gY6K1GYPVpB4JQaASZCfagL4CY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-l3yAXp2wPAu3AAk4t5Nhng-1; Mon, 02 Aug 2021 09:27:35 -0400
X-MC-Unique: l3yAXp2wPAu3AAk4t5Nhng-1
Received: by mail-wm1-f70.google.com with SMTP id
 a197-20020a1c98ce0000b029025831695a2eso2044642wme.4
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 06:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tduLZy3TSmlMByw2yMfDIeiOph0gEYrwn/iNgFd/KT0=;
 b=rE6Te8VlogvXysKIe4XUCiF7O0bi0SrNFrQ6aKFfwZVEK1JHujnlF6R5cclmYRPBUV
 1YfZBfe0ioHtOMDGqH55eS7ya64tnetOwSQvgRTP40DHOLiKJHkxfHbC2NLo4y4lNynM
 88M/R6VqLa+i0W0YkoX5jOmpEv4fEHEXYWE7mt17nEaCNEnYpoog3korsOU+ILoHwukV
 5aP27dwuFilZDpHfHexVC2fpC4dO19UBWl1X01q+yDkxYUvJuqkStph3jSOBM9Iplniu
 cTLQvM7CY6Qv6twgDppJyNND5S09OQbcBsgZATEbx4IkvIml86gcmDbd25yUcMPjmyrn
 C+1g==
X-Gm-Message-State: AOAM53367cqYXQTPWYZzGuZ1obNkU26AhglqR3B4GqICxzJeRHQ42eJ1
 DUzi+52pbXvZp4Qt7ExkIOm/+XXmnR4E4sQuWut8r+M9UokndGdKt5RnyZiEEkU1IexIaHNC+hU
 E6Jew7TqssysioSw=
X-Received: by 2002:adf:e5cf:: with SMTP id a15mr17617067wrn.362.1627910854345; 
 Mon, 02 Aug 2021 06:27:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+M+7I+o7XoQf0Xr0VXfB4SJ97ret+hOQzezogcO0RefdsHAUY4MQUVLGXsPVW5rHEXQEKlQ==
X-Received: by 2002:adf:e5cf:: with SMTP id a15mr17617044wrn.362.1627910854146; 
 Mon, 02 Aug 2021 06:27:34 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83171.dip0.t-ipconnect.de.
 [217.232.49.113])
 by smtp.gmail.com with ESMTPSA id g138sm12602709wmg.32.2021.08.02.06.27.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 06:27:33 -0700 (PDT)
Subject: Re: "make check-acceptance" takes way too long
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <YQeu+Jm2Q0NlQ2Im@redhat.com> <878s1kgg2f.fsf@linaro.org>
 <YQfsb4MQY+EL6LMl@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d9600d53-7532-761e-9dfb-44c13967f162@redhat.com>
Date: Mon, 2 Aug 2021 15:27:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQfsb4MQY+EL6LMl@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/08/2021 15.00, Daniel P. Berrangé wrote:
> On Mon, Aug 02, 2021 at 01:55:44PM +0100, Alex Bennée wrote:
>>
>> Daniel P. Berrangé <berrange@redhat.com> writes:
>>
>>> On Fri, Jul 30, 2021 at 04:12:27PM +0100, Peter Maydell wrote:
>>>> "make check-acceptance" takes way way too long. I just did a run
>>>> on an arm-and-aarch64-targets-only debug build and it took over
>>>> half an hour, and this despite it skipping or cancelling 26 out
>>>> of 58 tests!
>>>>
>>>> I think that ~10 minutes runtime is reasonable. 30 is not;
>>>> ideally no individual test would take more than a minute or so.
>>>>
>>>> Output saying where the time went. The first two tests take
>>>> more than 10 minutes *each*. I think a good start would be to find
>>>> a way of testing what they're testing that is less heavyweight.
>>>
>>> While there is certainly value in testing with a real world "full" guest
>>> OS, I think it is overkill as the default setup. I reckon we would get
>>> 80-90% of the value, by making our own test image repo, containing minimal
>>> kernel builds for each machine/target combo we need, together with a tiny
>>> initrd containing busybox.
>>
>> Also another minor wrinkle for this test is because we are booting via
>> firmware we need a proper disk image with bootloader and the rest of it
>> which involves more faff than a simple kernel+initrd (which is my goto
>> format for the local zoo of testing images I have).
> 
> Ok, so that would require a bootloader build too, which is likely going
> to be arch specific, so probably the most tedious part.

Maybe we could use buildroot for this. I've used buildroot for my images in 
the QEMU Advent Calendar, and it was really a great help. See also:

  http://people.redhat.com/~thuth/blog/general/2019/01/28/buildroot.html

  Thomas


