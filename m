Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2C9538DD9
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 11:37:42 +0200 (CEST)
Received: from localhost ([::1]:52674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvyJp-0005SF-BM
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 05:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nvyC4-0002OJ-37
 for qemu-devel@nongnu.org; Tue, 31 May 2022 05:29:41 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:39848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nvyBz-0000PA-Oh
 for qemu-devel@nongnu.org; Tue, 31 May 2022 05:29:38 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9B1971F981;
 Tue, 31 May 2022 09:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1653989374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t1xXxkXRYp/WYFjpXgHr3Y+jYKjzNMhWAVpPSrIScU0=;
 b=uSuKtC4oCj/1rm+0pnHk8wTohdFT9mpb1ZbCR3ymNVmL+M8+38r/vKdYkkeN9nDTrhpjw5
 tGnKxlGFjm9t4s806aow6irsN8MpuS8JiLHHb4GEd1PjBNB3PpoJfn7ouuXI5EK1nBpxss
 p+eHrR1qj2my4QNH/tjhDkdTKvNMpeE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1653989374;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t1xXxkXRYp/WYFjpXgHr3Y+jYKjzNMhWAVpPSrIScU0=;
 b=DrThUR8UmqWonQoFHiMcUBJET4NY4IFl5yVJKEtPu1BGGENls1PV9LmfeT9M2R85nN+rCm
 5+il+ZwIIqdEEnAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 77915132F9;
 Tue, 31 May 2022 09:29:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QvN8G/7flWK+EgAAMHmgww
 (envelope-from <cfontana@suse.de>); Tue, 31 May 2022 09:29:34 +0000
Message-ID: <31c26a0f-04d8-35fb-acf3-29814df19ee9@suse.de>
Date: Tue, 31 May 2022 11:29:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: QEMU malfunctioning if built with FORTIFY_SOURCE=3
Content-Language: en-US
To: Dario Faggioli <dfaggioli@suse.com>
References: <6a6dbfb53f2ea5a9740249c2fdf480be183e6ee8.camel@suse.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <6a6dbfb53f2ea5a9740249c2fdf480be183e6ee8.camel@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
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

On 5/27/22 18:55, Dario Faggioli wrote:
> Hello Everyone!
> 
> So, I'm not sure how much this would be interesting, but I thought
> about reporting it anyways, then let's see.
> 
> A few days ago we started to build openSUSE_Tumbleweed packages with
> -D_FORTIFY_SOURCES=3 by default (it was =2 before, and it's back to =2
> again now, at least for QEMU :-/).
> 
> It seemed fine, but then we discovered that a QEMU built that way, does
> not work properly. In fact, it crashes pretty early displaying a
> message like this: "*** buffer overflow detected ***"

Hi Dario and all,

I just sent a fix to the list,

with the Subject

"[PATCH] pci: fix overflow in printf string formatting"

That should fix the issue,

Thanks,

Claudio

> 
> I've had a look around, and did not find anything about previous
> attempts of doing that, or things to be aware of, in general, if doing
> it.
> 
> Now, for now, I don't have many other info myself either. Just some
> terminal logs from a few users, and from our automated testing system,
> i.e., like this:
> 
> $ sudo virsh start VM1
> error: Failed to start domain 'VM1'
> error: internal error: qemu unexpectedly closed the monitor: qxl_send_events: spice-server bug: guest stopped, ignoring
> *** buffer overflow detected ***: terminated
> 
> Or this:
> 
> error: Failed to start domain 'vm-swtpm-legacy'
> error: internal error: qemu unexpectedly closed the monitor: 2022-05-25T16:30:05.738186Z qemu-system-x86_64: -accel kvm: warning: Number of SMP cpus requested (2) exceeds the recommended cpus supported by KVM (1)
> 2022-05-25T16:30:05.738259Z qemu-system-x86_64: -accel kvm: warning: Number of hotpluggable cpus requested (2) exceeds the recommended cpus supported by KVM (1)
> 2022-05-25T16:30:05.742354Z qemu-system-x86_64: warning: host doesn't support requested feature: MSR(48FH).vmx-exit-load-perf-global-ctrl [bit 12]
> 2022-05-25T16:30:05.742369Z qemu-system-x86_64: warning: host doesn't support requested feature: MSR(490H).vmx-entry-load-perf-global-ctrl [bit 13]
> 2022-05-25T16:30:05.743989Z qemu-system-x86_64: warning: host doesn't support requested feature: MSR(48FH).vmx-exit-load-perf-global-ctrl [bit 12]
> 2022-05-25T16:30:05.744050Z qemu-system-x86_64: warning: host doesn't support requested feature: MSR(490H).vmx-entry-load-perf-global-ctrl [bit 13]
> *** buffer overflow detected ***: terminated
> 
> Or this:
> https://openqa.opensuse.org/tests/2375666#step/usr_sbin_dnsmasq/47
> https://xenbits.xen.org/people/dariof/download.png (also here, in case
> the image disappears from OpenQA)
> 
> I am planning to try to investigate this more, but not right away. And
> I can't even tell for sure when I'll have time for it. So, this is just
> for letting people know that this has been (quickly) attempted, and
> that it currently does not work, in case it's interesting for anyone
> else.
> 
> Of course, in case it's the other way around, i.e., someone already has
> more info on the subject that I've not been able to find, feel free to
> ping me. :-)
> 
> Thanks and Regards


