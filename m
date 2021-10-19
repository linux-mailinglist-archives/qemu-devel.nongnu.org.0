Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A36D433708
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 15:27:11 +0200 (CEST)
Received: from localhost ([::1]:59462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcp94-0005jL-53
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 09:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel@labath.sk>) id 1mcp2p-0001P7-9d
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 09:20:44 -0400
Received: from holomatrix.labath.sk ([92.48.125.149]:56888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel@labath.sk>) id 1mcp2k-0004x9-R0
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 09:20:42 -0400
Received: from [172.29.152.10] (unknown [172.29.152.10])
 by holomatrix.labath.sk (Postfix) with ESMTP id 49B5F7760C5B;
 Tue, 19 Oct 2021 13:19:33 +0000 (GMT)
Subject: Re: [PATCH] gdbstub: Switch to the thread receiving a signal
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210930095111.23205-1-pavel@labath.sk>
 <9b435ae3-27f3-4838-421e-f40ac58a7905@labath.sk> <87czo6th1k.fsf@linaro.org>
From: Pavel Labath <pavel@labath.sk>
Message-ID: <18ff3adb-6777-730b-ecdb-a99addd9109f@labath.sk>
Date: Tue, 19 Oct 2021 15:19:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87czo6th1k.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=92.48.125.149; envelope-from=pavel@labath.sk;
 helo=holomatrix.labath.sk
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.074,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/10/2021 17:59, Alex Bennée wrote:
> 
> Pavel Labath <pavel@labath.sk> writes:
> 
>> Ping.
>>
>> (This is my first qemu patch, so please let me know if I am doing
>> something wrong.)
> 
> Apologies it slipped though the cracks. I shall have a look on Monday.
> 

I don't want to impose, but did this get buried over the weekend by any 
chance?

regards,
pl

