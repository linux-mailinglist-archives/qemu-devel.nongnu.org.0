Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0DA56636B
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 08:53:55 +0200 (CEST)
Received: from localhost ([::1]:40108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8cRW-0005yb-1P
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 02:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o8cOn-0003o1-Sj; Tue, 05 Jul 2022 02:51:05 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o8cOm-0005TE-4Q; Tue, 05 Jul 2022 02:51:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qHWqjVEnckg9kqPQ1HOoDPWNjYMpv7tQtYKr67b6Aa8=; b=llpbbs/N1YPmbPZYmbDpCvrOQ5
 t17+RYuVcV/ko+/n2FiRZKX2MN2tZcsyn68CspfEybtonZTCoeKF0NQlK2uwDH1M4FcXLRkEdIxyE
 qeP47axhfmZ9jNmC4EG+k3iR88ZPU3pwUSuVS71kvLYrMV6ONoeDjDgzjZ76UE/HdR5yLiY2tHFJH
 LFe1iRxlPfvtKkOJ2CNPoM4CtJ/4hbT2dO6CRmAViK+2p0LLTBJ6GPiZ/9Jd6TT9aeQGJPGHwhXBz
 lY1HBCxBS5sA4/MDHA23jjZ8Bh8PICKimcErt4Gdj0ds8TZetlKcaGIsIuhcKaM3E4OpID4TsB/g8
 6z30e7u5wBB5cEg7o8zIfghDzdF339D5Bevyb7peOawT1QmAiQ4Np2sgC7ZkTPXjsdzNHJwa58QwG
 A8c11HeONAI2y2M9aI+eEEDtO4vvFSEyujHwsACNBL4kP1kiTGb7oNBsCZYPTkpe+ElwDuucuaXs7
 VdgJDF4ymaUuf2Q+OXtBffckcfn6HqG21oK4OrMeerUoiDHeIHDO3v+aNjEijQNBfVzbF8KKbg7Tz
 Rk+7JTwetXcHtjhXjdx2KiBqoBtleK1ssO4v1IeAMlYIWQD65LdlbPNfH2TSKuKciiIlc2QVMqbcb
 YyURp0KtYm78Spq2yXC5Dy3Zuq111fnqNmo3ujf4A=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o8cNX-000Arc-Ln; Tue, 05 Jul 2022 07:49:48 +0100
Message-ID: <1d2cd44f-fd61-4693-ecc0-f71c80131005@ilande.co.uk>
Date: Tue, 5 Jul 2022 07:51:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org
References: <20220630194249.886747-1-danielhb413@gmail.com>
 <20220630194249.886747-3-danielhb413@gmail.com>
 <55014e2a-a668-4843-8338-850abeb5ff04@kaod.org>
 <47277f4f-a6a5-85dc-4806-67df8e2fc153@gmail.com>
 <6d37b1dc-5dfb-2513-f74e-3f58e84e8117@kaod.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <6d37b1dc-5dfb-2513-f74e-3f58e84e8117@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 2/9] target/ppc: add errp to kvmppc_read_int_cpu_dt()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 04/07/2022 18:34, Cédric Le Goater wrote:

> On 7/2/22 15:34, Daniel Henrique Barboza wrote:
>>
>>
>> On 7/2/22 03:24, Cédric Le Goater wrote:
>>> On 6/30/22 21:42, Daniel Henrique Barboza wrote:
>>>> The function can't just return 0 whether an error happened and call it a
>>>> day. We must provide a way of letting callers know if the zero return is
>>>> legitimate or due to an error.
>>>>
>>>> Add an Error pointer to kvmppc_read_int_cpu_dt() that will be filled
>>>> with an appropriate error, if one occurs. Callers are then free to pass
>>>> an Error pointer and handle it.
>>>>
>>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>> ---
>>>>   target/ppc/kvm.c | 16 +++++++++-------
>>>>   1 file changed, 9 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>>>> index 109823136d..bc17437097 100644
>>>> --- a/target/ppc/kvm.c
>>>> +++ b/target/ppc/kvm.c
>>>> @@ -1925,15 +1925,17 @@ static uint64_t kvmppc_read_int_dt(const char *filename)
>>>>   /*
>>>>    * Read a CPU node property from the host device tree that's a single
>>>> - * integer (32-bit or 64-bit).  Returns 0 if anything goes wrong
>>>> - * (can't find or open the property, or doesn't understand the format)
>>>> + * integer (32-bit or 64-bit).  Returns 0 and set errp if anything goes
>>>> + * wrong (can't find or open the property, or doesn't understand the
>>>> + * format)
>>>>    */
>>>> -static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
>>>> +static uint64_t kvmppc_read_int_cpu_dt(const char *propname, Error **errp)
>>>>   {
>>>>       char buf[PATH_MAX], *tmp;
>>>>       uint64_t val;
>>>>       if (kvmppc_find_cpu_dt(buf, sizeof(buf))) {
>>>> +        error_setg(errp, "Failed to read CPU property %s", propname);
>>>>           return 0;
>>>>       }
>>>> @@ -1946,12 +1948,12 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
>>>>   uint64_t kvmppc_get_clockfreq(void)
>>>>   {
>>>> -    return kvmppc_read_int_cpu_dt("clock-frequency");
>>>> +    return kvmppc_read_int_cpu_dt("clock-frequency", NULL);
>>>
>>>
>>> This should be fatal. no ?
>>
>>
>> I'm not sure. I went under the assumption that there might be some weird
>> condition where 'clock-frequency' might be missing from the DT, and this
>> is why we're not exiting out immediately.
>>
>> That said, the advantage of turning this into fatal is that we won't need
>> all the other patches that handles error on this function. We're going to
>> assume that if 'clock-frequency' is missing then we can't boot. I'm okay
>> with that.
> 
> I think so. Some machines behave badly when 'clock-frequency' is bogus,
> division by zero, no console, etc. We could check easily with pseries
> which is the only KVM PPC platform.

Well not quite true ;)  I haven't tested it during the last release cycle, but the 
Mac machines were still working fine to boot OS X with KVM-PR on my G4 Mac Mini last 
time I checked.


ATB,

Mark.

