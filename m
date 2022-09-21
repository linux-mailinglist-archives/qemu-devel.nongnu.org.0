Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B73925BF85D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 09:56:55 +0200 (CEST)
Received: from localhost ([::1]:42670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaubG-0007LS-Eq
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 03:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oauVg-0003Ks-Ki
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 03:51:08 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:33734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oauVb-0000bf-N2
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 03:51:08 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7BFB71F388;
 Wed, 21 Sep 2022 07:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663746660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ExkrAu7X6iI/SaBHAJ5+77eEroSo+DMa5wWxRIn+cw=;
 b=GpD0cMbaw8+o60ZLGcSZ2A5LzukMBb877W0lNTyB89NHIJYnHWijvuh/Q4PpLFgeTCjCWW
 /BvtFSQFRDzgsGHgx7440qG8l2B9LiozzUNtuydlshaGs8Qj/wxmX7WXXfr2tVDDNvq4zA
 GbZluwkRprt5DPO5SOxZppuzccHmaog=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663746660;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ExkrAu7X6iI/SaBHAJ5+77eEroSo+DMa5wWxRIn+cw=;
 b=k61t9RT5M9Jiqh887Zy51zukh6SU9ba4qc/LKvDspZMHFPNIvryZWvy7Skb7Om31w+KAAL
 eq8Qv05b/AOkClCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3638813A00;
 Wed, 21 Sep 2022 07:51:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LGy4C2TCKmPgFgAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 21 Sep 2022 07:51:00 +0000
Message-ID: <eda3f2ce-a828-8c84-60bd-684844eb25b6@suse.de>
Date: Wed, 21 Sep 2022 09:50:59 +0200
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
References: <20220908145308.30282-1-cfontana@suse.de>
 <20220908145308.30282-3-cfontana@suse.de>
 <062faaa8-064c-f68a-e316-aaacb80efa5a@linaro.org>
 <3c6cb3ee-2470-654f-c2c4-3449861f9781@suse.de>
 <8682ad9f-aea8-0419-5ff6-c14493e4e980@suse.de> <YynvR49aIK2AzbJ3@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <YynvR49aIK2AzbJ3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.182,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/20/22 18:50, Kevin Wolf wrote:
> Am 08.09.2022 um 19:36 hat Claudio Fontana geschrieben:
>> On 9/8/22 19:10, Claudio Fontana wrote:
>>> On 9/8/22 18:03, Richard Henderson wrote:
>>>> On 9/8/22 15:53, Claudio Fontana wrote:
>>>>> @@ -446,8 +447,13 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
>>>>>           return -EINVAL;
>>>>>       }
>>>>>   
>>>>> -    block_module_load_one("dmg-bz2");
>>>>> -    block_module_load_one("dmg-lzfse");
>>>>> +    if (!block_module_load_one("dmg-bz2", &local_err) && local_err) {
>>>>> +        error_report_err(local_err);
>>>>> +    }
>>>>> +    local_err = NULL;
>>>>> +    if (!block_module_load_one("dmg-lzfse", &local_err) && local_err) {
>>>>> +        error_report_err(local_err);
>>>>> +    }
>>>>>   
>>>>>       s->n_chunks = 0;
>>>>>       s->offsets = s->lengths = s->sectors = s->sectorcounts = NULL;
>>>>
>>>> I wonder if these shouldn't fail hard if the modules don't exist?
>>>> Or at least pass back the error.
>>>>
>>>> Kevin?
>>
>> is "dmg-bz" _required_ for dmg open to work? I suspect if the dmg
>> image is not compressed, "dmg" can function even if the extra dmg-bz
>> module is not loaded right?
> 
> Indeed. The code seems to consider that the modules may not be present.
> The behaviour in these cases is questionable (it seems to silently leave
> the buffers as they are and return success), but the modules are clearly
> optional.
> 
>> I'd suspect we should then do:
>>
>> if (!block_module_load_one("dmg-bz2", &local_err)) {
>>   if (local_err) {
>>      error_report_err(local_err);
>>      return -EINVAL;
>>   }
>>   warn_report("dmg-bz2 is not present, dmg will skip bz2-compressed chunks */
>> }
>>
>> and same for dmg-lzfse...?
> 
> Actually, I think during initialisation, we should just pass NULL as
> errp and ignore any errors.

Hmm really? I'd think that if there is an actual error loading the module (module is installed, but the loading itself fails due to broken module, wrong permissions, I/O errors etc)
we would want to report that fact as it happens?

> 
> When a request would access a block that can't be uncompressed because
> of the missing module, that's where we can have a warn_report_once() and
> arguably should fail the I/O request.
> 
> Kevin
> 

That would mean, moving the

warn_report("dmg-bz2 is not present, dmg will skip bz2-compressed chunks")

to the uncompression code and change it to a warn_report_once() right?

Thanks,

Claudio

