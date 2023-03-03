Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD256A981B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 14:02:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY52y-0004F3-Fs; Fri, 03 Mar 2023 08:02:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY52V-0003sn-Qn
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 08:01:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY52T-0004iZ-Ul
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 08:01:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677848493;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jVCqV0VQsPcLXLXgyF/kk/hoVrYxOP6bLrrpvFg3Dwg=;
 b=HP444R2kLpIChGkZLd6P6vO9PKSEM+mepP2bVfgV5zteehBKeQiyl53HZ9rnZu0utXIVxi
 g+7neEA80vAb/N0+vab1ojep4fIiR3FaAn6bbE2yZXhUP4hGZhB9stPwQJnPI9DZVcLUSl
 DBcKMW2blcQspw8NXyXyMqFg+DpDqLw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-kYAF6yN2NXaf-ct8FCFpvA-1; Fri, 03 Mar 2023 08:01:30 -0500
X-MC-Unique: kYAF6yN2NXaf-ct8FCFpvA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A626B101A5BA;
 Fri,  3 Mar 2023 13:01:29 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E6E8492C14;
 Fri,  3 Mar 2023 13:01:28 +0000 (UTC)
Date: Fri, 3 Mar 2023 13:01:25 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 1/5] iotests: explicitly pass source/build dir to 'check'
 command
Message-ID: <ZAHvpfldaNYrhBvP@redhat.com>
References: <20230302184606.418541-1-berrange@redhat.com>
 <20230302184606.418541-2-berrange@redhat.com>
 <877cvy9eo4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877cvy9eo4.fsf@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

On Fri, Mar 03, 2023 at 12:55:26PM +0000, Alex Bennée wrote:
> 
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > The 'check' script has some rather dubious logic whereby it assumes
> > that if invoked as a symlink, then it is running from a separate
> > source tree and build tree, otherwise it assumes the current working
> > directory is a combined source and build tree.
> >
> > This doesn't work if you want to invoke the 'check' script using
> > its full source tree path while still using a split source and build
> > tree layout. This would be a typical situation with meson if you ask
> > it to find the 'check' script path using files('check').
> >
> > Rather than trying to make the logic more magical, add support for
> > explicitly passing the dirs using --source-dir and --build-dir. If
> > either is omitted the current logic is maintained.
> >
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  tests/qemu-iotests/check      |  8 +++++++-
> >  tests/qemu-iotests/testenv.py | 17 +++++++++++++----
> >  2 files changed, 20 insertions(+), 5 deletions(-)
> >
> > diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
> > index 9bdda1394e..806abc21d6 100755
> > --- a/tests/qemu-iotests/check
> > +++ b/tests/qemu-iotests/check
> > @@ -113,6 +113,10 @@ def make_argparser() -> argparse.ArgumentParser:
> >                         'middle of the process.')
> >      g_sel.add_argument('tests', metavar='TEST_FILES', nargs='*',
> >                         help='tests to run, or "--" followed by a command')
> > +    g_sel.add_argument('--build-dir', default=None,
> > +                       help='Path to iotests build directory')
> > +    g_sel.add_argument('--source-dir', default=None,
> > +                       help='Path to iotests build directory')
> >
> 
> I'd be tempted to push all the automagic stuff into the options so you
> have something like:

Hmm, yes, that's a nice idea, will give it a go as you suggest.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


