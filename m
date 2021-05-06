Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C288374DE2
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 05:17:57 +0200 (CEST)
Received: from localhost ([::1]:51024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leUWS-0002lc-Fs
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 23:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1leUVK-0001cn-Cp
 for qemu-devel@nongnu.org; Wed, 05 May 2021 23:16:46 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:8382
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1leUVI-0002gT-Jv
 for qemu-devel@nongnu.org; Wed, 05 May 2021 23:16:46 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4FbJhH5sYCz8PbQ;
 Wed,  5 May 2021 23:18:55 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=51DNp9nnl
 hUKsSUnVHkYzHwnpRA=; b=JTHA9BylDPte0m0ZSEOoO9gKUL2VNCmCGwayiColV
 24N71BPTXtjyWNGoE0xtSCFHoyWdVLCuvJNeQOlY0JjuWejn0YmEpVcWuHhdaE08
 sSNf6QVPkkkGKV+e/DCNwMNFQKWu4ng8FEYrnSz8Z9RqNUMUWdEAFPcCRZseicTR
 1s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=cqm
 UfsdtlHSHi5rQecvFaEcNCJbGanpOAemFI0xJJPJ/sO93snd3PYIS50vID54+Mmc
 8C0EVsLl9e0Pd8n3ZoYBDkLrtSx2zjMNZrNypZOUt7sk2P6W0Ub7P/+MHN6FogBw
 4fUDAZtFIbyklNyL1TF6NkcdQFVCSBAdbV3gJXZQ=
Received: from [192.168.3.75]
 (bras-base-toroon2719w-grc-49-142-114-9-241.dsl.bell.ca [142.114.9.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4FbJhH58n4z8PbP;
 Wed,  5 May 2021 23:18:55 -0400 (EDT)
Message-ID: <04e3ffd1-e791-08e3-f49c-e86b09375f23@comstyle.com>
Date: Wed, 5 May 2021 23:16:42 -0400
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
 <78602d9d-e111-05f0-c91d-debb6e78009f@comstyle.com>
 <e5df409d-2560-131d-420f-db38b148cbd7@redhat.com>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <e5df409d-2560-131d-420f-db38b148cbd7@redhat.com>
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

On 5/5/2021 10:19 PM, Jason Wang wrote:
>
> =E5=9C=A8 2021/5/2 =E4=B8=8B=E5=8D=8812:10, Brad Smith =E5=86=99=E9=81=93=
:
>> On 4/1/2021 3:24 AM, Jason Wang wrote:
>>>
>>> =E5=9C=A8 2021/3/30 =E4=B8=8A=E5=8D=884:38, Brad Smith =E5=86=99=E9=81=
=93:
>>>> On 3/28/2021 11:58 PM, Jason Wang wrote:
>>>>
>>>>>
>>>>> =E5=9C=A8 2021/3/29 =E4=B8=8A=E5=8D=8811:03, Brad Smith =E5=86=99=E9=
=81=93:
>>>>>> It very much is correct. We don't care about such releases anymore=
.
>>>>>
>>>>>
>>>>> So is there a doc/wiki to say Qemu doesn't support those OpenBSD=20
>>>>> release?
>>>>
>>>> The (OpenBSD itself and QEMU) project only makes a concerted effort=20
>>>> to support
>>>> two previous releases. I can't remember where in the QEMU Wiki it=20
>>>> is mentioned.
>>>>
>>>> Just looking at the Meson requirement alone limits us to the=20
>>>> previous two releases
>>>> never mind older. Even if that wasn't a consideration there would=20
>>>> be issues with
>>>> a few other dependencies like Gtk before going back this far to=20
>>>> support such old
>>>> OpenBSD releases.
>>>>
>>>>
>>>
>>> Ok. So I've applied this patch.
>>>
>>> Thanks
>>
>>
>> I do not see where.
>
>
> I don't queue it for 6.0 so it will be in the next pull request.
>
> Thanks


Ah, I didn't think it would be 6.0 but thought I would be able to find it
in your git repo. Anyway, thank you.


