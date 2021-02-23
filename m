Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 982F9322700
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 09:19:41 +0100 (CET)
Received: from localhost ([::1]:46514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lESuy-0006wV-3h
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 03:19:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lEStu-0006Nl-V8; Tue, 23 Feb 2021 03:18:34 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33592
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lEStt-0000jI-4a; Tue, 23 Feb 2021 03:18:34 -0500
Received: from host31-48-197-98.range31-48.btcentralplus.com ([31.48.197.98]
 helo=[192.168.1.110]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lESth-0000MP-Nw; Tue, 23 Feb 2021 08:18:26 +0000
To: Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
References: <91874f1e-4b14-5fb1-f1ae-1225938df759@linux.ibm.com>
 <20210222120138.31f313c9@bahia.lan>
 <3c3fc3f0-afb8-1012-eaf7-11ecbe146025@linux.ibm.com>
 <YDSJxzxjs3jJImEY@yekko.fritz.box> <20210223085910.6928135a@bahia.lan>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <f800b5f2-f502-cdfc-777d-f353a71477e4@ilande.co.uk>
Date: Tue, 23 Feb 2021 08:18:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210223085910.6928135a@bahia.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 31.48.197.98
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: Editing QEMU POWER Platform wiki page
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
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
Cc: lagarcia@br.ibm.com, Programmingkid <programmingkidx@gmail.com>,
 QEMU PPC devel list <qemu-ppc@nongnu.org>,
 QEMU devel list <qemu-devel@nongnu.org>, Cedric Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/02/2021 07:59, Greg Kurz wrote:

> On Tue, 23 Feb 2021 15:51:19 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
> 
>> On Mon, Feb 22, 2021 at 06:18:08PM -0300, Leonardo Augusto Guimarães Garcia wrote:
>>> On 2/22/21 8:01 AM, Greg Kurz wrote:
>>>> On Thu, 18 Feb 2021 10:16:25 -0300
>>>> Leonardo Augusto Guimarães Garcia <lagarcia@linux.ibm.com> wrote:
>>>>
>>>>> Hi there,
>>>>>
>>>>> I would like to edit the wiki page at [0] as it contains some outdated
>>>>> information. Could anyone that has access to the wiki please help me
>>>>> create a user so that I can edit it?
>>>>>
>>>>> 0. https://wiki.qemu.org/Documentation/Platforms/POWER
>>>>>
>>>> Hi Leo,
>>>>
>>>> User creation isn't publicly available to avoid spam : only an existing
>>>> user can create a new account.
>>>
>>> Yeah, I saw that. That's why I asked here.
>>
>> The other concerns raised in this thread are valid, but those
>> notwithstanding, I think it makes sense to let you update the Wiki if
>> you have the time and inclination.
>>
> 
> Sure, but the point is that this incentive to update documentation
> would be better used in the main QEMU documentation, i.e. the
> docs/system/ppc/pseries.rst file in Cedric's "docs/system: Extend PPC
> section" patch.

Certainly in an ideal world it would make sense to have everything held in the 
documentation, but in real life there are circumstances where having the wiki is useful.

I spend a lot of my time with people interested in emulating older machines, and for 
these people who aren't particularly technical, the manual is far too complicated: 
all they want is examples, and to know what works and what doesn't.

There was a recent thread where I think Peter discussed removing the QuickStart 
section from the documentation because it was out of date, and to me the wiki is a 
good replacement here - pretty much all of the content at 
https://wiki.qemu.org/Documentation/Platforms/PowerPC is user-generated. I also like 
the wiki organisation of Documentation/Platforms/FOO since it's easy to point people 
towards tips that will help them get started on IRC.

Another example is the SPARC page that I maintain at 
https://wiki.qemu.org/Documentation/Platforms/SPARC which mainly came about as people 
kept emailing me off-list to ask whether a particular OS will run under QEMU, and 
would then follow up by asking me for examples because the QEMU command line is 
intimidating for new users.


ATB,

Mark.

