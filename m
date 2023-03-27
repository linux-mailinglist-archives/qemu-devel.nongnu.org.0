Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1366F6C9F0A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 11:12:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgis0-0000r8-R4; Mon, 27 Mar 2023 05:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pgiry-0000qm-Jv
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 05:10:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pgirw-0000Iv-9G
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 05:10:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679908217;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WAeV8hUBOmln5DwzjCNIRtoxRlzSaeRnRsZ6w4YMW1I=;
 b=Yvl0f/czBrINQtEk/uwgE2Vi9FsuB8I7c2h3ukECvbrX2aO/qd1/uWcMm9SeOfr3yVc7Oq
 Cm0PdphomhN+lH2FaRvxFgPt0PgwwZliJk61/N+x8cMso5FCTDqc2dYLa62ELoB0eLQ6+9
 HV0VYgsyRDaccPee3v6NHTavQSQs+uw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-I927QM8YM0O-nGXTXDGRHQ-1; Mon, 27 Mar 2023 05:10:15 -0400
X-MC-Unique: I927QM8YM0O-nGXTXDGRHQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E9043C0F18C
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 09:10:15 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B18343FBE;
 Mon, 27 Mar 2023 09:10:13 +0000 (UTC)
Date: Mon, 27 Mar 2023 10:10:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] Change the default for Mixed declarations.
Message-ID: <ZCFdcVPi3v71i+FV@redhat.com>
References: <20230214160738.88614-1-quintela@redhat.com>
 <ZByhueDO9J9MLuSJ@redhat.com> <87pm8ykq09.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pm8ykq09.fsf@secure.mitica>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Mar 24, 2023 at 06:39:34PM +0100, Juan Quintela wrote:
> Daniel P. Berrangé <berrange@redhat.com> wrote:
> > On Tue, Feb 14, 2023 at 05:07:38PM +0100, Juan Quintela wrote:
> >> Hi
> >> 
> >> I want to enter a discussion about changing the default of the style
> >> guide.
> >> 
> >> There are several reasons for that:
> >> - they exist since C99 (i.e. all supported compilers support them)
> >> - they eliminate the posibility of an unitialized variable.
> >
> > Actually they don't do that reliably. In fact, when combined
> > with usage of 'goto', they introduce uninitialized variables,
> > despite the declaration having an initialization present, and
> > thus actively mislead reviewers into thinking their code is
> > safe.
> 
> Wait a minute.
> If you use goto, you are already in special rules.
> 
> And don't get confused, I fully agree when using goto for two reasons:
> - performance
>   if you show that the code is x% faster when using goto, it is
>   justified.  It is even better if you send a bug report to gcc/clang,
>   but I will not opose that use.
> - code clearity
>   Some code (basically error paths) are clearer with goto that without
>   them.
> 
> But that don't mind that mixed declarations are bad.  It means that goto
> is complicated.

Yes, goto is complicated and we shouldn't make that worse by using a
code pattern that encourages mistakes IMHO.

> >> - Current documentation already declares that they are allowed in some
> >>   cases.
> >> - Lots of places already use them.
> >> 
> >> We can change the text to whatever you want, just wondering if it is
> >> valib to change the standard.
> >> 
> >> Doing a trivial grep through my local qemu messages (around 100k) it
> >> shows that some people are complaining that they are not allowed, and
> >> other saying that they are used all over the place.
> >
> > IMHO the status quo is bad because it is actively dangerous when
> > combined with goto and we aren't using any compiler warnings to
> > help us.
> >
> > Either we allow it, but use -Wjump-misses-init to prevent mixing
> > delayed declarations with gotos, and just avoid this when it triggers
> > a false positive.
> >
> > Or we forbid it, rewrite current cases that use it, and then add
> > -Wdeclaration-after-statement to enforce it.
> >
> >
> > IMHO if we are concerned about uninitialized variables then I think
> > a better approach is to add -ftrivial-auto-var-init=zero, which will
> > make the compiler initialize all variables to 0 if they lack an
> > explicit initializer. 
> 
> I think this is a bad idea.
> If we want to "catch" unitialized variables, using something like:
> 
> -ftrivial-auto-var-init=pattern sounds much saner.

It depends on what you are aiming to achieve.

In almost all cases where we forgot to initialize something, all-zeros
is the value that we would have wanted to be present. IOW, init=zero
will (almost) always make the code do what we wanted it to do, and thus
is the safe option to make QEMU robust.

Using a non-zero value will be potentially dangerous in a number of
possible ways. It will lead to loops iterating when they should not,
potentially even infinite loops. It will lead to reads/writes off
the end of arrays. It will lead to attempts to free() invalid pointers.
Essentially all the ways in which an uninitialized value can make the
code go wrong wil still potentially happen if we initialized to a
non-zero value. The only benefit is that it will go horribly wrong
in the same way each time.

IOW...

* If you want the application to be robust and generally "do the
  right thing", even in the face of missing initializers, then
  using -ftrivial-auto-var-init=zero is the right answer.

* If you want the application to go horribly wrong, but in a
  repeatable manner, then -ftrivial-auto-var-init=pattern is the
  right answer

Personally I prefer QEMU to be robust and thus believe we should
initialize to zero in real world deployments.

Potentially there's a case for CI jobs to use a non-zero pattern
though to try to expose edge cases.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


