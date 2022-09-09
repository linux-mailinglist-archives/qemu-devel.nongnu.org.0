Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F5E5B396D
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 15:44:46 +0200 (CEST)
Received: from localhost ([::1]:46548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWeJJ-0001Xb-Bi
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 09:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oWeG9-0004tb-Dm
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 09:41:30 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:58292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oWeG7-00039t-Oi
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 09:41:29 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EC0D522A07;
 Fri,  9 Sep 2022 13:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662730883; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lsoRis+FeHVHc4Fyc1lLmm08Dpo4r8FEYS1T44hPqhk=;
 b=VIOKDxUgCAe+sIndx0786gD8y8SLcCZWgAxRRWfZ8b39eixneVnUhILBq04r43d7QDX+fQ
 GK9Dyb+LJVOpqur4S70/ORvXb6hNKid83Nr5vE/a0JhCFd5zEO4tDY5CnpVvuojCad5LQB
 FPJFGLpImovx3YqNnDDxaAEeReVFFt4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662730883;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lsoRis+FeHVHc4Fyc1lLmm08Dpo4r8FEYS1T44hPqhk=;
 b=SVfbD+44H9fOxUgRxX0UoYvJ7+kHgNUhO+gg3qwgVdAuaSmrlbzX2dRdY5gTXD1yMOiFbd
 O7eFYh5U8bHxnuCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 730DD139D5;
 Fri,  9 Sep 2022 13:41:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 35DxGYNCG2PTSAAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 09 Sep 2022 13:41:23 +0000
Message-ID: <490c7ed8-53be-31de-1065-14b2fec492b2@suse.de>
Date: Fri, 9 Sep 2022 15:41:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3] audio: add help option for -audio and -audiodev
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, =?UTF-8?Q?Volker_R=c3=bcmelin?=
 <vr_qemu@t-online.de>, qemu-devel <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20220908093936.19280-1-pbonzini@redhat.com>
 <67f82e6b-683d-564f-aa9f-a9aaaafd0382@suse.de>
 <CABgObfaQuw20OB2whQMg1kp0Pau370zs3NyUP4SMN1GkFUvLpA@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <CABgObfaQuw20OB2whQMg1kp0Pau370zs3NyUP4SMN1GkFUvLpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.079,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 9/9/22 00:05, Paolo Bonzini wrote:
> Il gio 8 set 2022, 15:47 Claudio Fontana <cfontana@suse.de> ha scritto:
> 
>> On 9/8/22 11:39, Paolo Bonzini wrote:
>>> Queued, thanks.
>>>
>>> Paolo
>>>
>>>
>>
>> Thanks. When it comes to programmatic checks about what QEMU supports in
>> terms of audio,
>>
>> is there something that can be done with QMP?
>>
>> I checked the QMP manual at:
>>
>>
>> https://qemu.readthedocs.io/en/latest/interop/qemu-qmp-ref.html#qapidoc-2948
>>
>> but in the "Audio" section there is a bunch of Objects and enums defined,
>> but no command to query them...
>>
>> Thanks,
>>
>> Claudio
>>
>>
> No, there's nothing yet.
> 
> Paolo
> 
 
Interesting. What about Display (ie ui-*) ? I mean how do I figure out from, say, libvirt,
everything that QEMU can do in terms of display, which drivers are actually installed?

Same for block...

with the increasing modularization of QEMU we should I presume strengthen the discoverability of QEMU capabilities right?
This way we can configure once, and install just what is needed to match the user requirements, or distro variant.

As Markus mentioned maybe a more general solution would be to have these things as qom objects so that a

qom-list-types

can be used to get all 'audiodev' types, or all 'display' types, or all 'block' types and solve the problem this way?

Is there a more general problem / solution that I am not seeing?

Thanks,

Claudio

