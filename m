Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E176242A76A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 16:38:46 +0200 (CEST)
Received: from localhost ([::1]:41762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maIvV-0005nI-TN
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 10:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1maItw-00046c-B0
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 10:37:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1maItu-0006T1-92
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 10:37:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634049424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tNDITPY34r2tsPnTvijcAg7YfyxwTfwr8AEJ0MWPcBc=;
 b=bUBR2haNdNMaDG+lq7rE3XvDizvKyAdCXFSrKEHs4n06lFKxld1V/DXFAwrGn5bwteBkS8
 QIsd3vTm1lAqYqyEHgv4MQuOfjsGLekPqJag/1mfFeEbkpjy1Crt3mxRPKSS7bddQOIrp4
 sw8jYPD5EVczWHFtDBGhOBGBoTqMOVI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-okq5pGn1NbSd7WlTGfEhMQ-1; Tue, 12 Oct 2021 10:37:01 -0400
X-MC-Unique: okq5pGn1NbSd7WlTGfEhMQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3109F11B4C13
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 14:36:31 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.219])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 212545D9C6;
 Tue, 12 Oct 2021 14:36:29 +0000 (UTC)
Date: Tue, 12 Oct 2021 16:36:27 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 6/6] tests/qapi-schema: Test cases for aliases
Message-ID: <YWWda+hjUlDkT1tb@redhat.com>
References: <YTt0G1cs+BweXOMD@redhat.com> <87bl4vedma.fsf@dusky.pond.sub.org>
 <YUB0BcZUwwwecrFl@redhat.com> <87k0jj8evk.fsf@dusky.pond.sub.org>
 <YUG71uATYCwpRyQH@redhat.com> <8735q3y5db.fsf@dusky.pond.sub.org>
 <YUSuThJtW9ar2wCY@redhat.com> <87a6jrimaf.fsf@dusky.pond.sub.org>
 <YVsKpClmGgq5ki7r@redhat.com> <87y270uhsl.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87y270uhsl.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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

Am 11.10.2021 um 09:44 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> [...]
> 
> > What I had in mind was using the schema to generate the necessary code,
> > using the generic keyval parser everywhere, and just providing a hook
> > where the QDict could be modified after the keyval parser and before the
> > visitor. Most command line options would not have any explicit code for
> > parsing input, only the declarative schema and the final option handler
> > getting a QAPI type (which could actually be the corresponding QMP
> > command handler in the common case).
> 
> A walk to the bakery made me see a problem with transforming the qdict
> between keyval parsing and the visitor: error reporting.  On closer
> investigation, the problem exists even with just aliases.

I already commented on part of this on IRC, but let me reply here as
well.

On general remark is that I would make the same distinction between
aliases for compatibility and usability that I mentioned elsewhere in
this thread.

In the case of compatibility, it's already a concession that we still
accept the option - suboptimal error messages for incorrect command
lines aren't a major concern for me there. Users are supposed to move to
the new syntax anyway.

On the other hand, aliases we employ for usability are cases where we
don't expect humans to move to something else. I think this is mostly
for flattening structures. Here error messages should be good.

> All experiments performed with your complete QAPIfication at
> https://repo.or.cz/qemu/kevin.git qapi-alias-chardev-v4.
> 
> 
> Example: flattening leads to suboptimal error
> 
>     $ qemu-system-x86_64 -chardev udp,id=chr0,port=12345,ipv4=om
>     qemu-system-x86_64: -chardev udp,id=chr0,port=12345,ipv4=om: Parameter 'backend.data.remote.data.ipv4' expects 'on' or 'off'
> 
> We're using "alternate" notation, but the error message barks back in
> "standard" notation.  It comes from the visitor.  While less than
> pleasant, it's still understandable, because the "standard" key ends
> with the "alternate" key.

This is not a fundamental problem with aliases. The right name for the
option is unambiguous and known to the visitor: It's the name that the
user specified.

With manual QDict modification it becomes a more fundamental problem
because the visitor can't know the original name any more.

