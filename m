Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC0E589A4A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 12:09:59 +0200 (CEST)
Received: from localhost ([::1]:36288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJXnh-0003vz-JD
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 06:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJXgZ-00081O-9I
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 06:02:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJXgU-0002MQ-Q0
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 06:02:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659607349;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TGUwq1JzZcz4FnwH9ApflLWsIIBCAdn6zh4EeNrWwIg=;
 b=XDW+cckyo22ru6Lbpbw5JxtxDaPvudrJHFrpBN9opNaH0h9VVpsKB+0iTr4V9J2cTI4NAR
 L1yIi6X7BiD2mK/PWk6ZzhdeU6WYLFbuy0nisHaz195IsHor5WLsGhqxu60fIcHhyISJSs
 xbZ8x6cYRQGRe6aDFaSUVrB4B6R6rEY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-qkTviNKaO9ugbSZHUQLuwQ-1; Thu, 04 Aug 2022 06:02:26 -0400
X-MC-Unique: qkTviNKaO9ugbSZHUQLuwQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB92718E0043;
 Thu,  4 Aug 2022 10:02:25 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 244942166B26;
 Thu,  4 Aug 2022 10:02:24 +0000 (UTC)
Date: Thu, 4 Aug 2022 11:02:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Chalios, Babis" <bchalios@amazon.es>
Cc: qemu-devel@nongnu.org, ani@anisinha.ca, mst@redhat.com,
 imammedo@redhat.com, dwmw@amazon.co.uk, graf@amazon.de,
 xmarcalx@amazon.co.uk, Jason@zx2c4.com
Subject: Re: [PATCH 0/2] vmgenid: add generation counter
Message-ID: <YuuZLeYmOfzBlcNl@redhat.com>
References: <20220803134147.31073-1-bchalios@amazon.es>
 <Yuqhm5LCdg+zf/rH@redhat.com>
 <babbf105-f7df-a759-c942-45483dfae02f@amazon.es>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <babbf105-f7df-a759-c942-45483dfae02f@amazon.es>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 04, 2022 at 11:54:05AM +0200, Chalios, Babis wrote:
> Hi Daniel,
> 
> On 3/8/22 18:26, Daniel P. Berrangé wrote:
> > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> > 
> > 
> > 
> > On Wed, Aug 03, 2022 at 03:41:45PM +0200, bchalios@amazon.es wrote:
> > > From: Babis Chalios <bchalios@amazon.es>
> > > 
> > > VM generation ID exposes a GUID inside the VM which changes every time a
> > > VM restore is happening. Typically, this GUID is used by the guest
> > > kernel to re-seed its internal PRNG. As a result, this value cannot be
> > > exposed in guest user-space as a notification mechanism for VM restore
> > > events.
> > > 
> > > This patch set extends vmgenid to introduce a 32 bits generation counter
> > > whose purpose is to be used as a VM restore notification mechanism for
> > > the guest user-space.
> > > 
> > > It is true that such a counter could be implemented entirely by the
> > > guest kernel, but this would rely on the vmgenid ACPI notification to
> > > trigger the counter update, which is inherently racy. Exposing this
> > > through the monitor allows the updated value to be in-place before
> > > resuming the vcpus, so interested user-space code can (atomically)
> > > observe the update without relying on the ACPI notification.
> > The VM generation ID feature in QEMU is implementing a spec defined
> > by Microsoft. It is implemented in HyperV, VMWare, QEMU and possibly
> > more. This series is proposing a QEMU specific variant, which means
> > Linux running on all these other hypervisor platforms won't benefit
> > from the change. If the counter were provided entirely in the guest
> > kernel, then it works across all hypervisors.
> > 
> > It feels like the kernel ought to provide an implementation itself
> > as a starting point, with this QEMU change merely being an optional
> > enhancement to close the race window.
> > 
> > Ideally there would be someone at Microsoft we could connect with to
> > propose they include this feature in a VM Gen ID spec update, but I
> > don't personally know who to contact about that kind of thing. A
> > spec update would increase chances that this change gets provieded
> > across all hypervisors.
> 
> You are right, this *is* out-of-spec. The approach here is based on various
> discussions happened last year when we first tried to upstream and more
> recently when vmgenid landed in Linux. I find that this summary:
> https://lkml.org/lkml/2022/3/1/693 quite to the point. (CCing Jason to
> have his take on the matter).
> 
> This series comes together with a Linux counterpart:
> https://lkml.org/lkml/2022/8/3/563, where the generation counter is
> exposed to user-space as a misc device. There, I tried to make the
> generation counter "optional", in the sense that if it is not there, the
> ACPI device should not fail, exactly because, for the moment, this is
> not in the spec and hypervisors might not want to implement it.
> 
> However, I think that changing the spec will take time and this is a
> real issue affecting real use-cases, so we should start from somewhere.

I know a spec change can take time, but has there even been any effort
at all to try to start that action since first discussed a year ago ?

If these race condition issues are supposedly so serious that we need
to do this without waiting for a spec, then what is the answer for the
masses of users running Linux on VMware or HyperV/Azure ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


