Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B69184AD812
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 13:00:19 +0100 (CET)
Received: from localhost ([::1]:42116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHPAQ-0007FY-PZ
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 07:00:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nHObg-0004hy-Hm
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:24:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nHObe-0007lm-Dc
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:24:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644319461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iiYw9lIfXngfJ+pKeVMgYKidyLrgHKUi2M5cB7bVsuc=;
 b=Pwmq7snYjOFEfVUGvl7iZmuZ6uGlSmsDJqAVeC5Bwiyz6UHqHlxOvDvzU5zVR+Mu7KInvW
 VsXHHuaqMggi8kEDWWSUgTYyW6AVD8F/H83dlCUCbe5Wz/7IwnxLjnZYryHvvh5+qoOIy7
 oY2ejfHQOHY6WBAiXoCPnPnkrT01SSg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-1AO0i0IQNv6NCMA8-juNFg-1; Tue, 08 Feb 2022 06:24:18 -0500
X-MC-Unique: 1AO0i0IQNv6NCMA8-juNFg-1
Received: by mail-wr1-f71.google.com with SMTP id
 w7-20020adfbac7000000b001d6f75e4faeso5949776wrg.7
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:24:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iiYw9lIfXngfJ+pKeVMgYKidyLrgHKUi2M5cB7bVsuc=;
 b=wy1N+mRgDSmf8lryoNqWO8xxjT5bKlL94MISzxURxrXm5vVjZ9SDQZSMjAjY7FCmcA
 wNoqvyZqD3iM063NQu4RK5mOrmrnBO8Y4qNCM4svVy05h68gxtxJT4pJwWqMg798SpJl
 Do8Y9NR/moADudoE+Zvnmyh4Q+RJBvGTJSudUrwZNGbUNefCwe1sSyyq5UQ865yw3hbg
 D+yjVIgjEITMRtc17n75m87gGNdSjvGqZ3ZOMSZkgYB517dDfUARysJziFYbnrnQbCie
 oFdtktxMtyB8/KxfibVM/oCnbVrWkiM53xaBNfko4H4PSoMikkft+QSOj/yCtRufmMvv
 ZskA==
X-Gm-Message-State: AOAM532bw6bGMLe0FGLO3TbnMz8wVELyN3jeInv8x3lCgPr28a8Dv/Xk
 OWBu+2RCihZ8K8jsnmvdrdlcT+6EyQvjheRL1N0HXNDmKUYzpiW7NgYTk9gr0xgDxlOe7vb30e5
 m9STqtuTYaW1TB4U=
X-Received: by 2002:a05:600c:1914:: with SMTP id
 j20mr718994wmq.51.1644319457684; 
 Tue, 08 Feb 2022 03:24:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMhudZCEDJ9s/h1MXYLxOMYR7i/vjdxPs5TyXkxRIuK61zQ6+qymQiuAXFuYJVvjq3x2rZ2Q==
X-Received: by 2002:a05:600c:1914:: with SMTP id
 j20mr718972wmq.51.1644319457426; 
 Tue, 08 Feb 2022 03:24:17 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id j15sm2263411wmq.19.2022.02.08.03.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:24:16 -0800 (PST)
Date: Tue, 8 Feb 2022 11:24:14 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC 14/15] migration: Postcopy preemption on separate
 channel
Message-ID: <YgJS3qUuyopB+JFZ@work-vm>
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-15-peterx@redhat.com>
 <YfwUvGfE46G1oXOv@work-vm> <YgHv/4Ep4JUhfLB4@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <YgHv/4Ep4JUhfLB4@xz-m1.local>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> On Thu, Feb 03, 2022 at 05:45:32PM +0000, Dr. David Alan Gilbert wrote:
