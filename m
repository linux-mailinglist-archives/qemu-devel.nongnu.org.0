Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9C63C75E6
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 19:47:19 +0200 (CEST)
Received: from localhost ([::1]:42382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3MV3-0001aO-Ky
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 13:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m3MTw-0000G8-RK
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 13:46:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m3MTr-0001Fu-MY
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 13:46:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626198362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fLcB7RoYx+hzB9ofeEj3a9Lj2NF9LiVA+VISi+6aWgA=;
 b=V+3v0Mbb4Z4VAzpaHrblR/bxu3aStCEDF2wsfz0NIlA1oDXGxF03WuR6g+KLszXUP/nGiz
 2lRxVrWt2iLH4VLFthYkj73WcPpTiY9oEJwAUZ32VL1+rN9EoJLPM34EdRn9rnPGoBhl/w
 py6VmLKJaZJGCaw0SSwG8Rolu2StcxA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-7mjHmRIAPwCxpG1V3aDx1g-1; Tue, 13 Jul 2021 13:46:00 -0400
X-MC-Unique: 7mjHmRIAPwCxpG1V3aDx1g-1
Received: by mail-qv1-f70.google.com with SMTP id
 c5-20020a0562141465b02902e2f9404330so8316060qvy.9
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 10:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fLcB7RoYx+hzB9ofeEj3a9Lj2NF9LiVA+VISi+6aWgA=;
 b=qbSGY1k+rPyO29w5pHJeB+Bc7nGTaos9VK7uz7LGBI6jRF9UhngSd2whiJbpUPD5nl
 j4SkoMtgOiaCVoagiFyVLSxeHk3IPaz4RrtwT5E2bahuNDgST159mD3dOvdPhstSutcg
 KY/5GJMYGMlr4/eECxuuVMRjfwoapJS7iDSVtEBe8UKUB8vVro2sOsgQdeq7HAWkNKGh
 Jv53V96YFPZZiQUWvvICLGA0NLlCASCl8WDXmRVkch/dCTeYqx6WvDbiFZvHyUhcC5x8
 UZiyKKM3C5ZOPIIm5r1rtcfm7qqZYvQFSSKqybH0JJlafBPok51hAvTsOqs+gIfBnSzR
 b6Xg==
X-Gm-Message-State: AOAM531qvg/C7586r5xQB45iVrIbPambc2QGJ1lgZu3FlsSM1b2NPxW7
 R9P6Rx+m4sqtwx8DhUnpZpRzUnOcWphBK6U1ebMNDV1a4EJ/+aKrdAbIPeX3KpD4rsxSiteVV96
 cG1yvr/J43t9JTR0=
X-Received: by 2002:a05:622a:1349:: with SMTP id
 w9mr5162451qtk.73.1626198360297; 
 Tue, 13 Jul 2021 10:46:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydXv9r1rCXUHNF8K/atP1b60AwFea+Zo4QqVi28PNcKnV9Nn9Eabccg9mExu2JVgeyWJMenw==
X-Received: by 2002:a05:622a:1349:: with SMTP id
 w9mr5162434qtk.73.1626198360033; 
 Tue, 13 Jul 2021 10:46:00 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id l190sm8391126qkc.120.2021.07.13.10.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 10:45:59 -0700 (PDT)
Date: Tue, 13 Jul 2021 13:45:57 -0400
From: Peter Xu <peterx@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Subject: Re: [PATCH 0/4] support dirtyrate measurement with dirty bitmap
Message-ID: <YO3RVarYG8WftETj@t490s>
References: <cover.1624768443.git.huangy81@chinatelecom.cn>
 <YOiTYBITq1px8r1S@t490s>
 <5ad1b7ce-1fb0-c551-8fe3-ed6fd3fab37c@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <5ad1b7ce-1fb0-c551-8fe3-ed6fd3fab37c@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

On Sun, Jul 11, 2021 at 11:27:13PM +0800, Hyman Huang wrote:
> > IMHO we can directly do the calculation when synchronizing the dirty bits in
> > below functions:
> > 
> >          cpu_physical_memory_set_dirty_range
> >          cpu_physical_memory_set_dirty_lebitmap
> >          cpu_physical_memory_sync_dirty_bitmap
> > 
> > Maybe we can define a global statistics for that?
> uhhh... Do you mean that we can reuse the DIRTY_MEMORY_MIGRATION dirty bits
> to stat the new dirty pages number and just define the global var to count
> the increased dirty pages during the calculation time?

I think I misguided you.. Sorry :)

cpu_physical_memory_sync_dirty_bitmap() should not really be in the list above,
as it's fetching the bitmap in ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION].

If you see the other two functions, they all apply dirty bits upon the same
bitmap (actually ram_list.dirty_memory[*] instead of migration-only).  It's
used by e.g. memory region log_sync() to deliver lower level dirty bits to
upper, e.g., see kvm's log_sync[_global]() and kvm_slot_sync_dirty_pages().

Using cpu_physical_memory_sync_dirty_bitmap() is not a good idea to me (which I
saw you used in your latest version), as it could affect migration.  See its
only caller now at ramblock_sync_dirty_bitmap(): when migration calls it, it'll
start to count less than it should for rs->migration_dirty_pages.

So what I wanted to suggest is we do some general counting in both
cpu_physical_memory_set_dirty_range and cpu_physical_memory_set_dirty_lebitmap.
Then to sync for dirty rate measuring, we use memory_global_dirty_log_sync().
That'll sync all dirty bits e.g. in kernel to ram_list.dirty_memory[*], along
which we do the accounting.

Would that work?

-- 
Peter Xu


