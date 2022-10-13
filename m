Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D58765FDE5D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 18:40:30 +0200 (CEST)
Received: from localhost ([::1]:55056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj1G1-00071K-GM
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 12:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oj0vi-0001bX-Tz
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 12:19:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oj0vg-0003Zh-CB
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 12:19:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665677967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+BevHFThJEfx5RdnlF1eRYLTZ7UhOKL1Q2z/qoUIgZM=;
 b=Czs3wbO/cG18JslIzqqPY+Lzfb0FTLHyfhWH+3xikhnPtQRgMV5+eQaQYrtNi5jBkYz5ls
 MqQ9CyGdgLEUo1Y/TQPlk77zaViRzh4GbTkXPl8vIKEnPLNt0mUxG+K9EWMkTziW2uLlic
 AOlk1Af8Mo0GsbQHfeoMLIaFAsXNIpY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-240-BKlHnl9lNbOghUhf7PqlGA-1; Thu, 13 Oct 2022 12:19:25 -0400
X-MC-Unique: BKlHnl9lNbOghUhf7PqlGA-1
Received: by mail-qt1-f199.google.com with SMTP id
 k9-20020ac85fc9000000b00399e6517f9fso1705126qta.18
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 09:19:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+BevHFThJEfx5RdnlF1eRYLTZ7UhOKL1Q2z/qoUIgZM=;
 b=DDtyad3xN5TtBa9eFN5htpjqUA0kfLwMwniJoLcOthhQ/8GU9bX7qyYVflXde/EMu/
 qUXqkg1+onMFxP1nFiUFU5Jvv0PO5RFOH39EoYANMj7tqhSaA3uAzGWDYHIbZxvQ68GK
 znJ498LXCnQeRXbH3Rwbt1zvUXTsXrVGzh7s40VzQfTX6H0n7gWWcevVJfKgQLcyV+gb
 znEOZr409ErjNKT2ATOdJsiEMwR1o/jnD73nsUusJ3jiMmovJZqxvazPusHTrtHvlGXP
 6eQY4lgHg+jhxL8WBY4/NEzobxuQr8NQiYXBu1isXF0X5NB3ACOYalTR/vpGahd3ClmB
 0+Tw==
X-Gm-Message-State: ACrzQf2dKHjT+NmsgeY9LJWlAqpXCqEB0voBN6nHKdauaRUyBV+b8JRK
 lKmHXvAlzQIyO/zxVMpvEugEgbq3Q2hInY5pigjPDyTID9bqGpKZOy4oFZp1w0Z6ZaFjFZ+zaY5
 rGBiHTMVEs9V6Ab0=
X-Received: by 2002:a05:622a:1110:b0:39c:d568:8b26 with SMTP id
 e16-20020a05622a111000b0039cd5688b26mr520436qty.280.1665677965283; 
 Thu, 13 Oct 2022 09:19:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4jo5YZZ1FYp7rTwuddVngtfjoppsLsTVDU4rrp2AC6GyZzEd1k/R6CCNFouaxMIjIJqrJRzA==
X-Received: by 2002:a05:622a:1110:b0:39c:d568:8b26 with SMTP id
 e16-20020a05622a111000b0039cd5688b26mr520414qty.280.1665677965021; 
 Thu, 13 Oct 2022 09:19:25 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 bb33-20020a05622a1b2100b00399fe4aac3esm219853qtb.50.2022.10.13.09.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 09:19:24 -0700 (PDT)
Date: Thu, 13 Oct 2022 12:19:23 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: Re: [PATCH v2 06/15] migration: Yield bitmap_mutex properly when
 sending/sleeping
Message-ID: <Y0g6i6z3K4mglmPb@x1n>
References: <20221011215559.602584-1-peterx@redhat.com>
 <20221011215559.602584-7-peterx@redhat.com>
 <Y0buySbboE3xOVoQ@work-vm> <Y0b+i6vliRkBC2MI@x1n>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="1Om8LZn7jeGInJKW"
Content-Disposition: inline
In-Reply-To: <Y0b+i6vliRkBC2MI@x1n>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--1Om8LZn7jeGInJKW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Oct 12, 2022 at 01:51:07PM -0400, Peter Xu wrote:
> On Wed, Oct 12, 2022 at 05:43:53PM +0100, Dr. David Alan Gilbert wrote:
> > * Peter Xu (peterx@redhat.com) wrote:
> > > Don't take the bitmap mutex when sending pages, or when being throttled by
> > > migration_rate_limit() (which is a bit tricky to call it here in ram code,
> > > but seems still helpful).
> > > 
> > > It prepares for the possibility of concurrently sending pages in >1 threads
> > > using the function ram_save_host_page() because all threads may need the
> > > bitmap_mutex to operate on bitmaps, so that either sendmsg() or any kind of
> > > qemu_sem_wait() blocking for one thread will not block the other from
> > > progressing.
> > > 
> > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > 
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > 
> > although a comment above the reclaration of ram_save_host_pages saying
> > it can drop the lock would be veyr good.
> 
> Let me add that.  Thanks,

A fixup to this patch attached to touch up the comment for
ram_save_host_page().

-- 
Peter Xu

--1Om8LZn7jeGInJKW
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment;
	filename="0001-fixup-migration-Yield-bitmap_mutex-properly-when-sen.patch"

From dcc3adce062df7216851890d49f7d2b1fa2e84a4 Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Thu, 13 Oct 2022 12:18:04 -0400
Subject: [PATCH] fixup! migration: Yield bitmap_mutex properly when
 sending/sleeping
Content-type: text/plain

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index 538667b974..b311ece48c 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2407,9 +2407,14 @@ out:
  * a host page in which case the remainder of the hostpage is sent.
  * Only dirty target pages are sent. Note that the host page size may
  * be a huge page for this block.
+ *
  * The saving stops at the boundary of the used_length of the block
  * if the RAMBlock isn't a multiple of the host page size.
  *
+ * The caller must be with ram_state.bitmap_mutex held to call this
+ * function.  Note that this function can temporarily release the lock, but
+ * when the function is returned it'll make sure the lock is still held.
+ *
  * Returns the number of pages written or negative on error
  *
  * @rs: current RAM state
-- 
2.37.3


--1Om8LZn7jeGInJKW--


