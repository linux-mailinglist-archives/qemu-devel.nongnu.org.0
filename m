Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AC952494E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 11:42:51 +0200 (CEST)
Received: from localhost ([::1]:52424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np5LO-0003lN-Rx
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 05:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1np50Y-0005vQ-1R
 for qemu-devel@nongnu.org; Thu, 12 May 2022 05:21:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1np50T-0005uS-Hq
 for qemu-devel@nongnu.org; Thu, 12 May 2022 05:21:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652347272;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aORld5R1eOfG+QmjI+oYurqiAj0RHdpqdmfOjwl9azk=;
 b=KyZZkA89scJTApL5qCchrGFDd00EbGhcCVb9ky2PpL9uGgBJ7bGNsq8ELZ88Usxt6fN5c5
 73FnAamCDEEsBt4rDWO/CUHIbjlUZ8mTHN5ZEH7EFgpjzfIkJxc87snrKZtjL0hmbctP2v
 PYpc7rev1bF1/AzY7JgCRJnvh77DFiI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-m81y4N3TPOS_UREu1ghlMA-1; Thu, 12 May 2022 05:21:09 -0400
X-MC-Unique: m81y4N3TPOS_UREu1ghlMA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86941382ECC2;
 Thu, 12 May 2022 09:21:08 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C5D6153B885;
 Thu, 12 May 2022 09:21:05 +0000 (UTC)
Date: Thu, 12 May 2022 10:21:03 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, Fam Zheng <fam@euphon.net>,
 Robert Foley <robert.foley@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] Remove Ubuntu 18.04 support from the repository
Message-ID: <YnzRf6aRQBHfx3zC@redhat.com>
References: <20220510195612.677494-1-thuth@redhat.com>
 <YnuCEPOj70J+1NXx@redhat.com>
 <CAAdtpL45Bn0wrDX6nQzkzQW=eqxrja4zOFcfG_gTz84LExSpoA@mail.gmail.com>
 <f40ceb7b-8412-8da2-7c16-2590debecaed@redhat.com>
 <CAAdtpL4oGW28-r0ZuMV9nBoZGDR5L9PYM2jsKw0Fmuwx68MWdw@mail.gmail.com>
 <c0fb8289-1b56-6e7f-e053-b19dffcfc87b@redhat.com>
 <CAAdtpL5JxRgJ75eqQT6MZPvd7DvgN2ND44O+MKd1Fr_SzEwmAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAdtpL5JxRgJ75eqQT6MZPvd7DvgN2ND44O+MKd1Fr_SzEwmAA@mail.gmail.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 12, 2022 at 11:14:45AM +0200, Philippe Mathieu-Daudé wrote:
> On Wed, May 11, 2022 at 1:15 PM Thomas Huth <thuth@redhat.com> wrote:
> > On 11/05/2022 13.13, Philippe Mathieu-Daudé wrote:
> > > On Wed, May 11, 2022 at 1:03 PM Thomas Huth <thuth@redhat.com> wrote:
> > >> On 11/05/2022 12.46, Philippe Mathieu-Daudé wrote:
> > >>>    On Wed, May 11, 2022 at 11:30 AM Daniel P. Berrangé
> > >>> <berrange@redhat.com> wrote:
> > >>>> On Tue, May 10, 2022 at 09:56:12PM +0200, Thomas Huth wrote:
> > >>>>> According to our "Supported build platforms" policy, we now do not support
> > >>>>> Ubuntu 18.04 anymore. Remove the related files and entries from our CI.
> > >>>>>
> > >>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> > >>>>> ---
> > >>>>>    Seems like nobody touched the 18.04-based tests/vm/ubuntu* files in a
> > >>>>>    very long time, so I assume these are not used anymore and can completely
> > >>>>>    be removed now.
> > >>>>
> > >>>> Or it could mean that they are working fine and so haven't needed
> > >>>> changes...
> > >>>
> > >>> Yes :)
> > >>
> > >> At least for me "make vm-build-ubuntu.aarch64" is only failing with ssh
> > >> timeouts (on my x86 laptop) ... is this really supposed to work with TCG, or
> > >> is this KVM (on arm hosts) only?
> > >
> > > Yes this timeout code is not working. I suppose it is tied to the TCG host perf.
> > > I suggested a pair of patches to increase it but back then Fam didn't accepted
> > > them because IIRC these VMs were used by patchew (previous to Gitlab).
> > > Today we have better framework for testing, so I wouldn't use this script on
> > > CI, but it is still valuable for manual testing.
> > >
> > > Robert's email doesn't work anymore. Since I don't have x86 workstation
> > > anymore, I'll probably use these tests/vm for testing. So let me add a
> > > "upgrade tests/vm/ubuntu to 22.04" to my TODO list. If I fail and nobody
> > > miss them, then I won't object to remove them.
> 
> So, 18.04 is the latest LTS release for 32-bit x86 (i386).
> 
> IIRC we used this 32-bit VM to reproduce bugs only triggered on 32-bit hosts
> (while it seems obvious, what is not obvious is that very few developers run
> on 32-bit hosts, so I'm not sure how long we are interested in avoiding bugs
> there). See i.e.:
> https://lore.kernel.org/qemu-devel/07a865e0-d535-9a19-cf29-f90984bcd510@amsat.org/

At some point we'll need to just admit 32-bit host is dead, and that
point is getting ever closer. For now though, if we need a VM for
32-bit testing, the easiest answer is probably to tweak the VM config to
be Debian based, as that's functionally closest to what Ubuntu provides
and so likely not too much work.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


