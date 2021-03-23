Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7C2345CED
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 12:32:33 +0100 (CET)
Received: from localhost ([::1]:52690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOfGw-0001Pt-Pa
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 07:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lOfE4-0007qN-QC
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 07:29:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lOfDy-0006tj-FV
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 07:29:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616498964;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B/zrdNBxSAl6tRXNe7iE3qi2T2ItNbc4GK0x6YASOb4=;
 b=cdRtc90OhuGMtb+OrSOb8h1Aumfxzr9COakV1ab3rbbHos0I4qNACnQ+CJYvt0GXYsMjte
 iNXx6UWPBBlnZ7OJcbJUG+/jvDM8A8sgzEZPHzb/2ewtGeUTaDxo4TyuUBE4ipsgNU81UK
 p/eW+RLo7YU9HOWgXyblGZphsNs8qPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-p_GPJpZuOiSLVvp7b2eELg-1; Tue, 23 Mar 2021 07:29:19 -0400
X-MC-Unique: p_GPJpZuOiSLVvp7b2eELg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49B051083E80;
 Tue, 23 Mar 2021 11:29:18 +0000 (UTC)
Received: from redhat.com (ovpn-113-223.ams2.redhat.com [10.36.113.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2739219C87;
 Tue, 23 Mar 2021 11:29:13 +0000 (UTC)
Date: Tue, 23 Mar 2021 11:29:11 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4] sphinx: adopt kernel readthedoc theme
Message-ID: <YFnRBwWPAA9TRntZ@redhat.com>
References: <20210322105234.3932691-1-marcandre.lureau@redhat.com>
 <YFnCfhiaixbn7lMy@redhat.com>
 <CAFEAcA_f2fMmVS=Pt6Zd7Si5L2YfRMH+dJZ_pZd=E-neKpxUOg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_f2fMmVS=Pt6Zd7Si5L2YfRMH+dJZ_pZd=E-neKpxUOg@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 23, 2021 at 11:00:29AM +0000, Peter Maydell wrote:
> On Tue, 23 Mar 2021 at 10:27, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Mon, Mar 22, 2021 at 02:52:34PM +0400, marcandre.lureau@redhat.com wrote:
> > > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> > >
> > > The default "alabaster" sphinx theme has a couple shortcomings:
> > > - the navbar moves along the page
> > > - the search bar is not always at the same place
> > > - it lacks some contrast and colours
> > >
> > > The "rtd" theme from readthedocs.org is a popular third party theme used
> > > notably by the kernel, with a custom style sheet. I like it better,
> > > perhaps others do too. It also simplify "Edit on Gitlab" links.
> 
> > >  # Add any paths that contain custom static files (such as style sheets) here,
> > >  # relative to this directory. They are copied after the builtin static files,
> > >  # so a file named "default.css" will overwrite the builtin "default.css".
> > > -# QEMU doesn't yet have any static files, so comment this out so we don't
> > > -# get a warning about a missing directory.
> > > -# If we do ever add this then it would probably be better to call the
> > > -# subdirectory sphinx_static, as the Linux kernel does.
> > > -# html_static_path = ['_static']
> > > +html_static_path = [os.path.join(qemu_docdir, "sphinx-static")]
> > > +
> > > +html_css_files = [
> > > +    'theme_overrides.css',
> > > +]
> >
> > Does this still have a good result in the case where we fall back
> > to alabaster theme ?
> 
> How much do we want to retain support for multiple themes? When
> I was first putting in the Sphinx documentation I found that some
> things were kind of theme-specific, in that tweaking things to look
> and read sensibly in one theme made them look a bit weird in another.
> If we said "we support only the rtd theme and mandate it" would that
> cause much pain for downstreams and end-users ?

The theme is pre-packaged for Fedora, Debian, Ubuntu, which gives me
confidence for Linux distros in general.

BSD / macOS / Windows, who knows ?

We could check for rtd theme in meson, and disable the docs build
if missing.  Might be better than pretending to have alabaster
fallback which none of us will ever test, and then get bugs about
it.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


