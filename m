Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CCE5E6547
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 16:27:11 +0200 (CEST)
Received: from localhost ([::1]:50072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obNAU-0002Go-I5
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 10:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1obMTm-0006AE-My
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:43:02 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:59650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1obMTl-0003M4-0K
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:43:02 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AD9E3219ED;
 Thu, 22 Sep 2022 13:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663854177; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O7Kasv43rzdOZfTe7vT4wIb6dOEkVz51eREsz9bFzn4=;
 b=n98kniFwl+CfDFd4xieq1EtAZWKsBVt9MQzYs4BheA1ITrh+oDeASGtYuHuMq4ZSe7kHUy
 BB4P/EgRUYRqEAyM6eFwOa9dnFT7MN8v98FnsgdRFcepyMRcXflt1bc9wIyX4XgHwCxgPZ
 m7byOL8/kP4wCae1AIuKjmIXXYkasTE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663854177;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O7Kasv43rzdOZfTe7vT4wIb6dOEkVz51eREsz9bFzn4=;
 b=1URniXtu6KM9qyRbUwU+3s2mxJuAcBWLDipAmRlBCo9/pOM10NNp7uru/8ts7vAPGxCC3Q
 5vBESjmKk510ScBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4465413AA5;
 Thu, 22 Sep 2022 13:42:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2sCbDmFmLGPJfQAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 22 Sep 2022 13:42:57 +0000
Message-ID: <9344f595-5d0e-727f-5802-17b2cc6c822c@suse.de>
Date: Thu, 22 Sep 2022 15:42:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 2/3] module: add Error arguments to module_load_one and
 module_load_qom_one
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 dinechin@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20220908183012.17667-1-cfontana@suse.de>
 <20220908183012.17667-3-cfontana@suse.de> <877d23ekj0.fsf@pond.sub.org>
 <76775f64-e49a-1c3c-0d73-10d93eff34e4@amsat.org>
 <87y1ucdirx.fsf@pond.sub.org> <cc2c5e14-f0a0-4415-9fe1-d7811ee27850@suse.de>
 <878rmc54cw.fsf@pond.sub.org> <Yywcs7CpKDxahOSM@redhat.com>
 <87leqb4ul9.fsf@pond.sub.org> <5f5921fe-6d4f-490b-4328-702a45973bbc@suse.de>
 <87bkr7mvgr.fsf@pond.sub.org> <4a656f0f-1497-5569-e562-f537b115daf3@suse.de>
 <87r103lf4y.fsf@pond.sub.org>
 <CAAdtpL7=6YN+jh30xB_PB5aAxaWoFf4-3nLsWiAMGK6ZvWnLww@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <CAAdtpL7=6YN+jh30xB_PB5aAxaWoFf4-3nLsWiAMGK6ZvWnLww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.893,
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

On 9/22/22 15:34, Philippe Mathieu-Daudé wrote:
> On Thu, Sep 22, 2022 at 3:20 PM Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Claudio Fontana <cfontana@suse.de> writes:
>>
>> [...]
>>
>>> I think it would be better to completely make the return value separate from the Error,
>>> and really treat Error as an exception and not mix it up with the regular execution,
>>>
>>> but if it is the general consensus that I am the only one seeing this conflation problem we can model it this way too.
>>
>> It's a matter of language pragmatics.  In Java, you throw an exception
>> on error.  In C, you return an error value.
>>
>> Trying to emulate exceptions in C might be even more unadvisable than
>> trying to avoid them in Java.  Best to work with the language, not
>> against it.
>>
>> Trouble is the error values we can conveniently return in C can't convey
>> enough information.  So we use Error for that.  Just like GLib uses
>> GError.
>>
>> More modern languages do "return error value" much better than C can.  C
>> is what it is.
>>
>> We could certainly argue how to do better than we do now in QEMU's C
>> code.  However, the Error API is used all over the place, which makes
>> changing it expensive.  "Rethinking the whole Error API" (your words)
>> would have to generate benefits worth this expense.  Which seems
>> unlikely.
> 
> QEMU Error* and GLib GError are designed to report recoverable runtime *errors*.
> 
> There is or is no error. A boolean return value seems appropriate.
> 
> We are bikeshedding about the API because we are abusing it in a non-error case.

Agreed.

> 
> If we want to try to load an optional module, the Error* argument is
> not the proper way to return the information regarding why we couldn't
> load.

Mostly agree. If an _actual_ terrible Error happens when loading an optional module (I/O error, multiple module exist for the same QOM type, module architecture incompatible etc, module directory permissions are wrong, etc) I'd argue we have to provide this information too,

ie in the case of a catastrophic error when loading the optional module, we should at least provide the information to the caller and let it decide what to do with it,
maybe even just warn and continue, maybe do nothing, caller choice.

> 
> In both cases we want to know if the module was loaded. If this is an
> optional module, we don't care why it couldn't be loaded.

We don't care if the module is not present, but the caller _may_ care to at least report if the module is present (and thus the user expects the functionality to be available),
but it could not be loaded because of a catastrophic I/O error. I am deliberately exaggerating for the benefit of clarity.

> 
> So trying to make everybody happy:
> 
>   // Return true if the module could be loaded, otherwise return false
> and errp contains the error.
>  bool module_load_one(const char *prefix, const char *name, Error *errp);
> 
>   // Return true if the module could be loaded, false otherwise.
>   bool module_try_load_one(const char *prefix, const char *name);


