Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA555FAF57
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 11:29:11 +0200 (CEST)
Received: from localhost ([::1]:55758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiBZV-0000bH-Qm
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 05:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oiBA9-00070y-E4
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 05:02:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oiBA5-0003gR-BA
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 05:02:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665478972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AW+r9aBGVRSWlo80xywtS0hD5L2nSq2SzppzhbWobjk=;
 b=Js70WahNb7TTM18RU9popk3R70VYRgq4goSkj8YDODyHJqoMWpFi5K3v5hdf0f/hafayvy
 hzwVmjF9thHDCsWHsPwJ2w+4Yf/rU4Ws+yY2k6Tus9uPLxe1q/m9IAva+FEhSZG9sE1bNK
 r/gzZjljhCg2cq1bLr8jWC8aOJsXufA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-168-h62qxQbUNyKWFvjb6uFsiQ-1; Tue, 11 Oct 2022 05:02:51 -0400
X-MC-Unique: h62qxQbUNyKWFvjb6uFsiQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 dm10-20020a170907948a00b00781fa5e140fso5653585ejc.21
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 02:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AW+r9aBGVRSWlo80xywtS0hD5L2nSq2SzppzhbWobjk=;
 b=iQ3RqqA/00wumM/j8Gczn20/y4Ezd09ZmB4yA9wkmkV6wg5yIZdiKqkRk7hGnuvxYo
 XAhlgNpbIdg4ex+RSDNfYCSnEgwiVWsLz13qMqh/exJ0FbiYrUybUaBhl9CJaugc/dF9
 ui2RnEIdfgr52Km7lLlcuU927SPkWRIXRTj+CyLuny4w48AQctkzMAOZTqw9XTmA0WEB
 s2QsS0Cw2ygsUs86BTZkKCz8KUO3ydXnfpK+Xyd0FGR0+QHseix2A/9kFoK1RFbSs5UO
 EkWhUfaNC+DiqxmNdV4nBqBaqWHXhnVfWSLkjgEnT/dvsOYGAVdQJhylEYKGdsGGrb6s
 fFpQ==
X-Gm-Message-State: ACrzQf2rfXJsNetC2/qTcB2gQmfeUnDxVanUPSNEJg9rZVLNk1nux7jt
 eM+H2qsN9UX1Y9XQgKwb5OtMsVgF8/qS530nh5XJX16nLLDGr8lFH7UxlYPmV+7PN8nicq3h/z5
 3ZcAL2/MMxw/mnBI=
X-Received: by 2002:a17:907:2672:b0:734:a952:439a with SMTP id
 ci18-20020a170907267200b00734a952439amr16966562ejc.539.1665478969727; 
 Tue, 11 Oct 2022 02:02:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4QgxwouE+rfYYBKKMC/QnWwh+/oousluo8fFKqNQcmbWxJoYZ0wvFL0DvMOb4LdT7sqpW3VQ==
X-Received: by 2002:a17:907:2672:b0:734:a952:439a with SMTP id
 ci18-20020a170907267200b00734a952439amr16966536ejc.539.1665478969451; 
 Tue, 11 Oct 2022 02:02:49 -0700 (PDT)
Received: from work-vm (82-132-238-187.dab.02.net. [82.132.238.187])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a1709063ca100b007305d408b3dsm6565625ejh.78.2022.10.11.02.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 02:02:48 -0700 (PDT)
Date: Tue, 11 Oct 2022 10:02:45 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Michal Privoznik <mprivozn@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH v2 0/7] hostmem: NUMA-aware memory preallocation using
 ThreadContext
Message-ID: <Y0UxNX5Y2dgZsUyN@work-vm>
References: <23dd0ce0-5393-3aa0-affe-11277c6a123b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23dd0ce0-5393-3aa0-affe-11277c6a123b@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

