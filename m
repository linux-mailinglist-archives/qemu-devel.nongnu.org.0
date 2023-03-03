Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A546A9CE8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:12:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY8xP-0002TJ-QG; Fri, 03 Mar 2023 12:12:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY8xL-0002Sg-Au
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:12:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY8xG-0001bl-V8
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:12:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677863545;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fzqey3tEqyovAYEyen8tldFYubl7MsRliuXMfECzZ9k=;
 b=ZRpF3WU26AP/ndir/HqYvKsqnlssLUulJ9XQ3H/+s3vizBXm/Z2En+nm4zNhNVRraOyEQC
 fvzGV7ntoEDE+iwTKk7o3vWRzO6R6sjptdx/Bh71d9V+aY7M/lYfMz6tLUQNTlic7pIb8F
 cF0W7y96OWlU+o/Tv9Q198YPvQGn7VU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-xUvMFH5NN6STOAsgFXGndg-1; Fri, 03 Mar 2023 12:12:22 -0500
X-MC-Unique: xUvMFH5NN6STOAsgFXGndg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BF6585CBE0;
 Fri,  3 Mar 2023 17:12:22 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E27A40C6EC4;
 Fri,  3 Mar 2023 17:12:21 +0000 (UTC)
Date: Fri, 3 Mar 2023 17:12:18 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Haitao Shan <hshan@google.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/6] Adding the Android Emulator hypervisor driver
 accelerator
Message-ID: <ZAIqclU7BbH2vog7@redhat.com>
References: <CAGD3tSzW1QoAsn+uGjoAkBegLt1iZ=9YWDFcvqbcHMr0S_5kVw@mail.gmail.com>
 <ZAHNEtV0N+9JyZTk@redhat.com>
 <CAGD3tSzZAa+zRv0xEetB-WW+zmnGNJUAzLj0CyGCek9YYDNq9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGD3tSzZAa+zRv0xEetB-WW+zmnGNJUAzLj0CyGCek9YYDNq9g@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Mar 03, 2023 at 08:50:18AM -0800, Haitao Shan wrote:
> On Fri, Mar 3, 2023 at 2:34 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Thu, Mar 02, 2023 at 06:25:59PM -0800, Haitao Shan wrote:
> > > The Android Emulator hypervisor driver is a hypervisor for Windows (7
> > > or later), made by porting the KVM from the linux kernel 4.9-rc7. Its
> > > initial purpose was to support the Android Emulator on the AMD
> > > platforms as the old name "Android Emulator Hypervisor Driver for AMD
> > > Processors" suggested. Despite the name, Intel processors have been
> > > supported ever since its first release. Since Intel dropped HAXM support,
> > > the android emulator is switching from HAXM to AEHD.
> >
> > When HAXM was proposed for deprecation & removal from QEMU, the suggestion
> > was that users should switch to Windows' native replacement WHPX, which
> > QEMU already has support for.
>
> Sorry I was not aware of Intel's suggestion when HAXM was deprecated.
> Is this a decision already, which shuts the door for any other 3rd party
> hypervisors?

No, we're always open to new proposals. It merely means that it
might be harder to justify why the new hypervisor is a net benefit
for QEMU, when there is a competing solution supported by the OS
vendor.

> > What is the rationale for wanting to introduce a 3rd party hypervisor
> > solution like AEHD, for the Android emulator, rather than just sticking
> > with the standard WHPX hypervisor available for Windows ? IIUC, the
> > Android emulator can already support WHPX according to these pages:
> >
> >   https://developer.android.com/studio/run/emulator-acceleration
> >   https://learn.microsoft.com/en-us/dotnet/maui/android/emulator/hardware-acceleration?view=net-maui-7.0
> You are right. WHPX is supported by the android emulator. The reason for
> supporting AEHD:
> 
> 1. HyperV is a type-1 hypervisor, which does not coexist with other hypervisors.
> According to our data, there are both users who have to live with HyperV on or
> with HyperV off. Those users depend on certain Windows features (or 3rd party
> programs) that have to turn on or turn off HyperV. Offering AEHD allows us to
> serve both types of users. This is the major benefit. I think this
> argument is true
> for upstream QEMU users as well.

Yes, it is an akward situation if users cannot enable use of WHPX.
I don't have any better suggestion in that scenario.

> 2. Actually, AEHD started development before WHPX was added to the android
> emulator. But porting/writing a new hypervisor just took lots of time.
> In the middle,
> Microsoft offered us WHPX. It could be the case that AEHD was never started if
> WHPX had been offered one or two years earlier. However, we decided to continue.
> First, see reason 1. Second, at least at that time, WHPX was noticeably slower
> than both HAXM and AEHD. Third, Microsoft clearly stated there would not be
> any backporting of WHPX to older versions of Windows. And those using old
> versions of Windows need a solution in addition to HAXM.

FYI, from the QEMU POV, we only aim to support the two most recent major
releases of Windows.

At a technical level we've set the compilation baseline to Windows 8, but
per the support policy we only really support Windows 10 and 11 right now.

> 3. Compared with HAXM, which looks like the default solution when HyperV
> must be off, AEHD supports both Intel and AMD. And according to user feedback
> and our own tests, AEHD can support Windows 10. This was the reason
> why I maintained a patched QEMU ever since 4.2.0 specifically for them.

Yep, no disagreement that AEHD looks more useful for HAXM given the
cross vendor CPU support.

> 4. Although it is called Android Emulator hypervisor driver, it has nothing that
> is android specific. And I've seen the upstream QEMU successfully refactored the
> accelerator logic. This made adding a new hypervisor support less intrusive to
> the main code base. I have a good will and intention to maintain what I
> submitted if it could be approved by the community. I hope this does
> not place (or
> at least place very minimum) burden on the maintainers, should it be accepted.

Ok, thank you.

I don't have any specific requests / suggestion myself, but I see others
replied wondering whether there's any sense is sharing code with the
KVM driver in QEMU. Hopefully the QEMU KVM maintainers will comment with
their views on the matter.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


