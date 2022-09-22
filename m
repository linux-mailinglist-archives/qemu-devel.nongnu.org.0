Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E66AD5E6638
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 16:54:32 +0200 (CEST)
Received: from localhost ([::1]:51500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obNax-0006EU-Mo
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 10:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1obMlt-0007s0-BH
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:01:45 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c]:58246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1obMlr-00033o-Ia
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:01:45 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 17611219E4;
 Thu, 22 Sep 2022 14:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663855302; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fhjn6bvXl0yINdkQ9VVsDfgNuESaKBLl6hSceW5gP9c=;
 b=bheAqrcKHYGrAadiNpaRYgDTGvY0GtnxECd29nG4IHCKM8ZJGZzRQRLuEl+UNavHwW8HG1
 dlUaIhCiYevCiCBPbEwKk3Qf44T/UeCrPHIERZ8SxSuVkSAHrwXPDzlAnl0iKHlAaWOEl1
 +xmsbrpi5sK5bXuhKBhzbo/ADvBWQrE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663855302;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fhjn6bvXl0yINdkQ9VVsDfgNuESaKBLl6hSceW5gP9c=;
 b=GVIVNxYj272phdpNFpMon6ymSnU5mTzWJSytxzuqUAf5thL3dASJvxy5iuACpAgYMZYLRB
 IMcbDxaxXNF1XLBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A5ED913AA5;
 Thu, 22 Sep 2022 14:01:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id d+A5JsVqLGPtBwAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 22 Sep 2022 14:01:41 +0000
Message-ID: <d02287f6-0f71-1af4-3bab-99f6df6542eb@suse.de>
Date: Thu, 22 Sep 2022 16:01:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 2/3] module: add Error arguments to module_load_one and
 module_load_qom_one
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: Markus Armbruster <armbru@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 dinechin@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <87y1ucdirx.fsf@pond.sub.org>
 <cc2c5e14-f0a0-4415-9fe1-d7811ee27850@suse.de> <878rmc54cw.fsf@pond.sub.org>
 <Yywcs7CpKDxahOSM@redhat.com> <87leqb4ul9.fsf@pond.sub.org>
 <5f5921fe-6d4f-490b-4328-702a45973bbc@suse.de> <87bkr7mvgr.fsf@pond.sub.org>
 <4a656f0f-1497-5569-e562-f537b115daf3@suse.de> <87r103lf4y.fsf@pond.sub.org>
 <CAAdtpL7=6YN+jh30xB_PB5aAxaWoFf4-3nLsWiAMGK6ZvWnLww@mail.gmail.com>
 <YyxmrTnpziXGxRMm@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <YyxmrTnpziXGxRMm@redhat.com>
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

On 9/22/22 15:44, Daniel P. Berrangé wrote:
> On Thu, Sep 22, 2022 at 03:34:42PM +0200, Philippe Mathieu-Daudé wrote:
>> On Thu, Sep 22, 2022 at 3:20 PM Markus Armbruster <armbru@redhat.com> wrote:
>>>
>>> Claudio Fontana <cfontana@suse.de> writes:
>>>
>>> [...]
>>>
>>>> I think it would be better to completely make the return value separate from the Error,
>>>> and really treat Error as an exception and not mix it up with the regular execution,
>>>>
>>>> but if it is the general consensus that I am the only one seeing this conflation problem we can model it this way too.
>>>
>>> It's a matter of language pragmatics.  In Java, you throw an exception
>>> on error.  In C, you return an error value.
>>>
>>> Trying to emulate exceptions in C might be even more unadvisable than
>>> trying to avoid them in Java.  Best to work with the language, not
>>> against it.
>>>
>>> Trouble is the error values we can conveniently return in C can't convey
>>> enough information.  So we use Error for that.  Just like GLib uses
>>> GError.
>>>
>>> More modern languages do "return error value" much better than C can.  C
>>> is what it is.
>>>
>>> We could certainly argue how to do better than we do now in QEMU's C
>>> code.  However, the Error API is used all over the place, which makes
>>> changing it expensive.  "Rethinking the whole Error API" (your words)
>>> would have to generate benefits worth this expense.  Which seems
>>> unlikely.
>>
>> QEMU Error* and GLib GError are designed to report recoverable runtime *errors*.
>>
>> There is or is no error. A boolean return value seems appropriate.
>>
>> We are bikeshedding about the API because we are abusing it in a non-error case.
>>
>> If we want to try to load an optional module, the Error* argument is
>> not the proper way to return the information regarding why we couldn't
>> load.
>>
>> In both cases we want to know if the module was loaded. If this is an
>> optional module, we don't care why it couldn't be loaded.
> 
> No, that's wrong. If the module exists on disk but is incompatible
> with the current QEMU, then we need to be reporting that as an
> error to the caller, so they can propagate this problem back up
> the stack to the QMP command or CLI arg that started the code path.

Agree.

> 
> We don't need to be using the return status to tell the caller if
> the module was loaded or not. We only should be telling thue caller
> is there was a reportable error or not.
> 
> Consider, there is a call to load block drivers. We don't need
> to know whether each block driver was loaded or not. eg if the
> 'curl' code is a module and we fail to load it, then when code
> tries to create a curl based block device the missing curl
> support will be reported at that time.  The callers that load
> modules should only need to express whether their load attempt
> is mandatory or optional, in terms of the module existing on
> disk.  If the modules exists on disk, any further errors
> encountered when loading it should be propagated.
> 
> 
> 
>> So trying to make everybody happy:
>>
>>   // Return true if the module could be loaded, otherwise return false
>> and errp contains the error.
>>  bool module_load_one(const char *prefix, const char *name, Error *errp);
>>
>>   // Return true if the module could be loaded, false otherwise.
>>   bool module_try_load_one(const char *prefix, const char *name);
> 
> Nope, this latter doesn't work as it throws away important errors
> when loading an incompatible/broken module.
> 

Agree.

Claudio


