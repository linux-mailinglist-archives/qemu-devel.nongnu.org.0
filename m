Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF16D6EF027
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 10:22:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1praPn-00072d-QH; Wed, 26 Apr 2023 04:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1praPl-00072T-5K
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 04:22:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1praPi-0002eJ-BF
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 04:22:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682497329;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yY0Zr9pvUr2S63iUV7S0tkPEKLV2hfd5JqOOtGC2HIo=;
 b=PtJFjP1GlOdXfa8UhZw5F7h0X1D1JEVc3+aTseFZRqzotyBoRMzAwqCTXVGp0/uIxBTUOJ
 jklvcSzAsrXGAztjbqqTADYZJM89TptSZLSt7w2c4VEtmgb95wkIVay0aNXcQlpWmBthc7
 c66phlrudzCaNhJl9Kg3vWn8V+StIRE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-svMsdHSeNJuIYQaYj-sARA-1; Wed, 26 Apr 2023 04:22:05 -0400
X-MC-Unique: svMsdHSeNJuIYQaYj-sARA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59BED1C04190;
 Wed, 26 Apr 2023 08:22:05 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 324872027045;
 Wed, 26 Apr 2023 08:22:00 +0000 (UTC)
Date: Wed, 26 Apr 2023 09:21:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>,
 Beraldo Leal <bleal@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH v3 00/20] configure: create a python venv and ensure
 meson, sphinx
Message-ID: <ZEjfJtRC+MfRXpVL@redhat.com>
References: <20230424200248.1183394-1-jsnow@redhat.com>
 <ZEgLNJ13fJf5RAI4@redhat.com>
 <CAFn=p-YNjRZnFUhFr7PfHWKGvRnRnF1mpTc7KvFr5eXBM0Lsxw@mail.gmail.com>
 <CAFn=p-ajvEJkCvv=Z0hG9A8tbf9cYz2eTTDRChwqbFWiMUzAPw@mail.gmail.com>
 <ZEgXo67oiOugfCn8@redhat.com>
 <CAFn=p-bcuu8__gRfRtkMikZ=+N2e63yU2q1rkjaQNpTK_LYL=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFn=p-bcuu8__gRfRtkMikZ=+N2e63yU2q1rkjaQNpTK_LYL=w@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Apr 25, 2023 at 02:58:53PM -0400, John Snow wrote:
> On Tue, Apr 25, 2023 at 2:10 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > How about having --enable-pypi never|auto|force with the following
> > semantics for --enable-docs + --enable-pypi
> >
> >
> >   * docs=no   - pypi never used
> >
> >   * docs=auto + pypi=never  => docs only enable if sphinx is already
> >                                installed locally, otherwise disabled
> >
> >   * docs=auto + pypi=auto  => docs enable if sphinx is already
> >                               installed locally, or can download from
> >                               pypi as fallback
> >
> 
> As long as this doesn't cause needless trouble for existing configure
> invocations baked into scripts and the like. It's a bit more
> aggressive about enabling docs than we have been in the past, but
> maybe that's not a bad thing.
> 
> >   * docs=auto + pypi=force  => always download sphinx from pypi
> >
> 
> So if you already have Sphinx, this should perform an upgrade to the
> latest version?

Essentially I meant 'force' to mean *never* use the host python
installation packages. Always install all the deps in the venv,
even if they exist in the host with sufficient version met.

> >   * docs=yes + pypi=never  => ERROR if sphinx is not already
> >                               installed locally
> >
> >   * docs=yes + pypi=auto  => docs enable if sphinx is already
> >                              installed locally, or can download from
> >                              pypi as fallback
> >
> >   * docs=yes + pypi=force  => always download sphinx from pypi
> 
> Yeah, there's room for settings like these, and the above mostly makes
> sense to me.
> 
> Paolo and I had written up a more elaborate set of flags at one point
> under the premise of integrating testing, too -- for instance,
> pre-loading the testing dependencies for iotests (local qemu package,
> qemu.qmp, etc) or for avocado tests (avocado-framework and other deps
> needed for those tests). I wanted to try and check in a "minimum
> viable" version of this patch set first close to the 8.1 tree opening
> to iron out any bugs in the core feature and then I'd work to expand
> the flags and capability of the system as differential patches.
> 
> So, I think changing --enable-pypi too much is beyond the scope of the
> current patchset, but it's on my mind for what will follow almost
> immediately after it. With that in mind, we can brainstorm a little
> here and throw some darts at the wall:

Yep, I don't consider it a pre-requisite for this series.

> 
> The version of flags we originally came up with was this:
> 
> --python=... # runtime used to create venv
> --enable-pip-groups=testing,devel,avocado,meson,sphinx
> --enable-pip=now  # install all python deps now
> --enable-pip=on-demand  # install qemu.git/meson/sphinx, delay the rest
> --enable-pip=no    # offline
> --{enable,disable}-isolated-venv # let venv use system/distro if disable

This feels like a bit of overkill to me, and would create a hell
of a lot of combinations to test if you expand the matrix of
options.

> I may have pulled us in a slightly different direction with the
> version of the patches I actually sent here today, but the key ideas
> here were:
> 
> - The ability to opt into or out of different package groups at
> configure-time. meson is always required, docs/sphinx is optional, and
> the other three groups are testing related. (testing: iotests and
> qemu.qmp, devel: python self-tests, avocado: avocado tests.)

I think this is especially overkill. While you can probably come up
with some scenarios where you could use this fine grained selection,
I don't think it would be very compelling.

> - The ability to decide when packages get installed to the venv;
> either at configure time ("now") or as-needed ("on-demand") or
> functionally never ("no")

The distinction between now vs on-demand is really just about
avoiding the overhead of downloading bits that you might not
end up using. eg not downloading avocado unless you will be
running 'make check-avocado'. That's saving a few 10s or 100s
of KB of download, but doesn't feel like it'd make a noticable
difference in the overall QEMU build time.

THe 'now' and 'no' options look sufficient (corresponding to
the 'auto' and 'never' options I suggested above)

> - The ability to enable or disable venv isolation (turning on or off
> system packages).

Corresponds to the 'force' option I suggested above.

> 
> I think I abandoned the idea of configuring the venv isolation and
> have it set to "always off". We may revisit this later, but I think
> for this series it's fine to have glossed over it.
> I also skipped over the idea of having package installation being
> "now", "on-demand" or "no" -- this patch-set more or less is using a
> hybrid of "now" and "on-demand" where meson and sphinx are "now" but
> avocado is "on-demand". Unifying that discrepancy can occur in
> subsequent patches as it closely resembles what we had in 8.0 and
> earlier.

I guess the hybrid of 'now' and 'on-demand' could equally well
map to what I suggested by 'auto'. 


> > So eg distros could use pypi=never, devs would use pypi=auto mostly,
> > while CI might use pypi=force to test specific versions indepenant
> > of distros ?
> >
> 
> Sounds reasonable in general, I think, but I have some questions about
> what 'force' does, exactly.

Turning of system packages in the venv, and always installing everything
from pip.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


