Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44282F5540
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 00:46:48 +0100 (CET)
Received: from localhost ([::1]:49848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzpqh-0004dD-HA
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 18:46:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kzppm-0004Ch-Kd
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 18:45:50 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:41646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kzppj-00020O-CE
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 18:45:49 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C1FA67456B8;
 Thu, 14 Jan 2021 00:45:40 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 34AFF7456B7; Thu, 14 Jan 2021 00:45:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 301AC7456B4;
 Thu, 14 Jan 2021 00:45:40 +0100 (CET)
Date: Thu, 14 Jan 2021 00:45:40 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 1/2] trace: document how to specify multiple --trace
 patterns
In-Reply-To: <1cd6e449-cdde-adf6-a3ef-b2e95cd04add@redhat.com>
Message-ID: <95abf7c3-4338-1659-8c83-e4fb886794b7@eik.bme.hu>
References: <20210112165859.225534-1-stefanha@redhat.com>
 <20210112165859.225534-2-stefanha@redhat.com>
 <542c6083-37ef-8a7c-7b24-f1e4f8dbff3@eik.bme.hu>
 <20210113094804.GA250553@stefanha-x1.localdomain>
 <f13a4aac-2d9a-9762-2664-3e3e09376f4d@redhat.com>
 <b06344f0-892f-4ff0-782f-1d55862a2c2b@redhat.com>
 <1cd6e449-cdde-adf6-a3ef-b2e95cd04add@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 13 Jan 2021, John Snow wrote:
> On 1/13/21 5:15 PM, Eric Blake wrote:
>> On 1/13/21 3:42 PM, John Snow wrote:
>>> On 1/13/21 4:48 AM, Stefan Hajnoczi wrote:
>>>>> QEMU options are single dash with double dash accepted for
>>>>> compatibility but
>>>>> help and other docs have single dash so these (and below) should be
>>>>> -trace.
>>>>> (Also a bit less typing for otherwise already way too long command
>>>>> lines.)
>>>> Is this documented somewhere?
>>>> 
>>>> I was under the impression that '-' is legacy syntax and '--' is the
>>>> preferred syntax. There are examples of '--' on the QEMU man page.
>> 
>> Historically, uses of 'getopt_long()' support only double dash, while
>> 'getopt_long_only()' support both single and double.  While qemu does
>> not use getopt_long_only() (because it rolls its own parser instead), it
>> certainly tries to behave as if it does.  Meanwhile, our other tools
>> like qemu-img or qemu-storage-daemon use getopt_long().  I'm in favor of
>> preferring the double-dash in documentation, even when single-dash
>> works, especially for any option (like --trace) that is used for more
>> tools than just qemu proper, because it makes for easier copy-paste
>> between options that work for all tools in the qemu suite rather than
>> just qemu.
>> 
>
> Yes, this makes sense.
>
>>>> 
>>>> Let's reach agreement, document it, and then make the documentation
>>>> consistent.
>>>> 
>>>> Stefan
>>> 
>>> My naive impression was that double-dash is the preferred idiom in
>>> linuxdom in general for any multi-character option.
>>> 
>>> We might hang on to single-dash for backwards compatibility, but I doubt
>>> we want to enshrine that as our preferred way.
>>> 
>>> Is there a reasoning I am unaware of?
>> 
>> Continuing to document '-machine' instead of '--machine' for qemu is
>> debatable because we don't support 'qemu-img --machine' or
>> 'qemu-storage-daemon --machine'; but since 'qemu-img -trace' is an error
>> while 'qemu-img --trace' works, I'm definitely in favor of preferring
>> '--trace' everywhere in our docs.
>> 
>
> At that point, it's a guessing game as to which binaries support which flags 
> and using which spellings -- maybe some will pick up new flags later and so 
> on.
>
> Skip the fuss and just insist on the double dash, I think.

Please don't. That would break all scripts that already call qemu using 
single dash options. Forcing everyone to edit their scripts is not nice. 
How about also accepting single dash in qemu-img for consistency then you 
can use whatever you want in docs as long as single dash still works for 
consistency and backward compatibility.

Regards,
BALATON Zoltan

