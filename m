Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0876C6923B1
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:53:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWdG-0001DF-R7; Fri, 10 Feb 2023 11:52:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQWdC-0001Ce-Qr
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:52:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQWdA-0002y5-Bw
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:52:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676047931;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=7i82ud4LBeNFd/0vKYBxV4FWSpOEzzVW81VQ5qTcWmY=;
 b=HVHfJ2CPNKri0dI1bl/35syCQDD3f5onZPMUSk+ufclyrU4ph1ezyzXC4EtqnJlNUf6n69
 Gx1iAFrlkdTono1vtnkXovnzOkEp94M71KhFX7gakvzqXLMAE2ZLSgzMBHbMvemsITV6L1
 bk3WHpmYMROCov+4N8nXbowbMK99zB0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-z46ttqqHPsetpEqK5-KfsA-1; Fri, 10 Feb 2023 11:52:08 -0500
X-MC-Unique: z46ttqqHPsetpEqK5-KfsA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8951A18E5340;
 Fri, 10 Feb 2023 16:52:07 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9670040CF8F0;
 Fri, 10 Feb 2023 16:52:03 +0000 (UTC)
Date: Fri, 10 Feb 2023 16:51:53 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 6/7] CI: Stop building docs on centos8
Message-ID: <Y+Z2Kcq17HGWuoTV@redhat.com>
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-7-jsnow@redhat.com>
 <CAFEAcA-c5y0TR8vYg_FYEmGv3mOOmBgeD0cyb+mVotsP=r-Dsw@mail.gmail.com>
 <CAFn=p-aDV9=vG6hjTWRE6c52TpYSjDBU22nthTuejDCv_XrYMQ@mail.gmail.com>
 <CAFEAcA_eGvz_BQVLhVWtedRh2mcBuMEhv0RKF+6DW4t+9FdPAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA_eGvz_BQVLhVWtedRh2mcBuMEhv0RKF+6DW4t+9FdPAw@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

On Fri, Feb 10, 2023 at 04:32:19PM +0000, Peter Maydell wrote:
> On Fri, 10 Feb 2023 at 16:01, John Snow <jsnow@redhat.com> wrote:
> > On Fri, Feb 10, 2023, 5:41 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> >> On Fri, 10 Feb 2023 at 00:31, John Snow <jsnow@redhat.com> wrote:
> >> This confuses me. We work fine with Python 3.6 today.
> >
> >
> > That won't last - Many tools such as mypy, pylint and flake8 which I use to manage our python codebase have been dropping support for 3.6 and I've had to implement an increasing number of workarounds to help keep it possible to test 3.6 via CI while also ensuring our newest platforms work as dev environments.
> 
> Something somewhere seems kind of out-of-sync here. Either:
>  * Python is deprecating old versions too quickly and
>    dropping support for them too fast

Nope, they're fine in declaring EOL whenever they like. There's
no requirement for upstreams to support arbitrary old versions
for any length of time.

>  * CentOS is retaining old versions of Python when it needs to
>    ship newer ones

It is also totally OK for an distro to ship and support software
versions which are EOL upstream. In fact for enterprise distros
you can generally assume that *all* the software versions they
ship are probably EOL or nearly so. The main value of enterprise
distros is that they provide long term support, where upstreams
are not willing to.

>  * Our policy for what distros we support is overly lax
>    and causing us to try to support ancient platforms
>    that we shouldn't be trying to support

I don't think so. Users of distros are not anywhere near
as aggressive at updating their installations as users
are. The number of users of RHEL-8 will dwarf that of
RHEL-9 by a large margin for a decent amount of time
yet.

The challenge here is that upstream developers want to
use shiny new features from latest upstream, and at the
same time don't want to keep back compat with older
versions that users see in their real world deployed
distros, because that is a burden.

Ideally upstream developers would never care about old
versions and only ever target the very latest upstream.
Meanwhile for users, apps would ideally support every
version of every OS that's ever existed.

Somewhere in the middle we have to strike a bargain
that spreads the pain fairly between the two groups,
accepting that this is going to be a burden for both
to some degre. Our distro support policy is a decent
attempt at doing that IMHO and has worked pretty well
IMHO.


We don't have to drop python 3.6. It is a choice because
of a desire to be able to use some shiny new python
features without caring about back compat.

Similarly we don't have to use the new meson which drops
support for python 3.6, it is again a choice because we
want to rely on some new meson features.

QEMU could easily carry on supporting python 3.6 until
the affected distros drop out ofo our support matrix, but
we would have to opt out of using certain new features,
or put more effort into back compat.

Personally I'm still on the side of carrying on supporting
3.6 per our distro support policy, but if broad consensus
is to drop 3.6 I'm not going push back anymore.

> because "use the system version of foo" should not be a big
> deal -- it's not like we're trying to support decades-old
> hosts here: Centos 8 was released in 2019, which is less than
> five years ago.

Yeah, it isn't very old at all, and in terms of deployments
will dominate over CentOS/RHEL 9 users.

> > The argument I'm making is:
> >
> > - CentOS 8 is a supported build platform
> > - All platforms *do* have a Python modern enough to allow us to drop 3.6
> > - CentOS's repo version of sphinx is hardcoded to use the older 3.6, though
> > - You expressed a preference to me in the past to NOT use a pip installed version of sphinx in preference to the system version in "configure"
> > - It's still possible to build docs on CentOS 8 after this patchset, you just need a pip version.
> > - We've used the justification that our build platform promise does not necessarily extend to docs and tests in the past.
> > - So just skip docs building for CentOS 8, only in the CI.
> >
> > If you believe docs in CI for CentOS 8 is a hard deal breaker, then I want to go back to discussing the possibility of using sphinx versions from pip.
> 
> If Python 3.6 is EOL, shouldn't CentOS have shipped an updated
> version of Sphinx to go with their updated Python ?

CentOS isn't dropping python 3.6 support. It will exist for the
lifetime of CentOS 8.

It just decided to also ship some newer python versions as an
opt-in. These newer python versions are just the minimal runtime
though. CentOS is not shipping all the add-on python modules it
has with 3.6.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


