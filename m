Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D4F5E85DD
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 00:26:16 +0200 (CEST)
Received: from localhost ([::1]:56030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obr7e-0004NJ-0T
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 18:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1obr4l-0001eE-Ei
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 18:23:16 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:59276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1obr4i-0004pW-5j
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 18:23:14 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C8DD221998;
 Fri, 23 Sep 2022 22:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663971790; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g7Ihn3QK/TZobRM0xGKAoOMZgH6vnmOgeAavpWHd6tA=;
 b=XzsKmpjA2+7amgrSIrxRtPcfMffO3Fd8PO2ToWCMeuYwQYWhQeuuSUXSBMcLTCXD5czCFG
 n6vX18Gwnv+8Fgqbyn6MThpYaqKGoYzhW67qePCudUIdYRan0N3ASy8Isja3IYaqMVBoR1
 y3LfCH5TMygWLbbsSUY/w0CcOhtz8zk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663971790;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g7Ihn3QK/TZobRM0xGKAoOMZgH6vnmOgeAavpWHd6tA=;
 b=8VvPDrgfg5btYEsOXYb2d8twBuRF8J9PJoDAqBeuuBogmOmEhH1pNCbrvaajoR8ZvxISlH
 TYxgBCFGm599YrCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5759313AA5;
 Fri, 23 Sep 2022 22:23:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id d3oJE84xLmMYQgAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 23 Sep 2022 22:23:10 +0000
Message-ID: <f346e9b6-e3ab-9cdb-3496-7d7062290c43@suse.de>
Date: Sat, 24 Sep 2022 00:23:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 2/3] module: add Error arguments to module_load_one and
 module_load_qom_one
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, dinechin@redhat.com, Gerd Hoffmann
 <kraxel@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20220908145308.30282-3-cfontana@suse.de>
 <062faaa8-064c-f68a-e316-aaacb80efa5a@linaro.org>
 <3c6cb3ee-2470-654f-c2c4-3449861f9781@suse.de>
 <8682ad9f-aea8-0419-5ff6-c14493e4e980@suse.de> <YynvR49aIK2AzbJ3@redhat.com>
 <eda3f2ce-a828-8c84-60bd-684844eb25b6@suse.de> <Yyr72+YyYrhG2zTo@redhat.com>
 <b37405a8-2315-5390-1ae6-5f1cd7ef0001@suse.de> <Yy3F2JkSeB30jqfh@redhat.com>
 <e80d239b-6b57-f699-4f4d-8cadba941c3e@suse.de> <Yy3e45R4qcLKRh0q@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <Yy3e45R4qcLKRh0q@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/22 18:29, Kevin Wolf wrote:
