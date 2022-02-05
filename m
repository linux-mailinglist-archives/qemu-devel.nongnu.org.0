Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DDA4AA576
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 02:55:06 +0100 (CET)
Received: from localhost ([::1]:54064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGAI4-0004bW-R6
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 20:55:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA7F-0003sJ-Fr
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:43:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA6q-0003Kw-Cw
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:43:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644025398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M3jUSaSk62Y68RwsubSnE/d3+Hfgk3zd4sX5M9Po2zk=;
 b=C1kWpoJmqEbSSyernkBBgwjHQICcJitloWhoJukABaUkq+GuACJgFaPd9qOEjtNyQcEUNO
 o7em1YFWKYNQJGQFtCtuaHiI0KttDvo77AmSATfHAVn4JXrkxZwplKCH4qfWJ6X5eVqVAc
 m6zdxH4SWGQyMGqasW/lTQZXGP8BSDQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-HEmMarzWPlWgnvgkoC8YuA-1; Fri, 04 Feb 2022 20:43:17 -0500
X-MC-Unique: HEmMarzWPlWgnvgkoC8YuA-1
Received: by mail-wr1-f69.google.com with SMTP id
 v28-20020adfa1dc000000b001dd1cb24081so2783970wrv.10
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 17:43:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=M3jUSaSk62Y68RwsubSnE/d3+Hfgk3zd4sX5M9Po2zk=;
 b=ePOaWu4RB41tzotmWZuMSL+0nfA0zu3L0kyAtLddNBa3iX06ah2TabwsJU72PtpTbS
 YMllcxvpI4hvMaC/CGidE0OD50yAt1bba1lNBk3ehYkCIQxU+8mG4TuwoFFY8GtmLSbY
 Oalzdj1xPsbuw2F2hQ1liD5l0yuimcb3uIszpbgcGtecvrBZRu8F4DsWFPXq239wrujQ
 To0ELk1OAeQaXZJaUNDeGgdlwKkhfHN4rF1FTTBL9CRgXVzRD+p/4EGtsWUOv1EPN2Pa
 uDm/3IiNAvHl1isEBcUGqdvvAluRrqKxWGfZx7ix30SXnzSGsNsqwSn/jBiYZPFWTOax
 VtBw==
X-Gm-Message-State: AOAM532j6YDzeclyDBdI82NfGZSEcEMT/fiGiUKRi4JUUITO+Tprb783
 Fb0MgrTRs6XchDBV1rN132Ee4XBMVNmIkMGlH4b8aFH29ZJugdVkKeEQZBnO1oqhv9fcI5/Ec3v
 4zhfh0KCBWFKd9lHYqsGRlvYmAT+HLE14t2TILb4ReFCizMudTgtaZbp3jqIy
X-Received: by 2002:a05:6000:16cc:: with SMTP id
 h12mr1226653wrf.408.1644025396017; 
 Fri, 04 Feb 2022 17:43:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRjXw+cHQajUHu6roEQH1s4A9nZuIm5Kp2acLg/I7I0HeNM4y0eKBW5uOx7o/AkKwN6fdkBg==
X-Received: by 2002:a05:6000:16cc:: with SMTP id
 h12mr1226631wrf.408.1644025395781; 
 Fri, 04 Feb 2022 17:43:15 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id u8sm2123399wmn.27.2022.02.04.17.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 17:43:15 -0800 (PST)
Date: Fri, 4 Feb 2022 20:43:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/32] libvhost-user: Map shared RAM with MAP_NORESERVE to
 support virtio-mem with hugetlb
Message-ID: <20220205014149.1189026-15-mst@redhat.com>
References: <20220205014149.1189026-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220205014149.1189026-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

For fd-based shared memory, MAP_NORESERVE is only effective for hugetlb,
otherwise it's ignored. Older Linux versions that didn't support
reservation of huge pages ignored MAP_NORESERVE completely.

The first client to mmap a hugetlb fd without MAP_NORESERVE will
trigger reservation of huge pages for the whole mmapped range. There are
two cases to consider:

1) QEMU mapped RAM without MAP_NORESERVE

We're not dealing with a sparse mapping, huge pages for the whole range
have already been reserved by QEMU. An additional mmap() without
MAP_NORESERVE won't have any effect on the reservation.

2) QEMU mapped RAM with MAP_NORESERVE

We're delaing with a sparse mapping, no huge pages should be reserved.
Further mappings without MAP_NORESERVE should be avoided.

For 1), it doesn't matter if we set MAP_NORESERVE or not, so we can
simply set it. For 2), we'd be overriding QEMUs decision and trigger
reservation of huge pages, which might just fail if there are not
sufficient huge pages around. We must map with MAP_NORESERVE.

This change is required to support virtio-mem with hugetlb: a
virtio-mem device mapped into the guest physical memory corresponds to
a sparse memory mapping and QEMU maps this memory with MAP_NORESERVE.
Whenever memory in that sparse region will be accessed by the VM, QEMU
populates huge pages for the affected range by preallocating memory
and handling any preallocation errors gracefully.

So let's map shared RAM with MAP_NORESERVE. As libvhost-user only
supports Linux, there shouldn't be anything to take care of in regard of
other OS support.

Without this change, libvhost-user will fail mapping the region if there
are currently not enough huge pages to perform the reservation:
 fv_panic: libvhost-user: region mmap error: Cannot allocate memory

Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20220111123939.132659-1-david@redhat.com>
Acked-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 subprojects/libvhost-user/libvhost-user.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 0ee43b8e93..47d2efc60f 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -751,12 +751,12 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
          * accessing it before we userfault.
          */
         mmap_addr = mmap(0, dev_region->size + dev_region->mmap_offset,
-                         PROT_NONE, MAP_SHARED,
+                         PROT_NONE, MAP_SHARED | MAP_NORESERVE,
                          vmsg->fds[0], 0);
     } else {
         mmap_addr = mmap(0, dev_region->size + dev_region->mmap_offset,
-                         PROT_READ | PROT_WRITE, MAP_SHARED, vmsg->fds[0],
-                         0);
+                         PROT_READ | PROT_WRITE, MAP_SHARED | MAP_NORESERVE,
+                         vmsg->fds[0], 0);
     }
 
     if (mmap_addr == MAP_FAILED) {
@@ -920,7 +920,7 @@ vu_set_mem_table_exec_postcopy(VuDev *dev, VhostUserMsg *vmsg)
          * accessing it before we userfault
          */
         mmap_addr = mmap(0, dev_region->size + dev_region->mmap_offset,
-                         PROT_NONE, MAP_SHARED,
+                         PROT_NONE, MAP_SHARED | MAP_NORESERVE,
                          vmsg->fds[i], 0);
 
         if (mmap_addr == MAP_FAILED) {
@@ -1007,7 +1007,7 @@ vu_set_mem_table_exec(VuDev *dev, VhostUserMsg *vmsg)
          * mapped address has to be page aligned, and we use huge
          * pages.  */
         mmap_addr = mmap(0, dev_region->size + dev_region->mmap_offset,
-                         PROT_READ | PROT_WRITE, MAP_SHARED,
+                         PROT_READ | PROT_WRITE, MAP_SHARED | MAP_NORESERVE,
                          vmsg->fds[i], 0);
 
         if (mmap_addr == MAP_FAILED) {
-- 
MST


