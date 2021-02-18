Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5465731EC0C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 17:12:16 +0100 (CET)
Received: from localhost ([::1]:34612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCluZ-0004QL-9s
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 11:12:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lClsf-0003sz-62
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 11:10:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lClsc-00079c-BQ
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 11:10:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613664612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n33/NSoHK6zp31Y7N5nc2PoW/HfyV3ag5Yesa8cptjY=;
 b=CLnTQcAReXsbqEQuG/m1rx9sahdxypqyevMCwIuQ+Mw4dI/Y+V8f+fb3STse2GlyPmMGTT
 broZn6vaa9xP630va3VkxvdXbmRYByDDII++oF3bh7qgFPWsK1vx/d8F56FxBVaBV/GVPl
 /dYI/HteDhHJua3B3MiUIj5QJDuhF5w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-HJnBDLRaPrKcyIw3-g592Q-1; Thu, 18 Feb 2021 11:10:10 -0500
X-MC-Unique: HJnBDLRaPrKcyIw3-g592Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AF011005501
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 16:10:09 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-86.ams2.redhat.com [10.36.113.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A49CC10023B4;
 Thu, 18 Feb 2021 16:10:08 +0000 (UTC)
Date: Thu, 18 Feb 2021 17:10:07 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 4/6] qapi: Apply aliases in qobject-input-visitor
Message-ID: <20210218161007.GA10998@merkur.fritz.box>
References: <20210211183118.422036-1-kwolf@redhat.com>
 <20210211183118.422036-5-kwolf@redhat.com>
 <871rder9py.fsf@dusky.pond.sub.org>
 <20210217175026.GC5662@merkur.fritz.box>
 <87o8ghebrb.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87o8ghebrb.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.02.2021 um 14:39 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > Am 17.02.2021 um 16:32 hat Markus Armbruster geschrieben:
> >> Kevin Wolf <kwolf@redhat.com> writes:
> >> 
> >> > When looking for an object in a struct in the external representation,
> >> > check not only the currently visited struct, but also whether an alias
> >> > in the current StackObject matches and try to fetch the value from the
> >> > alias then. Providing two values for the same object through different
> >> > aliases is an error.
> >> >
> >> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> >> 
> >> Looking just at qobject_input_try_get_object() for now.
> >
> > :-(
> >
> > This patch doesn't even feel that complicated to me.
> 
> I suspect it's just me having an unusually obtuse week.
> 
> The code is straightforward enough.  What I'm missing is a bit of "how
> does this accomplish the goal" and "why is this safe" here and there.
> 
> > Old: Get the value from the QDict of the current StackObject with the
> > given name.
> >
> > New: First do alias resolution (with find_object_member), which results
> > in a StackObject and a name, and that's the QDict and key where you get
> > the value from.
> 
> This part I understand.
> 
> We simultaneously walk the QAPI type and the input QObject, consuming
> input as we go.
> 
> Whenever the walk leaves a QAPI object type, we check the corresponding
> QObject has been consumed completely.
> 
> With aliases, we additionally look for input in a certain enclosing
> input object (i.e. up the recursion stack).  If found, consume.
> 
> > Minor complication: Aliases can refer to members of nested objects that
> > may not be provided in the input. But we want these to work.
> >
> > For example, my chardev series defines aliases to flatten
> > SocketAddressLegacy (old syntax, I haven't rebased it yet):
> >
> > { 'union': 'SocketAddressLegacy',
> >   'data': {
> >     'inet': 'InetSocketAddress',
> >     'unix': 'UnixSocketAddress',
> >     'vsock': 'VsockSocketAddress',
> >     'fd': 'String' },
> >   'aliases': [
> >     {'source': ['data']},
> >     {'alias': 'fd', 'source': ['data', 'str']}
> >   ]}
> >
> > Of course, the idea is that this input should work:
> >
> > { 'type': 'inet', 'hostname': 'localhost', 'port': '1234' }
> >
> > However, without implicit objects, parsing 'data' fails because it
> > expects an object, but none is given (we specified all of its members on
> > the top level through aliases). What we would have to give is:
> >
> > { 'type': 'inet', 'hostname': 'localhost', 'port': '1234', 'data': {} }
> >
> > And _that_ would work. Visiting 'data' succeeds because we now have the
> > object that the visitor expects, and when visiting its members, the
> > aliases fill in all of the mandatory values.
> >
> > So what this patch does is to implicitly assume the 'data': {} instead
> > of erroring out when we know that aliases exist that can still provide
> > values for the content of 'data'.
> 
> Aliases exist than can still provide, but will they?  What if input is
> 
>     {"type": "inet"}
> 
> ?
> 
> Your explanation makes me guess this is equivalent to
> 
>     {"type": "inet", "data": {}}
> 
> which fails the visit, because mandatory members of "data" are missing.
> Fine.

Okay, if you want the gory details, then the answer is yes for this
case, but it depends.

If we're aliasing a single member, then we can easily check whether the
alias is actually specified. If it's not in the input, no implicit
object.

But in our example, it is a wildcard alias and we don't know yet which
aliases it will use. This depends on what the visitor for the implicit
object will do (future tense).

> If we make the members optional, it succeeds: qobject_input_optional()
> checks both the regular and the aliased input, finds neither, and
> returns false.  Still fine.
> 
> What if "data" is optional, too?  Hmmm...

Yes, don't use optional objects in the middle of the path of a wildcard
alias unless there is no semantic difference between empty object and
absent object. This is documented in the code, but it might actually
still be missing from qapi-code-gen.txt.

> Example:
> 
>     { 'struct': 'Outer',
>       'data': { '*inner': 'Inner' },
> 
>     { 'struct': 'Inner',
>       'data': { '*true-name': 'str' } }
> 
> For input {}, we get an Outer object with
> 
>     .has_inner = false,
>     .inner = NULL
> 
> Now add
> 
>       'aliases': [ { 'name': 'alias-name',
>                      'source': [ 'inner', 'true-name' ] } ] }
> 
> What do we get now?  Is it
> 
>      .has_inner = true,
>      .inner = { .has_true_name = false,
>                 .true_name = NULL }
> 
> perhaps?

I think this is the result you would get if you had used a wildcard
alias. But since you used a single-member alias, we would see that
'alias-name' is not in the input and actually still return the original
result:

    .has_inner = false,
    .inner = NULL

Kevin


