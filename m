Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C794C19B7
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 18:15:28 +0100 (CET)
Received: from localhost ([::1]:36204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMvEc-0005cN-T0
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 12:15:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMv8U-0002F5-BZ
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 12:09:07 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:54534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMv8R-0000lE-Fa
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 12:09:05 -0500
Received: from [172.17.10.6] (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 6D80A21C2B;
 Wed, 23 Feb 2022 17:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645636140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bWW4Me2U1Mc0fB19umOBkazsoLiKVGzPIPYIjbQamEE=;
 b=kcIldblrn1xOzsj1M2rPlZ5mzOAd8E4MlTQ4hki1eNcadAP5F8CJfUtvSOPNU1ve7R71FE
 UZ1uqaGoFUL1rhOa+krpCCltHlxjm/zVQYrm+LLdXLUuB8+SacQhM7A7k08r3ZO1Pewsbs
 WssASMfRayVbaYj1crlFYuwA2okecbU=
Message-ID: <4d5d4192-2e60-af23-dcfa-2e76e9b5f71d@greensocs.com>
Date: Wed, 23 Feb 2022 18:09:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 4/5] python: qmp_shell: add -e/--exit-on-error option
Content-Language: en-US-large
To: John Snow <jsnow@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20220221155519.2367-1-damien.hedde@greensocs.com>
 <20220221155519.2367-5-damien.hedde@greensocs.com>
 <CAFn=p-ZErejiw7mn_kN6c+57ya4OgS3ANpUa=BtS3Be=vcSOvg@mail.gmail.com>
 <YhZST1fCU54OgoP2@redhat.com>
 <CAFn=p-bo39LEvQhKBZZ6ZcEfhaaZ7eQDgDFMOEZtDkCV_XH54w@mail.gmail.com>
 <YhZWcFY1sGSV/OX8@redhat.com>
 <CAFn=p-aSbkdzqZQAZYKX2mPo9BVmX0U5s+huXQH-JcD5N6+WCA@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <CAFn=p-aSbkdzqZQAZYKX2mPo9BVmX0U5s+huXQH-JcD5N6+WCA@mail.gmail.com>
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



On 2/23/22 17:18, John Snow wrote:
> On Wed, Feb 23, 2022 at 10:44 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
>>
>> On Wed, Feb 23, 2022 at 10:41:11AM -0500, John Snow wrote:
>>> On Wed, Feb 23, 2022 at 10:27 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>>
>>>> On Wed, Feb 23, 2022 at 10:22:11AM -0500, John Snow wrote:
>>>>> On Mon, Feb 21, 2022 at 10:55 AM Damien Hedde
>>>>> <damien.hedde@greensocs.com> wrote:
>>>>>>
>>>>>> This option makes qmp_shell exit (with error code 1)
>>>>>> as soon as one of the following error occurs:
>>>>>> + command parsing error
>>>>>> + disconnection
>>>>>> + command failure (response is an error)
>>>>>>
>>>>>> _execute_cmd() method now returns None or the response
>>>>>> so that read_exec_command() can do the last check.
>>>>>>
>>>>>> This is meant to be used in combination with an input file
>>>>>> redirection. It allows to store a list of commands
>>>>>> into a file and try to run them by qmp_shell and easily
>>>>>> see if it failed or not.
>>>>>>
>>>>>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>>>>>
>>>>> Based on this patch, it looks like you really want something
>>>>> scriptable, so I think the qemu-send idea that Dan has suggested might
>>>>> be the best way to go. Are you still hoping to use the interactive
>>>>> "short" QMP command format? That might be a bad idea, given how flaky
>>>>> the parsing is -- and how we don't actually have a published standard
>>>>> for that format. We've *never* liked the bad parsing here, so I have a
>>>>> reluctance to use it in more places.
>>>>>
>>>>> I'm having the naive idea that a script file could be as simple as a
>>>>> list of QMP commands to send:
>>>>>
>>>>> [
>>>>>      {"execute": "block-dirty-bitmap-add", "arguments": { ... }},
>>>>>      ...
>>>>> ]
>>>>
>>>> I'd really recommend against creating a new format for the script
>>>> file, especially one needing opening & closing  [] like this, as
>>>> that isn't so amenable to dynamic usage/creation. ie you can't
>>>> just append an extcra command to an existing file.
>>>>
>>>> IMHO, the "file" format should be identical to the result of
>>>> capturing the socket data off the wire. ie just a concatenation
>>>> of QMP commands, with no extra wrapping / change in format.
>>>>
>>>
>>> Eugh. That's just so hard to parse, because there's no off-the-shelf
>>> tooling for "load a sequence of JSON documents". Nothing in Python
>>> does it. :\
>>
>> It isn't that hard if you require each JSON doc to be followed by
>> a newline.
>>
>> Feed one line at a time to the JSON parser, until you get a complete
>> JSON doc, process that, then re-init the parser and carry on feeding
>> it lines until it emits the next JSON doc, and so on.
>>
> 
> There's two interfaces in Python:
> 
> (1) json.load(), which takes a file pointer and either returns a
> single, complete JSON document or it raises an Exception. It's not
> useful here at all.
> (2) json.JSONDecoder().raw_decode(strbuf), which takes a string buffer
> and returns a 2-tuple of a JSON Document and the position at which it
> stopped decoding.
> 
> The second is what we need here, but it does require buffering the
> entire file into a string first, and then iteratively calling it. It
> feels like working against the grain a little bit. We also can't use
> the QAPI parser, as that parser has intentionally removed support for
> constructs we don't use in the qapi schema language. Boo. (Not that I
> want more non-standard configuration files like that propagating,
> either.)
> 
> It would be possible to generate a JSON-Schema document to describe a
> script file that used a containing list construct, but impossible for
> a concatenation of JSON documents. This is one of the reasons I
> instinctively shy away from non-standard file formats, they tend to
> cut off support for this sort of thing.
> 
> Wanting to keep the script easy to append to is legitimate. I'm keen
> to hear a bit more about the use case here before I press extremely
> hard in any given direction, but those are my impulses here.
> 

The use case is to be able to feed qemu with a bunch of commands we 
expect to succeed and let qemu continue (unlike Daniel's wrap use case, 
we don't want to quit qemu after the last command).

Typically it's the use case I present in the following cover-letter:
https://lore.kernel.org/qemu-devel/20220223090706.4888-1-damien.hedde@greensocs.com/

--
Damien

