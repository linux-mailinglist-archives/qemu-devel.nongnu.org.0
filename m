Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6A45E9E6A
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 11:55:12 +0200 (CEST)
Received: from localhost ([::1]:54110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ockpT-00048W-SI
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 05:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ockUI-00052T-8n
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:33:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ockUG-0000Yf-QB
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:33:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664184795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R7WxkcmbH/oqG28zLpv542GNyNfJNh8cvhXRrOxe/VU=;
 b=iyr8uagBL+CqprES28g5Cw4UwYjPiVs5xZwpJteRBB9X1bF2j7W3NZ5ePLmQLJ5If1v1Gc
 pRycZLuzECs71BWsdDACqXO6x9C1f6vjBlDfCSahjNighQZvxQ3exZ59+Fg1VkTgDMOatd
 YC8ALgDP/34h6vKcZyI5GiMZmN/nLkI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-207-PzSpL0RGOo2o4DkT88Uqog-1; Mon, 26 Sep 2022 05:33:14 -0400
X-MC-Unique: PzSpL0RGOo2o4DkT88Uqog-1
Received: by mail-ed1-f71.google.com with SMTP id
 z13-20020a05640240cd00b0045276a79364so4945748edb.2
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 02:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=R7WxkcmbH/oqG28zLpv542GNyNfJNh8cvhXRrOxe/VU=;
 b=3klGq0bSK4qcbIecLVCGOPt+EsXA940N5TlU1I+YrHRE2CkFOzC0d/75XFv6Xqs3u3
 BNeTqPquY9pYGhjhMqKuAGhK44omh2RLIgKQXxidjVjnoo5jF4P+mNFXIugQq+QrfJBJ
 Z8s9MD/f1euEp+DxH9dr6+GSNpKaTq/D6C+as0cJVS2iEp0CtWPKu4pWYl500kjk9I7o
 8kMfBTh6goM3D9wORYKvqmsz4/G5BIIWjC9aXxvLYcr3lux6GpxeV+dACFLfEU9oxcEG
 fC+6Zcrknfk4/Z8uREt9AIE/ibIRqefoijLirjR3WAGLHuFyl/bvKk4VzMgYxkuphSw4
 FBVA==
X-Gm-Message-State: ACrzQf37335SUDc+T7kGP8b0TZEUamU8PANHg+7hCm/YAAdJu0W8MohX
 UxPKeNPKRS1FsNZtu3PnQrfcsEzgTtuTZwoQc+4/654yDnFJz8lIN8Pjfqev9YIMXmZFaxHBQKW
 pB4tzd7a8TEiNU7M=
X-Received: by 2002:a05:6402:703:b0:456:53e9:9b70 with SMTP id
 w3-20020a056402070300b0045653e99b70mr16423368edx.24.1664184793225; 
 Mon, 26 Sep 2022 02:33:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7VzZDhHMeBEpQ0caZjz/PapY4YI7XP6/lBpQd5/MZt+bsG56GHYY67DDjnYidM3AUWdlNZaA==
X-Received: by 2002:a05:6402:703:b0:456:53e9:9b70 with SMTP id
 w3-20020a056402070300b0045653e99b70mr16423350edx.24.1664184792975; 
 Mon, 26 Sep 2022 02:33:12 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 ti5-20020a170907c20500b007801ce34311sm7993935ejc.19.2022.09.26.02.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 02:33:12 -0700 (PDT)
Date: Mon, 26 Sep 2022 11:33:11 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, David
 Woodhouse <dwmw2@infradead.org>, Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH] Revert "intel_iommu: Fix irqchip / X2APIC configuration
 checks"
Message-ID: <20220926113311.417316b7@redhat.com>
In-Reply-To: <Yy5c7M10df3OINwH@x1n>
References: <20220921161227.57259-1-peterx@redhat.com>
 <20220922154617.57d1a1fb@redhat.com> <YyyP4b2uKghi1EHL@xz-m1.local>
 <20220923102034.6579b66c@redhat.com>
 <20220923104159.39576159@redhat.com> <Yy4tQAeOUd49DpX6@x1n>
 <Yy5c7M10df3OINwH@x1n>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Fri, 23 Sep 2022 21:27:08 -0400
Peter Xu <peterx@redhat.com> wrote:

> On Fri, Sep 23, 2022 at 06:03:44PM -0400, Peter Xu wrote:
> > On Fri, Sep 23, 2022 at 10:41:59AM +0200, Igor Mammedov wrote:  
> > > It's worth putting history excavation with explanation what is broken and why
> > > compat stuff is being ignored in the patch.  
> > 
> > Makes sense, I'll amend the commit message and repost.  Thanks,  
> 
> There's actually one way to slightly remedy this single case, mostly for
> any QEMU 7.1.0 user with -smp <=8 and the intel iommu (as 77250171bdc02 is
> merged only in 7.1.0).
> 
> We can have one compact parameter x-eim-enable-kvm-x2apic, setting it "on"
> by default, "off" for 7.1, and "on" for 7.0-.
> 
> I'm not very sure whether that'll worth it.  Any thoughts?

How it (enabling x2apic API) would affect kvm/guests running with 8 or less CPUs
and with intel iommu + remapping?

> 


