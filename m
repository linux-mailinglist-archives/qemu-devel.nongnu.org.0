Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20228221C51
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jul 2020 08:05:29 +0200 (CEST)
Received: from localhost ([::1]:49784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvx1M-0006sA-7Z
	for lists+qemu-devel@lfdr.de; Thu, 16 Jul 2020 02:05:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1jvwx5-0003iI-Hl
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 02:01:03 -0400
Received: from mail.ispras.ru ([83.149.199.84]:36206)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1jvwx3-000183-BY
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 02:01:03 -0400
Received: from [192.168.0.183] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 7457140AAD73;
 Thu, 16 Jul 2020 06:00:57 +0000 (UTC)
Subject: Re: [PATCH 05/13] qapi: introduce replay.json for
 record/replay-related stuff
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <159316678008.10508.6615172353109944370.stgit@pasha-ThinkPad-X280>
 <159316680859.10508.4570677924280388493.stgit@pasha-ThinkPad-X280>
 <87ft9txbvt.fsf@linaro.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <f8f28e50-1d47-0bdb-b134-b124861e8a0c@ispras.ru>
Date: Thu, 16 Jul 2020 09:00:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <87ft9txbvt.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/16 02:00:58
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, wrampazz@redhat.com, ehabkost@redhat.com,
 mtosatti@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com, mreitz@redhat.com,
 philmd@redhat.com, zhiwei_liu@c-sky.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.07.2020 14:20, Alex Bennée wrote:
> 
> Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> writes:
> 
>> From: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
>>
>> This patch adds replay.json file. It will be
>> used for adding record/replay-related data structures and commands.
>>
>> Signed-off-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   0 files changed
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 5dd86c7f94..ca5b1cf7f1 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2572,6 +2572,7 @@ F: docs/replay.txt
>>   F: stubs/replay.c
>>   F: tests/acceptance/replay_kernel.py
>>   F: tests/acceptance/replay_linux.py
>> +F: qapi/replay.json
> 
> This makes me wonder what is missing as MAINTAINERS doesn't have
> replay_linux.py - which is why I was confused.

Right, this is my fault.
I missed, that replay_linux test was not upstreamed.


Pavel Dovgalyuk

