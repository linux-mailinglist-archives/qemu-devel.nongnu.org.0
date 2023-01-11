Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B22665E06
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 15:33:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFc6C-0002oR-RF; Wed, 11 Jan 2023 09:29:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pFc68-0002nf-8Z
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 09:29:00 -0500
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pFc66-0000hr-Kk
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 09:28:59 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-4c15c4fc8ccso197171487b3.4
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 06:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bkHUlskNraS5O2nG3Dhu3L9Enaqyxk8ONudZfAoHeXc=;
 b=TLd3C8GgLRP/G/wMFHSbO7dSlOM2fpknDJyZ4wg5rVG936K8D47xflRDrbDTqwlEW5
 /XtT9OLHwFH05dFquynjBHIVa4HsnZ/wx/IxgRWSHJ1j8tD+QCn7tiMhlwLgzNQ9saKn
 LVt7bLuFZoh6AT90rH/z3tYKC5TfX6DLYV8AG2qxE/IcLyW8mSsmlqtpNszHbhn3AZbq
 QmO4VD0P8SEFidTSKx5S+UVmv6e33S+qJVtni2A3Jh/jzQVxP86h30rTn16E7hnO6mVI
 ukJLpF/hDF4LwZ+LFC3Vhmd3bLkZRrPBF3Uj8H00SQuzO0VQxPVhgAZ/y07JgMCKYGwA
 YZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bkHUlskNraS5O2nG3Dhu3L9Enaqyxk8ONudZfAoHeXc=;
 b=Qao8zf324fbH36bmNT69BHc/fCyyb2fOSZ3eHli27fukJ5GXecLexTQcIgj9TUpocA
 NzJ840N9Q1ba+/xx3i9uyv9HZMbzozvPt+5QVqE2o1xI3/An6F1sFBqbIf2Y2FpcagLt
 Kl5zsY6BxOIm8Lw8QhLeok21h+vLexTGX8qWuo3lFp5lqB8Z8pIRc9rj07rrqIy3D+ex
 AM6RUROJQNM6dRd3AI6FskPhzOko6BpKBBRFeUd8T9dNLE7324Oo598WP855BOr9ecbu
 NB1gSZnj6QosfuaHIzu/gQL6oH8cgtv0bfXcinuY+kakdryS9SuSmMVsHC6qGxJbwjgm
 Dfkg==
X-Gm-Message-State: AFqh2kpIyUlV6glpJukqrvADlRcCxHcs2eQGWF+VAIwegZnuS7JhCezJ
 fEes14yaMa4lJ77rObUyb9OkTSWlBdALXg45w24=
X-Google-Smtp-Source: AMrXdXs0VJWY2D/6BDWHALufsa8cbguKMmfWK1XtAV6MJO0e8IyGH01NH3Zck7QGzZnUe6qs02AklpCqToPcZLZyLeg=
X-Received: by 2002:a81:7949:0:b0:3eb:447b:56cc with SMTP id
 u70-20020a817949000000b003eb447b56ccmr2140697ywc.296.1673447337172; Wed, 11
 Jan 2023 06:28:57 -0800 (PST)
MIME-Version: 1.0
References: <20220905000021.157613-1-afaria@redhat.com>
 <CABgObfahkrhwwn6+D7uUbqKYPXmA3mQGXHwe6f-TiA+iQoFyAQ@mail.gmail.com>
 <CAELaAXzhsNYQZV_FCmaY06x0UOqPTw3Lwsao1veBCq+eM4eayg@mail.gmail.com>
In-Reply-To: <CAELaAXzhsNYQZV_FCmaY06x0UOqPTw3Lwsao1veBCq+eM4eayg@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 11 Jan 2023 09:28:45 -0500
Message-ID: <CAJSP0QXURhnhcKBz28hK9DR3-xzprO831sZfVwLJ6=hDudmaKQ@mail.gmail.com>
Subject: Re: [PATCH v2] softmmu/physmem: Fix address of FlatView access in
 address_space_(read|write)_cached_slow()
