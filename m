Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8BF5211A9
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 12:03:39 +0200 (CEST)
Received: from localhost ([::1]:42292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noMiQ-00070B-1l
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 06:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noMaw-0000w1-4v
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:55:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noMau-0005Wu-08
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:55:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652176551;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=1oS4t16Q2ybQ/RMT/c2AfItt7s4cPTmVC1DnWasRUHo=;
 b=LTYsxSdAXEG9YdCrKg/zoh5zyWllKh8QYqpmg3YWiQ74N2eevLV7/RGH91cOGJjq/fmg2A
 sy8vpbzmFJuxZ3yrZCT8J16aoHsr2nObd1SLx7Hq6wq0uxB/nAQNPA9hWYUWMZWuYeeT2X
 rgP2FONwKHW930vJ9qUqc+1C3p8nwO8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-4lMutVwMMj2DhKUePqiZvg-1; Tue, 10 May 2022 05:55:50 -0400
X-MC-Unique: 4lMutVwMMj2DhKUePqiZvg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE8BE85A5A8
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 09:55:49 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABEE140CFD06;
 Tue, 10 May 2022 09:55:48 +0000 (UTC)
Date: Tue, 10 May 2022 10:55:46 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 Victor Toso <victortoso@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
Message-ID: <Yno2oi2rk/ukOtyT@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <CABJz62PBHFqUyBNtwd_K6pra9_zOz9Ps56JOsNZL8XHf2u35Uw@mail.gmail.com>
 <87a6c52u68.fsf@pond.sub.org>
 <CABJz62NaEgEzEkvdYbNZ5qfkx_gAYfnxt_YbQhGyD08gRH6EYg@mail.gmail.com>
 <87v8uos8lb.fsf@pond.sub.org>
 <CABJz62MTVhDHZo5+sTJKm5b+SZM_W+_o5VmMgx0NVyibYfs=hw@mail.gmail.com>
 <875ymop374.fsf@pond.sub.org>
 <CABJz62OsaZo0hJB=ucereGDOHbK-5Ym4ASqhgVePJr65JRu0gQ@mail.gmail.com>
 <87bkwff3q0.fsf@pond.sub.org>
 <CABJz62PcEPwiZfV9dBQooELvDnrqPTc_iKWYph8CR6_cGUzmWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABJz62PcEPwiZfV9dBQooELvDnrqPTc_iKWYph8CR6_cGUzmWA@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

On Tue, May 03, 2022 at 02:40:14AM -0700, Andrea Bolognani wrote:
> On Tue, May 03, 2022 at 09:57:27AM +0200, Markus Armbruster wrote:
> > Andrea Bolognani <abologna@redhat.com> writes:
> > > I still feel that 1) users of a language SDK will ideally not need to
> > > look at the QAPI schema or wire chatter too often
> >
> > I think the most likely point of contact is the QEMU QMP Reference
> > Manual.
> 
> Note that there isn't anything preventing us from including the
> original QAPI name in the documentation for the corresponding Go
> symbol, or even a link to the reference manual.
> 
> So we could make jumping from the Go API documentation, which is what
> a Go programmer will be looking at most of the time, to the QMP
> documentation pretty much effortless.
> 
> > My point is: a name override feature like the one you propose needs to
> > be used with discipline and restraint.  Adds to reviewers' mental load.
> > Needs to be worth it.  I'm not saying it isn't, I'm just pointing out a
> > cost.
> 
> Yeah, I get that.
> 
> Note that I'm not suggesting it should be possible for a name to be
> completely overridden - I just want to make it possible for a human
> to provide the name parsing algorithm solutions to those problems it
> can't figure out on its own.
> 
> We could prevent that feature from being misused by verifying that
> the symbol the annotation is attached to can be derived from the list
> of words provided. That way, something like
> 
>   # SOMEName (completely-DIFFERENT-name)
> 
> would be rejected and we would avoid misuse.
> 
> > Wild idea: assume all lower case, but keep a list of exceptions.
> 
> That could actually work reasonably well for QEMU because we only
> need to handle correctly what's in the schema, not arbitrary input.
> 
> There's always the risk of the list of exceptions getting out of sync
> with the needs of the schema, but there's similarly no guarantee that
> annotations are going to be introduced when they are necessary, so
> it's mostly a wash.
> 
> The only slight advantage of the annotation approach would be that it
> might be easier to notice it being missing because it's close to the
> name it refers to, while the list of exceptions is tucked away in a
> script far away from it.
> 
> > The QAPI schema language uses three naming styles:
> >
> > * lower-case-with-hyphens for command and member names
> >
> >   Many names use upper case and '_'.  See pragma command-name-exceptions
> >   and member-name-exceptions.
> 
> Looking at the output generated by Victor's WIP script, it looks like
> these are already handled as nicely as those that don't fall under
> any exception.
> 
> >   Some (many?) names lack separators between words (example: logappend).
> >
> > * UPPER_CASE_WITH_UNDERSCORE for event names
> >
> > * CamelCase for type names
> >
> >   Capitalization of words is inconsistent in places (example: VncInfo
> >   vs. DisplayReloadOptionsVNC).
> >
> > What style conversions will we need for Go?  Any other conversions come
> > to mind?
> >
> > What problems do these conversions have?
> 
> Go uses CamelCase for pretty much everything: types, methods,
> constants...
> 
>   There's one slight wrinkle, in that the case of the first letter
>   decides whether it's going to be a PublicName or a privateName. We
>   can't do anything about that, but it shouldn't really affect us
>   that much because we'll want all QAPI names to be public.
> 
> So the issues preventing us from producing a "perfect" Go API are
> 
>   1. inconsistent capitalization in type names
> 
>    -> could be addressed by simply changing the schema, as type
>       names do not travel on the wire
> 
>   2. missing dashes in certain command/member names
> 
>    -> leads to Incorrectcamelcase. Kevin's work is supposed to
>       address this
> 
>   3. inability to know which parts of a lower-case-name or
>      UPPER_CASE_NAME are acronyms or are otherwise supposed to be
>      capitalized in a specific way
> 
>    -> leads to WeirdVncAndDbusCapitalization. There's currently no
>       way, either implemented or planned, to avoid this
> 
> In addition to these I'm also thinking that QKeyCode and all the
> QCrypto stuff should probably lose their prefixes.

At the C level, those prefixes are pretty important to avoid
clashing with symbols defined by system headers and/or the
external crypto library headers, as the unprefixed names are
too generic.  All non-C languages of course have proper
namespacing

> > > Revised proposal for the annotation:
> > >
> > >   ns:word-WORD-WoRD-123Word
> > >
> > > Words are always separated by dashes; "regular" words are entirely
> > > lowercase, while the presence of even a single uppercase letter in a
> > > word denotes the fact that its case should be preserved when the
> > > naming conventions of the target language allow that.
> >
> > Is a word always capitalized the same for a single target language?  Or
> > could capitalization depend on context?
> 
> I'm not aware of any language that would adopt more than a single
> style of capitalization, outside of course the obvious
> lower_case_name or UPPER_CASE_NAME scenarios where the original
> capitalization stops being relevant.

As long as the capitalization we use in the schema can provides sufficient
info to detect word splitting and acronyms, we can cope with any output
language naming rules that I know of.  

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


