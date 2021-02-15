Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6029831B924
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:26:10 +0100 (CET)
Received: from localhost ([::1]:35990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcx7-0003hc-Dv
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:26:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1lBcTZ-0004H9-5X; Mon, 15 Feb 2021 06:55:37 -0500
Received: from kerio.kamp.de ([195.62.97.192]:51677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1lBcTT-0005J6-75; Mon, 15 Feb 2021 06:55:36 -0500
X-Footer: a2FtcC5kZQ==
Received: from [172.21.12.60] ([172.21.12.60]) (authenticated user pl@kamp.de)
 by kerio.kamp.de with ESMTPSA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits));
 Mon, 15 Feb 2021 12:55:20 +0100
Subject: Re: [PATCH V2 1/7] block/rbd: bump librbd requirement to luminous
 release
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210126112540.11880-1-pl@kamp.de>
 <20210126112540.11880-2-pl@kamp.de> <20210215102401.GB1542881@redhat.com>
 <4b010479-bd8b-85e9-ef29-88524fef6495@kamp.de>
 <20210215114101.GD1542881@redhat.com>
 <5cc0ff5a-5360-5d81-2da9-724a2baf9f6d@kamp.de>
 <20210215115114.GE1542881@redhat.com>
From: Peter Lieven <pl@kamp.de>
Message-ID: <3cece68c-3aff-fae1-4eef-13bfc92d13e5@kamp.de>
Date: Mon, 15 Feb 2021 12:55:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210215115114.GE1542881@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, ct@flyingcircus.io,
 qemu-devel@nongnu.org, mreitz@redhat.com, pbonzini@redhat.com,
 dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 15.02.21 um 12:51 schrieb Daniel P. Berrangé:
> On Mon, Feb 15, 2021 at 12:45:01PM +0100, Peter Lieven wrote:
>> Am 15.02.21 um 12:41 schrieb Daniel P. Berrangé:
>>> On Mon, Feb 15, 2021 at 12:32:24PM +0100, Peter Lieven wrote:
>>>> Am 15.02.21 um 11:24 schrieb Daniel P. Berrangé:
>>>>> On Tue, Jan 26, 2021 at 12:25:34PM +0100, Peter Lieven wrote:
>>>>>> even luminous (version 12.2) is unmaintained for over 3 years now.
>>>>>> Bump the requirement to get rid of the ifdef'ry in the code.
>>>>> We have clear rules on when we bump minimum versions, determined by
>>>>> the OS platforms we target:
>>>>>
>>>>>      https://qemu.readthedocs.io/en/latest/system/build-platforms.html
>>>>>
>>>>> At this time RHEL-7 is usually the oldest platform, and it
>>>>> builds with RBD 10.2.5, so we can't bump the version to 12.2.
>>>>>
>>>>> I'm afraid this patch has to be dropped.
>>>> I have asked exactly this question before I started work on this series and got reply
>>>>
>>>> from Jason that he sees no problem in bumping to a release which is already unmaintained
>>>>
>>>> for 3 years.
>>> I'm afraid Jason is wrong here.  It doesn't matter what the upstream
>>> consider the support status to be. QEMU targets what the OS vendors
>>> ship, and they still consider this to be a supported version.
>>
>> Okay, but the whole coroutine stuff would get a total mess with all the ifdef'ry.
> Doesn't seem like the write zeros code is adding much more comapred to
> the ifdefs that already exist...


Yes, I don't like it as well, but write zeroes support was only added in Nautilus (14.x) and the thick provisioning

that Jason asked me to add came only with Octopus (15.x).


>
>
>> Would it be an option to make a big ifdef in the rbd driver? One with old code for < 12.0.0 and one
>>
>> with new code for >= 12.0.0?
> ..but I don't have a strong opinion on that, since I'm not maintaining this
> driver.
>
>
> BTW, we will be free to drop RHEL-7 in the next development cycle of
> QEMU, starting after the forthcoming 6.0.0 release is out, as it will
> fall out of our OS support matrix.


Thanks for that hint. I would say lets hold this series back until Qemu 6.1.

Where can I find the OS support matrix for 6.1 - maybe we can bump the requirement to nautilus to

reduce the ifdef'ry further.


Peter




