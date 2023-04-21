Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 177C46EA80C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 12:15:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppnmM-0007zb-1q; Fri, 21 Apr 2023 06:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppnmJ-0007zK-RE; Fri, 21 Apr 2023 06:14:07 -0400
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppnmH-0002Fo-Am; Fri, 21 Apr 2023 06:14:07 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:7f29:0:640:9a2b:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id B2E465E8D9;
 Fri, 21 Apr 2023 13:13:54 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:8816::1:4] (unknown
 [2a02:6b8:b081:8816::1:4])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id rDcBcS1Oia60-xS7aUprL; Fri, 21 Apr 2023 13:13:53 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682072033; bh=jrMwTYFA2XPeW4G0KFUX+9OsQa4eK4+DAOJoSvPPdH0=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=SIVgq1PTbYEJiSYSKi446u0DSQqccy+7kYdR3DN7BFvyaINPR/Wd5ydDkyQJrG4OW
 zReOJvfV7Uis4khRn0rGfNfEz0D3qXNiozNIvj2V8EC1tZ6g88KkFxBbpM2eKjJ0tx
 NenUoVPr/Yq1M4yd4+0N188T4EcCKBXMj21X8Mrw=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <68834b18-1fab-ca2a-d131-71f75fc374a1@yandex-team.ru>
Date: Fri, 21 Apr 2023 13:13:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: test-blockjob: intermittent CI failures in msys2-64bit job
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 John Snow <jsnow@redhat.com>, Alberto Garcia <berto@igalia.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <CAFEAcA_SeUuZRo7HQPUJgeaepoup29YdAuFaWjNL+fhEt+pmkA@mail.gmail.com>
 <CAFEAcA87HtzYN76nHhHZBfazDZdoRnszgAt-e2CqBBWEoF6_2Q@mail.gmail.com>
 <CAFEAcA-n+9N+0ZuE6MSD1aMBeGYAJTbQe=j1-2K=SgD_Ly6nEA@mail.gmail.com>
 <df71d7b5-7723-eaff-3dcd-45f69186f6af@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <df71d7b5-7723-eaff-3dcd-45f69186f6af@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 17.03.23 15:35, Thomas Huth wrote:
> On 17/03/2023 11.17, Peter Maydell wrote:
>> On Mon, 6 Mar 2023 at 11:16, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>
>>> On Fri, 3 Mar 2023 at 18:36, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>>
>>>> I've noticed that test-blockjob seems to fail intermittently
>>>> on the msys2-64bit job:
>>>>
>>>> https://gitlab.com/qemu-project/qemu/-/jobs/3872508803
>>>> https://gitlab.com/qemu-project/qemu/-/jobs/3871061024
>>>> https://gitlab.com/qemu-project/qemu/-/jobs/3865312440
>>>>
>>>> Sample output:
>>>> | 53/89 ERROR:../tests/unit/test-blockjob.c:499:test_complete_in_standby:
>>>> assertion failed: (job->status == JOB_STATUS_STANDBY) ERROR
>>>> 53/89 qemu:unit / test-blockjob ERROR 0.08s exit status 3
>>
>>> Here's an intermittent failure from my macos x86 machine:
>>>
>>> 172/621 qemu:unit / test-blockjob
>>>             ERROR           0.26s   killed by signal 6 SIGABRT
>>
>> And an intermittent on the freebsd 13 CI job:
>> https://gitlab.com/qemu-project/qemu/-/jobs/3950667240
>>
>>>>> MALLOC_PERTURB_=197 G_TEST_BUILDDIR=/tmp/cirrus-ci-build/build/tests/unit G_TEST_SRCDIR=/tmp/cirrus-ci-build/tests/unit /tmp/cirrus-ci-build/build/tests/unit/test-blockjob --tap -k
>> ▶ 178/650 /blockjob/ids
>>             OK
>> 178/650 qemu:unit / test-blockjob
>>             ERROR           0.31s   killed by signal 6 SIGABRT
>> ――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
>> stderr:
>> Assertion failed: (job->status == JOB_STATUS_STANDBY), function
>> test_complete_in_standby, file ../tests/unit/test-blockjob.c, line
>> 499.
>>
>>
>> TAP parsing error: Too few tests run (expected 9, got 1)
>> (test program exited with status code -6)
>> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
>>
>> Anybody in the block team looking at these, or shall we just
>> disable this test entirely ?
> 
> I ran into this issue today, too:
> 
>   https://gitlab.com/thuth/qemu/-/jobs/3954367101
> 
> ... if nobody is interested in fixing this test, I think we should disable it...
> 
>   Thomas
> 

I'm looking at this now, and seems that it's broken since 6f592e5aca1a27fe1c1f6 "job.c: enable job lock/unlock and remove Aiocontext locks", as it stops critical section by new aio_context_release() call exactly after bdrv_drain_all_and(), so it's not a surprise that job may start at that moment and the following assertion fires.

Emanuele could please look at it?



-- 
Best regards,
Vladimir


