Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 280A5607B6B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 17:43:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oluB0-0004t1-3A
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 11:43:15 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oltxh-0008Qc-P3
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 11:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oltxY-0006rS-Tx
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 11:29:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oltxS-0004fq-5b
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 11:29:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666366153;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GOZAMrCXh/AHzXFjzMT64VAoMLwzbWQsa5LqoyKuhYA=;
 b=dOJTknPqaqo7gZVKIwzcrB15rmU4ij8+EZjxN3wa5LmwiyFOBWo090O1VBiQqbwY08q17Z
 Gd7EnkeaqOYGoumUH6KYXt64RATxfYOpZVTklMFBVfYJLLFpqMMmqvxQn7j0W5LTJ0z/Hh
 YfmINoN8Q+ZtouRHOopsJ+oPanDzdxM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-xeLsGWMqO8ilnIpk9qPdNQ-1; Fri, 21 Oct 2022 11:29:09 -0400
X-MC-Unique: xeLsGWMqO8ilnIpk9qPdNQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D68D101B44C;
 Fri, 21 Oct 2022 15:29:03 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.210])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F7B142620D;
 Fri, 21 Oct 2022 15:28:58 +0000 (UTC)
Date: Fri, 21 Oct 2022 16:28:55 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 3/4] meson: enforce a minimum Linux kernel headers
 version >= 4.18
Message-ID: <Y1K6t7ZixnpGkhSS@redhat.com>
References: <20221004093206.652431-1-berrange@redhat.com>
 <20221004093206.652431-4-berrange@redhat.com>
 <d51ca4c0-6115-7ed3-a6be-dec67bdbfdb0@vivier.eu>
 <CAFEAcA-GSKzEwPnjzBw0tn4G6+uRHRL1dDmvAiiYUb1YVo8T4Q@mail.gmail.com>
 <Y1Kxv6djOygcZCuk@redhat.com>
 <CAFEAcA8oxBaV-gdKncKEjAdWJQkSLOoWXf3Kz280PruFQj0veQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA8oxBaV-gdKncKEjAdWJQkSLOoWXf3Kz280PruFQj0veQ@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 21, 2022 at 04:05:27PM +0100, Peter Maydell wrote:
> On Fri, 21 Oct 2022 at 15:50, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Fri, Oct 21, 2022 at 03:38:38PM +0100, Peter Maydell wrote:
> > > On Fri, 21 Oct 2022 at 15:30, Laurent Vivier <laurent@vivier.eu> wrote:
> > > >
> > > > Le 04/10/2022 à 11:32, Daniel P. Berrangé a écrit :
> > > > > Various areas of QEMU have a dependency on Linux kernel header
> > > > > definitions. This falls under the scope of our supported platforms
> > > > > matrix, but historically we've not checked for a minimum kernel
> > > > > headers version. This has made it unclear when we can drop support
> > > > > for older kernel headers.
> > > > >
> > > > >    * Alpine 3.14: 5.10
> > > > >    * CentOS 8: 4.18
> > > > >    * CentOS 9: 5.14
> > > > >    * Debian 10: 4.19
> > > > >    * Debian 11: 5.10
> > > > >    * Fedora 35: 5.19
> > > > >    * Fedora 36: 5.19
> > > > >    * OpenSUSE 15.3: 5.3.0
> > > > >    * Ubuntu 20.04: 5.4
> > > > >    * Ubuntu 22.04: 5.15
> > > > >
> > > > > The above ignores the 3rd version digit since distros update their
> > > > > packages periodically and such updates don't generally affect public
> > > > > APIs to the extent that it matters for our build time check.
> > > > >
> > > > > Overall, we can set the baseline to 4.18 currently.
> > > >
> > > > As this change affects entire QEMU build, I'd prefer to have some "Acked-by" before merging it via
> > > > linux-user branch.
> > >
> > > I still think we should be more conservative about kernel header
> > > requirements than we are for other dependencies.
> >
> > How much more though ?  What other distros do we want to target that
> > we don't already cover with our targetted platforms  ?
> 
> I don't want to target them. I just don't want to leave them
> completely stuck. I think system headers are significantly
> different from just needing to build a local version of some
> dependency library.



> 
> Alternatively if we really need recent kernel headers to build
> linux-user then we should come up with some scheme for using
> a local copy of the relevant headers, as we do for KVM...

This wasn't so much about needing recent headers, rather it was
about removing conditionals that are not likely to be needed by
anyone. I wanted to set a min kernel version to make it clearer
to future authors how far back they need to care about compat
for.

The next patch removed conditions for:

  2.5.66 (??)
  2.6.0  (Dec 2003)
  4.2    (Aug 2015)
  4.12   (Jul 2017)

I can't imagine anyone needs 2.6.x support.  Perhaps 4.x if
someone is still using RHEL-7 though

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


