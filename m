Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 908134ACFBB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 04:24:08 +0100 (CET)
Received: from localhost ([::1]:36654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHH6t-0007V6-3t
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 22:24:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nHH4C-00061S-OK
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 22:21:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nHH46-0007Qf-T7
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 22:21:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644290448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zL0V9UofpLH5aJbMY6ir/5P5JAFtNm1DlT0lymA7OoM=;
 b=TBhndGd6qC7SROBZn3Ojm72QhNV/EfOF4Ii8jJLNkRMWhuXbGfZ9+LeIkjTW2Zl0imjDBi
 bhrTNnlRzkQDR+ijGLzmKGAbrbhqD+DHNSZW2zai+lJJ+2g5lCs2yNiBS+RWiX5X3a+aAO
 GC/X0tvIXIi6GtKR3RyuxWKGP5pXjCg=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-TgLIbAWQMqKls8XAS9WsUg-1; Mon, 07 Feb 2022 22:20:46 -0500
X-MC-Unique: TgLIbAWQMqKls8XAS9WsUg-1
Received: by mail-pj1-f69.google.com with SMTP id
 gj12-20020a17090b108c00b001b89b5f3dd4so656101pjb.6
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 19:20:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zL0V9UofpLH5aJbMY6ir/5P5JAFtNm1DlT0lymA7OoM=;
 b=dLheUmXZh9WumHnz//pI5SIZUiBU7c9E5v3MMuc9X5bTg+OmSMcS9NO2HKuKNHC4ZJ
 Fj5cAOCGPA8+qgcKdDQZnjba6adzTeasmSzZg3XSkRcCFAUssggjP/f4prZ9VaQRcmfh
 2Fy2Nug4oNVm1onGne/1rreyhzMayMEA9DHm4gYp4LtgKC3nQY8LVwOu1YR7+AQCEDEY
 o0O8KIUwHg3bp/6nlb6IGEW4NBDnL1lQ+seBX6jHMKRN2I+fs7P8ybCz4SKWzpJuoJ1p
 ZBWWAcYiNR5S53UjrBHe/NGI2uY3pvF1lT55ON9U01gJGL3zX2Y0sc0qCngRJsC2ig9b
 P4aw==
X-Gm-Message-State: AOAM533hV2BftrujfmDokoYs0kBWSAHhdr5Jetnk8nLThlKahsdsfKSj
 pCm5VqhLwebwzXuiZSnhRbxABCjbs1P1tWpzIUZQ6FzEuqTrHQvuPcOey1C28iq1l1AVK/i1g+3
 c99u7LE74iQg0ncs=
X-Received: by 2002:a17:90a:8804:: with SMTP id
 s4mr2177173pjn.129.1644290445352; 
 Mon, 07 Feb 2022 19:20:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3gpzSEHd0w9pvQCXDd0rKGDH5umZDzOd/rbcIUfJK8k9ikqIVMWGs3cO6g9z5C99l9Uc/Uw==
X-Received: by 2002:a17:90a:8804:: with SMTP id
 s4mr2177149pjn.129.1644290444983; 
 Mon, 07 Feb 2022 19:20:44 -0800 (PST)
Received: from xz-m1.local ([94.177.118.121])
 by smtp.gmail.com with ESMTPSA id pj4sm704416pjb.43.2022.02.07.19.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 19:20:44 -0800 (PST)
Date: Tue, 8 Feb 2022 11:20:38 +0800
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 02/15] migration: Allow pss->page jump over clean pages
Message-ID: <YgHhhtyeaqxqVSxc@xz-m1.local>
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-3-peterx@redhat.com>
 <YegVV6lmkkmKBv9p@work-vm> <YejE8+F1l0ugJruR@xz-m1.local>
 <YfwcqgbYEVtfSAbH@work-vm>
MIME-Version: 1.0
In-Reply-To: <YfwcqgbYEVtfSAbH@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
Cc: Kunkun Jiang <jiangkunkun@huawei.com>, Juan Quintela <quintela@redhat.com>,
 Keqian Zhu <zhukeqian1@huawei.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 03, 2022 at 06:19:22PM +0000, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > On Wed, Jan 19, 2022 at 01:42:47PM +0000, Dr. David Alan Gilbert wrote:
> > > * Peter Xu (peterx@redhat.com) wrote:
> > > > Commit ba1b7c812c ("migration/ram: Optimize ram_save_host_page()") managed to
> > > > optimize host huge page use case by scanning the dirty bitmap when looking for
> > > > the next dirty small page to migrate.
> > > > 
> > > > However when updating the pss->page before returning from that function, we
> > > > used MIN() of these two values: (1) next dirty bit, or (2) end of current sent
> > > > huge page, to fix up pss->page.
> > > > 
> > > > That sounds unnecessary, because I see nowhere that requires pss->page to be
> > > > not going over current huge page boundary.
> > > > 
> > > > What we need here is probably MAX() instead of MIN() so that we'll start
> > > > scanning from the next dirty bit next time. Since pss->page can't be smaller
> > > > than hostpage_boundary (the loop guarantees it), it probably means we don't
> > > > need to fix it up at all.
> > > > 
> > > > Cc: Keqian Zhu <zhukeqian1@huawei.com>
> > > > Cc: Kunkun Jiang <jiangkunkun@huawei.com>
> > > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > 
> > > 
> > > Hmm, I think that's potentially necessary.  note that the start of
> > > ram_save_host_page stores the 'start_page' at entry.
> > > That' start_page' goes to the ram_save_release_protection and so
> > > I think it needs to be pagesize aligned for the mmap/uffd that happens.
> > 
> > Right, that's indeed a functional change, but IMHO it's also fine.
> > 
> > When reaching ram_save_release_protection(), what we guaranteed is that below
> > page range contains no dirty bits in ramblock dirty bitmap:
> > 
> >   range0 = [start_page, pss->page)
> > 
> > Side note: inclusive on start, but not inclusive on the end side of range0
> > (that is, pss->page can be pointing to a dirty page).
> > 
> > What ram_save_release_protection() does is to unprotect the pages and let them
> > run free.  If we're sure range0 contains no dirty page, it means we have
> > already copied them over into the snapshot, so IIUC it's safe to unprotect all
> > of it (even if it's already bigger than the host page size)?
> 
> I think what's worrying me is the alignment of the address going into
> UFFDIO_WRITEPROTECT in uffd_change_protection - if it was previously
> huge page aligned and now isn't, what breaks? (Did it support
> hugepages?)

Good point..

It doesn't support huge pages yet, but we'd better keep it always page aligned
for the unprotect ioctl.

> 
> > That can be slightly less efficient for live snapshot in some extreme cases
> > (when unprotect, we'll need to walk the pgtables in the uffd ioctl()), but I
> > don't assume live snapshot to be run on a huge VM, so hopefully it's still
> > fine?  Not to mention it should make live migration a little bit faster,
> > assuming that's more frequently used..
> 
> Hmm I don't think I understand that statement.

I meant since we've scanned over those clean pages we don't need to scan it
again in the next find_dirty_block() call for precopy, per the "faster"
statement.

But to make it simple I think I'll drop this patch in the next version.

Thanks!

-- 
Peter Xu


