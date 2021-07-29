Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F3F3DABC9
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 21:22:52 +0200 (CEST)
Received: from localhost ([::1]:60686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9BcJ-0001kI-RM
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 15:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m9BaR-0007yM-0J
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 15:20:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m9BaP-0006dQ-5g
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 15:20:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627586452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qPFAAwFMtP9tidIG9o1bBYlUBKuqVMd+ts6x9rO9vJs=;
 b=LNdPMtwGbwaDKxfvQ5Frf6R5pUEeemxTrKdgYW9hJj1XbzbMAVa1sCiEYOfhzwt6c+RogB
 00LIM2Ze+ujUKfRUZQZHtGqXB+IxWs88TH+E4LBOtnk1xANGJXNzvYhiMUdaKJ7+2i2PW+
 ypav1ctIBsNC5bEh5Dn1wrOkKqZzl8Y=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-SBsEojkjOk-BO6fmH6hfxw-1; Thu, 29 Jul 2021 15:20:51 -0400
X-MC-Unique: SBsEojkjOk-BO6fmH6hfxw-1
Received: by mail-qk1-f200.google.com with SMTP id
 c3-20020a05620a0ce3b02903b8eff05707so3742688qkj.5
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 12:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qPFAAwFMtP9tidIG9o1bBYlUBKuqVMd+ts6x9rO9vJs=;
 b=b+iNEh4o5TjlXMOUbzpo6OCuj9D2A6xILQMd5m6y+Vgq3fY87QgAGbitDowg16Nndk
 IvXgC+ttffGnz1ySDLzU2Ygt2p1/hcBN2tRGvcB52tFhMlkyottoQrFet7WYKtAbtsP8
 fcKkoAzLH/zCaPbnlFQx8AeYVP1y3FnqXqSb7XgC2WPgVNdfGWMhJSg2msPtPxrI466U
 Mnh7u0G+dX3GTyKn3vm3mMCNIEuFGfa94e6UwImK8I62Yqf8NT7q6Fwv6JbkhKvvMeBt
 SAN6pUE1J21dKPNGMqnPM/vkEil7K6OXG/beZWW8/QPFe+1KTAzogYQe7en5yKODzSFG
 fKfw==
X-Gm-Message-State: AOAM531lcHvU3YXt+ciIQQ+FKHNEz5euYl6/Bimby2hx3Hjqw5QTC4L/
 xwdtH18rRN1kPPB8VJLBihaaqvsYfKClHzM4d5F104JjiVAXp42fWfTrJIgyRMb6GQAi1+cCUAE
 zfvdWRvs9VLFzY6E=
X-Received: by 2002:a37:46d0:: with SMTP id t199mr6734709qka.416.1627586450595; 
 Thu, 29 Jul 2021 12:20:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFZJRvZyzDryyEjX/ZfcHgFUhNDsMy1a2vYw7Z/U6F1Nte3HYYK3e03IS44kU0lpv0pHhbvg==
X-Received: by 2002:a37:46d0:: with SMTP id t199mr6734684qka.416.1627586450359; 
 Thu, 29 Jul 2021 12:20:50 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id h68sm2223734qkf.126.2021.07.29.12.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 12:20:49 -0700 (PDT)
Date: Thu, 29 Jul 2021 15:20:47 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 5/6] migration/postcopy: Handle RAMBlocks with a
 RamDiscardManager on the destination
Message-ID: <YQL/jxRizBc0OFZS@t490s>
References: <20210721092759.21368-1-david@redhat.com>
 <20210721092759.21368-6-david@redhat.com> <YPrvfST43SFOMA1F@t490s>
 <2ce949f2-6950-5404-70e4-73a2e41b4ca8@redhat.com>
 <YPsP8+STD836MO3L@t490s>
 <124693ef-5595-85c9-da5a-8f8e6a827c19@redhat.com>
 <YPs+cO7u1eXMomE0@t490s>
 <de4bd533-efaa-a6e5-c73c-01016d0f229c@redhat.com>
 <YQLO1QoOIu8dlaEq@t490s>
 <5ede7b00-1048-c124-e239-eeff21d9adb0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5ede7b00-1048-c124-e239-eeff21d9adb0@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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

On Thu, Jul 29, 2021 at 06:15:58PM +0200, David Hildenbrand wrote:
> On 29.07.21 17:52, Peter Xu wrote:
> > On Thu, Jul 29, 2021 at 02:14:41PM +0200, David Hildenbrand wrote:
> > > On 24.07.21 00:10, Peter Xu wrote:
> > > > On Fri, Jul 23, 2021 at 09:01:42PM +0200, David Hildenbrand wrote:
> > > > > It can happen in corner cases and is valid: with the current virtio-mem
> > > > > spec, guests are allowed to read unplugged memory. This will, for example,
> > > > > happen on older Linux guests when reading /proc/kcore or (with even older
> > > > > guests) when dumping guest memory via kdump. These corner cases were the
> > > > > main reason why the spec allows for it -- until we have guests properly
> > > > > adjusted such that it won't happen even in corner cases.
> > > > > 
> > > > > A future feature bit will disallow it for the guest: required for supporting
> > > > > shmem/hugetlb cleanly. With that in place, I agree that we would want to
> > > > > warn in this case!
> > > > 
> > > > OK that makes sense; with the page_size change, feel free to add:
> > > 
> > > I just realized that relying on the page_size would be wrong.
> > > 
> > > We migrate TARGET_PAGE_SIZE chunks and the offset might not be page_size
> > > aligned. So if we were to replace TARGET_PAGE_SIZE by rb->page_size, we
> > > might accidentally cover a "too big" range.
> > 
> > I'm wondering whether we should make the offset page size aligned instead.  For
> > example, note that postcopy_place_page_zero() should only take page_size
> > aligned host addr or UFFDIO_COPY could fail (hugetlb doesn't support
> > UFFDIO_ZEROPAGE yet).
> 
> That is true indeed. I'd assume in that case that we would get called with
> the proper offset already, right? Because uffd would only report properly
> aligned pages IIRC.

Nop; it should return the faulted address. So postcopy_request_page() may need
some alignment work, as it was handled in migrate_send_rp_req_pages().

> 
> > 
> > Btw, does virtio-mem supports hugetlbfs now?  When with it, the smallest unit
> > to plug/unplug would the huge page size (e.g., for 1g huge page, sounds not
> > helpful to unplug 2M memory), am I right?
> 
> It supports it to 99.9 % I'd say (especially with the dump/tpm/migration
> fixes upstream). The units are handled properly: the unit is at least as big
> as the page size.
> 
> So with 1 GiB pages, you have a unit of 1 GiB.

I see, thanks for confirming.  Then fixing up the offset seems to be the right
thing to do.

Thanks,

-- 
Peter Xu


