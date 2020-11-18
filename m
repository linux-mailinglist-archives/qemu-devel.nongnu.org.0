Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6492B73AF
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 02:21:35 +0100 (CET)
Received: from localhost ([::1]:35580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfCA9-0005W1-S0
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 20:21:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kfC8A-0004yb-Dp
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 20:19:30 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:52210 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kfC87-0000vJ-Qo
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 20:19:29 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 6B08B412E3;
 Wed, 18 Nov 2020 01:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1605662359;
 x=1607476760; bh=uTq6Al873JaI39XpXgX1SJIvGvuXKnPYZDgdT7TRRXk=; b=
 NcWRRt+P8/iQdI7IXGGmsJ8e5mxkejG/0hwGM8IUwTTqhQcEUhbDnjcB3WEmxR5Y
 xL64XkFy4GVecFEXWgyVvv6QC/ni4O5W4jCIuLZ+zvJbOOLl7rd4a1s1c44jiR+k
 3FsHGhTGJIOx946Ab/C3U9oGq1kRFcIC2fXcnb244g0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id thpuU51gK4bc; Wed, 18 Nov 2020 04:19:19 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id C1C6B412E1;
 Wed, 18 Nov 2020 04:19:18 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 18
 Nov 2020 04:19:17 +0300
Date: Wed, 18 Nov 2020 04:19:17 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH for-6.0 1/6] qapi: Add query-accel command
Message-ID: <20201118011917.GB10041@SPB-NB-133.local>
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-2-r.bolshakov@yadro.com>
 <2d934855-ad11-9f61-28a1-7c0a35347a66@redhat.com>
 <20201116211352.GC1235237@habkost.net>
 <87mtzgbc29.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87mtzgbc29.fsf@dusky.pond.sub.org>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 20:19:21
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 17, 2020 at 09:51:58AM +0100, Markus Armbruster wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > On Mon, Nov 16, 2020 at 10:20:04AM -0600, Eric Blake wrote:
> >> On 11/16/20 7:10 AM, Roman Bolshakov wrote:
> >> > There's a problem for management applications to determine if certain
> >> > accelerators available. Generic QMP command should help with that.
> >> > 
> >> > Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> >> > ---
> >> >  monitor/qmp-cmds.c | 15 +++++++++++++++
> >> >  qapi/machine.json  | 19 +++++++++++++++++++
> >> >  2 files changed, 34 insertions(+)
> >> > 
> >> 
> >> > +++ b/qapi/machine.json
> >> > @@ -591,6 +591,25 @@
> >> >  ##
> >> >  { 'command': 'query-kvm', 'returns': 'KvmInfo' }
> >> >  
> >> > +##
> >> > +# @query-accel:
> >> > +#
> >> > +# Returns information about an accelerator
> >> > +#
> >> > +# Returns: @KvmInfo
> 
> Is reusing KvmInfo here is good idea?  Recall:
> 
>     ##
>     # @KvmInfo:
>     #
>     # Information about support for KVM acceleration
>     #
>     # @enabled: true if KVM acceleration is active
>     #
>     # @present: true if KVM acceleration is built into this executable
>     #
>     # Since: 0.14.0
>     ##
>     { 'struct': 'KvmInfo', 'data': {'enabled': 'bool', 'present': 'bool'} }
> 
> I figure @present will always be true with query-accel.  In other words,
> it's useless noise.
> 

Hi Markus,

Actually, no. Provided implementation returns present = true only if we
can find the accel in QOM, i.e. on macOS we get present = false for kvm.
And on Linux we get present = false for hvf, e.g.:

C: {"execute": "query-accel", "arguments": {"name": "hvf"}}
S: {"return": {"enabled": true, "present": true}}
C: {"execute": "query-accel", "arguments": {"name": "kvm"}}
S: {"return": {"enabled": false, "present": false}}
C: {"execute": "query-accel", "arguments": {"name": "tcg"}}
S: {"return": {"enabled": false, "present": true}}

> If we return information on all accelerators, KvmInfo won't do, because
> it lacks the accelerator name.
> 
> If we choose to reuse KvmInfo regardless, it needs to be renamed to
> something like AccelInfo, and the doc comment generalized beyond KVM.
> 

I have renamed it to AccelInfo in another patch in the series :)

