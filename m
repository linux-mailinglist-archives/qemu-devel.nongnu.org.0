Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E19931CB7E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 14:55:20 +0100 (CET)
Received: from localhost ([::1]:55346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC0ox-0000Fv-9h
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 08:55:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC0nf-0008En-Cy
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:53:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC0nc-0006cE-Tt
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:53:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613483634;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=L9KqfUBifrsqfrMCTxIb1ceMmghnx6ZRrRY09V39FsU=;
 b=a98sGSGFrKjtihtCBAaYpww5VJaKC1pSs9/N/xqPl6hmn7e27bviKHy4o+q/tFi/r4YUzM
 5+T/4g/61UQHxU33rwgJNgxd7SLwysWAhesFBbhp3ZpWO30Yspf+SRemICezgSTVyoalLT
 SyNpFCYya80BI1DUXk94AziDHa70vq8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-fUzeCb07OHGZXEeuSpqRog-1; Tue, 16 Feb 2021 08:53:49 -0500
X-MC-Unique: fUzeCb07OHGZXEeuSpqRog-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3E5C801975;
 Tue, 16 Feb 2021 13:53:48 +0000 (UTC)
Received: from redhat.com (ovpn-112-215.ams2.redhat.com [10.36.112.215])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96C2D10016F7;
 Tue, 16 Feb 2021 13:53:47 +0000 (UTC)
Date: Tue, 16 Feb 2021 13:53:44 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 31/31] qemu-option: warn for short-form boolean options
Message-ID: <YCvOaNji5s28XGsF@redhat.com>
References: <20210123143128.1167797-32-pbonzini@redhat.com>
 <CAFEAcA8R84_-BPG-suKDvkpE1BxG8o1edGv=zfU_CCw27pK4eg@mail.gmail.com>
 <CABgObfZNy_j3DYt3NKKvC1Ou8TW2zACZ2LffnrR7LU8PeS5hww@mail.gmail.com>
 <CAFEAcA_6RiR+ud5U0Y9K3jNmEoQ-Ex8fZN3-o0MkLxpK8PROgw@mail.gmail.com>
 <378df6af-8383-8a51-4286-54739dba99e4@redhat.com>
 <CAFEAcA9-bOggKPjJiZNc3WXD9Uu-TxzDc7NMvUDGgoM7ERg3hg@mail.gmail.com>
 <1a8f0b62-0adf-9360-2365-e9881a6aef94@redhat.com>
 <CAFEAcA8VCGmqbdLFLQ0R9Uun4MzxLTnOZExmYJZ65qZ_fjDUvg@mail.gmail.com>
 <f61447bf-f556-b626-4a6c-f86e724b0f7f@redhat.com>
 <CAFEAcA9G7CQDPb1QNaajwG5wSdND-E5nkTox1yEocdsBDsfc3g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9G7CQDPb1QNaajwG5wSdND-E5nkTox1yEocdsBDsfc3g@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 16, 2021 at 01:36:46PM +0000, Peter Maydell wrote:
> On Tue, 16 Feb 2021 at 13:30, Paolo Bonzini <pbonzini@redhat.com> wrote:
> > On 16/02/21 12:58, Peter Maydell wrote:
> > > On Tue, 16 Feb 2021 at 11:23, Paolo Bonzini <pbonzini@redhat.com> wrote:
> > >> I agree, and that's why I have no plans to move -chardev off QemuOpts;
> > >> warning is a different step than excising and sometimes years pass from
> > >> one to the other.  However, that doesn't prevent introducing a warning
> > >> so that users slowly move away from the problematic functionality.
> > >
> > > If we want to continue to support the functionality then complaining
> > > about it doesn't serve much purpose IMHO.
> >
> > It depends.  I don't want to support it forever for all options;
> > -machine, -accel and -object are those for which I do intend to remove
> > support for short-form options after the two release deprecation period.
> >
> > My first submission of this patch even special cased "-chardev" to hide
> > the warning, but this was dropped in response to reviews.
> > (https://patchew.org/QEMU/20201103151452.416784-1-pbonzini@redhat.com/20201103151452.416784-5-pbonzini@redhat.com/).
> >   I can add that back if you prefer, since it's very simple.
> 
> I agree with Daniel that it would be better to be consistent about
> whether we like these short options or not, but disagree that
> the answer is to deprecate everywhere :-)
> 
> Broadly, I think that being able to say 'foo' when foo is a
> boolean option being set to true is obvious and nice-to-use
> syntax, and I don't really want it to go away. 'nofoo' for
> 'foo=false' is much less obvious and I'm happy if we only
> support it as a special-case for 'nowait'.

There's an inherant tension in our goals here.

It is widely thought that QEMU configuration is complex and painful to
understand. From my POV a big part of that believe comes from the fact
that we have so many inconsistencies in our parsing code, and many ways
of doing the same thing.

Every time we have special cases like  "foo" as a short hand for "foo=on"
or "nofoo" as a short hand for "foo=off",  we increase the complexity of
QEMU and that impacts how our users view QEMU. 

IMHO we'd be better off eliminating the boolean short forms entirely
in all QEMU options, so that we get consistency and a clearer right way
of doing things. The short bool format was created with good intentions,
but on balance a bare "foo" isn't a big enough win over "foo=on" to
justify its existance long term.

I do agree though, that we should not be deprecating something if our
documentation is still showing people the deprecated syntax, as that
makes us look even worse.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


