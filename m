Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BC74DB348
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 15:29:33 +0100 (CET)
Received: from localhost ([::1]:47504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUUeZ-0001vq-HY
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 10:29:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nUUSJ-00079S-O6
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 10:16:51 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nUUSH-0005AQ-Kn
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 10:16:51 -0400
Received: from [192.168.1.13] (lfbn-lyo-1-488-129.w2-7.abo.wanadoo.fr
 [2.7.77.129])
 by beetle.greensocs.com (Postfix) with ESMTPSA id A1CDC2077C;
 Wed, 16 Mar 2022 14:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1647440206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9d39wB7zQGO9j7AFtwAuCcI+MiBseXSu7XuTcKbhnZM=;
 b=UjVQd6NuCdIdpNhrbtw1BXjbSjpVl7+hQxwIAZ8TG7kZmrQhtfdOu2us0p2KtoPF/VwlCg
 aNNnkWGk1qifbTVeomN/YPT6XLpa+pZfhTUVr4uFOiuWxBuUyW6lhXpTY2cY0apQnLxFBf
 z1s2vPIspqw52ljDLFksiWKc+kW84PM=
Message-ID: <7c7e369b-d5f5-46a3-abc9-27aa420b9e7d@greensocs.com>
Date: Wed, 16 Mar 2022 15:16:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH] python: add qmp-send program to send raw qmp commands
 to qemu
Content-Language: en-US-large
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220316095455.6473-1-damien.hedde@greensocs.com>
 <YjG68xzV/qrMnhEW@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <YjG68xzV/qrMnhEW@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/16/22 11:24, Daniel P. Berrangé wrote:
> On Wed, Mar 16, 2022 at 10:54:55AM +0100, Damien Hedde wrote:
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
> 
> Having CLI similarity to the existing scripts is a good idea.
> 
> As a proof of usefulness, it might be worth trying to illustrate
> this qmp-send command by converting an I/O test.
> 
> Quite a few I/O tests have code that look like:
> 
> do_run_qemu()
> {
>      echo Testing: "$@" | _filter_imgfmt
>      $QEMU -nographic -qmp stdio -serial none "$@"
>      echo
> }
> 
> 
> run_qemu()
> {
>      do_run_qemu "$@" 2>&1 | _filter_testdir | _filter_qemu | _filter_qmp | _filter_qemu_io
> }
> 
> run_qemu <<EOF
> { "execute": "qmp_capabilities" }
> { "execute": "blockdev-add",
>     ....
> }
> { "execute": "quit" }
> EOF
> 
> (eg iotests 71)
> 
> I would hope this qmp-send command to be able to satisfy that
> use case by modifying do_run_qemu like this:
> 
> do_run_qemu()
> {
>      echo Testing: "$@" | _filter_imgfmt
>      qmp-send --wrap $QEMU -nographic -serial none "$@"
>      echo
> }

I need to add stdin handling, but it should be straightforward.

I'm more worried by what should happen if there is a failure that makes 
qemu hang, because then run_qemu won't exit. I'll take a look at the iotest.
I expect the test will be killed at some point, I need to ensure that 
part is handled properly by qmp-send.

Thanks,
Damien

