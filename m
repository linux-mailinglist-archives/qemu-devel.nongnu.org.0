Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788A4346198
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:37:13 +0100 (CET)
Received: from localhost ([::1]:59472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOi9g-0001VO-8o
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lOi7C-000820-7W
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:34:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lOi79-0002og-VP
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:34:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616510074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NMY7YlBbVWf1V3cdfGyv/Eix6pURv8YmSte2vCqSGK0=;
 b=AtQAswGOMwYwkIKsur9f54hV2iAY0u1wXeo6GsWUK2aSBD0TOoxbN0Jtel+N/ST5NU7BpQ
 tn2hd6DuPbxLyfLzsCV3c/+kjHRirWkXVYDrTOunCGx77hFLWzGr3YEL9hd+TuaU9SV62L
 JVxN95m9L00QyRl5Iz9ZQSDEOYgWHfc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-m-FjZKuROry3Xjj9KgwqXQ-1; Tue, 23 Mar 2021 10:34:32 -0400
X-MC-Unique: m-FjZKuROry3Xjj9KgwqXQ-1
Received: by mail-qv1-f70.google.com with SMTP id j3so1728254qvo.1
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 07:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NMY7YlBbVWf1V3cdfGyv/Eix6pURv8YmSte2vCqSGK0=;
 b=hbAnlPdkDUmWlOHvJtOgz8FiKJm9atBKK2ZPcqBZ4hcZBMh/N1ItEPXSdilFs8GVMF
 i0zVk8zeDEeMwWPHo8CrAlCkSyeZX7/WAQG5n/hi9MLqnGPOj1hT9vprj+aEZMeshVQ1
 JVP/QPhhU3du/KwDtV6rNtO8teH/yZKAmb1p9Md6oly41Q8UmpUMRP1mBWeZkuEls+Bk
 Hm5VNfn9F11e4DU4erg/eVJRv7+wr90ynnSMY5m+70uzJkmy03lkCTdlixYavxMN7wnl
 ymprkLt/tKzWxHGW9l4xwCYuCP9aTZTfK3I86mMjZgmOrZxeFAxxRMbNvJhp3SqKZWVC
 KRSg==
X-Gm-Message-State: AOAM533Xol2K819KgKhjDYisjSY34i1LYmSIPoD9LS/c3aVjz7M6IYcM
 kK9fJLkNsGzRxNbdjs6vIl54NXU5JTsqSz7mpeBNEp+AOzMW7femkcmfkYRFxVJksIpj1iwXVZv
 QxMbfUkBjH8VsVFE=
X-Received: by 2002:ac8:43c2:: with SMTP id w2mr4630142qtn.95.1616510072338;
 Tue, 23 Mar 2021 07:34:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwOcuZYnNRksjHE6FE0/rfWd/RGG3PzFqjymP2AQ8Htz2eQdVeM2ObBF13+3/FbxgHTVufaQ==
X-Received: by 2002:ac8:43c2:: with SMTP id w2mr4630120qtn.95.1616510071981;
 Tue, 23 Mar 2021 07:34:31 -0700 (PDT)
Received: from xz-x1 (bras-base-toroon474qw-grc-82-174-91-135-175.dsl.bell.ca.
 [174.91.135.175])
 by smtp.gmail.com with ESMTPSA id 21sm13830870qkv.12.2021.03.23.07.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 07:34:31 -0700 (PDT)
Date: Tue, 23 Mar 2021 10:34:29 -0400
From: Peter Xu <peterx@redhat.com>
To: Keqian Zhu <zhukeqian1@huawei.com>
Subject: Re: [PATCH v5 00/10] KVM: Dirty ring support (QEMU part)
Message-ID: <20210323143429.GB6486@xz-x1>
References: <20210310203301.194842-1-peterx@redhat.com>
 <2e057323-8102-7bfc-051b-cd3950c93875@huawei.com>
 <20210322194533.GE16645@xz-x1>
 <ddf6bf41-ab29-8bbc-d3fb-94938e42e215@huawei.com>
MIME-Version: 1.0
In-Reply-To: <ddf6bf41-ab29-8bbc-d3fb-94938e42e215@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Keqian,

On Tue, Mar 23, 2021 at 02:40:43PM +0800, Keqian Zhu wrote:
> >> The second question is that you observed longer migration time (55s->73s) when guest
> >> has 24G ram and dirty rate is 800M/s. I am not clear about the reason. As with dirty
> >> ring enabled, Qemu can get dirty info faster which means it handles dirty page more
> >> quick, and guest can be throttled which means dirty page is generated slower. What's
> >> the rationale for the longer migration time?
> > 
> > Because dirty ring is more sensitive to dirty rate, while dirty bitmap is more
> Emm... Sorry that I'm very clear about this... I think that higher dirty rate doesn't cause
> slower dirty_log_sync compared to that of legacy bitmap mode. Besides, higher dirty rate
> means we may have more full-exit, which can properly limit the dirty rate. So it seems that
> dirty ring "prefers" higher dirty rate.

When I measured the 800MB/s it's in the guest, after throttling.

Imagine another example: a VM has 1G memory keep dirtying with 10GB/s.  Dirty
logging will need to collect even less for each iteration because memory size
shrinked, collect even less frequent due to the high dirty rate, however dirty
ring will use 100% cpu power to collect dirty pages because the ring keeps full.

> 
> > sensitive to memory footprint.  In above 24G mem + 800MB/s dirty rate
> > condition, dirty bitmap seems to be more efficient, say, collecting dirty
> > bitmap of 24G mem (24G/4K/8=0.75MB) for each migration cycle is fast enough.
> > 
> > Not to mention that current implementation of dirty ring in QEMU is not
> > complete - we still have two more layers of dirty bitmap, so it's actually a
> > mixture of dirty bitmap and dirty ring.  This series is more like a POC on
> > dirty ring interface, so as to let QEMU be able to run on KVM dirty ring.
> > E.g., we won't have hang issue when getting dirty pages since it's totally
> > async, however we'll still have some legacy dirty bitmap issues e.g. memory
> > consumption of userspace dirty bitmaps are still linear to memory footprint.
> The plan looks good and coordinated, but I have a concern. Our dirty ring actually depends
> on the structure of hardware logging buffer (PML buffer). We can't say it can be properly
> adapted to all kinds of hardware design in the future.

Sorry I don't get it - dirty ring can work with pure page wr-protect too?

> 
> > 
> > Moreover, IMHO another important feature that dirty ring provided is actually
> > the full-exit, where we can pause a vcpu when it dirties too fast, while other
> I think a proper pause time is hard to decide. Short time may have little effect
> of throttle, but long time may have heavy effect on guest. Do you have a good algorithm?

That's the next thing we can discuss.  IMHO I think the dirty ring is nice
already because we can measure dirty rate per-vcpu, also we can throttle in
vcpu granule.  That's something required for a good algorithm, say we shouldn't
block vcpu when there's small dirty rate, and in many cases that's the case for
e.g. UI threads.  Any algorithm should be based on these facts.

Thanks,

-- 
Peter Xu


