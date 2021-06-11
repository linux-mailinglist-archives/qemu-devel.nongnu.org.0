Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5338B3A47F8
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 19:36:18 +0200 (CEST)
Received: from localhost ([::1]:53414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrl4r-0007Q1-5a
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 13:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lrl41-0006Ul-Rg
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 13:35:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lrl3y-0004Tc-Gf
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 13:35:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623432919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hnlxWH/4dAxs0poz3SAMxto/6eVvaHD2GB/Q4W/0YTw=;
 b=Ia626ZrlyHxZqzvASnWZIBlfPi5g4A+wa68+eZbFMVQWYQgWENVlwCmQlKaM8jjqioLEyH
 8JkMCl1UyDK3q+MjBMtZS4h1CYT9tR1XKFgE1zAivq4ck3ON2BjJ/h2Gov17Sp99Qa1AhN
 ZIzd31AbTNilOcFl+/vuGIkoc9p4hmQ=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-D0JJp5DOMw-MQJ_w-npXSA-1; Fri, 11 Jun 2021 13:35:18 -0400
X-MC-Unique: D0JJp5DOMw-MQJ_w-npXSA-1
Received: by mail-oi1-f200.google.com with SMTP id
 82-20020aca04550000b02901f40670cf75so3206709oie.19
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 10:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hnlxWH/4dAxs0poz3SAMxto/6eVvaHD2GB/Q4W/0YTw=;
 b=MFd1FKHGxoF+IwXUUdwwl90JOZTOvAFrC43WDa6VDpF9kvcVVX222GCx8v/OqUz5rX
 C9QjrAKB2XK4qiJkEnqdD2uj6hEaC2JyMzzr8ViynIb7oilyb64dz3KOJEcb/BIrmdP2
 UVA1RUB8IlaiKF8bqzUXg/00ImY7zJo1y5Y7lu2WLMACgu0Wr9XP80IyYedVWUJM4W+l
 tbUqK2zHCehzOSYaGDC9UaKvxYZT/M91fc7sjPkZYLKlX/cQvTx1Z8FqrBgffOUeI1tk
 9EaqJQbPza82KTcTWDC7MxSprwY0DaSjd5/o/rXiN7NzOdcoOCzD4U2cYz+IjK2aJ9FQ
 5R+g==
X-Gm-Message-State: AOAM53112GhofOoso4e1FU+hgwxeh02C5996B7BjKdvd7t9Ft+2Q0man
 FVe3R3lbR8tQ76bxvwCvez/eY6NmX1koUt9KkV+G7Se2xTS3OxdUDzfV1eYj3uyXhc8P8XSU75P
 +5IMvexBtqUPfs3A0Auy0X8ZIjAgwKGg=
X-Received: by 2002:a9d:6081:: with SMTP id m1mr4058710otj.226.1623432917892; 
 Fri, 11 Jun 2021 10:35:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzL2yCZ5SYXCuiBTQ04EfpBl6BxNaBP4/9WrmznFmj5ign+wIKKUWrTsswJ6NREZykhxbgH4i72GJDUt0HaNYg=
X-Received: by 2002:a9d:6081:: with SMTP id m1mr4058695otj.226.1623432917678; 
 Fri, 11 Jun 2021 10:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210607202204.1805199-1-nsoffer@redhat.com>
 <20210607212224.tiqjvvdwosvhrvz7@redhat.com>
 <CAMRbyyukE9iTmM6OB_xAA1n6tRiRRxwKojaO5wzRwAR-8-FX3g@mail.gmail.com>
 <20210610183443.clk43ngkobzyjopy@redhat.com>
 <CAMRbyysoYhcyiP2mWubfZsj09k=Ea_3-RPr+Tt7KvoE1z3jrNA@mail.gmail.com>
 <20210610204617.fuj4ivqrixpz4qfj@redhat.com> <YMMaJcKYe8nHDdjU@redhat.com>
 <20210611132830.i6wwm3fvytri6czu@redhat.com>
In-Reply-To: <20210611132830.i6wwm3fvytri6czu@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Fri, 11 Jun 2021 20:35:01 +0300
Message-ID: <CAMRbyytDeniKkg4Bjcqry8203RHWzAKmAMdSELnLquBkXJNXvQ@mail.gmail.com>
Subject: Re: [PATCH] qemu-{img,nbd}: Don't report zeroed cluster as a hole
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Nir Soffer <nirsof@gmail.com>, qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 11, 2021 at 4:28 PM Eric Blake <eblake@redhat.com> wrote:
>
> On Fri, Jun 11, 2021 at 10:09:09AM +0200, Kevin Wolf wrote:
> > > Yes, that might work as well.  But we didn't previously document
> > > depth to be optional.  Removing something from output risks breaking
> > > more downstream tools that expect it to be non-optional, compared to
> > > providing a new value.
> >
> > A negative value isn't any less unexpected than a missing key. I don't
> > think any existing tool would be able to handle it. Encoding different
> > meanings in a single value isn't very QAPI-like either. Usually strings
> > that are parsed are the problem, but negative integers really isn't that
> > much different. I don't really like this solution.
> >
> > Leaving out the depth feels like a better suggestion to me.
> >
> > But anyway, this seems to only happen at the end of the backing chain.
> > So if the backing chain consistents of n images, why not report 'depth':
> > n + 1? So, in the above example, you would get 1. I think this has the
> > best chances of tools actually working correctly with the new output,
> > even though it's still not unlikely to break something.
>
> Ooh, I like that.  It is closer to reality - the file data really
> comes from the next depth, even if we have no filename at that depth.
> v2 of my patch coming up.

How do you know the number of the layer? this info is not presented in
qemu-img map output.

Users will have to run "qemu-img info --backing-chain" to understand the
output of qemu-img map.


