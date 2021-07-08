Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F072C3BF2D0
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 02:24:02 +0200 (CEST)
Received: from localhost ([::1]:41476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Hph-000838-Id
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 20:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1How-0007ON-9u
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:23:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1Hos-0003M9-Mq
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:23:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625703789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qFBCeRD7HLdBvWfEpmPFh6DhKXq4HO8Ap1ymbhNl6Dk=;
 b=Nt5uO0sVTEiyrKAlOxbSyuhurMpoWxCLGLIrfthfIhcWJ0CnBLNXIVcbYTwPmgc9rKF3k7
 HhcRxcMPwYiW4TPvEf21M+0RjLGOzGxOg4hCaQnVbn9Ew4jUicHko2Z9HMAYuMW7tvuBTh
 mM9Zyi1/kHlCVJx+hbRb2/Ts0rmyZ3Y=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-EZAGDxVMNbeODNfKkHi_3g-1; Wed, 07 Jul 2021 20:23:08 -0400
X-MC-Unique: EZAGDxVMNbeODNfKkHi_3g-1
Received: by mail-qk1-f197.google.com with SMTP id
 o14-20020a05620a0d4eb02903a5eee61155so2669363qkl.9
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 17:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qFBCeRD7HLdBvWfEpmPFh6DhKXq4HO8Ap1ymbhNl6Dk=;
 b=RCXLI4BOual1K2rXYK5Kca0zc/AR7G0uh5ltGYHVsfnHCGXVEonHNqbZme/GjZO4V2
 uObALqVDuE+HxQrqQR+R7zy9LfLZ1uYEBz2pVaYTJZ1gweDca9xUnOC95suE37ysL2TV
 UR0RHrL69zpaxWR4K0m8YYtsmVF2jgb+LSb5ELOnKT+sZy00gadbEIHYYjbKaEHIuoNj
 hNR3zFDpUhFEtTNCFF4rSgKUPnjhcVWR2ImzMHxERNvRYL0re8CgveS6nOGXobLW6s3b
 6VEHSAr0UwiKOJpP57mGv6E1WDCzkEYP1AtXhGI6BbDa+qjSasE9aGZm5VGYcyIcv2Ya
 MV7g==
X-Gm-Message-State: AOAM533gz6ITBxpaTFiYJlXb3HgezCDUnpGBMMmpuyW/ocoD44eBVjUp
 JhgDduw9ygOg5FKSCqhIvrI/lXFr7WOMBzuo4aSaK3mkT+NKqZsffQCxBhee+7c8c/w71mwRoMM
 ArmvlkvhzvbG/7q0=
X-Received: by 2002:a05:622a:134d:: with SMTP id
 w13mr24396734qtk.275.1625703787857; 
 Wed, 07 Jul 2021 17:23:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3KDp9w6IUARVtuSb2WSC/lqav9PK1hONhYfRhsSpmqUW0SZANeAlRRvkYb2B10Op6WIrcqg==
X-Received: by 2002:a05:622a:134d:: with SMTP id
 w13mr24396715qtk.275.1625703787594; 
 Wed, 07 Jul 2021 17:23:07 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id j28sm71455qki.52.2021.07.07.17.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 17:23:06 -0700 (PDT)
Date: Wed, 7 Jul 2021 20:21:22 -0400
From: Peter Xu <peterx@redhat.com>
To: "Wang, Wei W" <wei.w.wang@intel.com>
Subject: Re: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Message-ID: <YOZFAmAEQuOWvvIK@t490s>
References: <604935aa45114d889800f6ccc23c6b13@intel.com>
 <824a1d77-eab0-239f-5104-49c49d6ad285@redhat.com>
 <562b42cbd5674853af21be3297fbaada@intel.com>
 <a5877d58-d501-0ff6-676b-c98df44d1b6f@redhat.com>
 <a01758f98b3f46f282f0d6974862680d@intel.com>
 <f554501a-19d9-a22d-f399-5db4dbb81764@redhat.com>
 <YOSVZLwZzY/rZ0db@t490s>
 <b94e02b7e7bd4f2a8cbed73cb7756a68@intel.com>
 <YOXaIlPxHSlINjiz@t490s>
 <7f3e27272da9469281d8fa5820978e51@intel.com>
MIME-Version: 1.0
In-Reply-To: <7f3e27272da9469281d8fa5820978e51@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 07, 2021 at 11:25:50PM +0000, Wang, Wei W wrote:
> On Thursday, July 8, 2021 12:45 AM, Peter Xu wrote:
> > On Wed, Jul 07, 2021 at 12:45:32PM +0000, Wang, Wei W wrote:
> > > Btw, what would you think if we change mutex to QemuSpin? It will also reduce
> > the overhead, I think.
> > 
> > As I replied at the other place, the bottleneck we encountered is the lock taking
> > not sleeping, so I'm afraid spinlock will have the same issue. Thanks,
> 
> I suspect the overhead you observed might be caused by the syscalls for mutex. Per-page syscall might be too much.
> If possible, you could have another test of the 3GB guest migration using QemuSpin.

I'm a bit confused.. Why taking a mutex with no contention would need a syscall?

Please feel free to strace on a general version glibc impl of pthread mutex
which qemu uses, I believe it didn't need to.

Thanks,

-- 
Peter Xu


