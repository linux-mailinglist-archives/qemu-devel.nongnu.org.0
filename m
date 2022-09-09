Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EB55B3AB6
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 16:31:15 +0200 (CEST)
Received: from localhost ([::1]:51222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWf2I-0003rg-6w
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 10:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oWezE-0000Bo-TG
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 10:28:05 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d]:53066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oWeyn-0003nB-N1
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 10:27:39 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 99FD41F890;
 Fri,  9 Sep 2022 14:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662733655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fuBqg7efCGMbD/zCayrghRhLJ3WSbaSdi7NAyaW4rhA=;
 b=S+puiMBu7C8wjl5jqcggr0VWChN9K7kR8JUDRc0wWReT4Q+MNEa+oeBTB/h2E3j5chx03k
 lWQRVTTJaqayRwwmPu599rD87F8/6Ia93JGxcTfdbOq4MrxD40K4yc1E4JG3SMrtGczHna
 3wtcwRB6EPFPKp0njGIrZXl3+gGqDlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662733655;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fuBqg7efCGMbD/zCayrghRhLJ3WSbaSdi7NAyaW4rhA=;
 b=qDQSinySCVwxRuUkft9J3d7chPvso0VEy9JUaCXkNcmlHc6U7ih8SNFagpVgbZWoS7gmEF
 5x/YtdLG4yXrMlCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 46EA813A93;
 Fri,  9 Sep 2022 14:27:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ryTaD1dNG2OvWwAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 09 Sep 2022 14:27:35 +0000
Message-ID: <17ef7456-9652-6105-b81d-7a92ee9a6ced@suse.de>
Date: Fri, 9 Sep 2022 16:27:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3] audio: add help option for -audio and -audiodev
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, =?UTF-8?Q?Volker_R=c3=bcmelin?=
 <vr_qemu@t-online.de>, qemu-devel <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20220908093936.19280-1-pbonzini@redhat.com>
 <67f82e6b-683d-564f-aa9f-a9aaaafd0382@suse.de>
 <CABgObfaQuw20OB2whQMg1kp0Pau370zs3NyUP4SMN1GkFUvLpA@mail.gmail.com>
 <490c7ed8-53be-31de-1065-14b2fec492b2@suse.de> <YxtEkdBkYgiwMJyB@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <YxtEkdBkYgiwMJyB@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=cfontana@suse.de; helo=smtp-out2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.079,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/9/22 15:50, Daniel P. Berrangé wrote:
> On Fri, Sep 09, 2022 at 03:41:22PM +0200, Claudio Fontana wrote:
>> On 9/9/22 00:05, Paolo Bonzini wrote:
>>> Il gio 8 set 2022, 15:47 Claudio Fontana <cfontana@suse.de> ha scritto:
>>>
>>>> On 9/8/22 11:39, Paolo Bonzini wrote:
>>>>> Queued, thanks.
>>>>>
>>>>> Paolo
>>>>>
>>>>>
>>>>
>>>> Thanks. When it comes to programmatic checks about what QEMU supports in
>>>> terms of audio,
>>>>
>>>> is there something that can be done with QMP?
>>>>
>>>> I checked the QMP manual at:
>>>>
>>>>
>>>> https://qemu.readthedocs.io/en/latest/interop/qemu-qmp-ref.html#qapidoc-2948
>>>>
>>>> but in the "Audio" section there is a bunch of Objects and enums defined,
>>>> but no command to query them...
>>>>
>>> No, there's nothing yet.
> 
> You're now reminding me of the patch I sent a while ago for reporting
> audiodev backends and then completely forgot to followup on
> 
>   https://mail.gnu.org/archive/html/qemu-devel/2021-03/msg00656.html
> 
> 
>> Interesting. What about Display (ie ui-*) ? I mean how do I figure out from, say, libvirt,
>> everything that QEMU can do in terms of display, which drivers are actually installed?
>>
>> Same for block...
>>
>> with the increasing modularization of QEMU we should I presume strengthen the discoverability of QEMU capabilities right?
>> This way we can configure once, and install just what is needed to match the user requirements, or distro variant.
>>
>> As Markus mentioned maybe a more general solution would be to have these things as qom objects so that a
>>
>> qom-list-types
>> can be used to get all 'audiodev' types, or all 'display' types, or all 'block' types and solve the problem this way?
> 
>> Is there a more general problem / solution that I am not seeing?
> 
> In an idealized world (where we can ignore the reality of our
> existing legacy codebase) I think all backends would simply
> be QOM objects, and created with -object, avoiding the need for
> any backend type specific CLI args like -audiodev / -netdev / etc.
> 
> This would actually also extend to frontends, devices, cpus,
> machine types etc all being objects, ought to be creatable via
> -object, not requiring -device, -machine.
> 
> If we lived in the world where everything was a QOM Object,
> then qom-list-types would serve as the universal detection
> mechanism for everything.
> 
> Back in our current reality of pre-existing legacy code though,
> we have to be a little more pragmattic. If we can make things
> into QOM objects that work with -object / qom-list-types that's
> great, but if it is too much work we'll just have to create other
> QMP commands for querying, such as the query-audiodev patch.
> 
> 
> With regards,
> Daniel

Hmm the patch I am seeing though says that it

"reflects back the list of configured -audiodev command line options".

Maybe we are saying the same thing, but maybe we aren't,
what we are actually trying to achieve is to probe which audiodev drivers are available, either built-in or loaded as modules.
Same for display, block, etc.

You are instead trying to fetch the command line options?








