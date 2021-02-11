Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B58EE318B5B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:02:45 +0100 (CET)
Received: from localhost ([::1]:36728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABcK-0001os-PA
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:02:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lABSP-0001q3-I3
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:52:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lABSM-0005M8-0s
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:52:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613047944;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SdS0WWVK+aHokvxWveyNRSjm4yVgU3xCbjKn59o7+eQ=;
 b=hznmrjskrzqsE0jUsVZRnz5GVex4/5FmiWIPyTNCvZ5J9Wf+3iHVyHwd798DlDvHIsbGdn
 xmc6dOAWaiR4YKn9ETKG/1c7zhBvUeyNRcG9kVSD6/uFm+3lczvF+Bect0Nnc9eE447ZoC
 O2JHgxsxj1sK7461FxUTFb4P1s3+7+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-zVQiq4TsNmS0f8aa39x3iA-1; Thu, 11 Feb 2021 07:52:18 -0500
X-MC-Unique: zVQiq4TsNmS0f8aa39x3iA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EC751005501
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 12:52:17 +0000 (UTC)
Received: from redhat.com (ovpn-114-239.ams2.redhat.com [10.36.114.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A5F5760CEA;
 Thu, 11 Feb 2021 12:52:16 +0000 (UTC)
Date: Thu, 11 Feb 2021 12:52:13 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] meson: adjust timeouts for some slower tests
Message-ID: <20210211125213.GD1302824@redhat.com>
References: <20210209174541.150011-1-pbonzini@redhat.com>
 <20210209175834.GW1166421@redhat.com>
 <725dd339-1eee-4791-fda8-2922a5d19a44@redhat.com>
MIME-Version: 1.0
In-Reply-To: <725dd339-1eee-4791-fda8-2922a5d19a44@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 12:30:35PM +0100, Paolo Bonzini wrote:
> On 09/02/21 18:58, Daniel P. Berrangé wrote:
> > On Tue, Feb 09, 2021 at 06:45:41PM +0100, Paolo Bonzini wrote:
> > > Adjust the timeouts for the longest running tests.  These are the
> > > times that I measured and the corresponding timeouts.  For generic
> > > qtests, the target that reported the longest runtime is included.
> > > 
> > > unit tests:
> > >      test-crypto-tlscredsx509        13.15s   60s
> > >      test-crypto-tlssession          14.12s   60s
> > 
> > The default meson timeout is 30 seconds which is enough for these
> > tests. Of course larger timeouts give more headroom.
> 
> This was a relatively fast run, I've had them take as little as 7s and as
> much as 25s on the same machine.  I suspect it's because the machine has a
> very slow NFS home directory (yes those things still exist :)). In general a
> 2x-ish headroom makes sense in case someone is doing a build at the same
> time as a test run.
> 
> By the way, with Meson 0.57 there's the possibility of specifying "infinite
> timeout", and this could be used for the benchmarks.  Giving slower tests a
> higher priority is also a good idea, and even though this is not guaranteed
> in theory, Make ends up taking into account the priority as well.  With
> these tweaks "meson test" and "make check" (minus check-block of course)
> both clock at 2:20s, which is exactly the time it takes to run the
> longest-running test.
> 
> I will also give "meson test" a shot on the GitLab runners before posting
> v2, and see if it needs a timeout multiplier.

I'd say we should set the default timeouts so that they are suitable for
our automated GitLab CI, and what we expect typical developer platforms.

Timeout multiplier should only be needed if users are running on outdated
hardware, or under slow emulation.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


