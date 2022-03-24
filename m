Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E75224E65F7
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 16:29:36 +0100 (CET)
Received: from localhost ([::1]:39110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXPP5-000238-GI
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 11:29:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nXPLQ-0000Ll-G9
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 11:25:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nXPLN-00028T-PP
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 11:25:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648135544;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RCXFBsSng5gy7PhUg6tI8h6FLUT3M3uLVhX4kLdgOqc=;
 b=JaVi/e1U2GeUTg+4BypWbnGNLbh5kgEvqfW7C3+r+DqWhXviDMmKIiVjWc0ftZ5C33l5lO
 H88UMpe7G8GaUM4I6QSvsXZkRqJ6J85GIbHTX+isG03+PYQ6sewPx2jai66sPvA85IJ21Q
 xWCNBg08BEXDh3MrbdmW4YiBMsZXmyY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-OwVfLWx3Mo-HjMthnS7fbg-1; Thu, 24 Mar 2022 11:25:40 -0400
X-MC-Unique: OwVfLWx3Mo-HjMthnS7fbg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5C30811E76;
 Thu, 24 Mar 2022 15:25:39 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65E51401476;
 Thu, 24 Mar 2022 15:25:38 +0000 (UTC)
Date: Thu, 24 Mar 2022 15:25:36 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 01/10] python/aqmp: add explicit GPLv2 license to legacy.py
Message-ID: <YjyNcDjRLWZGiEwU@redhat.com>
References: <20220321210847.914787-1-jsnow@redhat.com>
 <20220321210847.914787-2-jsnow@redhat.com>
 <CAFn=p-YM8VoXLMBz4nmkvkAMH8SHa+uT=Wx9F77Q-xKrea9GLg@mail.gmail.com>
 <YjwzCM3/wZ4S2fxf@redhat.com> <Yjwzy97JAHKhvCHn@redhat.com>
 <CAFn=p-Zj24yJYvPTpnXLA3wG-Fm8okVTXM-QG0rSAjp3AJuCvQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-Zj24yJYvPTpnXLA3wG-Fm8okVTXM-QG0rSAjp3AJuCvQ@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Luiz Capitulino <lcapitulino@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 11:03:12AM -0400, John Snow wrote:
> On Thu, Mar 24, 2022, 5:03 AM Daniel P. Berrangé <berrange@redhat.com>
> wrote:
> 
> > On Thu, Mar 24, 2022 at 09:00:05AM +0000, Daniel P. Berrangé wrote:
> > > I've not fully audited the git history, but what little I've looked
> > > at, the relicensing doesn't look too hard. The overwhealming majority
> > > of code was by @redhat.com authors, so we can cope with that fairly
> > > easily. There are a handful of other contributors still around in
> > > QEMU, and some of the patches are so trivial you couldn't claim
> > > copyright on them ie where adding 1 parameter to a method call is
> > > literally the only possible way you could implmenent the change.
> > > It is never fun to contact everyone, but it looks viable.
> > >
> > > > (2) Re-licensing async QMP as GPLv2+. (Next patch)
> > > >
> > > > (3) Someday, eventually, adding a different sync interface that
> > > > doesn't re-mix this specific compatibility interface and will provide
> > > > better event-waiting primitives and so on. legacy.py will get dropped
> > > > at that point and the sub-project will become wholly GPLv2+. Until
> > > > then, it will be mixed.
> > >
> > > Overall making it *all* GPLv2+ compat is going to be important if you
> > > want people to be comfortable using it. If it has a mix of GPLv2+
> > > and GPLv2-only code in the source tarball, then the overall combined
> > > work will have to be considered GPLv2-only and that will put people
> > > off using it. Even if they could theoreticallly restrict their usage
> > > to only the GPLv2+ parts, many won't get that far before moving on.
> >
> 
> I agree. Just a matter of which intermediate states we'll see enroute.
> 
> 
> > Actually I'll go furthuer and suggest that if we're going to do a
> > relicensing at all, and your goal is to encourage usage, then GPLv2+
> > is the wrong choice. Use LGPLv2+ if you want to facilitate usage, while
> > retaining a copyleft license.
> >
> 
> Same question as Andrea. Does the linking exception matter for Python? (The
> lawyer seemed to intuit to me that it was somewhat untested. I don't think
> the answer was clear.)
> 
> I have no opposition towards LGPL whatsoever, so I guess if it doesn't hurt
> anything I can just do that instead.

Let us contemplate two scenarios

 - GPL vs LGPL  *does* make a legal difference for Python, in the
   same way it does for C

      => Using LGPL over GPL is therefore a benefit for QEMU users

 - GPL vs LGPL does *not* make  a legal difference for Python, in
   the same way it does for C

      => Using LGPL over GPL makes zero differnce for QEMU users

In the absence of information that can confidently predict
which scenario applies, then the right answer is to pick LGPL.
It might be a benefit, and if no, it has no downside [1].


[1] Yes, there could be some subtle reason why LGPL is worse
    than GPL in Python than in C, but I've not seen sign of
    that being raised, and I have seen plenty of POVs saying
    LGPL is still a benefit.

> (The lawyer did suggest that MIT was likely the absolute most compatible
> license I could choose here; but I'm unsure I want to open the floodgates
> that wide without strong reason. MIT feels like an off-ramp out of open
> source, and I like to avoid it when possible. That said, the point of this
> package is to get people to use QEMU and drive them towards our GPL project
> and ecosystem, so... Maybe MIT would be reasonable. Still, if this
> component grows in complexity and becomes integrated into a commercial
> product, I'd be *pretty upset* if any improvements were not published for
> everyone to benefit from. I think that's why I lean GPL, even though I want
> to maximize use.)

Yep, as I mentioned, I don't want to see us abandon copyleft either.

Of course everyone has their own preferred license, so I'm sure
people who write apps with MIT, will think we should use MIT
too. Ultimately though, if we choose LGPL, they can still use
our module from an MIT licensed app, or any other licensed app
for that matter.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


