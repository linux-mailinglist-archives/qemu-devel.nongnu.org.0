Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EAB2E0B44
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 15:01:08 +0100 (CET)
Received: from localhost ([::1]:40616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kriDr-0006MQ-NX
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 09:01:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liliang324@gmail.com>)
 id 1krgXh-0007VI-Ly
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 07:13:29 -0500
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:42429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liliang324@gmail.com>)
 id 1krgXg-00045p-Aq
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 07:13:29 -0500
Received: by mail-lf1-x12e.google.com with SMTP id b26so21940415lff.9
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 04:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XDqWemTZAr3Yf5zc0WPnza6SJa69M9w7Rj4fQPF3P5o=;
 b=tPpOPFZiOO+7bXVYjFI5JFD6T6i0npRgJb2VT4lieoQIF08DoFCYSGjj9UtUf7OlOT
 k59s2Xvq/lfysj+/GyyxJvQlfo02nL1EuA2PBhI+xh9pDS5Yg5bPQ4Zt7jO0QiFdxGdp
 dKcuZ4zXWF5bWyAxUTzFny3vMoMajws16JY40rUn6sUIVqICCZSBYnX5i8M7E+Z0u3CT
 lTPukRJlbMMNBCD78ibfqd94YssAxc4XtIpdyd2C7HlUWeqJ17NRIF47bAm5ugtNHU68
 U4khUQcaFfH58dRFjW4SmhGv0p2aKTkWcwPPS4ZUSjxZrs0qCCkJW8Il2Xt6AJjLwQiX
 KhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XDqWemTZAr3Yf5zc0WPnza6SJa69M9w7Rj4fQPF3P5o=;
 b=NC3irx2LJ25X8a/jDuq8kg7+GZ4X93CVtpRhu7qs+S10h09TSHMBimrriOGGVFP24S
 BAjqWjRKVybk4SK5t/aACOb2sPwQ/L73/lJuS9KC9bOrfG5tzFps6cVrxSmp79tl0N0p
 WK1goxlipgmZTZ2SCH0geflDom9yXWv1YFblhNws/syXaCx9cpbANcXdhbu2v8MQ4qX6
 xaifTTtzyLJcWdGivALbmoYmLIo4GJqYSt1mqxSKeUej0mFKgpnCJRQe/utf9MTjuZYi
 cQpVairRjb19CwrrDMXHhgte7qx3Tc+mWj0h+9MWSx898cR5yF9wap0KHbztiC+Rjj9v
 EgXA==
X-Gm-Message-State: AOAM5301fO3izOXaLAJKocKUGEY+2wAs7UT6SKAJBHECOg64dyfYwN8n
 Unu2idwgkSZbVPHrAqjNvL2rGsaakE5IcT+nhi0=
X-Google-Smtp-Source: ABdhPJy//mXDzhSL1YWk1GnMAjPpsove6BusTlVwzWEpUuwAUeHj+jE+6K6s+3pbthcvs1KaZqTkjZMhul0rQkreE6s=
X-Received: by 2002:a2e:b8d1:: with SMTP id s17mr10053775ljp.472.1608639206075; 
 Tue, 22 Dec 2020 04:13:26 -0800 (PST)
MIME-Version: 1.0
References: <20201222074910.GA30051@open-light-1.localdomain>
 <585791f4-4b41-5e73-296e-691d5478a915@redhat.com>
 <a0bee19a-0703-54b1-2903-60383ab7da64@redhat.com>
In-Reply-To: <a0bee19a-0703-54b1-2903-60383ab7da64@redhat.com>
From: Liang Li <liliang324@gmail.com>
Date: Tue, 22 Dec 2020 20:13:12 +0800
Message-ID: <CA+2MQi8kupPHetMhH97fn+toFk9HUYeVPnwdzrpyiS6Necn0CA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] mm: support free hugepage pre zero out
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=liliang324@gmail.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 22 Dec 2020 08:55:38 -0500
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Michal Hocko <mhocko@suse.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Liang Li <liliangleo@didiglobal.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Dave Hansen <dave.hansen@intel.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Mel Gorman <mgorman@techsingularity.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > Free page reporting in virtio-balloon doesn't give you any guarantees
> > regarding zeroing of pages. Take a look at the QEMU implementation -
> > e.g., with vfio all reports are simply ignored.
> >
> > Also, I am not sure if mangling such details ("zeroing of pages") into
> > the page reporting infrastructure is a good idea.
> >
>
> Oh, now I get what you are doing here, you rely on zero_free_pages of
> your other patch series and are not relying on virtio-balloon free page
> reporting to do the zeroing.
>
> You really should have mentioned that this patch series relies on the
> other one and in which way.

I am sorry for that. After I sent out the patch, I realized I should
mention that, so I sent out an updated version which added the
information you mentioned :)

Thanks !
Liang

