Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 396BB3D9F91
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 10:28:16 +0200 (CEST)
Received: from localhost ([::1]:46050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m91Op-0000k4-8E
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 04:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m91NH-0006NF-4w
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:26:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m91NF-0001Pj-7v
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:26:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627547196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jPy6HEGdkq/BdI9Qi0TIlNmX54jJZju5+zDcuhTbBks=;
 b=bMY3kZc9jb3SAFUoM781q3MKvzzlDESNA/po3rSpq4WS75q7b7eh6hgmeP76cjZxmkIPWJ
 fop098a2ygrSZIg6STi5UKHozUP4cn/7tov2zNtjApPZ4iYVLxgCZ7x/pCy8xT4r80JA+B
 TokOl3hofAErQwxVAAlbN6Mr/qnXyG8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-CPRu7q6FO9eSSdPxiFMh6A-1; Thu, 29 Jul 2021 04:26:35 -0400
X-MC-Unique: CPRu7q6FO9eSSdPxiFMh6A-1
Received: by mail-wm1-f69.google.com with SMTP id
 r125-20020a1c2b830000b0290197a4be97b7so1746781wmr.9
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 01:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jPy6HEGdkq/BdI9Qi0TIlNmX54jJZju5+zDcuhTbBks=;
 b=JwngXQXJYWj0BIMgjBs6ivWegM9zbPpR8qvTby4LaG7ajTAthWojljZcRFG9tKRzmG
 feW+iyV10TIOyISz4P80JeP2pQVxVzUMh71grUNSXgV8HAelxVjL2t2PxIsOv0CWB1zX
 qcFcleWo7Km8EZUWa9WP0S7gYdtNBVpUlqRD3QJ2GMzvXc+dMGtJJd7CaEXV6VJHMosL
 l1p3rTYZ9a7FMtQQMeF5Ohk3cyvKdFKjAJJsBN7Jb+SwjFJssYagr6KM2pk72dMpUYde
 UldP2IHyPc/RtcQJGhTgvC9QVNRLsKQQRmzrSVurGTNqmPrbMbarpaakbM29PASoHRj+
 kztA==
X-Gm-Message-State: AOAM531L+7IkPqKfmnyqH9WgtiWHX1BAK5toMvKe3SgI2T0jP4liD8H5
 Tn0sPEAMxEjFGmu4K9z/u7wEkOYCDe8dneTDXSRXVIjRDSrf9/+0OXsvMWvr+/sPo9cMco50G51
 K6BCJTZes6r/Vgeg=
X-Received: by 2002:a05:6000:1b02:: with SMTP id
 f2mr3434519wrz.274.1627547194032; 
 Thu, 29 Jul 2021 01:26:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztgH3S2KvcWrkkojV+CUcap9xN99h7N5iCb49B1baPveuA4Oa/m0xFf6QKcGo3R2F3TLIxrw==
X-Received: by 2002:a05:6000:1b02:: with SMTP id
 f2mr3434505wrz.274.1627547193918; 
 Thu, 29 Jul 2021 01:26:33 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id t1sm2435496wrm.42.2021.07.29.01.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 01:26:33 -0700 (PDT)
Date: Thu, 29 Jul 2021 09:26:31 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests: Fix migration-test build failure for sparc
Message-ID: <YQJmN61aUvANxr0I@work-vm>
References: <20210728214128.206198-1-peterx@redhat.com>
 <d5093e20-fb32-dcd5-2100-b26eafb55672@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d5093e20-fb32-dcd5-2100-b26eafb55672@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Thomas Huth (thuth@redhat.com) wrote:
> On 28/07/2021 23.41, Peter Xu wrote:
> > Even if <linux/kvm.h> seems to exist for all archs on linux, however including
> > it with __linux__ defined seems to be not working yet as it'll try to include
> > asm/kvm.h and that can be missing for archs that do not support kvm.
> > 
> > To fix this (instead of any attempt to fix linux headers..), we can mark the
> > header to be x86_64 only, because it's so far only service for adding the kvm
> > dirty ring test.
> > 
> > No need to have "Fixes" as the issue is just introduced very recently.
> > 
> > Reported-by: Richard Henderson <rth@twiddle.net>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >   tests/qtest/migration-test.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> > index 1e8b7784ef..cc5e83d98a 100644
> > --- a/tests/qtest/migration-test.c
> > +++ b/tests/qtest/migration-test.c
> > @@ -27,7 +27,8 @@
> >   #include "migration-helpers.h"
> >   #include "tests/migration/migration-test.h"
> > -#if defined(__linux__)
> > +/* For dirty ring test; so far only x86_64 is supported */
> > +#if defined(__linux__) && defined(HOST_X86_64)
> >   #include "linux/kvm.h"
> >   #endif
> > @@ -1395,7 +1396,7 @@ static void test_multifd_tcp_cancel(void)
> >   static bool kvm_dirty_ring_supported(void)
> >   {
> > -#if defined(__linux__)
> > +#if defined(__linux__) && defined(HOST_X86_64)
> >       int ret, kvm_fd = open("/dev/kvm", O_RDONLY);
> >       if (kvm_fd < 0) {
> > 
> 
> Acked-by: Thomas Huth <thuth@redhat.com>
> 
> Juan, Dave, if you don't mind I can take this through my testing branch -
> I'm planning to send a pull request today anyway.

Please do; thanks!

Dave

>  Thomas
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


