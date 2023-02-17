Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6329F69AF87
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 16:31:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT2g9-0004m4-Ga; Fri, 17 Feb 2023 10:29:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pT2g7-0004le-0E
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:29:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pT2g4-0006WW-9v
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:29:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676647774;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QRb8IDS8wE34lce85qRRG4R/mhZaTl5a/RjtundXPpQ=;
 b=hize73/zF0b4TmDF5rW9FsdufRtrMnhwdSIikjjsMEdC8EQYFKHsExzxycvnGcnKctjA2L
 x8o0BZjuxkP/KuxS3Fjvlp3WEwdUjYN+EwR2X/OjOABmKsA7aukYQGQKULzK/bdS2M+x1i
 tHHLqHl7y2YC8Dq4JdtyfiyIivkZb2I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8--99M6S43P3u_RVUiKUbY2w-1; Fri, 17 Feb 2023 10:29:31 -0500
X-MC-Unique: -99M6S43P3u_RVUiKUbY2w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F756800B23;
 Fri, 17 Feb 2023 15:29:31 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EF084035704;
 Fri, 17 Feb 2023 15:29:29 +0000 (UTC)
Date: Fri, 17 Feb 2023 15:29:26 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Subject: Re: [RFC PATCH] docs: build-platforms: refine requirements on Python
 build dependencies
Message-ID: <Y++dVjax+6GdtEr1@redhat.com>
References: <20230217124150.205012-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230217124150.205012-1-pbonzini@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Fri, Feb 17, 2023 at 01:41:50PM +0100, Paolo Bonzini wrote:
> Historically, the critical dependency for both building and running
> QEMU has been the distro packages.  Because QEMU is written in C and C's
> package management has been tied to distros (at least if you do not want
> to bundle libraries with the binary, otherwise I suppose you could use
> something like conda or wrapdb), C dependencies of QEMU would target the
> version that is shipped in relatively old but still commonly used distros.
> 
> For non-C libraries, however, the situation is different, as these
> languages have their own package management tool (cpan, pip, gem, npm,
> and so on).  For some of these languages, the amount of dependencies
> for even a simple program can easily balloon to the point that many
> distros have given up on packaging non-C code.  For this reason, it has
> become increasingly normal for developers to download dependencies into
> a self-contained local environment, instead of relying on distro packages.
> 
> Fortunately, this affects QEMU only at build time, as qemu.git does
> not package non-C artifacts such as the qemu.qmp package; but still,
> as we make more use of Python, we experience a clash between a support
> policy that is written for the C world, and dependencies (both direct
> and indirect) that increasingly do not care for the distro versions
> and are quick at moving past Python runtime versions that are declared
> end-of-life.
> 
> For example, Python 3.6 has been EOL'd since December 2021 and Meson 0.62
> (released the following March) already dropped support for it.  Yet,
> Python 3.6 is the default version of the Python runtime for RHEL/CentOS
> 8 and SLE 15, respectively the penultimate and the most recent version
> of two distros that QEMU would like to support.  (It is also the version
> used by Ubuntu 18.04, but QEMU stopped supporting it in April 2022).
> 
> Fortunately, these long-term support distros do include newer versions of
> the Python runtime.  However, these more recent runtimes only come with
> a very small subset of the Python packages that the distro includes.
> Because most dependencies are optional tests (avocado, mypy, flake8)
> and Meson is bundled with QEMU, the most noticeably missing package is
> Sphinx (and the readthedocs theme).

mypy itself is optional for QEMU, but the implications of new mypy
are not optional. The intent of using new mypy is to leverage
improved python parameter type annotations, and these annotations
are apparently not compatible with py3.6 runtime exection, despite
the fact that they should not conceptually affect runtime.


> Assuming QEMU would like to move forward with the deprecation of
> Python 3.6 (for which there are some good reasons: completing the
> configure->meson switch, which requires Meson 0.63, or making qapidoc
> fully typed which requires newer versions of mypy and also Python due
> to PEP563), there are four possibilities:
> 
> * we change the support policy and stop supporting CentOS 8 and SLE 15;
>   not a good idea since CentOS 8 is not an unreasonable distro for us to
>   want to continue to support

And there's not even a newer SLE 16 available yet, so even less
desirable to drop the only SLE we target.

> * we keep supporting Python 3.6 until CentOS 8 and SLE 15 stop being
>   supported.  This is a possibility---but we may want to revise the support
>   policy anyway because SLE 16 has not even been released, so this would
>   mean delaying those desirable reasons for perhaps three years;
> 
> * we support Python 3.6 just for building documentation, i.e. we are
>   careful not to use Python 3.7+ features in our Sphinx extensions but are
>   free to use them elsewhere.  Besides being more complicated to understand
>   for developers, this is difficult to apply because qapidoc runs at
>   sphinx-build time, and it is one of the areas which would benefit from
>   a newer version of the runtime;

Using a mix of python versions is just asking for trouble

> 
> * we only support Python 3.7+, which means CentOS 8 CI and users
>   have to either install Sphinx from pip or disable documentation.
> 
> This proposed update to the support policy chooses the last of these
> possibilities.  It does by modifying two aspects of the support policy:
> 
> * it introduces different support periods for *native* vs. *non-native*
>   dependencies.  Non-native dependencies are currently Python ones only,
>   and for simplicity the policy only mentions Python; however, the concept
>   generalizes to other languages with a well-known upstream package
>   manager, that users of older distributions can fetch dependencies from;

