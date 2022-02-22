Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45FB4BF4E5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 10:44:04 +0100 (CET)
Received: from localhost ([::1]:35884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMRiF-0007gT-Kz
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 04:44:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMRce-0006ch-5D
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 04:38:16 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:41588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMRcb-0006lc-Jh
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 04:38:15 -0500
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id E44F921C36;
 Tue, 22 Feb 2022 09:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645522691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5sFhqQmBB2u0n1pnUE10iLYaJd2c71EvGvnQmvYFTaw=;
 b=oam0fDOBV9tGdjk6KkZpHgVjzGhAEIzWOxqmxevfKTfc7oSOIHJAGYmfIcYlOYGjeGRH2Q
 4CUk/p9cEcLqBwAPF9LG/beYT97TEpsTyN4irDm/eIu4SrH8wv9aDUnjdnGev11bKbWfCS
 bUtaP7iJFsWTKEyUcJfhz0dbO9rV+6M=
Message-ID: <c3fb1a44-29ac-00a0-47f4-7f152977f4a5@greensocs.com>
Date: Tue, 22 Feb 2022 10:38:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 0/5] qmp-shell modifications for non-interactive use
Content-Language: en-US-large
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220221155519.2367-1-damien.hedde@greensocs.com>
 <87bkyzzb1q.fsf@pond.sub.org>
 <3656609c-522d-a0e8-e6ef-465cdc9d6c88@greensocs.com>
 <YhSrD/gmlMkumkah@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <YhSrD/gmlMkumkah@redhat.com>
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/22/22 10:21, Daniel P. Berrangé wrote:
> On Tue, Feb 22, 2022 at 08:57:03AM +0100, Damien Hedde wrote:
>>
>>
>> On 2/22/22 07:10, Markus Armbruster wrote:
>>> Damien Hedde <damien.hedde@greensocs.com> writes:
>>>
>>>> Hi,
>>>>
>>>> The main idea of this series is to be a bit more user-friendly when
>>>> using qmp-shell in a non-interactive way: with an input redirection
>>>> from a file containing a list of commands.
>>>>
>>>> I'm working on dynamic qapi config of a qemu machine, this would
>>>> be very useful to provide and reproduce small examples.
>>>
>>> Why not use plain QMP for that?
>>>
>>> [...]
>>>
>> What do you mean by plain QMP ?
> 
> Directly connect to the socket and send the QMP JSON commands you have.
> 
> Essentially qmp-shell is designed for adhoc interactive human usage.
> For automated / scripted, non-interactive usage, it is expected that
> QMP is simple enough that tools just directly connect to the QMP
> socket instead of using a wrapper layer.
> 
> What is the reason you want to use qmp-shell for this instead of
> directly using the socket from your scripts ?
> 
> Regards,
> Daniel

We have such scripts that interface with QMP directly for our own use.

Here I just wanted to propose a simple way to just send a
bunch of commands from a source file and stop if something unexpected 
happens.
Only goal is to be able to share a file on the ml and allow people to 
reproduce easily.
We can already redirect the input, but it is almost impossible to see
if something failed.

--
Damien


