Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6764C18FE
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 17:49:06 +0100 (CET)
Received: from localhost ([::1]:35044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMup6-00014U-Me
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 11:49:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMuk8-0008NQ-8Q
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 11:43:56 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:54328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMuk5-00026N-3e
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 11:43:55 -0500
Received: from [172.17.10.6] (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPSA id A0CE320770;
 Wed, 23 Feb 2022 16:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645634627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NScq+XE+BCWqc4sFM58nwLNHiz03bYx/uEDr+3Y40TE=;
 b=STpdIrmUe7MVL/Qu7/59FII0nnOM1IvQG0lhBnXsJqHNTDbafKraOSKV8DxPu3v/kZhy67
 A9nFGI4TKfkh7pgrk1/vM3fevWGn15YtUNTKysbt8ixOPvStD2s0uh3K41ddZqke871mfe
 hrESyHp/qdEsVU6iwDBItqskT0hOOJc=
Message-ID: <58ba5bf4-b374-31f6-ae8a-556418cedbfc@greensocs.com>
Date: Wed, 23 Feb 2022 17:43:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 4/5] python: qmp_shell: add -e/--exit-on-error option
Content-Language: en-US-large
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20220221155519.2367-1-damien.hedde@greensocs.com>
 <20220221155519.2367-5-damien.hedde@greensocs.com>
 <CAFn=p-ZErejiw7mn_kN6c+57ya4OgS3ANpUa=BtS3Be=vcSOvg@mail.gmail.com>
 <YhZST1fCU54OgoP2@redhat.com>
 <CAFn=p-bo39LEvQhKBZZ6ZcEfhaaZ7eQDgDFMOEZtDkCV_XH54w@mail.gmail.com>
 <YhZWcFY1sGSV/OX8@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <YhZWcFY1sGSV/OX8@redhat.com>
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
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/23/22 16:44, Daniel P. Berrangé wrote:
> On Wed, Feb 23, 2022 at 10:41:11AM -0500, John Snow wrote:
>> On Wed, Feb 23, 2022 at 10:27 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>
>>> On Wed, Feb 23, 2022 at 10:22:11AM -0500, John Snow wrote:
>>>> On Mon, Feb 21, 2022 at 10:55 AM Damien Hedde
>>>> <damien.hedde@greensocs.com> wrote:
>>>>>
>>>>> This option makes qmp_shell exit (with error code 1)
>>>>> as soon as one of the following error occurs:
>>>>> + command parsing error
>>>>> + disconnection
>>>>> + command failure (response is an error)
>>>>>
>>>>> _execute_cmd() method now returns None or the response
>>>>> so that read_exec_command() can do the last check.
>>>>>
>>>>> This is meant to be used in combination with an input file
>>>>> redirection. It allows to store a list of commands
>>>>> into a file and try to run them by qmp_shell and easily
>>>>> see if it failed or not.
>>>>>
>>>>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>>>>
>>>> Based on this patch, it looks like you really want something
>>>> scriptable, so I think the qemu-send idea that Dan has suggested might
>>>> be the best way to go. Are you still hoping to use the interactive
>>>> "short" QMP command format? That might be a bad idea, given how flaky
>>>> the parsing is -- and how we don't actually have a published standard
>>>> for that format. We've *never* liked the bad parsing here, so I have a
>>>> reluctance to use it in more places.

I don't really care of the command format. I was just using the one 
expected by qmp-shell to avoid providing another script.
I think it's better not to use some standard syntax like json.
As long as we can store the commands into a file and tests them easily, 
it's ok. The crucial feature is the "stop as soon something unexpected 
happens" so that we can easily spot an issue.
>>>>
>>>> I'm having the naive idea that a script file could be as simple as a
>>>> list of QMP commands to send:
>>>>
>>>> [
>>>>      {"execute": "block-dirty-bitmap-add", "arguments": { ... }},
>>>>      ...
>>>> ]

I used this format at some point because it's so trivial to feed into 
the QMP tools. Even used a yaml version of that to get the "human 
readability" that goes with it.

>>>
>>> I'd really recommend against creating a new format for the script
>>> file, especially one needing opening & closing  [] like this, as
>>> that isn't so amenable to dynamic usage/creation. ie you can't
>>> just append an extcra command to an existing file.
>>>
>>> IMHO, the "file" format should be identical to the result of
>>> capturing the socket data off the wire. ie just a concatenation
>>> of QMP commands, with no extra wrapping / change in format.
>>> >>
>> Eugh. That's just so hard to parse, because there's no off-the-shelf
>> tooling for "load a sequence of JSON documents". Nothing in Python
>> does it. :\
> 
> It isn't that hard if you require each JSON doc to be followed by
> a newline.
> 
> Feed one line at a time to the JSON parser, until you get a complete
> JSON doc, process that, then re-init the parser and carry on feeding
> it lines until it emits the next JSON doc, and so on.
> 

I agree it's doable. I can look into that.

It makes me think that I've managed to modify the chardev 'file' backend
a few months ago so that it can be used with an input file on the cli. 
This allowed to give such raw qmp file directly with the -qmp option 
instead of using an intermediate socket and a script issuing the same file.
But I gave up with this approach because then it can't stop if a command 
failed without hacking into the receiving side in qemu.

--
Damien




