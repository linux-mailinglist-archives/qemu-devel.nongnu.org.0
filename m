Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A938841F4EB
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 20:21:10 +0200 (CEST)
Received: from localhost ([::1]:38090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWN9h-00041C-GQ
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 14:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>)
 id 1mWMxD-0000FV-4x; Fri, 01 Oct 2021 14:08:15 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:25369
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>)
 id 1mWMx7-00086X-Cg; Fri, 01 Oct 2021 14:08:14 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4HLdPy2Xv8z8PbN;
 Fri,  1 Oct 2021 14:08:06 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:from:to:cc:references:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=AaHUE05Ro
 RXBAWTJY8SLVK9hWuU=; b=S76CbgASUqxsT/42sR9D0vO8J1tpupCyUoQU/UyEm
 xoBbJz0/sW3H0a5ZuQK4mIjDMTn74S6cFeyfvrSlSucMadH7jTsyjHXlKx5W4Vwp
 xXAvlcOg6A6qY+XlBu3fDezo6/YTeUp3Ono1BuBKChXbYdJv4oY9Q0vWtgjJiR9K
 TA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:from:to:cc:references:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=nPV
 RlgXZ+95kSquMDjYOPrDL+Q2jiKmOcTyV6xfEf4PSKY52xXoORxgB8uUMu/tpnoN
 gqo+k58gHrc5TgxPHHWDpQZDKb0yEEzmC2zVqMSbPpuIGQwaMxpGnuR7G9g4UyUx
 LTJiTNNNWf6dT1dgdG9eJEN16/vhTwsRVe8y53jU=
Received: from [IPV6:2001:470:b0db:100:2180:9c72:cb7b:b0bd] (unknown
 [IPv6:2001:470:b0db:100:2180:9c72:cb7b:b0bd])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4HLdPy0f2Tz8PbK;
 Fri,  1 Oct 2021 14:08:06 -0400 (EDT)
Message-ID: <11479b02-b0f0-7f38-d43c-9443fc60a6cd@comstyle.com>
Date: Fri, 1 Oct 2021 14:08:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101
 Thunderbird/93.0
Subject: Re: [PATCH 3/3] dtc: Update to version 1.6.1
Content-Language: en-US
From: Brad Smith <brad@comstyle.com>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210827120901.150276-1-thuth@redhat.com>
 <20210827120901.150276-4-thuth@redhat.com>
 <7004c933-5262-3119-80f5-722a8e858046@redhat.com>
 <YVbQERWD9fY0kxxW@redhat.com>
 <CAFEAcA8PdNEHU2YMGT56bCwezf9i+BGxijwevLJakrR_N1Yjhw@mail.gmail.com>
 <YVbYavVeV/OmYON6@redhat.com>
 <9bbfbede-0b93-d9ea-cad9-2e7a32c0ebbf@comstyle.com>
In-Reply-To: <9bbfbede-0b93-d9ea-cad9-2e7a32c0ebbf@comstyle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.127,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/1/2021 1:54 PM, Brad Smith wrote:

> On 10/1/2021 5:44 AM, Daniel P. Berrang=C3=A9 wrote:
>
>> On Fri, Oct 01, 2021 at 10:37:51AM +0100, Peter Maydell wrote:
>>> On Fri, 1 Oct 2021 at 10:10, Daniel P. Berrang=C3=A9=20
>>> <berrange@redhat.com> wrote:
>>>> On Thu, Sep 30, 2021 at 09:10:12AM +0200, Thomas Huth wrote:
>>>>> On 27/08/2021 14.09, Thomas Huth wrote:
>>>>>> The dtc submodule is currently pointing to non-release commit.=20
>>>>>> It's nicer
>>>>>> if submodules point to release versions instead and since dtc=20
>>>>>> 1.6.1 is
>>>>>> available now, let's update to that version.
>>>> Most of our supported platforms don't have version 1.6.1 available.
>>>>
>>>> As a general goal IMHO we should be seeking to eliminate bundling of
>>>> 3rd party modules that are commonly available in distros. We've
>>>> carried dtc for a hell of a long time, and if we keep updating our
>>>> submodule we'll keep relyin on new features, and never be able to
>>>> drop it because it will always be newer than what's in the distros.
>>>>
>>>> So personally I think we should never again update dtc and capstone
>>>> modules. If we want to take adbantage of new features, then do that
>>>> through conditional compilation, as we do for any of the other 3rd
>>>> party libraries consumed.
>>> I agree in general, but (per the commit message here) our dtc
>>> submodule is currently pointing at some random not-a-release
>>> commit in upstream dtc. We should at least move forward to
>>> whatever the next released dtc after that is, before we say
>>> "no more dtc updates".
>> Yep, if we want to fix it onto an official version tag, that's
>> OK, just not jumping right to very latest version. We might want
>> to move it backwards to better align with what we're targetting
>> in the support
>>
>> Best I can tell the distros currently have these versions:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Alpine 3.14 - 1.6.1
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - CentOS 8 - 1.6.0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Debian 10 - 1.4.7
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Fedora 33 - 1.6.0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - OpenSUSE Leap 15.3 - 1.5.1
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Ubuntu 18.04 - 1.4.5
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - FreeBSD Ports - 1.6.0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - OpenBSD Ports - 1.6.0
> I already updated OpenBSD to 1.6.1.
and NetBSD is at 1.4.7.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - macOS HomeBrew - 1.6.1
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Windows MSys2 - 1.6.0
>>
>> Regards,
>> Daniel

