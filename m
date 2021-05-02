Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C98853709CE
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 06:12:04 +0200 (CEST)
Received: from localhost ([::1]:58530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ld3Sd-0003VM-UP
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 00:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1ld3RM-000358-Np
 for qemu-devel@nongnu.org; Sun, 02 May 2021 00:10:44 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:21222
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1ld3RK-0001Ka-Ty
 for qemu-devel@nongnu.org; Sun, 02 May 2021 00:10:44 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4FXt4Q2bVGz8PbN;
 Sun,  2 May 2021 00:12:54 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=bGzloVK1H
 VKytMDtfCZmqpRMlWU=; b=f/el+IxQGVlWoK0JE2CPN/nX7MWl1r9+dow1DVvq+
 7TjWB1H4kpSLR0c5Dho4RnNVTwjemVb7Kf2ZwrXv3EtLvI5SewJz/Mh1cpbBFK1w
 D/4FPgb7YOaFxOTI35PFm0XviwCUvw0liBBGj2/nvS36AJ8zvGoWETXa06/bUWAN
 70=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=fIi
 DNLCxONUWZu4AvYOgvcLuhhrglknBWTYv/tvfxZNBaKn94SD57xwiOVagFM22JNb
 vuW+rtEyimzm5H18UTMRFlBK4g33OEo5VbR4gnrBVChAHEdjrJvqMIONBtq4Wx2H
 PyoBLRIMf7WkLv+TPq3iGf5g7j0yzO5opSxPMj8Q=
Received: from [192.168.3.42]
 (bras-base-toroon2719w-grc-49-142-114-9-241.dsl.bell.ca [142.114.9.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4FXt4Q1wkgz8PbK;
 Sun,  2 May 2021 00:12:54 -0400 (EDT)
Message-ID: <78602d9d-e111-05f0-c91d-debb6e78009f@comstyle.com>
Date: Sun, 2 May 2021 00:10:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101
 Thunderbird/89.0
Subject: Re: [PATCH] tap-bsd: Remove special casing for older OpenBSD releases
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <YF5y+MDiK2QInFA2@humpty.home.comstyle.com>
 <8571b8c8-f3ed-ef67-6ea3-2e6652a2e435@redhat.com>
 <1787bf01190.27f3.c0f5e3539a5acb9c2563017afaca17d6@comstyle.com>
 <35befc6a-6167-1251-75ec-35e723b7547b@redhat.com>
 <c34234c1-5221-afd3-b850-1e78e566e2b5@comstyle.com>
 <0d0e3ba7-ce55-bb63-109b-86792d3ac08a@redhat.com>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <0d0e3ba7-ce55-bb63-109b-86792d3ac08a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 4/1/2021 3:24 AM, Jason Wang wrote:
>
> =E5=9C=A8 2021/3/30 =E4=B8=8A=E5=8D=884:38, Brad Smith =E5=86=99=E9=81=93=
:
>> On 3/28/2021 11:58 PM, Jason Wang wrote:
>>
>>>
>>> =E5=9C=A8 2021/3/29 =E4=B8=8A=E5=8D=8811:03, Brad Smith =E5=86=99=E9=81=
=93:
>>>> It very much is correct. We don't care about such releases anymore.
>>>
>>>
>>> So is there a doc/wiki to say Qemu doesn't support those OpenBSD=20
>>> release?
>>
>> The (OpenBSD itself and QEMU) project only makes a concerted effort=20
>> to support
>> two previous releases. I can't remember where in the QEMU Wiki it is=20
>> mentioned.
>>
>> Just looking at the Meson requirement alone limits us to the previous=20
>> two releases
>> never mind older. Even if that wasn't a consideration there would be=20
>> issues with
>> a few other dependencies like Gtk before going back this far to=20
>> support such old
>> OpenBSD releases.
>>
>>
>
> Ok. So I've applied this patch.
>
> Thanks


I do not see where.


