Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 137326CC818
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 18:35:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phCHM-0007Jo-B4; Tue, 28 Mar 2023 12:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1phCHK-0007JQ-Dd; Tue, 28 Mar 2023 12:34:34 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1phCHI-0002aE-F8; Tue, 28 Mar 2023 12:34:34 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id A11AA40158;
 Tue, 28 Mar 2023 19:34:21 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 6BDE6DD;
 Tue, 28 Mar 2023 19:34:20 +0300 (MSK)
Message-ID: <7c0b4f90-d790-7050-65aa-6ce7d1964224@msgid.tls.msk.ru>
Date: Tue, 28 Mar 2023 19:34:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: qemu 7.2 stable release, 2nd try
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-stable <qemu-stable@nongnu.org>, Michael Roth
 <michael.roth@amd.com>, qemu-devel@nongnu.org
References: <4e79a438-778b-877d-d3dc-ad05cbab88cc@msgid.tls.msk.ru>
 <87o7ocrj26.fsf@linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <87o7ocrj26.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

28.03.2023 18:28, Alex Bennée wrote:
> Michael Tokarev <mjt@tls.msk.ru> writes:
> 
>> Hi!
>>
>> After posting an RFC (due to me doing a stable release for the first time) and
>> getting exactly 0 replies/comments, I'm a bit worried, - does this mean there's
>> no interest in getting 7.2-stable out of the doors at all? :)
> 
> I'm interested - although Debian already has the "latest" stuff we need.
> What do you need though, re-reviews or just simple Acked-by's for the
> included patches?

Well, nothing really. Since this is my first attempt ever, I hoped someone pointed
out some of mistakes which I did ;) It's definitely not that I need a personal ACK
for every change I picked up, that'd be silly.


I was AFK for a few days here, but before the trip I picked up another bunch,
mentioned by Thomas in his reply. The trip was somewhat unexpected, - I wanted
to send another "Patch round-up" email with the newly picked up stuff, but
haven't done so due to the trip.

Now looking at this I think it's better to roll the changes back to commit
688714bf7eca805f98e9601b686e48a2269fc169 (
https://gitlab.com/mjt0k/qemu/-/commits/stable-7.2-staging ), and release
7.2.1 tomorrow without those changes.

Thanks,

/mjt

