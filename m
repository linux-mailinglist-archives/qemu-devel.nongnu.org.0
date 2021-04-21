Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFDC367415
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 22:19:46 +0200 (CEST)
Received: from localhost ([::1]:57016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZJK5-0000aP-2T
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 16:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lZJIW-0008MA-Ob
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 16:18:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lZJIT-0003sR-TB
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 16:18:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619036284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8TVM8kbG7gxmYStd9OAFRHNZtIBFa2yqBhS/x5MZ3wk=;
 b=hI9r+dYacZGWQST8ePA8p89b+oAJtxsQqyMn85gRfWoBWmZCD0AQzSmP8ub9sh6wU9t5tL
 Ox6Z352/TD5+oDpDu4HOvpGeks728OcIx4Ns4ZzOlPM8DU6rm/yxGD8GSCXj6sJXAy0oG2
 BDKO0GKBugEnfzv7wlny0I2eduv7Nf0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-JzHi4qjTMuepT4nyiTZE_w-1; Wed, 21 Apr 2021 16:18:02 -0400
X-MC-Unique: JzHi4qjTMuepT4nyiTZE_w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6573108BD08;
 Wed, 21 Apr 2021 20:18:00 +0000 (UTC)
Received: from localhost (ovpn-117-199.rdu2.redhat.com [10.10.117.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FFF96064B;
 Wed, 21 Apr 2021 20:17:59 +0000 (UTC)
Date: Wed, 21 Apr 2021 16:17:59 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>
Subject: Re: [PATCH v6] qapi: introduce 'query-cpu-model-cpuid' action
Message-ID: <20210421201759.utsmhuopdmlhghbx@habkost.net>
References: <20210420161940.24306-1-valeriy.vdovin@virtuozzo.com>
 <20210420170900.utg4qzqkefdc642c@habkost.net>
 <20210421173941.GA927665@dhcp-172-16-24-191.sw.ru>
MIME-Version: 1.0
In-Reply-To: <20210421173941.GA927665@dhcp-172-16-24-191.sw.ru>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Denis Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 21, 2021 at 08:39:42PM +0300, Valeriy Vdovin wrote:
> On Tue, Apr 20, 2021 at 01:09:00PM -0400, Eduardo Habkost wrote:
> > On Tue, Apr 20, 2021 at 07:19:40PM +0300, Valeriy Vdovin wrote:
> > [...]
> > > +##
> > > +# @query-cpu-model-cpuid:
> > > +#
> > > +# Returns description of a virtual CPU model, created by QEMU after cpu
> > > +# initialization routines. The resulting information is a reflection of a parsed
> > > +# '-cpu' command line option, filtered by available host cpu features.
> > > +#
> > > +# Returns:  @CpuModelCpuidDescription
> > > +#
> > > +# Example:
> > > +#
> > > +# -> { "execute": "query-cpu-model-cpuid" }
> > > +# <- { "return": 'CpuModelCpuidDescription' }
> > > +#
> > > +# Since: 6.1
> > > +##
> > > +{ 'command': 'query-cpu-model-cpuid',
> > > +  'returns': 'CpuModelCpuidDescription',
> > > +  'if': 'defined(TARGET_I386)' }
> > 
> > I was assuming the command was going to get a CPU model name as
> > argument.
> > 
> > If you are only going to return info on the current CPUs, the
> > interface could be simplified a lot.
> > 
> > What about a simple `query-cpuid` command that only takes:
> > 
> >  { 'qom-path': 'str', # qom-path is returned by query-cpus-fast
> >    'eax': 'uint32',
> >    '*ecx': 'uint32' }
> > 
> > as argument, and returns
> > 
> >  { 'present': 'bool',
> >    'max_eax': 'uint32',    # max value of EAX for this range
> >    '*max_ecx': 'uint32',   # max value of ECX if there are subleaves
> >    'eax': 'uint32',
> >    'ebx': 'uint32',
> >    'ecx': 'uint32',
> >    'edx': 'uint32' }
> > 
> > ?
> Hi. The interface that you suggest looks good. But it has one critical
> point that deems it unusable for our initial needs. The point of this
> whole new API is to take away the strain of knowing about leaf ranges
> from the caller of this API. In my current patch this goal works. So
> the caller does not need to know in advance what ranges there are in
> original CPUID as well as in it's tweaked QEMU's version.
>

Raw CPUID data is a pretty low level interface, already.  Is it
really too much of a burden for callers to know that CPUID ranges
start at 0, 0x40000000, 0x80000000, and 0xC0000000?

(Especially considering that it would save us ~100 extra lines of
C code and maybe 50-100 extra lines of QAPI schema code.)


> But you suggested API is not so kind to the caller, so he would need
> to add some logic around the call that knows about exact leaf ranges.
> If you have a solution to that also, I'll be happy to discuss it.

Would be following (Python-like pseudocode) be too much of a
burden for consumers of the command?

    for start in (0, 0x40000000, 0x80000000, 0xC0000000):
        leaf = query_cpuid(qom_path, start)
        for eax in range(start, leaf.max_eax + 1):
            for ecx in range(0, leaf.get('max_ecx', 0) + 1):
                all_leaves.append(query_cpuid(qom_path, eax, ecx))

> 
> The obvious thing that comes to mind is changing the exists/max_ecx pair
> to something like next_eax, next_ecx. But this idea will probably require
> the same amount of complexity that I currently have in this patch.

I agree.  I'm trying to reduce the complexity of the interface
and of the command implementation.

-- 
Eduardo


