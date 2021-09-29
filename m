Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D054541CC7D
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 21:16:12 +0200 (CEST)
Received: from localhost ([::1]:46292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVf3r-0004if-Ek
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 15:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mVf2J-0003zw-09
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:14:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mVf2C-0005d7-Ko
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:14:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632942866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZYxS0XGWvyn+bIPbHAJq7G1uhsLI5J4DtQeGJPDONEw=;
 b=EiTdwx57VWFZIweP3a2m+YlY7oDdfmrVT45bojYCBpGoLKOVkukX2+C2kHKxHgnD3smwmA
 LnwRSGJGpV+OXGlE1/JoLryEhsXf3uwHMywr2Kx0TeY1V84ZIwfap066EVqINkUngyuOZg
 /xUb7BJlCJTGB1ZWLM8I4vtWc+XS8Ig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335--mzNp1P0PYKE0m6W0QnhTg-1; Wed, 29 Sep 2021 15:14:25 -0400
X-MC-Unique: -mzNp1P0PYKE0m6W0QnhTg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79D5681450F;
 Wed, 29 Sep 2021 19:14:24 +0000 (UTC)
Received: from localhost (unknown [10.39.194.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0AAB060854;
 Wed, 29 Sep 2021 19:14:23 +0000 (UTC)
Date: Wed, 29 Sep 2021 20:14:23 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PULL 00/20] NBD patches through 2021-09-27
Message-ID: <20210929191423.GS3361@redhat.com>
References: <20210927215545.3930309-1-eblake@redhat.com>
 <CAFEAcA9P_xzSce_3bVKO95HOdhbf1aqVJ-eiXOkJ09Hj4ow+bg@mail.gmail.com>
 <97e67c45-21f9-2630-7173-991d01871116@redhat.com>
 <CAFXwXrnZzyUBSikVr6uFLHQeD5hWcXDq+eG=uwBC5xQ8FVivmg@mail.gmail.com>
 <9ba3ebe2-4d74-628f-fb76-5541f629ff9e@redhat.com>
 <20210929182921.t3g4ozzweoo4vpyu@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210929182921.t3g4ozzweoo4vpyu@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, berrange@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 29, 2021 at 01:29:21PM -0500, Eric Blake wrote:
> On Wed, Sep 29, 2021 at 05:03:08PM +0200, Paolo Bonzini wrote:
> > On 29/09/21 15:58, Richard Henderson wrote:
> > > 
> > >      > /usr/bin/ld: /usr/lib64/libselinux.so: error adding symbols: file in
> > >      > wrong format
> > >      > collect2: error: ld returned 1 exit status
> > > 
> > >     Missing libselinux-devel.i686 in
> > >     tests/docker/dockerfiles/fedora-i386-cross.docker, I think?
> > > 
> > > But additionally, incorrect package probing, I think.
> > 
> > Probably Meson deciding to look at --print-search-dirs and crossing fingers.
> > But -m32 and other multilib flags should be added to config-meson.cross
> > rather than QEMU_CFLAGS.
> 
> Rich, Dan, this is caused by 'nbd/server: Add --selinux-label option'
> (20/20 in this pull request); can you investigate?
> 
> In the short term, I'm leaning towards withdrawing that patch from the
> pull request, and getting everything else upstream; we can revisit a
> fixed version of that patch for my next pull request.

Yes I'll have to look at this later, so withdraw it from the PR for now.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-df lists disk usage of guests without needing to install any
software inside the virtual machine.  Supports Linux and Windows.
http://people.redhat.com/~rjones/virt-df/


