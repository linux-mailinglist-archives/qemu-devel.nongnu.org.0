Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4E530F816
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 17:37:01 +0100 (CET)
Received: from localhost ([::1]:53074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7hcq-0003dJ-Va
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 11:37:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l7hV6-0004uT-T3
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:29:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l7hV3-0007YF-IL
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:29:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612456136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PIbJeu3OMGSHYaHLB9jzR8Kw5PhMGKIJJuG12OG/S6A=;
 b=Hfjj40Z5SIvps6Bfj/YurUGHWriqD1GXxAplTk6z6c/q1kqhHqhcxHolmDIHCsBhVb2qGT
 Nmh/A7k6N6ICIQJKTsFCfzsj+TNtJfvN22sZBAKV/jytkAlUhqtefnCDasnPTSylqWX6tH
 aR9cW8OjTCVqpmDhi71eSs/ACrsOQzI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-ZBoh4LVHNY6rgz8WcaOO-A-1; Thu, 04 Feb 2021 11:28:52 -0500
X-MC-Unique: ZBoh4LVHNY6rgz8WcaOO-A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECCC1A0BD9;
 Thu,  4 Feb 2021 16:28:51 +0000 (UTC)
Received: from localhost (ovpn-3-197.rdu2.redhat.com [10.22.3.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB12110016FA;
 Thu,  4 Feb 2021 16:28:48 +0000 (UTC)
Date: Thu, 4 Feb 2021 11:28:47 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v4 08/14] qapi/introspect.py: create a typed 'Annotated'
 data strutcure
Message-ID: <20210204162847.GD126021@habkost.net>
References: <20210202174651.2274166-1-jsnow@redhat.com>
 <20210202174651.2274166-9-jsnow@redhat.com>
 <878s85tdh3.fsf@dusky.pond.sub.org>
 <20210203215026.GB126021@habkost.net>
 <87a6sjdet2.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87a6sjdet2.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 04, 2021 at 04:37:45PM +0100, Markus Armbruster wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > On Wed, Feb 03, 2021 at 03:47:36PM +0100, Markus Armbruster wrote:
> >> John Snow <jsnow@redhat.com> writes:
> >> 
> >> > Presently, we use a tuple to attach a dict containing annotations
> >> > (comments and compile-time conditionals) to a tree node. This is
> >> > undesirable because dicts are difficult to strongly type; promoting it
> >> > to a real class allows us to name the values and types of the
> >> > annotations we are expecting.
> >> >
> >> > In terms of typing, the Annotated<T> type serves as a generic container
> >> > where the annotated node's type is preserved, allowing for greater
> >> > specificity than we'd be able to provide without a generic.
> >> >
> >> > Signed-off-by: John Snow <jsnow@redhat.com>
> > [...]
> >> > +class Annotated(Generic[_NodeT]):
> >> > +    """
> >> > +    Annotated generally contains a SchemaInfo-like type (as a dict),
> >> > +    But it also used to wrap comments/ifconds around scalar leaf values,
> >> > +    for the benefit of features and enums.
> >> > +    """
> >> > +    # Remove after 3.7 adds @dataclass:
> >> 
> >> Make this
> >> 
> >>        # TODO Remove after Python 3.7 ...
> >> 
> >> to give us a fighting chance to remember.
> >> 
> >> > +    # pylint: disable=too-few-public-methods
> >> > +    def __init__(self, value: _NodeT, ifcond: Iterable[str],
> >> > +                 comment: Optional[str] = None):
> >> 
> >> Why not simply value: _value?
> >
> > Example:
> >   x = C(1)
> >   y: C[int]
> >   y = C('x')  # mistake
> >
> > Declaring value as _NodeT does:
> > - Make the inferred type of x be Annotated[int].
> > - Catch the mistake above.
> 
> I smell overengineering.  I may well be wrong.

To me it's just regular and idiomatic use of Generic.

> 
> Without doubt, there are uses for using the type system for keeping
> SomeGenericType[SomeType] and SomeGenericType[AnotherType] apart.
> 
> But what do we gain by keeping the Annotated[T] for the possible T
> apart?

I understand this as (valid) criticism of the use of Generic.
If we don't want to make Generic[T1] and Generic[T2] be
different types, there's no point in using Generic at all.


> 
> _tree_to_qlit() doesn't care: it peels off the wrapper holding ifcond
> and comment, and recurses for the JSON so wrapped.  Regardless of what
> was wrapped, i.e. what kind of T we got.
> 
> Heck, it works just fine even if you wrap your JSON multiple times.  It
> doesn't give a hoot whether that makes sense.  Making sense is the
> caller's business.
> 
> So what does care?
> 
> Or am I simply confused?

Those are valid questions.  Maybe using Generic will be useful
in the future, but maybe we don't need it right now.

Personally, I don't care either way.  I just wish this small
choice don't became another obstacle for doing useful work.

> 
> 
> PS: As far as I can tell, _tree_to_qlit() doesn't give a hoot whether a
> dictionary's values are wrapped, either.

-- 
Eduardo


