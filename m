Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 256836A945A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:44:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY1Ag-0007V0-Ar; Fri, 03 Mar 2023 03:53:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY1Ac-00076B-SY
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:53:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY1Aa-00054p-8U
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:53:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677833619;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dwrGwex2nNXThG3AcGlHA5oAm1BdYRXnriYAYQ+4xAY=;
 b=QkXKF1cLSJvk3I4iPmmfP2dJLzcxCFogOdFq6cToiXLdsW3XE3B34gK7WKN/052GHXgzOo
 M0XQsYwm3aKrEnXNHmFIh/OwEuxz/nZbHBakNYCSOTwZjK90WQDnwuEMf1xH0LrEZjh/jq
 1OMaeIqRnZl+d30KZ6jo6YNTrkSP1X8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-C_cCfiYJPrCpqZsXAg8jHw-1; Fri, 03 Mar 2023 03:53:36 -0500
X-MC-Unique: C_cCfiYJPrCpqZsXAg8jHw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2D6E18A6465;
 Fri,  3 Mar 2023 08:53:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98853492C3E;
 Fri,  3 Mar 2023 08:53:34 +0000 (UTC)
Date: Fri, 3 Mar 2023 08:53:32 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/5] iotests: make meson aware of individual I/O tests
Message-ID: <ZAG1jLsR8vZJprJ4@redhat.com>
References: <20230302184606.418541-1-berrange@redhat.com>
 <44d571e7-05b6-b2a1-7eb7-44bf2912ec69@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44d571e7-05b6-b2a1-7eb7-44bf2912ec69@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Mar 03, 2023 at 09:30:39AM +0100, Thomas Huth wrote:
> On 02/03/2023 19.46, Daniel P. Berrangé wrote:
> > To just repeat the patch 5 description...
> > 
> > Currently meson registers a single test that invokes an entire group of
> > I/O tests, hiding the test granularity from meson. There are various
> > downsides of doing this
> > 
> >   * You cannot ask 'meson test' to invoke a single I/O test
> >   * The meson test timeout can't be applied to the individual
> >     tests
> >   * Meson only gets a pass/fail for the overall I/O test group
> >     not individual tests
> >   * If a CI job gets killed by the GitLab timeout, we don't
> >     get visibility into how far through the I/O tests
> >     execution got.
> > 
> > This is not really specific to the I/O tests, the problem is common
> > to any case of us running a test which is in fact another test
> > harness which runs many tests. It would be nice to have meson have
> > the full view of all tests run. Adapting the I/O tests is as easy
> > win in this respect.
> > 
> > This switches meson to perform test discovery by invoking 'check' in
> > dry-run mode. It then registers one meson test case for each I/O
> > test. Parallel execution remains disabled since the I/O tests do not
> > use self contained execution environments and thus conflict with
> > each other.
> 
> Great to see some movement in this area again!
> 
> Some questions/remarks:
> 
> 1) Could you remove tests/check-block.sh now? See also:
>    https://lore.kernel.org/all/20220209101530.3442837-9-thuth@redhat.com/

Possibly, I wasn't sure if that was wanted as a general entry
point for humans, or was solely for meson ?

> 2) With regards to parallel execution ... I think it should be
>    possible nowadays - the "check" script is normally also run
>    with the "-j" switch by the tests/check-block.sh script, so
>    if you remove the possibility to run in parallel, it's a
>    regression from the previous behavior!

Hmmm, I got *masses* of test failures when running in parallel
but I'll check again to be sure.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


