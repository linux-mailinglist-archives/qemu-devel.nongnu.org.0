Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1563B57BB71
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 18:33:44 +0200 (CEST)
Received: from localhost ([::1]:51734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oECdr-0000bw-5N
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 12:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oECcM-0007Kw-51
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 12:32:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oECcJ-0008SI-MB
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 12:32:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658334726;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vhz4VegQ36g+hjYrMQ4LjJP7uiXJT1HHqbOCVJ+v7G8=;
 b=bMzZBb456wgTzYlY+Xm+X6/qWP4ArC1xApEQepwQdcn02swbTuq1Edg/tXbgjrT5LYUbSs
 LWI5cjU3sOfLvu+2hiFDmQHXDc+305gz83iXzVpIamxJ8uNUBujOPtaKqtVE0CJFaN39Cm
 pGNb3Wv2iu+71BuVraGdS24M/AahsVs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-P-MWi4KhNwWo2LTiIA2DOQ-1; Wed, 20 Jul 2022 12:31:57 -0400
X-MC-Unique: P-MWi4KhNwWo2LTiIA2DOQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 309DF1019C95;
 Wed, 20 Jul 2022 16:31:57 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 84621C2811A;
 Wed, 20 Jul 2022 16:31:55 +0000 (UTC)
Date: Wed, 20 Jul 2022 17:31:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 1/9] tests: introduce tree-wide code style checking
Message-ID: <Ytgt+I+XFg2sFbNi@redhat.com>
References: <20220707163720.1421716-1-berrange@redhat.com>
 <20220707163720.1421716-2-berrange@redhat.com>
 <CAFEAcA-gANYJSK4LPXQoP0jTO5ex-zf3XZA2WH91ByXCEZMysQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA-gANYJSK4LPXQoP0jTO5ex-zf3XZA2WH91ByXCEZMysQ@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 20, 2022 at 05:25:00PM +0100, Peter Maydell wrote:
> On Thu, 7 Jul 2022 at 17:37, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > The logic provide is inspired by the GNULIB 'top/maint.mk' file,
> > but has been re-implemented in a simple Python script, using a
> > YAML config file, in an attempt to make it easier to understand
> > than the make rules.
> >
> > This commit does the bare minimum introducing the basic infra:
> >
> >  - tests/style.py - the script for evaluating coding style rules
> >  - tests/style.yml - the config defining the coding style rules
> >
> > The concept behind the style checking is to perform simple regular
> > expression matches across the source file content.
> 
> > As such this style matching framework is not proposed as a solution for
> > all possible coding style rules. It is general enough that it can
> > accomplish many useful checks, and is intended to be complimentary to
> > any style checkers with semantic knowledge of the code like libclang,
> > or pylint/flake8.
> 
> So would the intention be that we try to obsolete checkpatch,
> or will we still have checkpatch because it can find some
> style issues that this framework cannot handle?
> 
> I think that on balance I'm in favour of this patchseries if
> it is part of a path where we say "we are going to drop
> checkpatch and replace it with X, Y and Z" (and we actually
> implement that path and don't just end up with another
> half-completed transition :-)). I'm much less in favour if
> it's just "we added yet another thing to the pile"...

I would certainly like to see us eventually remove
checkpatch.pl because of the various downsides it has.

The caveat is that I've not actually looked in any detail
at what things checkpatch.pl actually checks for. Without
looking my guess-timate is that we could probably replace
90% of it without much trouble. Perhaps we'll just decide
some of the checkjs in checkpatch aren't worth the burden
of maintaining its usage.

> > If a file is known to intentionally violate a style check rule
> > this can be recorded in the style.yml and will result in it being
> > ignored.  The '--ignored' flag can be used to see ignored failures.
> 
> Is it possible to have an individual "suppress this style check
> in this one place" mechanism? Dropping an entire file from the
> style check is certainly going to be useful for some situations,
> but very often I would expect there might be one place in a
> multi-thousand line C file where we want to violate a style
> rule and it would be nice not to lose the coverage on all the
> rest of the file as a result. Plus a whole-file suppression that
> lives somewhere other than the source file is going to tend to
> hang around for ages after we refactor/delete whatever bit of
> source code it was that meant we needed the suppression, whereas
> if the suppression is in the source file itself then you see it
> when you're working on that bit of code.

We could possibly come up with a way to put a magic comment
on the end of a line (eg '// style:ignore' ), and have it applied
automatically as an exclusion. A magic comment the line before
is hard though, given that we're aiming to match things linewise
for speed.

> >  meson.build            |   2 +
> >  tests/Makefile.include |   3 +-
> >  tests/meson.build      |  17 ++++
> >  tests/style.py         | 218 +++++++++++++++++++++++++++++++++++++++++
> >  tests/style.yml        |  88 +++++++++++++++++
> 
> I think this should live in scripts/, same as checkpatch.

Sure, I don't mind.

> > diff --git a/meson.build b/meson.build
> > index 65a885ea69..d8ef24bacb 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -18,6 +18,8 @@ config_host = keyval.load(meson.current_build_dir() / 'config-host.mak')
> >  enable_modules = 'CONFIG_MODULES' in config_host
> >  enable_static = 'CONFIG_STATIC' in config_host
> >
> > +in_gitrepo = run_command('test', '-d', '.git', check: false).returncode() == 0
> 
> Should we use Meson's fs.is_dir() rather than running a shell?
> (https://mesonbuild.com/Fs-module.html)

Will investigate 


> > diff --git a/tests/style.yml b/tests/style.yml
> > new file mode 100644
> > index 0000000000..b4e7c6111f
> > --- /dev/null
> > +++ b/tests/style.yml
> > @@ -0,0 +1,88 @@
> > +# Source code style checking rules
> > +#
> > +# Each top level key defines a new check, that is
> > +# exposed as a test case in the meson 'style' test
> > +# suite.
> > +#
> 
> You should say somewhere here which of the half a dozen
> possible regular expression syntaxes is used.

ok


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


