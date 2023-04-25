Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C68626EE2DD
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:23:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIca-0005OS-NE; Tue, 25 Apr 2023 09:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1prIcK-00057z-3c
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:22:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1prIc4-0008Fh-7c
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:21:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682428902;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fbTAm4q86sks0HmhMBnYEi0gSpWtN38qYyj7azTI63A=;
 b=CvdIuJSIqk57EvwfDE5MfPhWe9jC0YrIGf9hu/pZLi0cJWutMqt2sSTG25jdJyPVjE5DtN
 izfyOwgN5quqe7mwCvWYWDVwBvGDOwXp2HSciZPJwqLwPFqn68lOUxYol3pb38Jp8w7/T7
 I/xKfh8bXFSsxUBPR9JY6BXWNyO5tFU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-WgfwP30cMkeutSB34NOm_g-1; Tue, 25 Apr 2023 09:21:39 -0400
X-MC-Unique: WgfwP30cMkeutSB34NOm_g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A576D185A791;
 Tue, 25 Apr 2023 13:21:38 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D676A2166B3A;
 Tue, 25 Apr 2023 13:21:36 +0000 (UTC)
Date: Tue, 25 Apr 2023 14:21:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Het Gala <het.gala@nutanix.com>,
 Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v3 2/3] qapi: improve specificity of type/member
 descriptions
Message-ID: <ZEfT3VexRIYAWlOx@redhat.com>
References: <20230420102619.348173-1-berrange@redhat.com>
 <20230420102619.348173-3-berrange@redhat.com>
 <87a5yxa4sy.fsf@pond.sub.org> <ZEfIXfnavuNvkPyH@redhat.com>
 <871qk8umm7.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <871qk8umm7.fsf@pond.sub.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Apr 25, 2023 at 03:17:52PM +0200, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Mon, Apr 24, 2023 at 01:38:21PM +0200, Markus Armbruster wrote:
> >> Daniel P. Berrangé <berrange@redhat.com> writes:
> >> 
> >> > When describing member types always include the context of the
> >> > containing type. Although this is often redundant, in some cases
> >> > it will help to reduce ambiguity.
> >> 
> >> This is no longer true.  It was in v2.  Suggest:
> >> 
> >>   Error messages describe object members, enumeration values, features,
> >>   and variants like ROLE 'NAME', where ROLE is "member", "value",
> >>   "feature", or "branch", respectively.  When the member is defined in
> >>   another type, e.g. inherited from a base type, we add "of type
> >>   'TYPE'".  Example: test case struct-base-clash-deep reports a member
> >>   of type 'Sub' clashing with a member of its base type 'Base' as
> >> 
> >>       struct-base-clash-deep.json: In struct 'Sub':
> >>       struct-base-clash-deep.json:10: member 'name' collides with member 'name' of type 'Base'
> >> 
> >>   Members of implicitly defined types need special treatment.  We don't
> >>   want to add "of type 'TYPE'" for them, because their named are made up
> >>   and mean nothing to the user.  Instead, we describe members of an
> >>   implicitly defined base type as "base member 'NAME'", and command and
> >>   event parameters as "parameter 'NAME'".  Example: test case
> >>   union-bad-base reports member of a variant's type clashing with a
> >>   member of its implicitly defined base type as
> >> 
> >>       union-bad-base.json: In union 'TestUnion':
> >>       union-bad-base.json:8: member 'string' of type 'TestTypeA' collides with base member 'string'
> >> 
> >>   The next commit will permit unions as variant types.  "base member
> >>   'NAME' would then be ambigious: is it the union's base, or is it the
> >>   union's variant's base?  One of its test cases would report a clash
> >>   between two such bases as "base member 'type' collides with base
> >>   member 'type'".  Confusing.
> >> 
> >>   Refine the special treatment: add "of TYPE" even for implicitly
> >>   defined types, but massage TYPE and ROLE so they make sense for the
> >>   user.
> >> 
> >> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> >> > ---
> >> >  scripts/qapi/schema.py | 9 +++++++--
> >> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >> >
> >> > diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> >> > index 207e4d71f3..da04b97ded 100644
> >> > --- a/scripts/qapi/schema.py
> >> > +++ b/scripts/qapi/schema.py
> >> > @@ -697,6 +697,7 @@ def connect_doc(self, doc):
> >> >  
> >> >      def describe(self, info):
> >> >          role = self.role
> >> > +        meta = 'type'
> >> >          defined_in = self.defined_in
> >> >          assert defined_in
> >> >  
> >> > @@ -708,13 +709,17 @@ def describe(self, info):
> >> >                  # Implicit type created for a command's dict 'data'
> >> >                  assert role == 'member'
> >> >                  role = 'parameter'
> >> > +                meta = 'command'
> >> > +                defined_in = defined_in[:-4]
> >> >              elif defined_in.endswith('-base'):
> >> >                  # Implicit type created for a union's dict 'base'
> >> >                  role = 'base ' + role
> >> > +                defined_in = defined_in[:-5]
> >> >              else:
> >> >                  assert False
> >> > -        elif defined_in != info.defn_name:
> >> > -            return "%s '%s' of type '%s'" % (role, self.name, defined_in)
> >> > +
> >> > +        if defined_in != info.defn_name:
> >> > +            return "%s '%s' of %s '%s'" % (role, self.name, meta, defined_in)
> >> >          return "%s '%s'" % (role, self.name)
> >> 
> >> Since I rewrote both the patch and the commit message, would you like me
> >> to take the blame and claim authorship?
> >
> > Yes, I should have credited you as the author here since it was just
> > taking your proposed code. The suggested commit message looks fine too
> 
> Thanks!  May I add your R-by in my tree?

Certainly

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


