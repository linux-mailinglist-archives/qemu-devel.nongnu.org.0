Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0310856179A
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 12:22:37 +0200 (CEST)
Received: from localhost ([::1]:39512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6rJk-0005eC-44
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 06:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6rHb-0004Tl-Kb
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 06:20:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6rHU-0006xM-JY
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 06:20:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656584415;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6wJfmLMLtJ7djtLfThiqAOv+Izik+FZF65izABoq9vE=;
 b=CqiyTf6gBV2kLCc1c7RnmLxhA4s5aZ+1xamNJ0oClM6GHns7bQfFP6VkrjpuC9tH7k705Y
 qIi0UTdLBr21ksU/jDk8wvpw3Y/2mi8daEAGxDiaIjAHlm6nn5m0ghEvNQ5Kh4PLi1So1y
 rvxeobCocKSTw+xWydjENQeivbK/H1E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378--C7wY6fnOG-jLfIwSOiVWw-1; Thu, 30 Jun 2022 06:20:12 -0400
X-MC-Unique: -C7wY6fnOG-jLfIwSOiVWw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48EEB101A586;
 Thu, 30 Jun 2022 10:20:12 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5F18C08F0D;
 Thu, 30 Jun 2022 10:20:09 +0000 (UTC)
Date: Thu, 30 Jun 2022 11:20:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 David Hildenbrand <david@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PULL 15/18] qapi: introduce x-query-ramblock QMP command
Message-ID: <Yr1415pu4s9moMoB@redhat.com>
References: <20211102175700.1175996-1-berrange@redhat.com>
 <20211102175700.1175996-16-berrange@redhat.com>
 <073c1687-d30f-8f41-b87e-83372137708a@suse.de>
 <YqHJKgA5OG80dljx@redhat.com> <YqHtDN/+DNUpB/ve@work-vm>
 <2341fe7b-9831-24eb-c78c-39497901eea9@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2341fe7b-9831-24eb-c78c-39497901eea9@suse.de>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Jun 30, 2022 at 12:14:36PM +0200, Claudio Fontana wrote:
> On 6/9/22 14:52, Dr. David Alan Gilbert wrote:
> > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> >> On Thu, Jun 09, 2022 at 12:07:31PM +0200, Claudio Fontana wrote:
> >>> Hello all,
> >>>
> >>> it would be really good to be able to rely on this command or something similar,
> >>> to be able to know the approximate size of a migration before starting it.
> >>>
> >>> in QEMU ram_bytes_total() returns what I would like to have,
> >>> but there is currently no QMP way to get it without starting a migration,
> >>> which when trying to optimize it/size it is just about too late.
> >>
> >> Aside from the main VM RAM, what other RAM blocks are likely to have
> >> a size large enough to be of consequence to the live migration
> >> data copy, and whose size is not already known to the mgmt app from
> >> the guest config choices it made ? VGA RAM could be a few 100MB I
> >> guess, but the mgmt app knows about that. I've always assumed everything
> >> else is just noise in comparison to the main RAM region.
> >>
> >> Still I wonder how useful this is as its just a static figure, and the
> >> problems with migration transfer are the bulking up of data when the
> >> VM is repeatedly dirtying stuff at a high rate.
> >>
> >>> Do you think x-query-ramblock could be promoted to non-experimental?
> >>
> >> It would have to be re-written, as this current impl is just emitting
> >> a huge printf formatted string. To be considered supportable, the data
> >> would have to be formally modelled in QAPI instead.
> >>
> >> IOW, it would be a case of introducing a new command that emits formal
> >> data, convertintg 'info ramblock' to use that, and then deprecating this 
> >> x-query-ramblock.
> >>
> >>> Should another one be made available instead, like :
> >>> query-ram-bytes-total ?
> >>
> >> That would be simpler if you're just wanting it to give a single
> >> figure.
> > 
> > Is this what qmp_query_memory_size_summary does?
> 
> No, I am not looking at something returning the machine->ram_size,
> but rather how many bytes are actually used in each RAMBlock, in order to estimate the transfer size of a guest to disk.
> 
> This would be the return value of something like migration/ram.c::ram_bytes_total().
> 
> The main guest RAM total size is in most cases an overestimation of the actual bytes required to be transferred.
> 
> If there was such a feature that just returns ram_bytes_total via QMP,
> by knowing the size in bytes before the transfer, we can prealloc the space on disk, which would improve the performance of this series:
> 
> https://patchew.org/Libvirt/20220607091936.7948-1-cfontana@suse.de/
> 
> The interleaved format I posted there works just fine to migrate a suspended VM to disk (virsh save) from multifd channels to a single file,
> but still incurs in a 4-5% performance penalty compared with the multiple files approach,
> that is apparently due to multiple threads competing on acquiring locks to adjust the file size (on XFS).
> 
> Doing a fallocate() would likely remove this performance decrease compared with multifd to multiple files,
> but requires knowing beforehand the approximate size of the transfer, and as mentioned mnachine->ram_size is just overkill in practice and risks erroring out if not enough space is available.
> 
> Feedback on the interleaved format I posted there is welcome as well,

I still believe that libvirt is the wrong place to be implementing any
of this logic. It all belongs in QEMU, because QEMU is the place which
holds all the information needed to do an optimal job, and libvirt does
not, as this request for extra QMP features shows.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