> 
> Example: renaming leads to confusing error
> 
> So far, we rename only members of type 'str', where the visitor can't
> fail.  Just for illustrating the problem, I'm adding one where it can:
> 
>     diff --git a/qapi/char.json b/qapi/char.json
>     index 0e39840d4f..b436d83cbe 100644
>     --- a/qapi/char.json
>     +++ b/qapi/char.json
>     @@ -398,7 +398,8 @@
>      ##
>      { 'struct': 'ChardevRingbuf',
>        'data': { '*size': 'int' },
>     -  'base': 'ChardevCommon' }
>     +  'base': 'ChardevCommon',
>     +  'aliases': [ { 'name': 'capacity', 'source': [ 'size' ] } ] }
> 
>      ##
>      # @ChardevQemuVDAgent:
> 
> With this patch:
> 
>     $ qemu-system-x86_64 -chardev ringbuf,id=chr0,capacity=lots
>     qemu-system-x86_64: -chardev ringbuf,id=chr0,capacity=lots: Parameter 'backend.data.size' expects integer
> 
> The error message fails to connect to the offending key=value.

Same problem as above. The error message should use the key that the
user actually specified.

> 
> Example: manual transformation leads to confusion #1
> 
> Starting point:
> 
>     $ qemu-system-x86_64 -chardev udp,id=chr0,port=12345,localaddr=localhost
> 
> Works.  host defaults to localhost, localport defaults to 0, same as in
> git master.
> 
> Now "forget" to specify @port:
> 
>     $ qemu-system-x86_64 -chardev udp,id=chr0,localaddr=localhost
>     qemu-system-x86_64: -chardev udp,id=chr0,localaddr=localhost: Parameter 'backend.data.remote.data.port' is missing
> 
> Again, the visitor's error message uses "standard" notation.

The output isn't wrong, it's just more verbose than necessary.

Getting this one shortened is a bit harder because the right name is
ambiguous, the user didn't specify anything we can just print back.

Possibly in CLI context, making use of any wildcard aliases would be a
reasonable strategy. This would reduce this one to just 'port'.

> We obediently do what the error message tells us to do:
> 
>     $ qemu-system-x86_64 -chardev udp,id=chr0,localaddr=localhost,backend.data.remote.data.port=12345
>     qemu-system-x86_64: -chardev udp,id=chr0,localaddr=localhost,backend.data.remote.data.port=12345: Parameters 'backend.*' used inconsistently
> 
> Mission accomplished: confusion :)

This one already fails before aliases do their work. The reason is that
the default key for -chardev is 'backend', and QMP and CLI use the same
name 'backend' for two completely different things.

We could rename the default key into 'x-backend' and make it behave the
same as 'backend', then the keyval parser would only fail when you
explicitly wrote '-chardev backend=udp,...' and the problem is more
obvious.

By the way, we have a very similar issue with '-drive file=...', if we
ever want to parse that one with the keyval parser. It can be both a
string for the filename or an object for the configuration of the 'file'
child that many block drivers have.

> Example: manual transformation leads to confusion #2
> 
> Confusion is possible even without tricking the user into mixing
> "standard" and "alternate" explicitly:
> 
>     $ qemu-system-x86_64 -chardev udp,id=chr0,backend.data.remote.type=udp
>     qemu-system-x86_64: -chardev udp,id=chr0,backend.data.remote.type=udp: Parameters 'backend.*' used inconsistently
> 
> Here, the user tried to stick to "standard", but forgot to specify a
> required member.  The transformation machinery then "helpfully"
> transformed nothing into something, which made the visitor throw up.

Not the visitor, but the keyval parser. Same problem as above.

> Clear error reporting is a critical part of a human-friendly interface.
> We have two separate problems with it:
> 
> 1. The visitor reports errors as if aliases didn't exist
> 
>    Fixing this is "merely" a matter of tracing back alias applications.
>    More complexity...
> 
> 2. The visitor reports errors as if manual transformation didn't exist
> 
>    Manual transformation can distort the users input beyond recognition.
>    The visitor reports errors for the transformed input.
> 
>    To fix this one, we'd have to augment the parse tree so it points
>    back at the actual user input, and then make the manual
>    transformations preserve that.  Uff!

Manual transformations are hard to write in a way that they give perfect
results. As long as they are only used for legacy syntax and we expect
users to move to a new way to spell things, this might be acceptable for
a transition period until we remove the old syntax.

In other cases, the easiest way is probably to duplicate even more of
the schema and manually make sure that the visitor will accept the input
before we transform it.

The best way to avoid this is providing tools in QAPI that make manual
transformations unnecessary.

> I'm afraid I need another round of thinking on how to best drag legacy
> syntax along when we QAPIfy.

Let me know when you've come to any conclusions (or more things to
discuss).

Kevin


