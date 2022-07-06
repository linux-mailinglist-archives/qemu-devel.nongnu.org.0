Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B5E568C06
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 16:59:26 +0200 (CEST)
Received: from localhost ([::1]:38254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o96Uv-0007Qu-PS
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 10:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1o96TJ-0006ei-Ux
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 10:57:45 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:39244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1o96TH-0005WZ-Uw
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 10:57:45 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4876C22470;
 Wed,  6 Jul 2022 14:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657119461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SC2U1Q8CAsDFpzT6DsvgxUtrlT0KP8zLpbszHihqDNI=;
 b=mlG0nIOIaLWerhYTlVRwI+N91EQvg7RfD1NqUZ4uJN1Na4I7orzWje3yOyhIYFhwKu7kzg
 l4k3cPWhvZhVyMezA8VvtXNFD173KZo65MhdjGLp9KoLH7eTNM5u3jS8TG85d+rVhxdueI
 ZOlCDhdDIaj27ieL4veisG9OOzkIrik=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657119461;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SC2U1Q8CAsDFpzT6DsvgxUtrlT0KP8zLpbszHihqDNI=;
 b=HBou2MZbkAbwAj3Yy1e+JiJqTZkwtEyQr7SgATDOP9VkjAHwMQSoAT197MNk+58PDpowiq
 M2cN6peQuWm8wmCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0BCDD134CF;
 Wed,  6 Jul 2022 14:57:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4MFHAeWixWKXUgAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 06 Jul 2022 14:57:41 +0000
Message-ID: <eaea4711-0290-2087-5abf-f65e6328247d@suse.de>
Date: Wed, 6 Jul 2022 16:57:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Adjusting the default ROM option for SEV guests
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <d0c41d34-2ae3-39ac-58df-bbdf81bf79b6@suse.de>
Cc: Vasiliy Ulyanov <vasily.ulyanov@suse.com>, qemu-devel@nongnu.org
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <d0c41d34-2ae3-39ac-58df-bbdf81bf79b6@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

Hello all

any comment on this one? It seems it would make sense to disable option roms for SEV by default in QEMU, any feedback anyone?

Thanks,

Claudio

On 5/11/22 13:30, Vasily Ulyanov wrote:
> Hello QEMU devs,
> 
> Currently to launch an SEV guest there are certain requirements for the VM
> configuration. One such is that ROM option needs to be disabled for virtio-net
> devices [1]. The tools like virt-install or libvirt rely on the QEMU defaults if
> the ROM value is not provided (the default for virtio-net is set to
> romfile=efi-virtio.rom). Eventually this leads to unbootable guest and poor user
> experience as it is now mandatory to explicitly disable the ROM option.
> 
> There is a similar situation with iommu_platform, though that seems to be
> addressed already in [2] and QEMU adjusts the defaults depending on whether it
> is a confidential guest or not.
> 
> Wouldn't it make sense to also handle the romfile like that in QEMU? I.e. in the
> case when an SEV guest is run and no romfile is explicitly specified set it to
> an empty value? This will also be useful when running an SEV VM directly with QEMU.
> 
> Are there any objections or concerns? I could work on the patches but wanted to
> ping the community first and get some feedback. Would QEMU be the proper place
> to handle that? Any thoughts?
> 
> [1] https://libvirt.org/kbase/launch_security_sev.html#virtio-net
> [2] https://gitlab.com/qemu-project/qemu/-/commit/9f88a7a3df
> 


