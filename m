Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D69B699292
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 12:00:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSc0H-0008Aq-Pr; Thu, 16 Feb 2023 06:00:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSc0F-0008AK-Oy
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:00:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSc0E-0005o7-2D
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:00:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676545237;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BNqn7Fit7eMnfOeXdTT0AkNcEp87FxgBVq27Oh/M270=;
 b=Ion5DHR5/LEk7zaOh6V1EnW2U03uP/np+pujSxCAiudew4u+4yilDfcH/WhQ1+8A9S6//B
 La8d6WbhMkaG5ye5B8kC0C/Nxa4mHZEEfufsZXMyY1mrcRnO6L7SeIMO11kDMXZSksyHbH
 +u0I7+Pz5wltOFEQPzQyMhE9mjmPEgo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438--R3QsmT0OFKkkB0ikzc4Lw-1; Thu, 16 Feb 2023 06:00:33 -0500
X-MC-Unique: -R3QsmT0OFKkkB0ikzc4Lw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 467321C06EE4;
 Thu, 16 Feb 2023 11:00:33 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.164])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 20BBC140EBF6;
 Thu, 16 Feb 2023 11:00:29 +0000 (UTC)
Date: Thu, 16 Feb 2023 11:00:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
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
Message-ID: <Y+4My2BC1V5FSIiU@redhat.com>
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-7-jsnow@redhat.com>
 <CAFEAcA-c5y0TR8vYg_FYEmGv3mOOmBgeD0cyb+mVotsP=r-Dsw@mail.gmail.com>
 <CAFn=p-aDV9=vG6hjTWRE6c52TpYSjDBU22nthTuejDCv_XrYMQ@mail.gmail.com>
 <CAFEAcA_eGvz_BQVLhVWtedRh2mcBuMEhv0RKF+6DW4t+9FdPAw@mail.gmail.com>
 <Y+Z2Kcq17HGWuoTV@redhat.com> <87cz6cpue3.fsf@pond.sub.org>
 <553f238a-56f2-4bd0-382a-80cfe116f138@redhat.com>
 <Y+t6Ni+OW/1vp6Cs@redhat.com> <87r0uqv2lq.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87r0uqv2lq.fsf@pond.sub.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

On Thu, Feb 16, 2023 at 02:08:33AM +0100, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> > Our support policy is written from the POV of the C world, and
> > merely reducing the length of time we support a distro does not
> > address the different world view of Python.
> >
> > Should we instead try to be more explicit about the different
> > needs of the non-C dependencies ?
> >
> > We could for example say
> >
> >  * For native library/application dependancies we aim to
> >    support the two most recent distro versions, for 2 years
> >    overlap
> >
> >  * For non-native library/applications dependancies we aim
> >    to support only the most recent distro version. Users
> >    of older distros may need to dynamically fetch newer
> >    deps.
> 
> Who does the fetching, users manually, or the build process
> automatically?

I expect both cases need supporting.

In the case of distro builds, they will have to fetch the
deps ahead of time, because the build environments usually
won't have any network access. Some contributors have also
previously objected to the build system fetching stuff off
the network, but they're a small minority.

For friendliness to developers, the build process would be
best to fetch automatically, if they haven't been provided
upfront.

> > The python 3.8 runtime would be considered a native dep, so fall
> > under the 2 distro versions rule. This is fine with CentOS 8,
> > since it provides newer python runtime versions.
> >
> > The python libraries, or tools written in python (meson), would
> > fall under the second rule, and so only need to target one distro
> > version. This would be compatible with CentOS 8, as the users would
> > be expected to download extra python components (or we do it on
> > their behalf).
> >
> > For the second rule, rather than saying most recent distro versions,
> > possibly we might want to carve out an exclusion for LTS distros too.
> > ie, explicitly don't care about versions of non-native bits in RHEL
> > at all, beyond availability of the base (python) runtime.
> 
> Interesting idea.  Can anyone think of reasons not to do this?

It is probably even more compelling when looking at SLES, which is
having an even larger gap between releases than RHEL does.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


