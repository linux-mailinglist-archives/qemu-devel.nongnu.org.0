Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E365D6C9F15
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 11:13:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgitw-0001lu-Ac; Mon, 27 Mar 2023 05:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pgitt-0001lV-Nr
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 05:12:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pgitr-0000Wd-Jg
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 05:12:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679908342;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jMZYXilRAm4VOmRXLYrIdDdrA0U82m8GiI7/8Pd80rA=;
 b=J6HXJncQpkGgfIMRv3SnYuDjpJcSZcopWqI5VzeO6zJVhwOIQ0nW6GP4XVjvjWKQDranll
 uk0DvBNTv0nPLwU36W4kW/mWStBqrAL5//L87eAdhfFkiuTo9VXSYkzldKKuHTRpfR6ITs
 kUgDS3Eko3YhznsHdnwKFKZe7KHonEM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-O3yF9p4gP1C2jaQr6t6Aew-1; Mon, 27 Mar 2023 05:12:17 -0400
X-MC-Unique: O3yF9p4gP1C2jaQr6t6Aew-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68CD2801206;
 Mon, 27 Mar 2023 09:12:17 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EDA243FBD;
 Mon, 27 Mar 2023 09:12:16 +0000 (UTC)
Date: Mon, 27 Mar 2023 10:12:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: quintela@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH] Change the default for Mixed declarations.
Message-ID: <ZCFd7nAlJqXKZUqH@redhat.com>
References: <20230214160738.88614-1-quintela@redhat.com>
 <ZByhueDO9J9MLuSJ@redhat.com> <87pm8ykq09.fsf@secure.mitica>
 <87zg822fnm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zg822fnm.fsf@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Fri, Mar 24, 2023 at 05:56:46PM +0000, Alex Bennée wrote:
> 
> Juan Quintela <quintela@redhat.com> writes:
> 
> > Daniel P. Berrangé <berrange@redhat.com> wrote:
> >> On Tue, Feb 14, 2023 at 05:07:38PM +0100, Juan Quintela wrote:
> >>> Hi
> >>> 
> >>> I want to enter a discussion about changing the default of the style
> >>> guide.
> >>> 
> >>> There are several reasons for that:
> >>> - they exist since C99 (i.e. all supported compilers support them)
> >>> - they eliminate the posibility of an unitialized variable.
> >>
> >> Actually they don't do that reliably. In fact, when combined
> >> with usage of 'goto', they introduce uninitialized variables,
> >> despite the declaration having an initialization present, and
> >> thus actively mislead reviewers into thinking their code is
> >> safe.
> >
> > Wait a minute.
> > If you use goto, you are already in special rules.
> >
> > And don't get confused, I fully agree when using goto for two reasons:
> > - performance
> >   if you show that the code is x% faster when using goto, it is
> >   justified.  It is even better if you send a bug report to gcc/clang,
> >   but I will not opose that use.
> 
> I await a clear example in the context of QEMU - there is almost always
> a better way to structure things.
> 
> > - code clearity
> >   Some code (basically error paths) are clearer with goto that without
> >   them.
> 
> Now we have g_auto* and lock guards we should encourage their use. goto
> error_path is a relic of a simpler time ;-)
> 
> <snip>
> >> IMHO if we are concerned about uninitialized variables then I think
> >> a better approach is to add -ftrivial-auto-var-init=zero, which will
> >> make the compiler initialize all variables to 0 if they lack an
> >> explicit initializer. 
> >
> > I think this is a bad idea.
> > If we want to "catch" unitialized variables, using something like:
> >
> > -ftrivial-auto-var-init=pattern sounds much saner.
> >
> > Obviously gcc is missing
> >
> > -ftrivial-auto-var-init=42
> 
> I think we could at least eat the runtime cost of
> -ftrvial-auto-var-init=0xDEADBEEF for our --enable-debug builds.

If there is ever a case where an uninitialized var gets used as a
loop counter, that's 3,735,928,559 iterations. A small value pattern
would avoid such CPU burn.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