> > * Peter Xu (peterx@redhat.com) wrote:
> > > This patch enables postcopy-preempt feature.
> > > 
> > > It contains two major changes to the migration logic:
> > > 
> > >   (1) Postcopy requests are now sent via a different socket from precopy
> > >       background migration stream, so as to be isolated from very high page
> > >       request delays
> > > 
> > >   (2) For huge page enabled hosts: when there's postcopy requests, they can now
> > >       intercept a partial sending of huge host pages on src QEMU.
> > > 
> > > After this patch, we'll have two "channels" (or say, sockets, because it's only
> > > supported on socket-based channels) for postcopy: (1) PRECOPY channel (which is
> > > the default channel that transfers background pages), and (2) POSTCOPY
> > > channel (which only transfers requested pages).
> > > 
> > > On the source QEMU, when we found a postcopy request, we'll interrupt the
> > > PRECOPY channel sending process and quickly switch to the POSTCOPY channel.
> > > After we serviced all the high priority postcopy pages, we'll switch back to
> > > PRECOPY channel so that we'll continue to send the interrupted huge page again.
> > > There's no new thread introduced.
> > > 
> > > On the destination QEMU, one new thread is introduced to receive page data from
> > > the postcopy specific socket.
> > > 
> > > This patch has a side effect.  After sending postcopy pages, previously we'll
> > > assume the guest will access follow up pages so we'll keep sending from there.
> > > Now it's changed.  Instead of going on with a postcopy requested page, we'll go
> > > back and continue sending the precopy huge page (which can be intercepted by a
> > > postcopy request so the huge page can be sent partially before).
> > > 
> > > Whether that's a problem is debatable, because "assuming the guest will
> > > continue to access the next page" doesn't really suite when huge pages are
> > > used, especially if the huge page is large (e.g. 1GB pages).  So that locality
> > > hint is much meaningless if huge pages are used.
> > > 
> > > If postcopy preempt is enabled, a separate channel is created for it so that it
> > > can be used later for postcopy specific page requests.  On dst node, a
> > > standalone thread is used to receive postcopy requested pages.  The thread is
> > > created along with the ram listen thread during POSTCOPY_LISTEN phase.
> > 
> > I think this patch could do with being split into two; the first one that
> > deals with closing/opening channels; and the second that handles the
> > data on the two channels and does the preemption.
> 
> Sounds good, I'll give it a shot on the split.
> 
> > 
> > Another thought is whether, if in the future we allow multifd +
> > postcopy, the multifd code would change - I think it would end up closer
> > to using multiple channels taking different pages on each one.
> 
> Right, so potentially the postcopy channels can be multi-threaded too itself.
> 
> We've had a quick discussion on irc, just to recap: I didn't reuse multifd
> infra because IMO multifd is designed with below ideas in mind:
> 
>   (1) Every multifd thread is equal
>   (2) Throughput oriented
> 
> However I found that postcopy needs something different when they're mixed up
> together with multifd.
> 
> Firstly, we will have some channels sending as much as we could where latency
> is not an issue (aka background pages).  However it's not suitable for page
> requests, so we could also have channels that are servicing page faults fron
> dst.  In short, there're two types of channels/threads we want, and we may want
> to treat them differently.
> 
> The current model is we only have 1 postcopy channel and 1 precopy channel, but
> it should be easier if we want to make it N post + 1 pre base on this series.

It's not clear to me if we need to be able to do N post + M pre, or
whether we have a rule like always at least 1 post, but if there's more
pagefaults in the queue then you can steal all of the pre channels.

> So far all send() is still done in the migration thread so no new sender thread
> but 1 more receiver thread only. If we want to grow that 1->N for postcopy
> channels we may want to move that out too just like what we do with multifd.
> Not sure whether there can be something reused around.  That's where I haven't
> yet explored, but this series should already share a common piece of code on
> refactoring of things like tmp huge page on dst node to be able to receive with
> multiple huge pages.

Right; it makes me think the multifd+postcopy should just use channels.

> This also reminded me that, instead of a new capability, should I simply expose
> a parameter "postcopy-channels=N" to CLI so that we can be prepared with multi
> postcopy channels?

I'm not sure we know enough yet about what configuration it would have;
I'd be tempted to just make it work for the user by enabling both
multifd and preemption and then using this new mechanism rather than
having to add yet another parameter.

Dave

> > 
> > 
> > Do we need to do anything in psotcopy recovery ?
> 
> Yes. It's a todo (in the cover letter), if the whole thing looks sane I'll add
> that together in the non-rfc series.
> 
> Thanks,
> 
> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


