Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8092C3AB9F9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 18:52:29 +0200 (CEST)
Received: from localhost ([::1]:41098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltvFk-0006Wd-J5
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 12:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ltvEf-0005m3-1O
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 12:51:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ltvEa-0001sn-Oh
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 12:51:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623948675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1vvX86S3j3zAQfNkZGYm1clMo3KBpNRUn/OAQTL0xeo=;
 b=f9CNqfowxS1pn1vKAkXvbwqj5roCbqQedScFMuffS3nwJdSPS8b8XpwXXhfYXx5CDTL37a
 Qsy8zFZ7JYO9g4jQ080qEKmgxOxGkeH1XruWmuq6k11ByirsxwLFgYIv3WKDnVa+Ae5Y1P
 nYfcirqEf/Xv1+nxqxqDfgjKUn/OXw4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-s8peKZMRP6aYCu5WyfhHTA-1; Thu, 17 Jun 2021 12:51:14 -0400
X-MC-Unique: s8peKZMRP6aYCu5WyfhHTA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C57E7101F7A1;
 Thu, 17 Jun 2021 16:51:12 +0000 (UTC)
Received: from localhost (unknown [10.22.9.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63B7160875;
 Thu, 17 Jun 2021 16:51:12 +0000 (UTC)
Date: Thu, 17 Jun 2021 12:51:11 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v9] qapi: introduce 'query-kvm-cpuid' action
Message-ID: <20210617165111.eu3x2pvinpoedsqj@habkost.net>
References: <20210603090753.11688-1-valeriy.vdovin@virtuozzo.com>
 <87im2d6p5v.fsf@dusky.pond.sub.org>
 <20210617074919.GA998232@dhcp-172-16-24-191.sw.ru>
 <87a6no3fzf.fsf@dusky.pond.sub.org>
 <790d22e1-5de9-ba20-6c03-415b62223d7d@suse.de>
 <877dis1sue.fsf@dusky.pond.sub.org>
 <20210617153949.GA357@dhcp-172-16-24-191.sw.ru>
 <e69ea2b4-21cc-8203-ad2d-10a0f4ffe34a@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e69ea2b4-21cc-8203-ad2d-10a0f4ffe34a@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>, Denis Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 17, 2021 at 05:53:11PM +0200, Claudio Fontana wrote:
> On 6/17/21 5:39 PM, Valeriy Vdovin wrote:
> > On Thu, Jun 17, 2021 at 04:14:17PM +0200, Markus Armbruster wrote:
> >> Claudio Fontana <cfontana@suse.de> writes:
> >>
> >>> On 6/17/21 1:09 PM, Markus Armbruster wrote:
> >>>> Valeriy Vdovin <valeriy.vdovin@virtuozzo.com> writes:
> >>>>
> >>>>> On Thu, Jun 17, 2021 at 07:22:36AM +0200, Markus Armbruster wrote:
> >>>>>> Valeriy Vdovin <valeriy.vdovin@virtuozzo.com> writes:
> >>>>>>
> >>>>>>> Introducing new qapi method 'query-kvm-cpuid'. This method can be used to
> >>>>>>
> >>>>>> It's actually a QMP command.  There are no "qapi methods".
> >>>>>>
> >>>>>>> get virtualized cpu model info generated by QEMU during VM initialization in
> >>>>>>> the form of cpuid representation.
> >>>>>>>
> >>>>>>> Diving into more details about virtual cpu generation: QEMU first parses '-cpu'
> >>>>>>
> >>>>>> virtual CPU
> >>>>>>
> >>>>>>> command line option. From there it takes the name of the model as the basis for
> >>>>>>> feature set of the new virtual cpu. After that it uses trailing '-cpu' options,
> >>>>>>> that state if additional cpu features should be present on the virtual cpu or
> >>>>>>> excluded from it (tokens '+'/'-' or '=on'/'=off').
> >>>>>>> After that QEMU checks if the host's cpu can actually support the derived
> >>>>>>> feature set and applies host limitations to it.
> >>>>>>> After this initialization procedure, virtual cpu has it's model and
> >>>>>>> vendor names, and a working feature set and is ready for identification
> >>>>>>> instructions such as CPUID.
> >>>>>>>
> >>>>>>> Currently full output for this method is only supported for x86 cpus.
> >>>>>>
> >>>>>> Not sure about "currently": the interface looks quite x86-specific to me.
> >>>>>>
> >>>>> Yes, at some point I was thinking this interface could become generic,
> >>>>> but does not seem possible, so I'll remove this note.
> >>>>>
> >>>>>> The commit message doesn't mention KVM except in the command name.  The
> >>>>>> schema provides the command only if defined(CONFIG_KVM).
> >>>>>>
> >>>>>> Can you explain why you need the restriction to CONFIG_KVM?
> >>>>>>
> >>>>> This CONFIG_KVM is used as a solution to a broken build if --disable-kvm
> >>>>> flag is set. I was choosing between this and writing empty implementation into
> >>>>> kvm-stub.c
> >>>>
> >>>> If the command only makes sense for KVM, then it's named correctly, but
> >>>> the commit message lacks a (brief!) explanation why it only makes for
> >>>> KVM.
> >>>
> >>>
> >>> Is it meaningful for HVF?
> >>
> >> I can't see why it couldn't be.
> > Should I also make some note about that in the commit message?
> >>
> >> Different tack: if KVM is compiled out entirely, the command isn't
> >> there, and trying to use it fails like
> >>
> >>     {"error": {"class": "CommandNotFound", "desc": "The command query-kvm-cpuid has not been found"}}
> >>
> >> If KVM is compiled in, but disabled, e.g. with -machine accel=tcg, then
> >> the command fails like
> >>
> >>     {"error": {"class": "GenericError", "desc": "VCPU was not initialized yet"}}
> >>
> >> This is misleading.  The VCPU is actually running, it's just the wrong
> >> kind of VCPU.
> >>
> >>>> If it just isn't implemented for anything but KVM, then putting "kvm"
> >>>> into the command name is a bad idea.  Also, the commit message should
> >>>> briefly note the restriction to KVM.
> >>
> >> Perhaps this one is closer to reality.
> >>
> > I agree.
> > What command name do you suggest?
> 
> query-exposed-cpuid?

Pasting the reply I sent at [1]:

  I don't really mind how the command is called, but I would prefer
  to add a more complex abstraction only if maintainers of other
  accelerators are interested and volunteer to provide similar
  functionality.  I don't want to introduce complexity for use
  cases that may not even exist.

I'm expecting this to be just a debugging mechanism, not a stable
API to be maintained and supported for decades.  (Maybe a "x-"
prefix should be added to indicate that?)

[1] https://lore.kernel.org/qemu-devel/20210602204604.crsxvqixkkll4ef4@habkost.net

-- 
Eduardo


