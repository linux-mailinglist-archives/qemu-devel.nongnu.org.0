Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EEC5E62BD
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 14:47:19 +0200 (CEST)
Received: from localhost ([::1]:55602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obLbp-0003xf-Kv
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 08:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1obLR7-0003my-3G
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 08:36:15 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c]:56906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1obLQc-00063s-Ob
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 08:35:54 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0D4AF21A4C;
 Thu, 22 Sep 2022 12:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663850129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XvA5cog5D8xHhl5M67RfSpy4BATumhdiDpWWWMWstKE=;
 b=2CoBJ36IzUwYOpczIuuss3VitD8vAKtRPr6ANYEWdI7nQETZKu9KmDGIndESX9VIlyFNo1
 5/WQIwrDUSmZsyAuFp8CnlegkNpSpVswfs+bBhv2xNY3uXSlYQm0AfNJjqjGW997xHJzkN
 gCGQ3cMZ/B2tEfKkJbIXhWPjcO3r4yw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663850129;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XvA5cog5D8xHhl5M67RfSpy4BATumhdiDpWWWMWstKE=;
 b=aTcfU5gXjxUYeeV/kIsABNbNRKoSTQZYYTfMb7pkCE6K1SEpr0bYkczQzck6aufHFZwbv2
 HiERTixffm/3DUBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AAF4E1346B;
 Thu, 22 Sep 2022 12:35:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eWH9J5BWLGOTXAAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 22 Sep 2022 12:35:28 +0000
Message-ID: <26127615-af4c-b2b0-9681-efac77ce2941@suse.de>
Date: Thu, 22 Sep 2022 14:35:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 2/3] module: add Error arguments to module_load_one and
 module_load_qom_one
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <76775f64-e49a-1c3c-0d73-10d93eff34e4@amsat.org>
 <87y1ucdirx.fsf@pond.sub.org> <cc2c5e14-f0a0-4415-9fe1-d7811ee27850@suse.de>
 <878rmc54cw.fsf@pond.sub.org> <Yywcs7CpKDxahOSM@redhat.com>
 <5e6d958d-3b69-1472-b1b8-3a63186f0c5b@suse.de> <YywraWlVnJoy6ypN@redhat.com>
 <df4c09e9-addf-c643-6da0-62a6cf94b349@suse.de> <Yyw61MdawM2wkfiQ@redhat.com>
 <40d9103b-0a7e-5f3a-dfa0-50e42aba6868@suse.de> <YyxWNVFP3cdxoGnW@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <YyxWNVFP3cdxoGnW@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=cfontana@suse.de; helo=smtp-out1.suse.de
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.893,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 9/22/22 14:33, Daniel P. Berrangé wrote:
> On Thu, Sep 22, 2022 at 02:30:35PM +0200, Claudio Fontana wrote:
>> On 9/22/22 12:37, Daniel P. Berrangé wrote:
>>> On Thu, Sep 22, 2022 at 11:34:22AM +0200, Claudio Fontana wrote:
>>>> On 9/22/22 11:31, Daniel P. Berrangé wrote:
>>>>> On Thu, Sep 22, 2022 at 11:20:07AM +0200, Claudio Fontana wrote:
>>>>>> On 9/22/22 10:28, Daniel P. Berrangé wrote:
>>>>>>>
>>>>>>>> Another interface that does: return -1 for error, 0 for module not found
>>>>>>>> (no error), and 1 for loaded.
>>>>>>>
>>>>>>> IMHO this pattern is generally easier to understand when looking at
>>>>>>> the callers, as the fatal error scenario is always clear.
>>>>>>>
>>>>>>> That said I would suggest neither approach as the public facing
>>>>>>> API. Rather stop trying to overload 3 states onto an error reporting
>>>>>>> pattern that inherantly wants to be 2 states. Instead just have
>>>>>>> distinct methods
>>>>>>>
>>>>>>>   bool module_load_one(const char *prefix, const char *name, Error *errp)
>>>>>>>   bool module_try_load_one(const char *prefix, const char *name, Error *errp)
>>>>>>
>>>>>>
>>>>>> Here we are murking again the normal behavior and the error path.
>>>>>>
>>>>>> What is the meaning of try? It's not as though we would error out inside the function module_load_one,
>>>>>> it's the _caller_ that needs to decide how to treat a return value of found/not found, and the exception (Error).
>>>>>
>>>>> I suggested "try" as in the  g_malloc vs g_try_malloc API naming pattern,
>>>>> where the latter ignores the OOM error condition.
>>>>>
>>>>> So in this case 'try' means try to load the module, but don't fail if
>>>>> the module is missing on disk.
>>>>
>>>> I understand what you mean, but this is wrong in this case.
>>>>
>>>> We _do not fail_ in module_load_one, whether an error is present
>>>> or not, whether a module is found or not.
>>>
>>> Looking at the callers though, AFAIK there are only two patterns
>>> that we need. All callers should report a fatal error if the module
>>> exists and loading it failed eg module is from mis-matched build.
>>>
>>> Some callers also want a failure if the module doesn't exist on
>>
>> Some callers also want to behave differently if the module is not installed.
>> It is not a "failure" in the same sense that what an Error returns.
>>
>> For example, the block dmg module tries to also load other submodules for decompression.
>>
>> If dmg does not find any such submodules, it will be able to support basic dmg just fine,
>> but won't be able to open compressed dmg.
> 
> The dmg case looks like it works fine with module_try_load_one(). I
> know your patch does a "warn" when the module is missing currently,
> but IMHO that's the wrong place todo this. Any problems with use
> of compressed dmg should be reported at the time the feature is
> actually used, rather than when trying to load the module.

Right, this was the input from Kevin as well, I planned to change that.

We should warn only when we actually encounter/decode a compressed dmg.

Thanks,

Claudio

