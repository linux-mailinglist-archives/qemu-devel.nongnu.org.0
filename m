Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 484193109BD
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 12:03:26 +0100 (CET)
Received: from localhost ([::1]:45562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7ytZ-0001AZ-2G
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 06:03:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1l7yqP-00080F-8m; Fri, 05 Feb 2021 06:00:10 -0500
Received: from mx2.suse.de ([195.135.220.15]:55422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1l7yqM-0002TX-QZ; Fri, 05 Feb 2021 06:00:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C22F2AD24;
 Fri,  5 Feb 2021 11:00:04 +0000 (UTC)
Subject: Re: iotest 30 failing
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <818b08af-3077-7003-63eb-614fa459d01c@redhat.com>
 <CAFEAcA9LJMS+qZRn9H97cnderDm8LRg7wyy+dgz3nXGLF_QQeA@mail.gmail.com>
 <5c0ffc79-aabc-1b40-8758-9840845432bf@virtuozzo.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <b5e61c20-f500-b1cd-daa4-bdb9a368cb96@suse.de>
Date: Fri, 5 Feb 2021 12:00:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <5c0ffc79-aabc-1b40-8758-9840845432bf@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.182,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 11:38 PM, Vladimir Sementsov-Ogievskiy wrote:
> 04.02.2021 20:51, Peter Maydell wrote:
>> On Thu, 4 Feb 2021 at 17:48, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>
>>> Hi,
>>>
>>> Based on commit 1ed9228f63e (ericb/tags/pull-nbd-2021-02-02-v2)
>>> I got:
>>>
>>>    TEST   iotest-qcow2: 030 [fail]
>>
>> Yes; see also this thread:
>> https://lore.kernel.org/qemu-devel/9e71568c-ce4a-f844-fbd3-a4a59f850d74@redhat.com/
>>
>> Can somebody write a simple patch to disable the test entirely,
>> please? It's too unreliable to be in our CI set.
>>
> 
> I can..
> 
> Still, maybe I'll try tomorrow to make v2 from my "[PATCH RFC 0/5] Fix accidental crash in iotest 30"?
> 
> It would be very interesting will it fail after that fix. My experiments shows that my patches helps. But the question is do we really have the same crash in all these reports or not. So I think it worth taking my fix (even being incomplete solution) to understand do we ignore some unknown bug.
> 

Today's master passes the test for me, yesterday's failed. Was something changed or is it just flicky..

Ciao,

Claudio


