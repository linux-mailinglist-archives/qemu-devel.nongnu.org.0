Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F16F3DD65C
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 15:01:09 +0200 (CEST)
Received: from localhost ([::1]:41922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAXZ6-0004d5-Ey
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 09:01:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mAXXn-0003P6-C4
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:59:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mAXXk-0007Zp-L7
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:59:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627909183;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OcztPFBK2AhJgcTr3/SnEyRXZ2uYFidxiN1+BXeFM4s=;
 b=IuqiB4Z3CAkTT8Aa5Rf/cKxm1cjkdTl4Doik7hB/P7Lsjyuggj6OryOyle+95M7a34lxJU
 cBHkF7R2+680NJ6hq5uilZTxbue6MJzVtUtoQ/mo+AK6U3Ai1xTZ/qqb3+YygnqtUsOLxO
 k3hOM34ydeR9zz1RifIUi8K6EKZd51M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-Glrw6o70NXyK_Sq9HnZ1Rg-1; Mon, 02 Aug 2021 08:59:42 -0400
X-MC-Unique: Glrw6o70NXyK_Sq9HnZ1Rg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0705A10082F6;
 Mon,  2 Aug 2021 12:59:21 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.210])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8985C19C44;
 Mon,  2 Aug 2021 12:59:19 +0000 (UTC)
Date: Mon, 2 Aug 2021 13:59:16 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: "make check-acceptance" takes way too long
Message-ID: <YQfsJBEv92504gXX@redhat.com>
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <YQeu+Jm2Q0NlQ2Im@redhat.com> <87bl6gggb2.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87bl6gggb2.fsf@linaro.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 02, 2021 at 01:47:37PM +0100, Alex Bennée wrote:
> 
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Fri, Jul 30, 2021 at 04:12:27PM +0100, Peter Maydell wrote:
> >> "make check-acceptance" takes way way too long. I just did a run
> >> on an arm-and-aarch64-targets-only debug build and it took over
> >> half an hour, and this despite it skipping or cancelling 26 out
> >> of 58 tests!
> >> 
> >> I think that ~10 minutes runtime is reasonable. 30 is not;
> >> ideally no individual test would take more than a minute or so.
> >> 
> >> Output saying where the time went. The first two tests take
> >> more than 10 minutes *each*. I think a good start would be to find
> >> a way of testing what they're testing that is less heavyweight.
> >
> > While there is certainly value in testing with a real world "full" guest
> > OS, I think it is overkill as the default setup. I reckon we would get
> > 80-90% of the value, by making our own test image repo, containing minimal
> > kernel builds for each machine/target combo we need, together with a tiny
> > initrd containing busybox. This could easily be made to boot in 1 second,
> > which would make 'make check-acceptance' waaaaay faster, considering how
> > many times we boot a guest. This would also solve our problem that we're
> > pointing to URLs to download these giant images, and they're frequently
> > break URLs.
> 
> It's been discussed before but previously the worry has been the hassle
> of maintaining such images along with such tediousness as ensuring GPL
> compliance. We've outsourced that problem to the upstream.

I don't recall discussing that directly - only discussions around
hosting images / files from other distros on our own infra, that
does indeed create a compliance burden.

This is why I suggested /strictly/ nothing more than kernel+busybox
built from source ourselves, probably using debian cross compilers.

The busybox stuff would only need to be built once per architecture.
The kernel would potentially need more builds to cope with machine
board specific configs. We would not need to continually track new
releases - we can fix on specific kernel + busybox versions for as
long as they cope with the targets/archs we need.

I'd expect it all to be done in a gitlab repo, with a CI job to
publish the results, never any manual builds, so that we ensure
license compliance.

Of course the main problem is someone doing the leg work to get
such a system up & running initially to prove the concept.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


