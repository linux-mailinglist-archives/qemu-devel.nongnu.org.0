Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C1831A26D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 17:14:36 +0100 (CET)
Received: from localhost ([::1]:33124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAb5W-0005GP-54
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 11:14:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lAb2e-0003Ss-40
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 11:11:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lAb2b-0008EA-ML
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 11:11:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613146292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oMCavK1Ol2piwDt6OW0ejqA5E2qdYfICFRNHZyp3KaM=;
 b=XFXSwajnhKC86/4LZvpXNKyTgJf3psQ32hLkzHI41mJdqVdXna4qnuX5gaCKUqE2pZy+p/
 p990loVrN8cPTDj9W5Y+v8O9a2ecsaImviJqA+MnQun6T/EdnNBDVjG+CMvANDnff4rMBl
 AaPzDfOVhrMoeDvKT6HvOqUWHyegNTo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-PiJcnXQ6OiOUlBELL05SgA-1; Fri, 12 Feb 2021 11:11:28 -0500
X-MC-Unique: PiJcnXQ6OiOUlBELL05SgA-1
Received: by mail-qk1-f199.google.com with SMTP id h7so7683982qkf.16
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 08:11:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oMCavK1Ol2piwDt6OW0ejqA5E2qdYfICFRNHZyp3KaM=;
 b=mZ7B+tstGkt7d/l6erqv2/eVFHlo+jK0N6jfB0Z15+UP//U9PB5bzwVf64XhyANB+Z
 7XTkhI3C6oKPS0j/f2iQDjBuLOdhUld7RXEK7b04GrlYLrkv4IGX1c9slqRu2bzGp7ef
 BEoq3dV37R3xGP4lBNCbXftOJixE8StXr8BIzldKelhfeF0w+pe3GbkWdOeKVExvF/rQ
 22QohkqOQnqvPe3+kI37pzPDAerjxrKj6qGec6YzC3puVW2e6DsAdy/Jpzsh8xWPUd2W
 0k7abcgkjrGoCbKVFKHTwnpxExJTYm+0tCa2eE6UbpoIAOi4iOt8HzHzDBW6Hu6uPqCP
 rRQg==
X-Gm-Message-State: AOAM532V9jgLEm8k4HgWIOQQVX1MR26/Y467K471s13q08EjXsPC/3Qz
 AZP97s+uTxGKM3Aanr0iCnPNrV87ShRJzaj1Jc4+B7G/6p6QHiHXT/91Nj2ClSHc2Vet9sfKBi3
 bOGQK7JViW3KsdQ0=
X-Received: by 2002:a05:6214:a4f:: with SMTP id
 ee15mr3179914qvb.10.1613146288491; 
 Fri, 12 Feb 2021 08:11:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFHetDJsV6nA/3E/UUp/OpWWWATRVuyXRZ29U9k1uV+Gtpz0Zl4ZCiLGIOdNKo8gpO0WlLZg==
X-Received: by 2002:a05:6214:a4f:: with SMTP id
 ee15mr3179908qvb.10.1613146288322; 
 Fri, 12 Feb 2021 08:11:28 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-182.dsl.bell.ca. [174.93.89.182])
 by smtp.gmail.com with ESMTPSA id x15sm3708091qka.53.2021.02.12.08.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 08:11:27 -0800 (PST)
Date: Fri, 12 Feb 2021 11:11:25 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
Message-ID: <20210212161125.GH157159@xz-x1>
References: <20210211210549.GE157159@xz-x1>
 <4E588B57-AAC8-40DD-9260-541836074DB3@redhat.com>
 <20210212030621.GF157159@xz-x1>
 <79c3ebb9-82ba-4714-0cf1-9f2e08eff660@redhat.com>
MIME-Version: 1.0
In-Reply-To: <79c3ebb9-82ba-4714-0cf1-9f2e08eff660@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alexander Duyck <alexander.duyck@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Den Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 12, 2021 at 09:52:52AM +0100, David Hildenbrand wrote:
> On 12.02.21 04:06, Peter Xu wrote:
> > On Thu, Feb 11, 2021 at 10:09:58PM +0100, David Hildenbrand wrote:
> > > The issue is when the discard happened before starting the snapshot. Write-protection won‘t work and the zeroed content won‘t be retained in the snapshot.
> > 
> > I see what you mean now, and iiuc it will only be a problem if init_on_free=1.
> > I think CONFIG_INIT_ON_FREE_DEFAULT_ON should be off for most distros, so the
> 
> Yes, some distros seem to enable init_on_alloc instead. Looking at the
> introducing commit 6471384af2a6 ("mm: security: introduce init_on_alloc=1
> and init_on_free=1 boot options") there are security use cases and it might
> become important with memory tagging.
> 
> Note that in Linux, there was also the option to poison pages with 0,
> removed via f289041ed4cf ("mm, page_poison: remove
> CONFIG_PAGE_POISONING_ZERO"), available in some kernels that supported free
> page reporting.
> 
> It got removed and use cases got told to use init_on_free.
> 
> > impact should be small, I think.  I thought about it, but indeed I didn't see a
> > good way to fix this if without fixing the zero page copy for live snapshot.
> 
> We should really document this (unexpected) behavior of snapshotting.
> Otherwise, the next feature comes around that relies on pages that were
> discarded to remain zeroed (I even have one in mind ;) ) and forgets to
> disable snapshots.

Agreed.  I'll see whether Andrey would have any idea to workaround this, or
further comment.  Or I can draft a patch to document this next week (or unless
Andrey would beat me to it :).

-- 
Peter Xu


