Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E133C28F6
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 20:21:20 +0200 (CEST)
Received: from localhost ([::1]:55386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1v7n-0005Xw-C2
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 14:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1v6v-0004bk-VJ
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 14:20:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1v6s-00040o-FF
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 14:20:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625854819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WoW+Ja5Pf3zrXCg3S4KcCiMKYBxfpX9AoO6VTmt/rhc=;
 b=YepwIfqs5EmRbN0JMhPuwuPCN5XtPIo7Ni4SgPNe+O53UzDlq/YBN5CAhfE24qYAYPBSWM
 5u75V+1nfdO5Hf8kpAPAFSCHM1DOiUC9l8hAa9XF/Wjd8ZT08n4Go1YqecKOf7GQgeijMN
 +BOq0191qCyt4kZeDENhv1fcjweoNuE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-rDZhmfRNNaWtuAjaorwYCw-1; Fri, 09 Jul 2021 14:20:18 -0400
X-MC-Unique: rDZhmfRNNaWtuAjaorwYCw-1
Received: by mail-qk1-f200.google.com with SMTP id
 4-20020a3709040000b02903b4d0f603a9so6896993qkj.21
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 11:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=WoW+Ja5Pf3zrXCg3S4KcCiMKYBxfpX9AoO6VTmt/rhc=;
 b=nDCUljHOTm9S0Y2b3qSdSPD4iXHOlvKcuZyqAVXpK2ltS2bIZsU6HeaRRcni8aOQTr
 4LPaC26iwM/kHXDyGqYnl8pwXoAkAlluzJ83MIF3RJrfP8W5YyDBfAQVUzfof7xrAeGn
 ib14Km7b+NSPCqkEiYQansbdIaXTixOaqVcCM2BDmp5fX/V8Ps2PqjzuXhu81AcXuJUw
 w82tqyc+KCyCJ3XumHEkinaUOEPX61jYebFt0TSkZmA6qCvKYtsL8HcG5sQ7SZwKu+nd
 Uk06f3HeW02UFNZAjqYQUl0CXgwry/PETYYFuzCko+KoXhhaKGt4CPE0oYpLBiEYverH
 VDkQ==
X-Gm-Message-State: AOAM531dwzzNhGqxA9L+kgw4S5LRgQnhu/jQXXasoG0iZy3INFS91SRW
 YfxCZ1Q24lxDuISKAvqpM3guaUjpwDfkb3uTtkqIatd35z1rTyo/m7hifh90Fg7st0p+hNy73Wz
 YkqnqYRWu1VMtUjI=
X-Received: by 2002:a05:622a:187:: with SMTP id
 s7mr35364454qtw.301.1625854818477; 
 Fri, 09 Jul 2021 11:20:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+PL+XjHJ/1ySc3SRXX1/p86touIEq8SLvMpGoVHvS2RiW9VM4gGPw/qOTGnAJ7ag2vjKZ5Q==
X-Received: by 2002:a05:622a:187:: with SMTP id
 s7mr35364424qtw.301.1625854818190; 
 Fri, 09 Jul 2021 11:20:18 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id x5sm2817692qke.92.2021.07.09.11.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 11:20:17 -0700 (PDT)
Date: Fri, 9 Jul 2021 14:20:16 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH 0/4] support dirtyrate measurement with dirty bitmap
Message-ID: <YOiTYBITq1px8r1S@t490s>
References: <cover.1624768443.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <cover.1624768443.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yong,

On Sun, Jun 27, 2021 at 01:38:13PM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> the dirtyrate measurement implemented by page-sampling originally, it
> is not accurate in some scenarios, so we have introduced dirty-ring
> based dirtyrate measurement(maybe it will be merged soon), it fix the
> accuracy of page-sampling, and more importantly, it is at the
> granualrity of vcpu.
> 
> dirty-ring method can be used when dirty-ring enable, as supplementary,
> we introduce dirty-bitmap method to calculating dirtyrate when dirty log
> enable, so that we can also get the accurate dirtyrate if needed in the
> absence of dirty-ring.
> 
> three things has done to implement the measurement:
> - introduce a fresh new dirty bits named DIRTY_MEMORY_DIRTY_RATE, which
>   is used to store dirty bitmap after fetching it from kvm. why we do
>   not reuse the existing DIRTY_MEMORY_MIGRATION dirty bits is we do not
>   want to interfere with migration of and let implementation clear, this 
>   is also the reason why dirty_memory be split.
> 
>   DIRTY_MEMORY_DIRTY_RATE dirty bits will be filled when
>   memory_global_dirty_log_sync executed if GLOBAL_DIRTY_DIRTY_RATE bit
>   be set in the global_dirty_tracking flag.

I'm not 100% sure this is needed.

Dirty rate measurements do not care about which page is dirtied, it looks like
an overkill to introduce a new bitmap for it.

IMHO we can directly do the calculation when synchronizing the dirty bits in
below functions:

        cpu_physical_memory_set_dirty_range
        cpu_physical_memory_set_dirty_lebitmap
        cpu_physical_memory_sync_dirty_bitmap

Maybe we can define a global statistics for that?

> 
> - introduce kvm_get_manual_dirty_log_protect function so that we can
>   probe the protect caps of kvm when calculating.
> 
> - implement dirtyrate measurement with dirty bitmap with following step:
>   1. start the dirty log. 
> 
>   2. probe the protect cap, if KVM_DIRTY_LOG_INITIALLY_SET enable, skip
>      skip the 1'R and do the reset page protection manually, since kvm
>      file bitmap with 1 bits if this cap is enabled. 
> 
>   3. clear the DIRTY_MEMORY_DIRTY_RATE dirty bits, prepare to store 
>      the dirty bitmap.
> 
>   4. start memory_global_dirty_log_sync and fetch dirty bitmap from kvm
> 
>   5. reap the DIRTY_MEMORY_DIRTY_RATE dirty bits and do the calculation.
> 
> this patchset rebases on the commit 
> "migration/dirtyrate: implement dirty-ring dirtyrate calculation",
> since the above feature has not been merged, so we post this patch
> for the sake of RFC. ideally, this patshset may be merged after it.

I gave it a shot with some setup dirty workload, it runs well so far and also I
do get accurate numbers (200MB/s measured as 201MB/s; 300MB/s measured as
301MB/s, and so on).  Looks good to me in general.

But as I mentioned above I feel like the changeset can be shrinked quite a bit
if we can drop the extra bitmap; maybe it means we can drop half of the whole
series.  But it's also possible I missed something, let's see.

It'll slightly differ from dirty ring in that same page written will always
only be counted once between two dirty map sync, but that's expected.  Dirty
ring "sync" more frequently (either ring full, or current 1-sec timeout in the
reaper), so it re-protects more frequently too.

I still have some other small comments, I'll go into the patches.

Thanks,

-- 
Peter Xu


