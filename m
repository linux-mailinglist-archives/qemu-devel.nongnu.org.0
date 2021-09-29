Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB71D41C192
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:24:36 +0200 (CEST)
Received: from localhost ([::1]:35096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVVpL-0008ME-PS
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVVnn-0007Y8-0k
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:22:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVVnk-0000Xn-KP
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:22:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632907375;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x8HXvCzyGDt5RFTwuliH98qOtloqn+bZenOB3Nqtpg0=;
 b=Mw1B8nXjf8022p5CVx7XmAOQ3MZa4p2W2qpgP7GktXVJvd/0TXyJtFCWl2KDVr3mj5vQSI
 Oufcj7xgToWNj6QD6SuLtRCOsSYp5D3NW/SdEBBy2KMENCscmmzwHzrnQbnVVfkHqCbs4C
 +HCs+bD/UvtAVplKf7KtSPbGAQUaMlk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-A0jhu_zGPBqG5kq2KuESMA-1; Wed, 29 Sep 2021 05:22:52 -0400
X-MC-Unique: A0jhu_zGPBqG5kq2KuESMA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93E4D1084692;
 Wed, 29 Sep 2021 09:22:51 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 002C960C82;
 Wed, 29 Sep 2021 09:22:41 +0000 (UTC)
Date: Wed, 29 Sep 2021 10:22:39 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [External] Re: [PATCH] hostmem: change default prealloc threads
 number
Message-ID: <YVQwX3RHcafMwMgy@redhat.com>
References: <20210927131951.1810823-1-user@n248-145-203>
 <b14aebb1-489b-b15b-f9eb-047073920175@redhat.com>
 <e1a98460-ad0a-9b9c-5958-bb39635886ec@bytedance.com>
 <20210929110531.0724f911@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210929110531.0724f911@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: mikughoull@gmail.com, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, ehabkost@redhat.com,
 Nan Wang <wangnan.light@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 29, 2021 at 11:05:31AM +0200, Igor Mammedov wrote:
> On Tue, 28 Sep 2021 00:47:01 +0800
> Nan Wang <wangnan.light@bytedance.com> wrote:
> 
> > On 2021/9/27 11:16, David Hildenbrand wrote:
> > > On 27.09.21 15:19, Nan Wang wrote:  
> > >> From: "wangnan.light" <wangnan.light@bytedance.com>
> > >>
> > >> the default number of prealloc threads is 1, for huge memory backend
> > >> file, single thread touch page is really slow.
> > >> We can adjust thread number by prealloc-threads property, but if the
> > >> default value updated to MachineState::smp::cpus may be better.
> > >> For example, old version of qemu(prealloc-threads have not been
> > >> introduced yet), the value of threads num is MachineState::smp::cpus,
> > >> so if someone use the same commandline to start current verion of qemu
> > >> and old version of qemu which will lead to different behaviors.  
> > > 
> > > The introducing patch mentions:
> > > 
> > > commit ffac16fab33bb42f17e47624985220c1fd864e9d
> > > Author: Igor Mammedov <imammedo@redhat.com>
> > > Date:   Wed Feb 19 11:09:50 2020 -0500
> > > 
> > >      hostmem: introduce "prealloc-threads" property
> > > 
> > >      the property will allow user to specify number of threads to use
> > >      in pre-allocation stage. It also will allow to reduce implicit
> > >      hostmem dependency on current_machine.
> > >      On object creation it will default to 1, but via machine
> > >      compat property it will be updated to MachineState::smp::cpus
> > >      to keep current behavior for hostmem and main RAM (which is
> > >      now also hostmem based).
> > > 
> > > So it looks like we want to do the latter via compat properties eventually.
> > > 
> > > However, I'd like to note that more prealloc threads might be good for 
> > > large backends, and might be bad for small backends. To me, it feels 
> > > like a workload that relies on this should really do this manually. So I 
> > > am still not sure if this is the right thing to do.  
> > Yes, I agree with you "more prealloc threas are good for large backends, 
> > and bad for small backends". But I think most situation large backends 
> > always with large vcpu numbers and small backens always with small vcpu 
> > numbers, because most users will not create a vm with large vcpu numbers 
> > with small memory.
> > 
> > 
> > > 
> > > Note that qapi/qom.json:
> > > 
> > > "@prealloc-threads: number of CPU threads to use for prealloc (default: 
> > > 1", so that doc would be wrong now.
> > > 
> > > Why exactly can't workload that cares not simply set this manually? 
> > > Performance tuning smells like something to be done manually for a 
> > > specific workload.
> > >  
> > It is a simply way that let workload set the prealloc threads manually. 
> > For example, for large backends it set many prealloc threads, and set 1 
> > prealloc threads manually for small backends. Yes, workload can 
> > `maunally` set prealloc thread to 1, rather than use `default` value 1.
> > So when workload want to(or maybe just forget specify the 
> > prealloc-threads property) use the default value, I think the 
> > MachineState::smp::cpus maybe better than 1.
> 
> as commit mentioned by David states, it creates implicit dependency
> on Machine and we were working getting rid of such dependencies
> where it's possible.
> 
> So if you have to change prealloc-threads to a larger number,
> you can try to use specific machine compat properties to do it,
> instead of pushing machine to generic backend code. But 'good'
> default for your workload doesn't guaranties it's a good one
> another.
> 
> My preference is that user (mgmt layer) should set property
> explicitly if it cares. It's leads to more stable VM config,
> as opposed to using defaults which could change over time and
> unexpectedly 'regress' such VMs, and can factor in host/workload
> specific nuances without need to change QEMU.

Setting prealloc_threads to match vCPUs count feels like it is making
an assumption that if we've allowed 4 vCPUs, it is OK for the prealloc
to consume 4 host CPUs. This assumption could be tricky when QEMU is
strictly pinned to host CPUs, as vCPU threads are pinned to some pCPUs
but emulator threads might be pinned differently.

Would there still be a performance advantage to prealloc_threads > 1,
if all non-vCPU threads are pinned to the same single host CPU ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


