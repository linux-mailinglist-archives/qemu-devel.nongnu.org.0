Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1706B4F295C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 11:11:48 +0200 (CEST)
Received: from localhost ([::1]:50724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbfE2-0002fx-IA
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 05:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nbf5U-0001Z0-1N
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 05:02:56 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:37630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nbf5Q-0001xc-Lk
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 05:02:55 -0400
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 9281F20770;
 Tue,  5 Apr 2022 09:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1649149367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZJZsvCLN/e9oXh38pi0dvImjwZfv87yrtzS85yGIRZM=;
 b=655CFpEsIs2vRch/a+T51hMjF3S6FjKO/flLvr0S3yWlhORIEwBglzfB/wP7owCsEhF6Ev
 aQY9JKvre/PSFunWyLAaGypdRnDeN+iiW0pE2OeW1waipoIa92Z3S1NZcc2aBa0jqeObBC
 nwORSu+ks/7fBm/n/cr32BKfvd404co=
Message-ID: <3d52da6c-124d-4de6-432d-be9e0bb16dfe@greensocs.com>
Date: Tue, 5 Apr 2022 11:02:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH] python: add qmp-send program to send raw qmp commands
 to qemu
Content-Language: en-US-large
To: John Snow <jsnow@redhat.com>
References: <20220316095455.6473-1-damien.hedde@greensocs.com>
 <CAFn=p-bBExx6yKmRSvg2FJP74TP+7bB3w4xTZSJmj8RdkJiqdw@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <CAFn=p-bBExx6yKmRSvg2FJP74TP+7bB3w4xTZSJmj8RdkJiqdw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/4/22 22:34, John Snow wrote:
> On Wed, Mar 16, 2022 at 5:55 AM Damien Hedde <damien.hedde@greensocs.com> wrote:
>>
>> It takes an input file containing raw qmp commands (concatenated json
>> dicts) and send all commands one by one to a qmp server. When one
>> command fails, it exits.
>>
>> As a convenience, it can also wrap the qemu process to avoid having
>> to start qemu in background. When wrapping qemu, the program returns
>> only when the qemu process terminates.
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>> ---
>>
>> Hi all,
>>
>> Following our discussion, I've started this. What do you think ?
>>
>> I tried to follow Daniel's qmp-shell-wrap. I think it is
>> better to have similar options (eg: logging). There is also room
>> for factorizing code if we want to keep them aligned and ease
>> maintenance.
>>
>> There are still some pylint issues (too many branches in main and it
>> does not like my context manager if else line). But it's kind of a
>> mess to fix theses so I think it's enough for a first version.
> 
> Yeah, don't worry about these. You can just tell pylint to shut up
> while you prototype. Sometimes it's just not worth spending more time
> on a more beautiful factoring. Oh well.
> 
>>
>> I name that qmp-send as Daniel proposed, maybe qmp-test matches better
>> what I'm doing there ?
>>
> 
> I think I agree with Dan's response.
> 
>> Thanks,
>> Damien
>> ---
>>   python/qemu/aqmp/qmp_send.py | 229 +++++++++++++++++++++++++++++++++++
> 
> I recommend putting this in qemu/util/qmp_send.py instead.
> 
> I'm in the process of pulling out the AQMP lib and hosting it
> separately. Scripts like this I think should stay in the QEMU tree, so
> moving it to util instead is probably best. Otherwise, I'll *really*
> have to commit to the syntax, and that's probably a bigger hurdle than
> you want to deal with.

If it stays in QEMU tree, what licensing should I use ? LGPL does not 
hurt, no ?

> 
>>   scripts/qmp/qmp-send         |  11 ++
>>   2 files changed, 240 insertions(+)
>>   create mode 100644 python/qemu/aqmp/qmp_send.py
>>   create mode 100755 scripts/qmp/qmp-send
>>
>> diff --git a/python/qemu/aqmp/qmp_send.py b/python/qemu/aqmp/qmp_send.py
>> new file mode 100644
>> index 0000000000..cbca1d0205
>> --- /dev/null
>> +++ b/python/qemu/aqmp/qmp_send.py
> 
> Seems broadly fine to me, but I didn't review closely this time. If it
> works for you, it works for me.
> 
> As for making QEMU hang: there's a few things you could do, take a
> look at iotests and see how they handle timeout blocks in synchronous
> code -- iotests.py line 696 or so, "class Timeout". When writing async
> code, you can also do stuff like this:
> 
> async def foo():
>      await asyncio.wait_for(qmp.execute("some-command", args_etc), timeout=30)
> 
> See https://docs.python.org/3/library/asyncio-task.html#asyncio.wait_for
> 
> --js
> 

Thanks for the tip,
--
Damien

