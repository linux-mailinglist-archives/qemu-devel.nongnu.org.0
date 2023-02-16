Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 369916992E1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 12:13:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pScCG-0003Rv-KY; Thu, 16 Feb 2023 06:13:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pScCE-0003RP-EF
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:13:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pScCC-0004tY-O1
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:13:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676545979;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3v64lUT3zkDZf4J0GB5ulsQsjP3K4V+6MqKMu/9sIMs=;
 b=WBtua9sx18Q5nbSIf5T10WzVE/rPeOGuMiJABslu/TT/pJVzJzGn3+lqvdWYSmLJRR8r1d
 viz65BEvLcJyKpq4+No+YKSgz14KOE4YdlPXbAvnQMnEJEZQWaWOb6TiCED07wLl3n+d2q
 9fcI90t69m19p2HJnPjB0nuhEirW8UY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-srQPqgyDPwqvLDwk66Lxkg-1; Thu, 16 Feb 2023 06:12:55 -0500
X-MC-Unique: srQPqgyDPwqvLDwk66Lxkg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DD9285A5A3;
 Thu, 16 Feb 2023 11:12:55 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.164])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E219401014C;
 Thu, 16 Feb 2023 11:12:50 +0000 (UTC)
Date: Thu, 16 Feb 2023 11:12:48 +0000
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
Message-ID: <Y+4PsBPr6dGZ8EkO@redhat.com>
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

I forgot to mention in my previous reply, I feel like the ability
to finish the configure -> meson conversion is a pretty compelling
motivation to adopt the new meson. The hybrid configure/meson
state we've been in has worked better than I expected it would
at first, but none the less, the more we can get out of configure
the better it will be for ongoing maint burden.

So yes, its shiny new features, but they're pretty compelling
features as they allow us to finish the job we started. We've
clear precedent all over QEMU codebase that half-finished
conversions harm our ability to maintain the project.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


