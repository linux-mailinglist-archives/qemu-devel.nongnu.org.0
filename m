Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CD3697BC1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 13:31:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSGvy-0004l1-St; Wed, 15 Feb 2023 07:30:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSGvi-0004kA-GQ
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:30:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSGvf-0000Qu-Ep
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:30:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676464230;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ifEPR3k3PiUIF+NyL3m073KIisxz4oNFFqrhiXJqr8U=;
 b=I+73NZ1YgClNPToT6bdGAQ45hFCbsaoBafw8skkidhKjXRlN83DW+BdvR0Xm0vAuctHfii
 hSx4RAyl2naBnc9vhmUQJ+r41o2FC5A2wPGOrUXguNDNh0efKegRelrUb7/dXX/ZQyEM83
 QK8/ZMicqqcvN9hUgCAJ4bEKsuxuAhI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-274-gE8oFsy4P22mIblG7edlrQ-1; Wed, 15 Feb 2023 07:30:25 -0500
X-MC-Unique: gE8oFsy4P22mIblG7edlrQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35ACB183B3C0;
 Wed, 15 Feb 2023 12:30:25 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.254])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B52BC15BA0;
 Wed, 15 Feb 2023 12:30:22 +0000 (UTC)
Date: Wed, 15 Feb 2023 12:30:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 6/7] CI: Stop building docs on centos8
Message-ID: <Y+zQW75R/NYOyz+J@redhat.com>
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-7-jsnow@redhat.com>
 <CAFEAcA-c5y0TR8vYg_FYEmGv3mOOmBgeD0cyb+mVotsP=r-Dsw@mail.gmail.com>
 <CAFn=p-aDV9=vG6hjTWRE6c52TpYSjDBU22nthTuejDCv_XrYMQ@mail.gmail.com>
 <CAFEAcA_eGvz_BQVLhVWtedRh2mcBuMEhv0RKF+6DW4t+9FdPAw@mail.gmail.com>
 <Y+Z2Kcq17HGWuoTV@redhat.com>
 <CAFEAcA-Gi_hn7uSGMpgMhwgw-e3yjX8DjUNcqwu2MJFem4P0MQ@mail.gmail.com>
 <dc989fbd-14ec-4a62-d227-826c6244dfcb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dc989fbd-14ec-4a62-d227-826c6244dfcb@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Fri, Feb 10, 2023 at 07:27:41PM +0100, Paolo Bonzini wrote:
> On 2/10/23 18:15, Peter Maydell wrote:
> There are four possibilities:
> 
> * we change the support policy and stop supporting CentOS 8 and SLE 15, not
> a good idea since a lot of people have not migrated to CentOS 9 yet.
> 
> * we keep supporting Python 3.6 until CentOS 8 and SLE 15 stop being
> supported.  This means several more years since SLE 16 hasn't even been
> released.

The massive gap from SLE 15 to 16 is something our support policy
wasn't anticipating, though it probably should have done, since a
4-5 year gap is actually normal if looking at previous SLE versions.

I was thinking too much about RHEL which has a short 3 year gap,
but also rebases software versions in .y releases, so often the
dependancies aren't as old as the 3 year life of RHEL would
suggest.

We need to finese our support policy to give us more flexibility
wrt the very long life / long gap enterprise distros.

> * we support Python 3.6 just for building documentation, i.e. we are careful
> not to use Python 3.7+ features in our Sphinx extensions but are free to use
> them elsewhere.  CentOS 8 users can install sphinx from either RPMs (which
> will use Python 3.6) or pip (which will use Python 3.8).
> 
> * we only support Python 3.7+, which means CentOS 8 CI and users have to
> either install Sphinx from pip or disable documentation.
> 
> The only difference between the last two is documentation and CI
> configuration.  The code is exactly the same.

While it is good to mention the idea of 3.6 just for docs, I don't
think it is really a good idea to put into practice.

IMHO there's compelling benefit in having a clear & simple story for
the min versions of dependancies, both for us as maintainers, and
for people consuming it. So if we want 3.7, we should apply it
universally without caveats / carve-outs.

> > I'm reluctant to say that
> > Python gets a special derogation from that policy.
> 
> Note that its not the Python runtime but the Python dependencies, for which
> we already install avocado and some Python development tools in a virtual
> environment.  So, the questions are:
> 
> * to what extent can we rely on pip packages (preinstalled by the user)
> instead of the distro packages?
> 
> * to what extent should QEMU install its own dependencies via pip in a
> virtual environment instead of requiring the user to preinstall them?

FWIW, when I introduced scripts/git-submodule.sh script to handle
automatically checking out git submodules during build, there was
quite a bit of negative feedback from some users/contributors who
don't want  stuff being fetched off the net during builds.

Typically their scenario was that they have a QEMU checkout on
one machine with net access. That filesystem was exported to
another machine (or multiple other machines) to perform the
actual build(s) and those build machines lacked net access.

This motiviated the introduction of the configure arg, to tell
us *NOT* to attempt to checkout submodules, but merely validate
that they exist at the right checkout hash. The user would
manually checkout the submodules on the hosts which had net
access.

This situation is not too dis-similar to what distros have in
their package build systems which often block net access.

None of this means we can't use a private virtualenv for all of
QEMU python bits.

Just that if we go this route, then we're putting a greater
burden on people whose distro doesn't have the required packages,
and whose build env lacks net access.

They'll have to populate a venv manually in some way and get it
onto their build env.  The number of people with this situation
though likely is small enough, that it is likely an acceptable
burden / tradeoff in general.  The burden would only apply to the
pieces of build that are actually mandatory for build, the most
prominent of which are meson, and the QAPI generation code. Bits
like avocado, mypy, flake8, etc are all optional extra tests.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


