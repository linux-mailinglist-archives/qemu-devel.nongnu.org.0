Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 617D62D7996
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:42:48 +0100 (CET)
Received: from localhost ([::1]:56084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knkZD-0005e1-BF
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:42:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1knkIQ-0005AG-2Q
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:25:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1knkIO-0006DV-9Y
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:25:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607700322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3DMFkVDRfN2bFWNJad4xJ2+hcqJIE+6blfWfDT40D/M=;
 b=XY3N1zl+9klexQXbYAxL06ivAqF9+Fd4Z+tOhOMaqlF5+wNWlKoSmyd7LYGS4NHpzc2s1n
 +teS+oUsDPXorlaflb4JIfA1w7EN1HGlfDcLAAK8FJ5dvPQP2Up41a7Ey4PhMKGgyzNzN4
 YY8na4YalT3VAOPbnWoEGyUOquCUO28=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-1fDCBKKrMSuh88ykWQQNQw-1; Fri, 11 Dec 2020 10:25:21 -0500
X-MC-Unique: 1fDCBKKrMSuh88ykWQQNQw-1
Received: by mail-qt1-f199.google.com with SMTP id f7so6777055qtj.7
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 07:25:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3DMFkVDRfN2bFWNJad4xJ2+hcqJIE+6blfWfDT40D/M=;
 b=TiTkZDb9E0pv2NQ7JIlvjYBaWuaGzUsn0MhovT4eG4CADGBTX2qI2WorpB7A4/NJTU
 mn18zkHltoHeVYB6zA1YrEjySLBKPCrEhwulhBsu8gkuvdjh4jGzjffVzpslTtilJ8JH
 EUefdGEV1ZzKB84XyN71QHyrJ37odWmcYfJGvNM1ARTeBXShsTGCXfcsoN/Qfd34J/1Z
 9JE4bUH5SPxcygzAAu3zO7ejKHJLCBXmNt7C7R2jue2Ov9pRErEx5EZyUchUnK1NFl46
 TMd+ZK1j4fszQ4TvMhHxrmNZC08CoL9p4kTdezsWytmzQYfFd/71krJ4Hm4c2oktC3HQ
 MPSw==
X-Gm-Message-State: AOAM53090OHt7zqmPMmSvUKg+aT41yeE0mMCWl21fgWnzLf2dYfx4xHs
 PmvhMM7rxC4j5m84SmwCewgqaF+UyBuTR+Ww0MoOd6IqNLMLvHP3B3lJ10fL4jjxc+xvz1YLbrO
 ELkvcA/edPqjiX4E=
X-Received: by 2002:a37:4384:: with SMTP id q126mr16863515qka.30.1607700320715; 
 Fri, 11 Dec 2020 07:25:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxp9yYldwC0MGQIrT+t7qi9g6CDUEkHB0XegmFIPjn12FW5NuZxMBXj4GhD/nDOrrmsxlvMBg==
X-Received: by 2002:a37:4384:: with SMTP id q126mr16863492qka.30.1607700320477; 
 Fri, 11 Dec 2020 07:25:20 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id u22sm6854022qkk.51.2020.12.11.07.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 07:25:19 -0800 (PST)
Date: Fri, 11 Dec 2020 10:25:18 -0500
From: Peter Xu <peterx@redhat.com>
To: zhukeqian <zhukeqian1@huawei.com>
Subject: Re: [PATCH] kvm: Take into account the unaligned section size when
 preparing bitmap
Message-ID: <20201211152518.GD6520@xz-x1>
References: <20201208114013.875-1-yuzenghui@huawei.com>
 <20201208151654.GA6432@xz-x1>
 <bb4bcc8b-1d36-9529-d7cd-4d93162d092f@huawei.com>
 <6dc82702-9246-4684-4f28-e104abc0c11d@huawei.com>
 <20201210020843.GB3211@xz-x1>
 <7d46e5ca-24ab-7c44-201c-77e8fc6a2ace@huawei.com>
 <20201210145006.GD3211@xz-x1>
 <2607b4cd-524c-2360-6261-224736861fc4@huawei.com>
MIME-Version: 1.0
In-Reply-To: <2607b4cd-524c-2360-6261-224736861fc4@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, pbonzini@redhat.com,
 qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 11, 2020 at 09:13:10AM +0800, zhukeqian wrote:
> 
> On 2020/12/10 22:50, Peter Xu wrote:
> > On Thu, Dec 10, 2020 at 10:53:23AM +0800, zhukeqian wrote:
> >>
> >>
> >> On 2020/12/10 10:08, Peter Xu wrote:
> >>> Keqian,
> >>>
> >>> On Thu, Dec 10, 2020 at 09:46:06AM +0800, zhukeqian wrote:
> >>>> Hi,
> >>>>
> >>>> I see that if start or size is not PAGE aligned, it also clears areas
> >>>> which beyond caller's expectation, so do we also need to consider this?
> >>>
> >>> Could you elaborate?
> >>>
> >>> If start_delta != 0, kvm_log_clear_one_slot() should already go the slow path.
> >>>
> >>> Thanks,
> >>>
> >>
> >> Hi Peter,
> >>
> >> start_delta /= psize;
> >>
> >> If start is not PAGE aligned, then start_delta is not PAGE aligned.
> >> so I think the above code will implicitly extend our start to be PAGE aligned.
> >>
> >> I suggest that we should shrink the start and (start + size) to be PAGE aligned
> >> at beginning of this function.
> > 
> > Callers should be with TARGET_PAGE_SIZE aligned on the size, so at least x86_64
> > should be pretty safe since host/guest page sizes match.
> > 
> > Though indeed I must confess I don't know how it worked in general when host
> > page size != target page size, at least for migration.  For example, I believe
> > kvm dirty logging is host page size based, though migration should be migrating
> > pages in guest page size granule when it spots a dirty bit set.
> > 
> Hi,
> 
> Indeed, we handle target_page_size aligned @start and @size in general. Maybe we'd better
> add explicit function comments about alignment requirement, and explicit alignment assert
> on @start and @size?

Yes we can, but I think it's not strongly necessary.  As Zenghui pointed out,
the callers of memory_region_clear_dirty_bitmap() should always be aware of the
fact that dirty bitmap is always page size based.

OTOH I'm more worried on the other question on how we handle guest psize !=
host psize case for migration now...

Thanks,

-- 
Peter Xu