I guess this would mean its applicable to perl/ruby/etc, but really
we should be exclusively using Python for our scripting needs, except
for legacy stuff we already have. So in practice non-native == python.

Potentially if we want to use Rust, we'd want vendoring of deps needed
by Rust code, and that's native deps arguably, rather than non-native.

Still I think it is unlikely we would replace existing working code in
qemu.git with a rust impl, while discarding the original impl. More
likely we'd have a Rust impl in parallel, or use Rust only for a brand
new feature, where we don't need to support all possible old platforms.

> * it limits the support period for non-native dependencies to a fixed
>   amount of 4 years.  This is intended to be close to the Python 5-year
>   lifecycle while accounting for the time between a distro's feature freeze
>   and the day it's released.  This limit applies to all distro versions,
>   not just the previous one, in order to cater for the delay of SLE 16.
> 
> The 4 year cutoff in practice means that QEMU will be able to drop Python
> 3.6 support for QEMU 7.1 (RHEL8 becomes 4 year old next May, while SLE
> is already over the threshold).

So the 4 year timeframe enables us to move off 3.6, but it is still
potentially limiting.

That doesn't explicitly allow for the case where we decide we want
to increae min version of flake8/pylint/mypy to one that is merly
1 year old. As noted, covering multiple versions of these linting
tools is a burden, as the issues reported from new versions are
not always a superset of the old version. So it is somewhat
desirable to fixate on a specific release, or a narrow range of
releases.

I guess we can argue that any optional build time components that
only affect testing don't need to be constrained by our platform
policy in the first, since they are optional and don't affect the
ability to build QEMU. Still if I'm a distro maintainer, and
backporting patches I like to run all static analysis tools to
catch silly python mistake that happen when cherry-picking.
Equally if I'm a contributor working on QEMU I would like to
run all the static linting tests available.


Implicit in the 4 year timeframe is that it is actually easy to
cope with the fallout, because the long life distros support many
newer python runtime versions. The only impact is on the need to
use pip to grab extra pieces.

So a different way of expressing this is to not limit ourselves
by time. Instead declare that we reserve the right to bump the
python runtime version, provided the new version is available
from the disto as an optional alternative to the default python
version.

This would mean we would have had the option to adopt python
3.8 a year ago (or whenever it first became an option in RHEL
/SLES). Today 4 years would suit our immediate needs, but John
probably would have liked to have bumped the version last year
already if it weren't for our support policy, and 4 year cut
off wouldn't have helped last year.

Basically if it is acceptable to require a non-default python
version, it should be ok to require that are more or less
any time, as long as the version is available from the OS
vendor officially.

> Note that all "non-native" packages are currently build dependencies.
> If in the future some non-native packages became runtime dependencies for
> parts of QEMU, it would still be possible to choose any of the first
> three possibilities for them.
> 
> Another possible future change is to the way that these dependencies
> have to be obtained by the person building QEMU.  Right now they have to
> run pip before the build; it may be desirable for configure to set up a
> virtual environment and download them in the same way that it populates
> git submodules.  Just like with submodules, this would make things
> easier for people that can afford accessing the network in their build
> environment; the option to populate the build environment manually with
> pip would remain for people whose build machines lack network access.
> The change to the support policy neither requires nor forbids this change.
> 
> [Thanks to Daniel P. Berrangé, Peter Maydell and others for discussions
>  that were copied or summarized in the above commit message]
> 
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/about/build-platforms.rst | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
> index 1c1e7b9e11c3..e1ea09789107 100644
> --- a/docs/about/build-platforms.rst
> +++ b/docs/about/build-platforms.rst
> @@ -86,6 +86,25 @@ respective ports repository, while NetBSD will use the pkgsrc repository.
>  For macOS, `Homebrew`_ will be used, although `MacPorts`_ is expected to carry
>  similar versions.
>  
> +Python build dependencies
> +~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The minimum supported version of Python is currently 3.6.
> +
> +Distributions with long-term support often provide multiple
> +versions of the Python runtime.  QEMU aims to support the default
> +Python runtime for 4 years after the initial release of a new version.
> +Afterwards, you may have to point QEMU to a newer version of the Python
> +runtime using the ``--python`` command line option of the ``configure``
> +script.

My counter proposal is to remove the 4 year marker, and give us
more flexibility:

 Distributions with long-term support often provide multiple
 versions of the Python runtime.  QEMU will initially aim to
 support the default python runtime. QEMU reserves the right
 to increase its minimum version to any newer python that is
 available as an option from the vendor.


> +
> +Some of QEMU's build dependencies are written in Python and available
> +through the Python Package Index (PyPI).  QEMU aims to be compatible
> +with the versions packaged by common Linux distributions for the first
> +4 years after the major release of the distribution.  After 4 years,
> +you may have to use ``pip`` to install some of these build dependencies.

And for this I'd say

  If QEMU bumps its minimum python version to a non-default version,
  then it may be neccessary to fetch python modules from 'pip' to
  build or test QEMU.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


