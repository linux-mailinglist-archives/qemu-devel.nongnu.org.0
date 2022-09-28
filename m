Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EF15EDDEC
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 15:41:22 +0200 (CEST)
Received: from localhost ([::1]:55058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odXJP-0007Ys-Np
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 09:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odTym-0003RI-CE
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 06:07:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odTyh-0007p3-K9
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 06:07:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664359660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jIvGEFkXQ8ijs3c0j0gWIm7CEvdb7UDAqCW0mh+Dgo4=;
 b=Ku080hRgf8TcSJyhQEb1NxLHqPmMV9+cNa8gU+C2pMYQpEMobZB54fBgQJOG/KBOkevfR8
 RnXQkQiP4qeBHf7RQM7EKzS8VWq7cVjO9kp2OIWL7+hmti4IytB7mVeoVyCCCZcNeIfLSu
 8YrGY8O/+2Pj6/iXO55vg6ZShwbTHKc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-435-exLddKZsNrq2dxu4hwIHeA-1; Wed, 28 Sep 2022 06:07:39 -0400
X-MC-Unique: exLddKZsNrq2dxu4hwIHeA-1
Received: by mail-wm1-f69.google.com with SMTP id
 c2-20020a1c3502000000b003b535aacc0bso941948wma.2
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 03:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=jIvGEFkXQ8ijs3c0j0gWIm7CEvdb7UDAqCW0mh+Dgo4=;
 b=RLwEoVeGjXe7wsutd2sWEKSK9FQsevaS7lie7+bTfnZgMbXWS6UQX66f3hPZJaxwW2
 pXIkvSFX4rca0p04DteihTMpoawtG07Qj9Wodq0uUJbV8laymC2+IbDYQcmiPpUuJIgu
 XDvQZO2gmLJmLlMNmKAtmzQXFXF5ObM6uX+uCFogELgG84SYM3EGxyy9y0GzwYNCLlWq
 q0OmsJevs9jsRT+9z9evGAuyzA2dhjdMhl6O3n2E4zhk+j15s6THmRNRnQN2LpqG/w5U
 ySYM6Uwy1HNJnEbQPv2d1If+SnGUHXIdaYVPtYdj4azDDZLE3T/YWgG3vPOOBCLXEVjm
 Wq4g==
X-Gm-Message-State: ACrzQf2RrxLJTyPgPNRoc80zPQBdqeYx3xnzk1u0jih/bXHjkqPSlTZT
 ToW/4DzvNns12f3vHMWvCvX7M8wvxZ6uVz83QHE+T9tYlAPF6BydKaoIFIpu95W0CYKI9UMewvP
 lVan62KZfTL0kVYk=
X-Received: by 2002:adf:d22e:0:b0:22c:c690:df80 with SMTP id
 k14-20020adfd22e000000b0022cc690df80mr2244811wrh.424.1664359658333; 
 Wed, 28 Sep 2022 03:07:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4dqKQiwEASZSF9hKG1Wzbb3pDbDG2I/G8kMnxr5p5NQ+Yui0+TCV4+9n5zCY6xG1gEwWaLyA==
X-Received: by 2002:adf:d22e:0:b0:22c:c690:df80 with SMTP id
 k14-20020adfd22e000000b0022cc690df80mr2244787wrh.424.1664359657965; 
 Wed, 28 Sep 2022 03:07:37 -0700 (PDT)
Received: from redhat.com ([2.55.17.78]) by smtp.gmail.com with ESMTPSA id
 s15-20020adfeccf000000b00228d6edade0sm3980017wro.46.2022.09.28.03.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 03:07:37 -0700 (PDT)
Date: Wed, 28 Sep 2022 06:07:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: Why we should avoid new submodules if possible
Message-ID: <20220928060345-mutt-send-email-mst@kernel.org>
References: <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
 <20220928052352-mutt-send-email-mst@kernel.org>
 <YzQVyj5ouhGshZ2+@redhat.com>
 <20220928054803-mutt-send-email-mst@kernel.org>
 <YzQam+F1HEu5g52A@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YzQam+F1HEu5g52A@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 28, 2022 at 10:57:47AM +0100, Daniel P. Berrangé wrote:
> On Wed, Sep 28, 2022 at 05:53:17AM -0400, Michael S. Tsirkin wrote:
> > On Wed, Sep 28, 2022 at 10:37:14AM +0100, Daniel P. Berrangé wrote:
> > > On Wed, Sep 28, 2022 at 05:26:42AM -0400, Michael S. Tsirkin wrote:
> > > > On Tue, Jun 28, 2022 at 12:21:39PM +0200, Thomas Huth wrote:
> > > > > On 28/06/2022 12.03, Michael S. Tsirkin wrote:
> > > > > [...]
> > > > > > For biosbits if we are going this route then I feel a submodule is much
> > > > > > better.  It records which version exactly each qemu version wants.
> > > > > 
> > > > > As far as I know, you can also specify the version when using pip, can't
> > > > > you? So that's not really an advantage here.
> > > > > 
> > > > > On the contrary, submodules have a couple of disadvantages that I really
> > > > > dislike:
> > > > > 
> > > > > - submodules do not get updated automatically when doing a "git checkout",
> > > > > we have to update them via a script instead. This causes e.g. trouble if you
> > > > > rsync your source tree to a machine that has no access to the internet and
> > > > > you forgot to update the submodule before the sync
> > > > > 
> > > > > - the content of submodules is not added to the tarballs that get created on
> > > > > the git forges automatically. There were lots of requests from users in the
> > > > > past that tried to download a tarball from github and then wondered why they
> > > > > couldn't compile QEMU.
> > > > > 
> > > > > - we include the submodule content in our release tarballs, so people get
> > > > > the impression that hte submodule content is part of the QEMU sources. This
> > > > > has two disadvantages:
> > > > >  * We already got bug reports for the code in the submodule,
> > > > >    where people did not understand that they should report that
> > > > >    rather to the original project instead (i.e. you ship it - you
> > > > >    own it)
> > > > >  * People get the impression that QEMU is a huge monster
> > > > >    application if they count the number of code lines, run
> > > > >    their code scanner tools on the tarball contents, etc.
> > > > >    Remember "nemu", for example, where one of the main complaints
> > > > >    was that QEMU has too many lines of code?
> > > > > 
> > > > > - If programs includes code via submodules, this gets a higher
> > > > >   burder for distro maintainers, since they have to patch each
> > > > >   and every package when there is a bug, instead of being able to
> > > > >   fix it in one central place.
> > > > > 
> > > > > So in my opinion we should avoid new submodules if there is an alternative.
> > > > > 
> > > > >  Thomas
> > > > 
> > > > So looking at the latest proposals downloading files from CI,
> > > > checksumming them etc etc. No auto checkout, not added automatically
> > > > either, right?
> > > > 
> > > > This seems to be the only difference:
> > > > - we include the submodule content in our release tarballs
> > > 
> > > That's just one of the issues with submodules. Working with them in general
> > > is not a pleasant experiance.
> > 
> > This is what I asked about at the maintainers summit.
> > I'd like to map the issues and see if there's anything
> > we can do to solve them. In particular we will likely
> > keep using submodules where we historically did
> > so it's time well spent.
> > 
> > I agree generally but the big question is what to replace these with.
> > Below I assume the replacement is a script such as avocado or pytest
> > with its own hashing, calling wget internally etc etc.
> > 
> > 
> > > Thomas pointed out some of the issues, such
> > > as 'git checkout' ignoring submodules, requiring extra steps to sync them.
> > 
> > 
> > Not different from a home grown SCM as part of test script, right?
> 
> We're not building a home grown SCM as part of a test script, so
> this answer is irrelevant.

If you are managing contents of files using code then you have
a content managing system :)

> > > There's also the perenial problem that developers frequently send
> > > patches that mistakenly include submodule changes,
> > 
> > OK, so the thing to do would be to look for ways to exclude submodule changes
> > from git commits.
> 
> If someone wants to make git suck less with submodules great, but needs
> someone to actually do the work.

I have some experience with git, might be able to if I can figure out
what the issues are. Or maybe there's already a flag to do what we want
git is pretty configurable.

> > > I'd really like to see us doing more to eliminate as much use of submodules
> > > as is possible over time. 
> > 
> > Or try to fix the problems, right?
> 
> Again needs someone to actually make it happen.
> 
> Meanwhile  QEMU already has an integrated test harness in the form
> of Avocado that does everything needed. If Avocado had just been
> used for this biosbits test in the first place, the test would
> likely have already been merged to QEMU, instead of us having this
> never ending debate on how to re-invent an alternative to what
> already avocado does.
> 
> With regards,
> Daniel

I just think there's a ton of difference between linux guest images
which we want to keep running indefinitely and a unit test firmware
which we want to version with qemu.


> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


