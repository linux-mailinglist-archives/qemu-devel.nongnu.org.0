Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 472AB35F0AA
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 11:20:17 +0200 (CEST)
Received: from localhost ([::1]:49152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWbh2-0003Ow-DM
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 05:20:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lWbfP-0001aH-TG
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 05:18:35 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:50128
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lWbfN-00058W-GG
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 05:18:35 -0400
Received: from macbook02.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 167F8DA0498;
 Wed, 14 Apr 2021 11:18:30 +0200 (CEST)
Subject: Re: any remaining for-6.0 issues?
To: Bin Meng <bmeng.cn@gmail.com>
References: <CAFEAcA8=qEFgvUqGFdWLJ+1ePPv2Ybisomrs2o77PyiAZA2sXg@mail.gmail.com>
 <CAEUhbmWsBfhub-+hMvucshCRH412fuvz5_=fAU_y7UmYJ4_=dQ@mail.gmail.com>
 <5445e140-94f1-dfcf-4652-0e47494e8c23@weilnetz.de>
 <CAEUhbmWJ3kGk4sVM3+TsHmZrDrekqSYcFebpztedU4jkw1DoWQ@mail.gmail.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <f70d8abb-f10d-f1e8-00f1-2a41aeff8f2b@weilnetz.de>
Date: Wed, 14 Apr 2021 11:18:29 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <CAEUhbmWJ3kGk4sVM3+TsHmZrDrekqSYcFebpztedU4jkw1DoWQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.04.21 um 10:30 schrieb Bin Meng:

> Hi Stefan,
>
> On Tue, Apr 13, 2021 at 2:19 PM Stefan Weil <sw@weilnetz.de> wrote:
>> Am 13.04.21 um 07:56 schrieb Bin Meng:
>>
>>> This patch (affects Windows install)
>>> http://patchwork.ozlabs.org/project/qemu-devel/patch/20210326062140.367861-1-bmeng.cn@gmail.com/
>>>
>>> is still not applied.
>>>
>>> Regards,
>>> Bin
>>
>> That patch is based on an older version of my personal QEMU sources and
>> not required for 6.0.
> I am confused.
>
> I see https://repo.or.cz/qemu/ar7.git/blob/HEAD:/qemu.nsi still does
> not contain the fix.
>
> Or is this qemu.nsi file not used in the latest 6.0 installer?


https://repo.or.cz/qemu/ar7.git/blob/HEAD:/qemu.nsi#l139 installs all 
shared files recursively (same as in the official QEMU git master), so 
no fix is required.

Stefan



