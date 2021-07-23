Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 100A53D406F
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 20:54:01 +0200 (CEST)
Received: from localhost ([::1]:34698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m70J6-0005uW-5Q
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 14:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m70Ht-0005ED-Az
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 14:52:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m70Hq-0007O4-TN
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 14:52:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627066361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lXMc8CHDdtmmJ/47zHU3jZkNPdtnFDOx1N7cnXP9qNY=;
 b=JR/BMSSuaP3EzBlrT1uercsxcAe84LhHDCrtLehhsNAjepKfiZc6LaNzrqq6Gtk9gVzRLW
 U7SxQn1kP+B2IKk+0B6YOnYrBURtwGJgXKw6SmkC7WHhY08Hkh9QajefEs9n9C2/CBfpjL
 WJQwvLsXc/oBn/x4VA+Rl6yVMLuGjgI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-oxZgdJGgNGi6a1vpQYMhfg-1; Fri, 23 Jul 2021 14:52:38 -0400
X-MC-Unique: oxZgdJGgNGi6a1vpQYMhfg-1
Received: by mail-qt1-f198.google.com with SMTP id
 m22-20020a05622a1196b029026549e62339so1698262qtk.1
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 11:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lXMc8CHDdtmmJ/47zHU3jZkNPdtnFDOx1N7cnXP9qNY=;
 b=CVHpVGHvPjhTj/DnI4GlBE+3eeikyMOqJgGbTBxTNIDacUuQQ6G/dfSJfIlrXxHdvR
 Ww0WvlXf/8r4hkj7jeYbaymPTv4RqgC55kTFAZiHwepIa0n6Y3XN9BNfHKNyeUR77+IT
 +9hEXeGY5B1hrsqUazXDsP1OqS2DInJmsHonppMjuoVXnvyuVL5iq9bOGjjds2z9rtn7
 4r9cfan540WM0PRe+16Flmh55QH4OfrLDibfle0mndAOsOBX4nRrjVkx4ipUODx4EFqd
 gwqY2koaun28I2tfj8MAk/jmMKvSjYdV6KjpmMBjMxyLJc67vVrLUgCn+84KPyXiLRrc
 snkA==
X-Gm-Message-State: AOAM5328FwZCI4KEGq0cnMcMXT90/U5ACdXPqH0AxEbqC5dQfbbOk05j
 W2S/Nkl1sYT75M9WBCk14R7FYA3kKhBTSWWxfoI4wvEoKMQqSR0wD29Nvcs/uV3dXBcMmRVY/OM
 Avukg/gMQeOtup2U=
X-Received: by 2002:a05:6214:5b0:: with SMTP id
 by16mr6023157qvb.54.1627066358040; 
 Fri, 23 Jul 2021 11:52:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7vgpUm2MpdR7v5CVt+Pf9AmShOQH+GTOQE8MBzpcp2C+e6Nj5kLAhrz+RO92kkb8wGVhOAg==
X-Received: by 2002:a05:6214:5b0:: with SMTP id
 by16mr6023135qvb.54.1627066357769; 
 Fri, 23 Jul 2021 11:52:37 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id t14sm7168399qkm.7.2021.07.23.11.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 11:52:36 -0700 (PDT)
Date: Fri, 23 Jul 2021 14:52:35 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 5/6] migration/postcopy: Handle RAMBlocks with a
 RamDiscardManager on the destination
Message-ID: <YPsP8+STD836MO3L@t490s>
References: <20210721092759.21368-1-david@redhat.com>
 <20210721092759.21368-6-david@redhat.com> <YPrvfST43SFOMA1F@t490s>
 <2ce949f2-6950-5404-70e4-73a2e41b4ca8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2ce949f2-6950-5404-70e4-73a2e41b4ca8@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 23, 2021 at 08:36:32PM +0200, David Hildenbrand wrote:
> > > +static int postcopy_request_page(MigrationIncomingState *mis, RAMBlock *rb,
> > > +                                 ram_addr_t start, uint64_t haddr)
> > > +{
> > > +    /*
> > > +     * Discarded pages (via RamDiscardManager) are never migrated. On unlikely
> > > +     * access, place a zeropage, which will also set the relevant bits in the
> > > +     * recv_bitmap accordingly, so we won't try placing a zeropage twice.
> > > +     */
> > > +    if (ramblock_page_is_discarded(rb, start)) {
> > > +        bool received = ramblock_recv_bitmap_test_byte_offset(rb, start);
> > 
> > Will received be set for any case with the current code base?  As I thought
> > virtio-mem forbids plug/unplug during the whole lifecycle of migration.
> 
> receive would only be set if you have two CPUs faulting on the same address
> at the same time and the first one already placed a zeropage on this code
> path (as the comment said, that will implicitly set it in the rceivedmask).

Ah I see; or just ignore the error of postcopy_place_page_zero() here because
per my understanding this whole path is not expected after all.

> 
> So, pretty unlikely to happen, but if the stars align ... :)
> 
> > 
> > > +
> > > +        return received ? 0 : postcopy_place_page_zero(mis, (void *)haddr, rb);
> > 
> > (now we can fill up pages in two threads.. but looks thread-safe)
> > 
> > Meanwhile if this is highly not wanted, maybe worth an error_report_once() so
> > the admin could see something?
> 
> 
> You mean, if postcopy_place_page_zero() fails?

I meant ramblock_page_is_discarded() shouldn't really trigger for a sane guest,
right?  Because it means the guest is accessing some unplugged memory.

I wanted to give a heads-up to the admin so he/she knows there's something odd.
Also that can be a hint for debugging if it's hit for any unknown reasons.

Thanks,

-- 
Peter Xu


