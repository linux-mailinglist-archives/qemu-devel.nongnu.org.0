Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC9669666D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 15:19:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRw8H-00024l-Fk; Tue, 14 Feb 2023 09:18:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pRw8F-0001zg-L8
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 09:18:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pRw8A-0005jq-I4
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 09:18:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676384281;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CLjYbTIAnp+2IHzEYiZ07shJepB2lbeqvwYVdEYIf/E=;
 b=HwtYEBmgi34RK7hzDrXdKflwr6otpTy+6JVkQgaihpH3gM4gQ9JSZYk/OVA5AuQaxq8xXR
 p4/E+Mf5I4wh0RaX0F6txS4JZ4vKM+AyAABZgpTmwHILxglPQzhCBQts+Ue+rDKNydPr+A
 U3jTHcAZaKb9ntQL8R85c9EW6H8Qk90=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-jBeZnW48PSCcmhNXJKAgyg-1; Tue, 14 Feb 2023 09:17:58 -0500
X-MC-Unique: jBeZnW48PSCcmhNXJKAgyg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A829E3C10EC1;
 Tue, 14 Feb 2023 14:17:57 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33864492B04;
 Tue, 14 Feb 2023 14:17:54 +0000 (UTC)
Date: Tue, 14 Feb 2023 14:17:52 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 6/7] CI: Stop building docs on centos8
Message-ID: <Y+uYEKYQB+8kjtEx@redhat.com>
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-7-jsnow@redhat.com>
 <CAFEAcA-c5y0TR8vYg_FYEmGv3mOOmBgeD0cyb+mVotsP=r-Dsw@mail.gmail.com>
 <CAFn=p-aDV9=vG6hjTWRE6c52TpYSjDBU22nthTuejDCv_XrYMQ@mail.gmail.com>
 <CAFEAcA_eGvz_BQVLhVWtedRh2mcBuMEhv0RKF+6DW4t+9FdPAw@mail.gmail.com>
 <Y+Z2Kcq17HGWuoTV@redhat.com> <87cz6cpue3.fsf@pond.sub.org>
 <Y+t1J72iMsLWXHne@redhat.com>
 <CABgObfb-_upmc=36_bnxLMCB+0KqWoZNK62rnD5KpBKhW4N+hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABgObfb-_upmc=36_bnxLMCB+0KqWoZNK62rnD5KpBKhW4N+hw@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

On Tue, Feb 14, 2023 at 03:03:54PM +0100, Paolo Bonzini wrote:
> On Tue, Feb 14, 2023 at 12:49 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > [quote]
> > The motivation for this series is that Python 3.6 was EOL at the end of
> > 2021; upstream tools are beginning to drop support for it, including
> > setuptools, pylint, mypy, etc. As time goes by, it becomes more
> > difficult to support and test against the full range of Python versions
> > that QEMU supports. The closer we get to Python 3.12, the harder it will
> > be to cover that full spread of versions.
> > [/quote]
> >
> > this is all about new/eol versions of software upstream, and I don't
> > think that's a justification. QEMU explicitly aims to use distro provided
> > versions and upstream EOL status is not relevant in that context. Even
> > if using "pip" to install it is possible to limit yourself to upstream
> > releases which still support 3.6.
> >
> > There is the separate issue of Meson dropping python 3.6 which motivates
> > Paolo's series. Again though, we don't have to increase our minimum meson
> > version, because meson is working today. It is our choice to to increase
> > it to use latest available meson features. At some point we can decide
> > what we have is good enough and we don't have to keep chasing the latest
> > features. Maybe we're not there yet, but we should think about when that
> > would be.
> 
> In the case of Meson, the main advantage is moving _all_ of the
> emulator configury out of the configure script.  This requires
> add_global_dependencies which was added in 0.63.  So in that case it
> is indeed mostly about shiny new features and it's not absolutely
> necessary.
> 
> In the case of Python the issue is not the interpreter per se, though
> there are a couple new feature in Python 3.7 that are quite nice (for
> example improved data classes[1] or context variables[2]). The main
> problem as far as I understood (and have seen in my experience) is
> linting tools. New versions fix bugs that caused false positives, but
> also become more strict at the same time. The newer versions at the
> same time are very quick at dropping support for old versions of
> Python; while older versions sometimes throw deprecation warnings on
> new versions of Python. This makes it very hard to support a single
> version of, say, mypy that works on all versions from RHEL8 and SLE15
> to Fedora 38 and Ubuntu 23.04.
> 
> [1] https://peps.python.org/pep-0557/
> [2] https://peps.python.org/pep-0567/
> 
> In fact this issue is the reason why RHEL9 does not package any of
> these tools and does not run them as part of building RPMs even though
> in principle it would be a good idea; it's too much of a pain to have
> a single version that works across all the packages in the
> distribution.
> 
> Regarding your other suggestion:
> 
> > * For non-native library/applications dependancies we aim
> >   to support only the most recent distro version. Users
> >   of older distros may need to dynamically fetch newer
> >   deps.
> 
> I think this is a good idea, but one issue with "only supporting the
> most recent distro version" is SUSE. While the most recent version of
> SLE is about 5 years old, there is no next version in sight---SUSE
> instead is working on their "Adaptable Linux Platform", but it's still
> in the prototype stage[3]. So alternatively we could put a 4 or 5 year
> cutoff after which you need to fetch newer deps. Considering the
> delays between freeze and release of distros like RHEL or SLE, in
> practice we would probably keep Python versions supported for 6-7
> years.

Yeah, that kind of problem with very old SUSE would push towards
simply excluding the LTS distros, or excluding them if they're
older than N years, and expect users of such old distros to
download newer python modules, etc.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


