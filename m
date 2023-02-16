Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDABB6992B8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 12:07:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSc69-0004Wf-2p; Thu, 16 Feb 2023 06:06:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSc65-0004Vu-6v
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:06:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSc63-0008GT-Fs
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:06:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676545598;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4GrdJPyMXsioxnigYklI8ymcJxALt3Q5CGBqMPj53nw=;
 b=haIo7HOpUitHtzubDirkS/TRtcpEBwALlDowTNE+THUMDsuJVYfc0JaC59nfzgI/WbnQwI
 vmDppjFiSpEXz6Yr4vZBVwnYp9t7qoAkF3pDm2GG9Q2z6UPmU5UbTFAUHArjm76cEjlU9p
 OnZ2/OeICo5TBeEpTMJsWuDjCsFYuhs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-GCKOBUX5OYmn4bfnYT_Efw-1; Thu, 16 Feb 2023 06:06:35 -0500
X-MC-Unique: GCKOBUX5OYmn4bfnYT_Efw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FEE6185A7A4;
 Thu, 16 Feb 2023 11:06:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.164])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF2DA2166B30;
 Thu, 16 Feb 2023 11:06:30 +0000 (UTC)
Date: Thu, 16 Feb 2023 11:06:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v2 6/7] CI: Stop building docs on centos8
Message-ID: <Y+4ONA/D+uUV9klZ@redhat.com>
References: <CAFn=p-aDV9=vG6hjTWRE6c52TpYSjDBU22nthTuejDCv_XrYMQ@mail.gmail.com>
 <CAFEAcA_eGvz_BQVLhVWtedRh2mcBuMEhv0RKF+6DW4t+9FdPAw@mail.gmail.com>
 <Y+Z2Kcq17HGWuoTV@redhat.com> <87cz6cpue3.fsf@pond.sub.org>
 <Y+t1J72iMsLWXHne@redhat.com>
 <CABgObfb-_upmc=36_bnxLMCB+0KqWoZNK62rnD5KpBKhW4N+hw@mail.gmail.com>
 <Y+vEKTgwoPtj86Z1@redhat.com>
 <CABgObfbsoOGU5v-xw3LzsnknS_TFJWZBA3LGCAmOOF-uBcXziQ@mail.gmail.com>
 <Y+zDd93lnPeteQxk@redhat.com> <87k00iv0ut.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87k00iv0ut.fsf@pond.sub.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

On Thu, Feb 16, 2023 at 02:46:18AM +0100, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Tue, Feb 14, 2023 at 09:52:44PM +0100, Paolo Bonzini wrote:
> >> Il mar 14 feb 2023, 18:26 Kevin Wolf <kwolf@redhat.com> ha scritto:
> >> 
> >> > Am 14.02.2023 um 15:03 hat Paolo Bonzini geschrieben:
> >> > > In the case of Python the issue is not the interpreter per se, though
> >> > > there are a couple new feature in Python 3.7 that are quite nice (for
> >> > > example improved data classes[1] or context variables[2]). The main
> >> > > problem as far as I understood (and have seen in my experience) is
> >> > > linting tools. New versions fix bugs that caused false positives, but
> >> > > also become more strict at the same time. The newer versions at the
> >> > > same time are very quick at dropping support for old versions of
> >> > > Python; while older versions sometimes throw deprecation warnings on
> >> > > new versions of Python. This makes it very hard to support a single
> >> > > version of, say, mypy that works on all versions from RHEL8 and SLE15
> >> > > to Fedora 38 and Ubuntu 23.04.
> >> >
> >> > Why do we have to support a single version of mypy? What is wrong with
> >> > running an old mypy version with old Python version, and a newer mypy
> >> > with newer Python versions?
> >> >
> >> > Sure, they will complain about different things, but it doesn't feel
> >> > that different from supporting multiple C compilers in various versions.
> >> >
> >> 
> >> It's more like having to support only C++03 on RHEL 8 and only C++20 in
> >> Fedora 37, without even being able to use a preprocessor.
> >> 
> >> For example old versions might not understand some type annotations and
> >> will fail mypy altogether, therefore even with newer versions you can't
> >> annotate the whole source and have to fall back to non-strict mode.
> >
> > In terms of back compatibility, is there a distinction to be
> > made between mypy compat and the python runtime compat ?
> >
> > If we add annotations wanted by new mypy, and old mypy doesn't
> > understand them, that's not a huge problem. We can simply declare
> > that we don't support old mypy, and skip the validation tests if
> > old mypy is installed.
> 
> In theory, type hints are transparent at run time.  In practice, use of
> modern type hints is known to break 3.6 at run time.  I don't remember
> the details offhand, but John should be able to dig them up if you're
> interested.
> 
> So, it should not be a problem, but it is.

Ok, this is a pretty compelling motivating factor for dropping
3.6, as it is clear demonstration that we're being held back
by the unfortunate lack of runtime compatibility.

For most of the other problems we can simply mandate a new
enough version of the add on tool, but if using new mypy
requires annotations that break at runtime on 3.6 that's
a painful blocker.



With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


