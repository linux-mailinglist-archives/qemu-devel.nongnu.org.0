Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D22C2F14B5
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 14:29:12 +0100 (CET)
Received: from localhost ([::1]:38838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyxFu-0005Qg-5f
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 08:29:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kyxE5-0004lU-HT
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:27:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kyxE2-0005uM-3E
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:27:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610371632;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=8OSGsikp2unMtsSDyYKou9vfCCZgOnQb8wsmoujAiL0=;
 b=Onk4ssTwjJ+v5vuVIHCKf1IAHWygysG5K2KgL0/8PHuk5JTbb0fpmcECbfFEV8DBu/5TUG
 syPpNhQu7SaSOtvg0H1vc6f91HJn5S0Oxy2nD4aSqVaEee4PL6bFERLsZULFuE0O4IBrLm
 ddFgvnnvUF6HJ8N7hJTDPimtM/k1VBs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-r9NWxkcQNd-7gP7VwmFiJg-1; Mon, 11 Jan 2021 08:27:06 -0500
X-MC-Unique: r9NWxkcQNd-7gP7VwmFiJg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8531803642;
 Mon, 11 Jan 2021 13:27:05 +0000 (UTC)
Received: from redhat.com (ovpn-115-108.ams2.redhat.com [10.36.115.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E923960C62;
 Mon, 11 Jan 2021 13:27:04 +0000 (UTC)
Date: Mon, 11 Jan 2021 13:27:01 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Warner Losh <imp@bsdimp.com>
Subject: Re: qemu bsd-user plans
Message-ID: <20210111132701.GD1172772@redhat.com>
References: <CANCZdfo_CDqyG339HwNQb_K+sbsV0t+3nJMXVFf=mYrS3nsv-Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANCZdfo_CDqyG339HwNQb_K+sbsV0t+3nJMXVFf=mYrS3nsv-Q@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 08, 2021 at 12:41:30PM -0700, Warner Losh wrote:
> The FreeBSD project has rewritten bsd-user. We've been working on this for
> quite some time (the earliest commits date from 2013). Maybe a dozen people
> have worked on this over time, and there's 3 or 4 active developers focused
> on FreeBSD changes at the moment.

The fact that you have 3-4 people involved in this work is will be very
helpful to you going forward with a QEMU maintenance.

The biggest problem with getting code merged into QEMU is an insufficient
number of reviewers for the amount of patches sent. Since we have a rule
that patches need a review from someone else who isn't the author, if there
are two people with expertize to review patches in a given QEMU subsystem,
then they can become self-sufficient and review each others patches on
qemu-devel, which then makes merging much more productive.

If anyone wants to be automatically CC'd on patches for bsd-user for the
purposes of acting as a designated reviewer, they can added to MAINTAINERS
file to, alongside the primary maintainer(s).


> So, my new plan is to rebase what changes I can to the tip of master and
> submit those for review. I'll work with the developers on the FreeBSD side
> to ensure they are included in reviews in addition to the normal qemu-devel
> list. This will allow us to pare down the deltas between our code and
> upstream to allow us to make progress. The changes will be held to the
> standard 'makes things better'. Given how broken bsd-user is today in qemu
> upstream, at first that will a very easy standard to make.
>
> The first patch I'll submit will be changing MAINTAINERS to point to me,
> since I'm acting as the point person in this effort. I'll then re-submit
> some other changes that I've submitted in the past, but CC the FreeBSD
> folks that are currently active (they were only CC'd to former developers
> who lack the time to review).

> But before I get too far down this path, I thought I'd send out what's
> going on to qemu-devel so I can get feedback and adjust the plan into
> something that's mutually agreeable so time I put towards this is not
> wasted.

No objections from me. Since current bsd-user is orphaned, largely
unusable, and you're volunteering your time to make it better, I'm
supportive of whatever you believe is the most time efficient way
to improve bsd-user.

I presume some of the current QEMU maintainers knowledgable about
linux-user will be able to review the patches, and as mentioned
above, if other BSD devs currently active in bsd-user work can
also provide reviews on qemu-devel that'll be useful long term.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