To: Alberto Faria <afaria@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 David Hildenbrand <david@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 2 Dec 2022 at 07:31, Alberto Faria <afaria@redhat.com> wrote:
>
> On Mon, Sep 5, 2022 at 8:45 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> > Thanks, I will queue it.
> >
> > Paolo
> >
> > Il lun 5 set 2022, 02:00 Alberto Faria <afaria@redhat.com> ha scritto:
> >>
> >> flatview_(read|write)_continue() must be called with an address in the
> >> FlatView's address space, but `addr` is relative to the
> >> MemoryRegionCache.
> >>
> >> Convert `addr` from the MemoryRegionCache's address space to the
> >> FlatView's before passing it to flatview_(read|write)_continue().
> >>
> >> This problem was uncovered while attempting to perform unaligned writes,
> >> which caused flatview_write_continue() to reach the call to
> >> flatview_translate(), which then translated the erroneous address and
> >> caused the subsequent write to fail.
> >>
> >> Fixes: 48564041a7 ("exec: reintroduce MemoryRegion caching")
> >> Co-Developed-by: Stefan Hajnoczi <stefanha@redhat.com>
> >> Signed-off-by: Alberto Faria <afaria@redhat.com>
> >> ---
> >>  softmmu/physmem.c | 18 ++++++++++++++----
> >>  1 file changed, 14 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> >> index 50231bab30..bdde4eb927 100644
> >> --- a/softmmu/physmem.c
> >> +++ b/softmmu/physmem.c
> >> @@ -3420,6 +3420,14 @@ static inline MemoryRegion *address_space_translate_cached(
> >>      return section.mr;
> >>  }
> >>
> >> +/* Converts `addr` from the address space of `cache` to that of `cache->fv`. */
> >> +static inline hwaddr addr_in_cache_to_in_flat_view(MemoryRegionCache *cache,
> >> +                                                   hwaddr addr)
> >> +{
> >> +    hwaddr addr_in_mrs = addr + cache->xlat - cache->mrs.offset_within_region;
> >> +    return addr_in_mrs + cache->mrs.offset_within_address_space;
> >> +}
> >> +
> >>  /* Called from RCU critical section. address_space_read_cached uses this
> >>   * out of line function when the target is an MMIO or IOMMU region.
> >>   */
> >> @@ -3434,8 +3442,9 @@ address_space_read_cached_slow(MemoryRegionCache *cache, hwaddr addr,
> >>      mr = address_space_translate_cached(cache, addr, &addr1, &l, false,
> >>                                          MEMTXATTRS_UNSPECIFIED);
> >>      return flatview_read_continue(cache->fv,
> >> -                                  addr, MEMTXATTRS_UNSPECIFIED, buf, len,
> >> -                                  addr1, l, mr);
> >> +                                  addr_in_cache_to_in_flat_view(cache, addr),
> >> +                                  MEMTXATTRS_UNSPECIFIED, buf, len, addr1, l,
> >> +                                  mr);
> >>  }
> >>
> >>  /* Called from RCU critical section. address_space_write_cached uses this
> >> @@ -3452,8 +3461,9 @@ address_space_write_cached_slow(MemoryRegionCache *cache, hwaddr addr,
> >>      mr = address_space_translate_cached(cache, addr, &addr1, &l, true,
> >>                                          MEMTXATTRS_UNSPECIFIED);
> >>      return flatview_write_continue(cache->fv,
> >> -                                   addr, MEMTXATTRS_UNSPECIFIED, buf, len,
> >> -                                   addr1, l, mr);
> >> +                                   addr_in_cache_to_in_flat_view(cache, addr),
> >> +                                   MEMTXATTRS_UNSPECIFIED, buf, len, addr1, l,
> >> +                                   mr);
> >>  }
> >>
> >>  #define ARG1_DECL                MemoryRegionCache *cache
> >> --
> >> 2.37.2
>
> This doesn't seem to be in master yet. Maybe it fell through the cracks?

Ping.

Stefan

