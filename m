Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AACB33D0D10
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 13:10:40 +0200 (CEST)
Received: from localhost ([::1]:46170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6A7b-0000sF-PD
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 07:10:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m69nm-0007Hm-9Z
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:50:10 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:57030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m69nk-000592-I6
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:50:10 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4BC571FE93;
 Wed, 21 Jul 2021 10:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626864607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VbRFAn+2bb8M/YauV26OBwlru3ubyLNuzLaPerQNnLE=;
 b=DO3sNOmDaIU2Nybi9y8xeyeyef2If4vFus+AL5aL0NkIGCsaD/F3H8ncS/ScBH31ZzevJb
 QcE16Wc/WpoYioDzqmo0GV1zrk3YgedOYH6kz8boGJsOrBipJxScIAZzQ3DgpmMnNRrq8G
 TDaTMuJrUdPU1oy10pKTIW5KbMjvo3M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626864607;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VbRFAn+2bb8M/YauV26OBwlru3ubyLNuzLaPerQNnLE=;
 b=J0Iuakg0azpccTMUeLNwlEuA7zoqyF9dPGLmx1CKO4aCWbecdo50YO3g1UBqtdQCJReuzO
 7Sn+N8c5ZMOBPODw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E2BAE13B37;
 Wed, 21 Jul 2021 10:50:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EXDlNN7792AdOgAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 21 Jul 2021 10:50:06 +0000
Subject: Re: QEMU modules improvements objective (Was: Re: [RFC 0/3] Improve
 module accelerator error message)
From: Claudio Fontana <cfontana@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210630232749.21873-1-jziviani@suse.de>
 <2ab57f8e-cb8c-d708-274d-0c2092acfff3@suse.de>
 <20210721103528.5y4tvcpjggfn6hvi@sirius.home.kraxel.org>
 <baed353c-05da-0dcf-536b-1e7fde42275c@suse.de>
Message-ID: <d666180d-46db-8e86-9988-740b5858585f@suse.de>
Date: Wed, 21 Jul 2021 12:50:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <baed353c-05da-0dcf-536b-1e7fde42275c@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.117,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com,
 ehabkost@redhat.com, "Jose R. Ziviani" <jziviani@suse.de>,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, pbonzini@redhat.com,
 Alex Bennee <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/21/21 12:47 PM, Claudio Fontana wrote:
> On 7/21/21 12:35 PM, Gerd Hoffmann wrote:
>>   Hi,
>>
>>> Open question to all,
>>>
>>> why don't we have/add the ability to configure
>>>
>>> CONFIG_XXX=m
>>>
>>> for all potentially modular pieces?
>>>
>>> It should be possible to say, I want to build the storage plugins as modules, TCG I would like it built-in, and KVM as a module,
>>> or any combination of these.
>>>
>>> The most useful combination I see for virtualization use of qemu is with TCG as a module (M), KVM as built-in (Y), and various other optional pieces as modules (M).
>>
>> Surely doable.  Comes with maintenance and testing cost though.
>>
>> For example you'll get new kinds of dependencies: when building foo as
>> module stuff depending on foo must be built modular too (spice-core=m +
>> qxl=y doesn't work).
>>
>> I see mainly two use cases:
>>
>>   (1) distro builds.  Those would enable most features and also modules
>>       for fine-grained rpm/deb packaging.
>>
>>   (2) builds for specific use cases.  Those would disable modules and
>>       just use CONFIG_FOO=n for things they don't need.
>>
>> Being able to set CONFIG_FOO=y for features used in >90% of the use
>> cases (kvm, some virtio devices come to mind) might be useful for (1).
>> Distros do that with linux kernel builds too (Fedora kernel has
>> CONFIG_SATA_AHCI=y, CONFIG_USB_XHCI_PCI=y, ...).
>>
>> But the question is: Are the benefits worth the effort?
>>
>> take care,
>>   Gerd
>>
> 
> I generally agree with your use cases as we see it right now from a distro perspective, I suspect there are more,
> especially thinking of modeling, testing/builds etc on the TCG side of things.
> 
> I think that eventually we will end up there anyway due to the requirements being so vastly different for all possible uses of QEMU.
> 
> Doing a proper design of this will allow I think to come to the right conclusions on how to correctly check for accelerators etc,
> without creating a one-off solution for each single feature.
> 
> KConfig should probably be driving this from day 1 right?


Before this, though, the KConfig stuff should be all-ok for ARM and possibly other archs, I am not sure where we are there..

> 
> Yeah, it's tough, but I think we would otherwise just drive circles around this, implement a lot of provisional stuff,
> and still end up there sooner or later in my opinion.
> 
> Ciao,
> 
> CLaudio