* David Hildenbrand (david@redhat.com) wrote:
> On 10.10.22 12:40, Dr. David Alan Gilbert wrote:
> > * David Hildenbrand (david@redhat.com) wrote:
> > > This is a follow-up on "util: NUMA aware memory preallocation" [1] by
> > > Michal.
> > > 
> > > Setting the CPU affinity of threads from inside QEMU usually isn't
> > > easily possible, because we don't want QEMU -- once started and running
> > > guest code -- to be able to mess up the system. QEMU disallows relevant
> > > syscalls using seccomp, such that any such invocation will fail.
> > > 
> > > Especially for memory preallocation in memory backends, the CPU affinity
> > > can significantly increase guest startup time, for example, when running
> > > large VMs backed by huge/gigantic pages, because of NUMA effects. For
> > > NUMA-aware preallocation, we have to set the CPU affinity, however:
> > > 
> > > (1) Once preallocation threads are created during preallocation, management
> > >      tools cannot intercept anymore to change the affinity. These threads
> > >      are created automatically on demand.
> > > (2) QEMU cannot easily set the CPU affinity itself.
> > > (3) The CPU affinity derived from the NUMA bindings of the memory backend
> > >      might not necessarily be exactly the CPUs we actually want to use
> > >      (e.g., CPU-less NUMA nodes, CPUs that are pinned/used for other VMs).
> > > 
> > > There is an easy "workaround". If we have a thread with the right CPU
> > > affinity, we can simply create new threads on demand via that prepared
> > > context. So, all we have to do is setup and create such a context ahead
> > > of time, to then configure preallocation to create new threads via that
> > > environment.
> > > 
> > > So, let's introduce a user-creatable "thread-context" object that
> > > essentially consists of a context thread used to create new threads.
> > > QEMU can either try setting the CPU affinity itself ("cpu-affinity",
> > > "node-affinity" property), or upper layers can extract the thread id
> > > ("thread-id" property) to configure it externally.
> > > 
> > > Make memory-backends consume a thread-context object
> > > (via the "prealloc-context" property) and use it when preallocating to
> > > create new threads with the desired CPU affinity. Further, to make it
> > > easier to use, allow creation of "thread-context" objects, including
> > > setting the CPU affinity directly from QEMU, before enabling the
> > > sandbox option.
> > > 
> > > 
> > > Quick test on a system with 2 NUMA nodes:
> > > 
> > > Without CPU affinity:
> > >      time qemu-system-x86_64 \
> > >          -object memory-backend-memfd,id=md1,hugetlb=on,hugetlbsize=2M,size=64G,prealloc-threads=12,prealloc=on,host-nodes=0,policy=bind \
> > >          -nographic -monitor stdio
> > > 
> > >      real    0m5.383s
> > >      real    0m3.499s
> > >      real    0m5.129s
> > >      real    0m4.232s
> > >      real    0m5.220s
> > >      real    0m4.288s
> > >      real    0m3.582s
> > >      real    0m4.305s
> > >      real    0m5.421s
> > >      real    0m4.502s
> > > 
> > >      -> It heavily depends on the scheduler CPU selection
> > > 
> > > With CPU affinity:
> > >      time qemu-system-x86_64 \
> > >          -object thread-context,id=tc1,node-affinity=0 \
> > >          -object memory-backend-memfd,id=md1,hugetlb=on,hugetlbsize=2M,size=64G,prealloc-threads=12,prealloc=on,host-nodes=0,policy=bind,prealloc-context=tc1 \
> > >          -sandbox enable=on,resourcecontrol=deny \
> > >          -nographic -monitor stdio
> > > 
> > >      real    0m1.959s
> > >      real    0m1.942s
> > >      real    0m1.943s
> > >      real    0m1.941s
> > >      real    0m1.948s
> > >      real    0m1.964s
> > >      real    0m1.949s
> > >      real    0m1.948s
> > >      real    0m1.941s
> > >      real    0m1.937s
> > > 
> > > On reasonably large VMs, the speedup can be quite significant.
> > > 
> > > While this concept is currently only used for short-lived preallocation
> > > threads, nothing major speaks against reusing the concept for other
> > > threads that are harder to identify/configure -- except that
> > > we need additional (idle) context threads that are otherwise left unused.
> > > 
> > > This series does not yet tackle concurrent preallocation of memory
> > > backends. Memory backend objects are created and memory is preallocated one
> > > memory backend at a time -- and there is currently no way to do
> > > preallocation asynchronously.
> 
> Hi Dave,
> 
> > 
> > Since you seem to have a full set of r-b's - do you intend to merge this
> > as-is or do the cuncurrenct preallocation first?
> 
> I intent to merge this as is, as it provides a benefit as it stands and
> concurrent preallcoation might not require user interface changes.

Yep, that's fair enough.

> I do have some ideas on how to implement concurrent preallocation, but it
> needs more thought (and more importantly, time).

Yep, it would be nice for the really huge VMs.

Dave


> -- 
> Thanks,
> 
> David / dhildenb
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


