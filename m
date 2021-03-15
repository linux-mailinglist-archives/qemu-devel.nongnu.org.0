Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 601BC33C09C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 16:56:10 +0100 (CET)
Received: from localhost ([::1]:53112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLpZh-0001Un-Cq
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 11:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLpWk-0008ET-VP
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:53:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLpWj-0002QV-9R
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:53:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615823584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=23EH66u0DJAbJFUXv6VwJaIFajThaoYUw6jlBprIwRI=;
 b=LFZfrgMNyAAkhGgQVvP8H7nSuATadIFkTSctq9FgmwEvMMvvy232wQSUxceiZHyVqzCSIA
 qSlsRadK2wSdIjv5JxLqO7eAbjRGURI/EtaT5DeBkeEheramo2/KHWaBz04C/XYPjOo+gX
 0npeRFyvEwrY7TlzAE76882BkHXAKhg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-hiH81AxiPQaI4KLEArbjBA-1; Mon, 15 Mar 2021 11:53:02 -0400
X-MC-Unique: hiH81AxiPQaI4KLEArbjBA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06E301015C8A;
 Mon, 15 Mar 2021 15:53:01 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E79E85D9DC;
 Mon, 15 Mar 2021 15:52:59 +0000 (UTC)
Subject: Re: [RFC PATCH] configure: Poison (almost) all target-specific
 #defines
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210315135410.221729-1-thuth@redhat.com>
 <5f8be2a7-5baf-7cdc-42a1-954ea3aeba82@redhat.com>
 <9a6fd794-8ac5-a054-7bf5-b485d57fb1a3@redhat.com>
 <CAFEAcA9KvqMycFysq_U1NHwUx8RZToZ5DXvqGnhpuw8XcGhrSQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <94307555-3d39-b993-d8b3-ea78cb675be1@redhat.com>
Date: Mon, 15 Mar 2021 16:52:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9KvqMycFysq_U1NHwUx8RZToZ5DXvqGnhpuw8XcGhrSQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/03/2021 16.37, Peter Maydell wrote:
> On Mon, 15 Mar 2021 at 15:26, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 15/03/2021 15.52, Philippe Mathieu-Daudé wrote:
>>> On 3/15/21 2:54 PM, Thomas Huth wrote:
>>>> We are generating a lot of target-specific defines in the *-config-devices.h
>>>> and *-config-target.h files. Using them in common code is wrong and leads
>>>> to very subtle bugs since a "#ifdef CONFIG_SOMETHING" is not working there
>>>> as expected. To avoid these issues, we are already poisoning some of the
>>>> macros in include/exec/poison.h - but maintaining this list manually is
>>>> cumbersome. Thus let's generate the list of poisoned macros automatically
>>>> instead.
>>>> Note that CONFIG_TCG (which is also defined in config-host.h) and
>>>
>>> IIRC we can't poison CONFIG_XEN / CONFIG_HAX because they are
>>> pulled in via "sysemu/hw_accel.h".
>>
>> That's a good hint ... but I think it can be fixed with a patch like this:
>>
>> diff a/include/sysemu/hw_accel.h b/include/sysemu/hw_accel.h
>> --- a/include/sysemu/hw_accel.h
>> +++ b/include/sysemu/hw_accel.h
>> @@ -12,19 +12,24 @@
>>    #define QEMU_HW_ACCEL_H
>>
>>    #include "hw/core/cpu.h"
>> +
>> +#ifdef NEED_CPU_H
>> +
>>    #include "sysemu/hax.h"
>>    #include "sysemu/kvm.h"
>>    #include "sysemu/hvf.h"
>>    #include "sysemu/whpx.h"
> 
> This doesn't look right, because sysemu/kvm.h itself contains
> a NEED_CPU_H check, which implies that there are situations where
> NEED_CPU_H is not defined and we need to pull in the header.

I just tried, and QEMU seems to compile fine with my patch... I guess the 
check for NEED_CPU_H is mainly required for files that include 
"sysemu/kvm.h" directly, without the detour via hw_accel.h.

Anyway, I can also push the check rather into the hax.h, hvf.h and whpx.h 
files themselves, to make them more similar to kvm.h.

  Thomas


