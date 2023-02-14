Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E7F69632A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 13:12:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRu95-0007CE-Jw; Tue, 14 Feb 2023 07:10:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pRu90-0007Ap-7f
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 07:10:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pRu8w-0000Du-77
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 07:10:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676376639;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dCiPZnNsRlJdmmkRyKqc98uDg2Mh6kLd6nrArfoirTE=;
 b=VDWNfC0SxEMYxx9q1uTVV0CzmHRpRT5T3pDfQ/9yGysH1J+QCJHnG+B94iT0XHF1S84YzB
 ZHasbmWxO2oqNcFcOsIe7uj/iTKlJ/KneoTxHYYgJr2vXCmYkkG0CJXCCik+2ipWC/tXvu
 Wa682k5pKsvx0dApKI2vCQONOBFInN4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-ydQD-xCIN3mVp2IINXqRJA-1; Tue, 14 Feb 2023 07:10:36 -0500
X-MC-Unique: ydQD-xCIN3mVp2IINXqRJA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 000D41C0A580;
 Tue, 14 Feb 2023 12:10:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10653492B15;
 Tue, 14 Feb 2023 12:10:32 +0000 (UTC)
Date: Tue, 14 Feb 2023 12:10:30 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 6/7] CI: Stop building docs on centos8
Message-ID: <Y+t6Ni+OW/1vp6Cs@redhat.com>
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-7-jsnow@redhat.com>
 <CAFEAcA-c5y0TR8vYg_FYEmGv3mOOmBgeD0cyb+mVotsP=r-Dsw@mail.gmail.com>
 <CAFn=p-aDV9=vG6hjTWRE6c52TpYSjDBU22nthTuejDCv_XrYMQ@mail.gmail.com>
 <CAFEAcA_eGvz_BQVLhVWtedRh2mcBuMEhv0RKF+6DW4t+9FdPAw@mail.gmail.com>
 <Y+Z2Kcq17HGWuoTV@redhat.com> <87cz6cpue3.fsf@pond.sub.org>
 <553f238a-56f2-4bd0-382a-80cfe116f138@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <553f238a-56f2-4bd0-382a-80cfe116f138@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

On Tue, Feb 14, 2023 at 09:35:44AM +0100, Thomas Huth wrote:
> On 14/02/2023 08.40, Markus Armbruster wrote:
> > Daniel P. Berrangé <berrange@redhat.com> writes:
> > 
> > [...]
> > 
> > > We don't have to drop python 3.6. It is a choice because
> > > of a desire to be able to use some shiny new python
> > > features without caring about back compat.
> > 
> > I read this on Friday, and decided to let it sit until after the
> > weekend.  Well, it's now Tuesday, and to be frank, it's still as
> > offensively flippant as it was on Friday.  It shows either ignorance of
> > or cavalier disregard for the sheer amount of work some of us have had
> > to put into keeping old versions of Python viable.
> 
> I'm a complete python ignorant, too, so I'm a little bit surprised of the
> amount of pain that these scripts are causing.
> 
> No matter of that fact, I think Peter still has a point that we have a real
> conflict here with our current support policy. So this either means that
> Python was the wrong choice for our needs (since it is moving too fast and
> causing too much friction), or we should really rethink our support policy.
> 
> I guess we're too deep into the Python rabbit hole already, and I'm not
> aware of any other good solutions (back to Perl scripts? No, thanks!), so
> it's likely quite impossible to tune that knob.

I still believe python is a probably the best thing for what we're using
it for. Certainly would not suggest shell or perl, and using a compiled
language would add its own complications for cross compilation.

> Thus we should maybe really start talking about our support policy now. I
> think the main problem is likely the sentence "Support for the previous
> major version will be dropped 2 years after the new major version is
> released". Maybe we should shorten that time frame to 1 year. The 2 years
> caused some confusions in the past already, since e.g. Debian only supports
> the previous major release for only one more year, and macOS also releases a
> major version each year ... so IMHO we could shorten the time frame for the
> previous major release to 1 year instead. People then could still continue
> building QEMU on CentOS 8, but they have to be aware that they might install
> other software like Sphinx manually if they want to continue using QEMU with
> docs there. What do you think?


I think perhaps the problem is not in the length of time defined by
our support policy, but rather that we're facing a rather different
reality to the one we've historically been used it, where distros
are no longer critical dependancies and our support policy does not
reflect that.


For any C/C++ application, wanting to target the versions shipped in a
distro has been pretty much normal practice. C has not ever come with
a standard package manager toolset, the distros service that role. The
distros also aren't generally a fan of shipping multiple versions of
C libs in parallel.


Pretty much every non-C library though is different. They all have
their own package manager service / tools (perl has cpan, pytyhon has
PyPi/pip, ruby has gems. With latest compiled languages like Go/Rust,
this has gone one step further and is natively integrated into the
compiler toolchain as standard.


IOW, for everything except C, it has become increasingly normal
practice to ignore the distro and dynamically download all the deps
your application needs into a self contained local environment.
Now, the distros aren't especially a fan of this new world, since
they still prefer to unbundle all these deps, but I think that
approach is increasingly difficult for them to achieve because the
majority of upstreams don't care for the distro versions.


Thus what we're experiancing is a clash between the traditional
way that C applications/libraries deal with their deps, vs the
way pretty much every other language deals with their deps in
the modern world. It has come up now because we're making much
more use of python now, than we did in the past.


Our support policy is written from the POV of the C world, and
merely reducing the length of time we support a distro does not
address the different world view of Python.

Should we instead try to be more explicit about the different
needs of the non-C dependencies ?

We could for example say

 * For native library/application dependancies we aim to
   support the two most recent distro versions, for 2 years
   overlap

 * For non-native library/applications dependancies we aim
   to support only the most recent distro version. Users
   of older distros may need to dynamically fetch newer
   deps.

The python 3.8 runtime would be considered a native dep, so fall
under the 2 distro versions rule. This is fine with CentOS 8,
since it provides newer python runtime versions.

The python libraries, or tools written in python (meson), would
fall under the second rule, and so only need to target one distro
version. This would be compatible with CentOS 8, as the users would
be expected to download extra python components (or we do it on
their behalf).

For the second rule, rather than saying most recent distro versions,
possibly we might want to carve out an exclusion for LTS distros too.
ie, explicitly don't care about versions of non-native bits in RHEL
at all, beyond availability of the base (python) runtime.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


