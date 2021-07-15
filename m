Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 980F53CA598
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 20:36:53 +0200 (CEST)
Received: from localhost ([::1]:43608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m46E8-0005sp-5d
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 14:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m46Cz-0005DE-D1
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 14:35:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m46Cu-0004y8-MJ
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 14:35:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626374134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yFSXvHaz5PI1wR95lE7MBxmf/qyuknXA5dEcSrJl/FI=;
 b=A9tLSH4FJivIb6O6zNtKNyqS1xEmmWnRTzRfWe8+sxmWz89+y8wveeQXDeRS3sqUzUvrKb
 AKbNdkPZ0fdizh65Jh/PualvrpPW5wOx7PWFDqGWEfJCCXrqY4iJRZzWbEPcKZlU3BT3MA
 XUyNAEgpiU+G0xQJWHWXf/mXXwcZpqk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-8j0XeHAZMP-FqwcCSh8vNw-1; Thu, 15 Jul 2021 14:35:31 -0400
X-MC-Unique: 8j0XeHAZMP-FqwcCSh8vNw-1
Received: by mail-qk1-f200.google.com with SMTP id
 ay38-20020a05620a17a6b02903b7bed4e05eso4481055qkb.6
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 11:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yFSXvHaz5PI1wR95lE7MBxmf/qyuknXA5dEcSrJl/FI=;
 b=PbfyMvmaeFluVwJSWkcWyvN7cbVG0bBMZtsYpR9kGB1rvn2VCvCyOqBGyXxOxhSEXP
 l8CD4s5Av79oG+vxwzyXHMaKXufFERH4XVxe9dpEqCVI+iNgprfMXY37xmFm3/YG4IAP
 BIHriXDgv3BQcMO/H3Y2qqIlQehwYG4YNBzF08O6j60vfIiRjbFPM0UKBTqiDYDA/gKg
 qliThM1Q+G2VxLd9GZLXPOriaTlGD9vT1I7sZij/gY/oXH1zkNCGhvNSz2MoI4BETfNL
 /zGKHVfDAJUXfBwceR6Qg6FwmK2Ye6dJJPA4xN1pVDygPaueOFfyslWyGNlg1T4mA9Rw
 0y8g==
X-Gm-Message-State: AOAM533Jwtd674rdxcB/Uar0/rNOEQ5uHSZonJkOseX3VqxnqxKabHrQ
 ApI1Hhmzy5BXYVsBfUrRUS5nTkYTUIMy2zQinlXGTJhWvOfQ1W89y6m1MKWLHmD2T3V0La6fUaH
 VmnXvH3Y+wgnPx0U=
X-Received: by 2002:ac8:134c:: with SMTP id f12mr5024402qtj.279.1626374131377; 
 Thu, 15 Jul 2021 11:35:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuSk4AWdeDejL4hrd2dHUqlIwZALWriVzPQDAiRh3vjJj77Uj0tUfDlC+OEqBr01uNNU3CUQ==
X-Received: by 2002:ac8:134c:: with SMTP id f12mr5024386qtj.279.1626374131145; 
 Thu, 15 Jul 2021 11:35:31 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id r2sm2820284qkf.94.2021.07.15.11.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 11:35:30 -0700 (PDT)
Date: Thu, 15 Jul 2021 14:35:29 -0400
From: Peter Xu <peterx@redhat.com>
To: Thanos Makatos <thanos.makatos@nutanix.com>
Subject: Re: Question on memory commit during MR finalize()
Message-ID: <YPB/8f0pv7mDR310@t490s>
References: <20200420210049.GA420399@xz-x1>
 <fe73a74b-2324-68a5-a37f-530a6bb03ebc@redhat.com>
 <20200420233115.GB420399@xz-x1>
 <5ed295a3-9e4a-0dca-adc6-5361dc78a83c@redhat.com>
 <20200421104334.GC420399@xz-x1>
 <CH0PR02MB78989C2F77880AA5355037748B129@CH0PR02MB7898.namprd02.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <CH0PR02MB78989C2F77880AA5355037748B129@CH0PR02MB7898.namprd02.prod.outlook.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, John Levon <john.levon@nutanix.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Markus Armbruster <armbru@redhat.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 15, 2021 at 02:27:48PM +0000, Thanos Makatos wrote:
> Hi Peter,

Hi, Thanos,

> We're hitting this issue using a QEMU branch where JJ is using vfio-user as the transport for multiprocess-qemu (https://github.com/oracle/qemu/issues/9). We can reproduce it fairly reliably by migrating a virtual SPDK NVMe controller (the NVMf/vfio-user target with experimental migration support, https://review.spdk.io/gerrit/c/spdk/spdk/+/7617/14). I can provide detailed repro instructions but first I want to make sure we're not missing any patches.

I don't think you missed any bug fix patches, as the issue I mentioned can only
be trigger with my own branch at that time, and that's fixed when my patchset
got merged.

However if you encountered the same issue, it's possible that there's an
incorrect use of qemu memory/cpu API too somewhere there so similar issue is
triggered.  For example, in my case it was run_on_cpu() called incorrectly
within memory layout changing so BQL is released without being noticed.

I've got a series that tries to expose these hard to debug issues:

https://lore.kernel.org/qemu-devel/20200421162108.594796-1-peterx@redhat.com/

Obviously the series didn't track enough interest so it didn't get merged.
However maybe that's also something useful to what you're debugging, so you can
apply those patches onto your branch and see the stack when it reproduces
again. Logically with these sanity patches it could fail earlier than what
you've hit right now (which I believe should be within the RCU thread; btw it
would be interesting to share your stack too when it's hit) and it could
provide more useful information.

I saw that the old series won't apply onto master any more, so I rebased it and
pushed it here (with one patch dropped since someone wrote a similar patch and
got merged, so there're only 7 patches in the new tree):

https://github.com/xzpeter/qemu/tree/memory-sanity

No guarantee it'll help, but IMHO worth trying.

Thanks,

-- 
Peter Xu