> Am 23.09.2022 um 16:46 hat Claudio Fontana geschrieben:
>> On 9/23/22 16:42, Kevin Wolf wrote:
>>> Am 23.09.2022 um 16:10 hat Claudio Fontana geschrieben:
>>>> On 9/21/22 13:56, Kevin Wolf wrote:
>>>>> Am 21.09.2022 um 09:50 hat Claudio Fontana geschrieben:
>>>>>> On 9/20/22 18:50, Kevin Wolf wrote:
>>>>>>> Am 08.09.2022 um 19:36 hat Claudio Fontana geschrieben:
>>>>>>>> On 9/8/22 19:10, Claudio Fontana wrote:
>>>>>>>>> On 9/8/22 18:03, Richard Henderson wrote:
>>>>>>>>>> On 9/8/22 15:53, Claudio Fontana wrote:
>>>>>>>>>>> @@ -446,8 +447,13 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
>>>>>>>>>>>           return -EINVAL;
>>>>>>>>>>>       }
>>>>>>>>>>>   
>>>>>>>>>>> -    block_module_load_one("dmg-bz2");
>>>>>>>>>>> -    block_module_load_one("dmg-lzfse");
>>>>>>>>>>> +    if (!block_module_load_one("dmg-bz2", &local_err) && local_err) {
>>>>>>>>>>> +        error_report_err(local_err);
>>>>>>>>>>> +    }
>>>>>>>>>>> +    local_err = NULL;
>>>>>>>>>>> +    if (!block_module_load_one("dmg-lzfse", &local_err) && local_err) {
>>>>>>>>>>> +        error_report_err(local_err);
>>>>>>>>>>> +    }
>>>>>>>>>>>   
>>>>>>>>>>>       s->n_chunks = 0;
>>>>>>>>>>>       s->offsets = s->lengths = s->sectors = s->sectorcounts = NULL;
>>>>>>>>>>
>>>>>>>>>> I wonder if these shouldn't fail hard if the modules don't exist?
>>>>>>>>>> Or at least pass back the error.
>>>>>>>>>>
>>>>>>>>>> Kevin?
>>>>>>>>
>>>>>>>> is "dmg-bz" _required_ for dmg open to work? I suspect if the dmg
>>>>>>>> image is not compressed, "dmg" can function even if the extra dmg-bz
>>>>>>>> module is not loaded right?
>>>>>>>
>>>>>>> Indeed. The code seems to consider that the modules may not be present.
>>>>>>> The behaviour in these cases is questionable (it seems to silently leave
>>>>>>> the buffers as they are and return success)
>>>>>
>>>>> I think I misunderstood the code here actually. dmg_read_mish_block()
>>>>> skips chunks of unknown type, so later trying to find them fails and
>>>>> dmg_co_preadv() returns -EIO. Which is a reasonable return value for
>>>>> this.
>>>>>
>>>>>>> , but the modules are clearly
>>>>>>> optional.
>>>>>>>
>>>>>>>> I'd suspect we should then do:
>>>>>>>>
>>>>>>>> if (!block_module_load_one("dmg-bz2", &local_err)) {
>>>>>>>>   if (local_err) {
>>>>>>>>      error_report_err(local_err);
>>>>>>>>      return -EINVAL;
>>>>>>>>   }
>>>>>>>>   warn_report("dmg-bz2 is not present, dmg will skip bz2-compressed chunks */
>>>>>>>> }
>>>>>>>>
>>>>>>>> and same for dmg-lzfse...?
>>>>>>>
>>>>>>> Actually, I think during initialisation, we should just pass NULL as
>>>>>>> errp and ignore any errors.
>>>>>>
>>>>>> Hmm really? I'd think that if there is an actual error loading the
>>>>>> module (module is installed, but the loading itself fails due to
>>>>>> broken module, wrong permissions, I/O errors etc) we would want to
>>>>>> report that fact as it happens?
>>>>>
>>>>> Can we distinguish the two error cases?
>>>>>
>>>>> Oooh... Reading the code again carefully, are you returning false
>>>>> without setting errp if the module just couldn't be found? This is a
>>>>> surprising interface.
>>>>>
>>>>> Yes, I guess then your proposed code is fine (modulo moving
>>>>> warn_report() somewhere else so that it doesn't complain when the image
>>>>> doesn't even contain compressed chunks).
>>>>>
>>>>>>> When a request would access a block that can't be uncompressed because
>>>>>>> of the missing module, that's where we can have a warn_report_once() and
>>>>>>> arguably should fail the I/O request.
>>>>>>>
>>>>>>> Kevin
>>>>>>>
>>>>>>
>>>>>> That would mean, moving the
>>>>>>
>>>>>> warn_report("dmg-bz2 is not present, dmg will skip bz2-compressed chunks")
>>>>>>
>>>>>> to the uncompression code and change it to a warn_report_once() right?
>>>>>
>>>>> Yeah, though I think this doesn't actually work because we never even
>>>>> stored the metadata for chunks of unknown type (see above), so we never
>>>>> reach the uncompression code.
>>>>>
>>>>> What misled me initially is this code in dmg_read_chunk():
>>>>>
>>>>>         case UDBZ: /* bzip2 compressed */
>>>>>             if (!dmg_uncompress_bz2) {
>>>>>                 break;
>>>>>             }
>>>>>
>>>>> I believe this is dead code, it could actually be an assertion. So
>>>>> if I'm not missing anything, adding the warning there would be useless.
>>>>>
>>>>> The other option is moving it into dmg_is_known_block_type() or its
>>>>> caller dmg_read_mish_block(), then we would detect it during open, which
>>>>> is probably nicer anyway.
>>>>>
>>>>> Kevin
>>>>>
>>>>>
>>>>
>>>> Hi Kevin, I got a bit lost on whether we have some agreement on where
>>>> if anywhere to move the check/warning about missing decompression
>>>> submodules.
>>>>
>>>> If that's ok I'd post a V5, and we can rediscuss from the new starting
>>>> point?
>>>
>>> Sure, feel free, though I don't think the code will otherwise change for
>>> dmg, so we could as well continue here.
>>>
>>> My conclusion was that only dmg_read_mish_block() or something called by
>>> it can know whether compressed blocks exist in the image when the
>>> modules aren't present. So if we want to make the warning conditional on
>>> that (and my understanding is correct), this is where a
>>> warn_report_once() would have to live.
>>>
>>> Kevin
>>>
>>
>> I took a look, but I feel a bit too ignorant of the code there, maybe you could move the warning as a patch to the right place after the series?
>>
>> Or give me the extra commit needed to move into the right place?
> 
> Only built and tested with an uncompressed image, so this could use
> testing with an actual compressed dmg image and the module present or
> missing, but something like the following should do the trick.
> 
> Kevin
> 
> 
> diff --git a/block/dmg.c b/block/dmg.c
> index 98db18d82a..630cde3416 100644
> --- a/block/dmg.c
> +++ b/block/dmg.c
> @@ -254,6 +254,25 @@ static int dmg_read_mish_block(BDRVDMGState *s, DmgHeaderState *ds,
>      for (i = s->n_chunks; i < s->n_chunks + chunk_count; i++) {
>          s->types[i] = buff_read_uint32(buffer, offset);
>          if (!dmg_is_known_block_type(s->types[i])) {
> +            switch (s->types[i]) {
> +            case UDBZ:
> +                warn_report_once("dmg-bzip2 module is missing, accessing bzip2 "
> +                                 "compressed blocks will result in I/O errors");
> +                break;
> +            case ULFO:
> +                warn_report_once("dmg-lzfse module is missing, accessing lzfse "
> +                                 "compressed blocks will result in I/O errors");
> +                break;
> +            case UDCM:
> +            case UDLE:
> +                /* Comments and last entry can be ignored without problems */
> +                break;
> +            default:
> +                warn_report_once("Image contains chunks of unknown type %x, "
> +                                 "accessing them will result in I/O errors",
> +                                 s->types[i]);
> +                break;
> +            }
>              chunk_count--;
>              i--;
>              offset += 40;
> 

Awesome thanks!

Claudio