> >> > +#
> >> > +# Since: 6.0.0
> >> 
> >> We're inconsistent on whether we have 'Since: x.y' or 'Since: x.y.z',
> >> although I prefer the shorter form.  Maybe Markus has an opnion on that.
> 
> Yes: use the shorter form, unless .z != .0.
> 
> The shorter form is much more common:
> 
>     $ sed -En 's/.*since:? *([0-9][0-9.]*).*/\1/pi' qapi/*json | sed 's/[^.]//g' | sort | uniq -c
>        1065 .
>         129 ..
> 
> .z != 0 should be rare: the stable branch is for bug fixes, and bug
> fixes rarely require schema changes.  It is: there is just one instance,
> from commit ab9ba614556 (v3.0.0) and 0779afdc897 (v2.12.1).
> 

Thanks, I'll use 6.0 then.

> >> > +#
> >> > +# Example:
> >> > +#
> >> > +# -> { "execute": "query-accel", "arguments": { "name": "kvm" } }
> >> > +# <- { "return": { "enabled": true, "present": true } }
> >> > +#
> >> > +##
> >> > +{ 'command': 'query-accel',
> >> > +  'data': { 'name': 'str' },
> >> > +  'returns': 'KvmInfo' }
> >> 
> >> '@name' is undocumented and an open-coded string.  Better would be
> >> requiring 'name' to be one of an enum type.  [...]
> >
> > This seem similar to CPU models, machine types, device types, and
> > backend object types: the set of valid values is derived from the
> > list of subtypes of a QOM type.  We don't duplicate lists of QOM
> > types in the QAPI schema, today.
> 
> Yes.
> 
> > Do we want to duplicate the list of accelerators in the QAPI
> > schema, or should we wait for a generic solution that works for
> > any QOM type?
> 
> There are only a few accelerators, so duplicating them wouldn't be too
> bad.  Still, we need a better reason than "because we can".
> 
> QAPI enum vs. 'str' doesn't affect the wire format: both use JSON
> string.
> 

'str' is quite flexible. If we remove an accel, provided QOM command
won't complain. It'll just reply that the accel is not present :)

> With a QAPI enum, the values available in this QEMU build are visible in
> query-qmp-schema.
> 
> Without a QAPI enum, we need a separate, ad hoc query.  For QOM types,
> we have qom-list-types.
> 
> If you're familiar with qom-list-types, you may want to skip to
> "Conclusion:" now.
> 
> Ad hoc queries can take additional arguments.  qom-list-types does:
> "implements" and "abstract" limit output.  Default is "all
> non-abstract".
> 
> This provides a way to find accelerators: use "implements": "accel" to
> return only concrete subtypes of "accel":
> 
>    ---> {"execute": "qom-list-types", "arguments": {"implements": "accel"}}
>    <--- {"return": [{"name": "qtest-accel", "parent": "accel"}, {"name": "tcg-accel", "parent": "accel"}, {"name": "xen-accel", "parent": "accel"}, {"name": "kvm-accel", "parent": "accel"}, {"name": "accel", "parent": "object"}]}
> 
> Aside: the reply includes "accel", because it's not abstract.  Bug?
> 
> Same for CPU models ("implements": "cpu"), machine types ("implements":
> "machine"), device types ("implements": "device").  Not for backend
> object types, because they don't have a common base type.  Certain kinds
> of backend object types do, e.g. character device backends are subtypes
> of "chardev".
> 
> Ad hoc queries can provide additional information.  qom-list-types does:
> the parent type.
> 
> This provides a second way to find subtypes, which might be more
> efficient when you need to know the subtypes of T for many T:
> 
>    Get *all* QOM types in one go:
> 
>    ---> {"execute": "qom-list-types", "arguments": {"abstract": false}}
>    <--- lots of output
> 
>    Use output member "parent" to construct the parent tree.  The
>    sub-tree rooted at QOM type "accel" has the subtypes of "accel".
> 
>    Awkward: since output lacks an "abstract" member, we have to
>    determine it indirectly, by getting just the concrete types:
> 
>    ---> {"execute": "qom-list-types", "arguments": {"abstract": true}}
>    <--- slightly less output
> 
>    We can add "abstract" to the output if we care.
> 
>    Unlike the first way, this one works *only* for "is subtype of",
>    *not* for "implements interface".
> 
>    We can add interface information to the output if we care.
> 
> Likewise, QOM properties are not in the QAPI schema, and we need ad hoc
> queries instead of query-qmp-schema: qom-list-properties, qom-list,
> device-list-properties.  Flaws include inadequate type information and
> difficulties around dynamic properties.
> 
> Conclusion: as is, QOM is designed to defeat our general QAPI/QMP
> introspection mechanism.  It provides its own instead.  Proper
> integration of QOM and QAPI/QMP would be great.  Integrating small parts
> in ways that do not get us closer to complete integration does not seem
> worthwhile.
> 
> For some QOM types, we have additional ad hoc queries that provide more
> information, e.g. query-machines, query-cpu-definitions, and now the
> proposed query-accel.
> 
> query-accel is *only* necessary if its additional information is.
> 

Thanks for the profound answer!

I'm not an expert of QOM/QAPI. Please correct me if my understanding is
wrong.

1. We can use QOM capabilities in QMP to get all accelerators:

C: {"execute": "qom-list-types", "arguments": {"implements": "accel"}}
S: {"return": [{"name": "qtest-accel", "parent": "accel"}, {"name": "tcg-accel", "parent": "accel"}, {"name": "hax-accel", "parent": "accel"}, {"name": "hvf-accel", "parent": "accel"}, {"name": "accel", "parent": "object"}]}

The response answers if an accelerator was compiled with current QEMU
binary. All accelerators outside of the list aren't present.

2. We can't figure out if an accel is actually enabled without relying
on ad-hoc query-accel because there are no means for that in QOM.
I might be wrong here but I couldn't find a way to list fields of an
accel class using qom-list and qom-get.

I have no particular preference of query-accel vs wiring current accel
to QOM to be able to find it unless the latter one takes x10 time to
implement and rework everything. But I need some understanding of what
would be preferred way for everyone :)

> I unde
> 
> >>                                       [...]  Even better would be
> >> returning an array of KvmInfo with information on all supported
> >> accelerators at once, rather than making the user call this command once
> >> per name.
> >
> > Maybe.  It would save us the work of answering the question
> > above, but is this (querying information for all accelerators at
> > once) going to be a common use case?
> 
> I recommend to scratch the query-accel parameter, and return information
> on all accelerators in this build of QEMU.  Simple, and consistent with
> similar ad hoc queries.  If a client is interested in just one, fishing
> it out of the list is easy enough.
> 

Works for me. I'll then leave KvmInfo as is and will introduce AccelInfo
with two fields: name and enabled. enabled will be true only for
currently active accelerator.

Thanks,
Roman

