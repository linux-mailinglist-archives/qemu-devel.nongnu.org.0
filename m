Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B04E3D0C8E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:49:59 +0200 (CEST)
Received: from localhost ([::1]:60336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69na-0005An-CV
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m69lS-000200-Q4
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:47:46 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:56508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m69lQ-0003a2-2W
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:47:46 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AA1711FE9C;
 Wed, 21 Jul 2021 10:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626864462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rrO3iSZ7pTDUBsuGz8WMeoU7ELxBsHz+K7a1bc9XXQk=;
 b=iXdJ+vqP5+TF7MyOWfMZWoGIqdE26FI7rek5QiFd+9sn3uhoU4wgYHkyAPKBUHacMFsRqk
 RLCb8OIjmdHob9jPJSTXZRr3xJU6bSBFHSt+MCQVPANRVcNlA37na5kd3665RGD4kAjVb/
 EJVm+RefDLdk7gJ5L7DjCCzf5hT04zA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626864462;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rrO3iSZ7pTDUBsuGz8WMeoU7ELxBsHz+K7a1bc9XXQk=;
 b=8Zw3bfrE1dU0lE9Rvbn1pg+GeCfJO8nb6VrjwN4A++EnJ1hepkvLp2tRAw2nPmVGcpuP5B
 Elx1mdF8efA0WuDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6751613B37;
 Wed, 21 Jul 2021 10:47:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id f5a5Fk7792BGOQAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 21 Jul 2021 10:47:42 +0000
Subject: Re: QEMU modules improvements objective (Was: Re: [RFC 0/3] Improve
 module accelerator error message)
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210630232749.21873-1-jziviani@suse.de>
 <2ab57f8e-cb8c-d708-274d-0c2092acfff3@suse.de>
 <20210721103528.5y4tvcpjggfn6hvi@sirius.home.kraxel.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <baed353c-05da-0dcf-536b-1e7fde42275c@suse.de>
Date: Wed, 21 Jul 2021 12:47:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210721103528.5y4tvcpjggfn6hvi@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
 qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/21/21 12:35 PM, Gerd Hoffmann wrote:
>   Hi,
> 
>> Open question to all,
>>
>> why don't we have/add the ability to configure
>>
>> CONFIG_XXX=m
>>
>> for all potentially modular pieces?
>>
>> It should be possible to say, I want to build the storage plugins as modules, TCG I would like it built-in, and KVM as a module,
>> or any combination of these.
>>
>> The most useful combination I see for virtualization use of qemu is with TCG as a module (M), KVM as built-in (Y), and various other optional pieces as modules (M).
> 
> Surely doable.  Comes with maintenance and testing cost though.
> 
> For example you'll get new kinds of dependencies: when building foo as
> module stuff depending on foo must be built modular too (spice-core=m +
> qxl=y doesn't work).
> 
> I see mainly two use cases:
> 
>   (1) distro builds.  Those would enable most features and also modules
>       for fine-grained rpm/deb packaging.
> 
>   (2) builds for specific use cases.  Those would disable modules and
>       just use CONFIG_FOO=n for things they don't need.
> 
> Being able to set CONFIG_FOO=y for features used in >90% of the use
> cases (kvm, some virtio devices come to mind) might be useful for (1).
> Distros do that with linux kernel builds too (Fedora kernel has
> CONFIG_SATA_AHCI=y, CONFIG_USB_XHCI_PCI=y, ...).
> 
> But the question is: Are the benefits worth the effort?
> 
> take care,
>   Gerd
> 

I generally agree with your use cases as we see it right now from a distro perspective, I suspect there are more,
especially thinking of modeling, testing/builds etc on the TCG side of things.

I think that eventually we will end up there anyway due to the requirements being so vastly different for all possible uses of QEMU.

Doing a proper design of this will allow I think to come to the right conclusions on how to correctly check for accelerators etc,
without creating a one-off solution for each single feature.

KConfig should probably be driving this from day 1 right?

Yeah, it's tough, but I think we would otherwise just drive circles around this, implement a lot of provisional stuff,
and still end up there sooner or later in my opinion.

Ciao,

CLaudio




