Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD17E6F0541
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 14:00:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps0HF-0004fs-Jz; Thu, 27 Apr 2023 07:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ps0HC-0004fS-PF
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 07:59:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ps0HA-0000OV-HN
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 07:59:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682596743;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ZO/ctY9Uik+K5iHHjXUD9+S7wUSKaxMC8NfYfcSbT1o=;
 b=AoZ/p5XcVg+cEtnmcBfMJ9JFYPgcJkadl0Dw959R7rZU3MYwL9pkFPfighPN6K2zoQnn4o
 a/IiKROllvmU2QW8EE7iLPjBfah8mFj8MujfhXr7dEZwmzoJgKzi0xvKX+EBj8QLDFbIPL
 bfUllYX7Lhj/Y2i/rpLudHnUkOxBmlo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-_aD60cCOPKuylYR6S-aZEg-1; Thu, 27 Apr 2023 07:59:01 -0400
X-MC-Unique: _aD60cCOPKuylYR6S-aZEg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 607A7858F0E;
 Thu, 27 Apr 2023 11:59:01 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9434314171B6;
 Thu, 27 Apr 2023 11:58:59 +0000 (UTC)
Date: Thu, 27 Apr 2023 12:58:56 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] meson: Pass -j option to sphinx
Message-ID: <ZEpjgDbIZZ5H89N8@redhat.com>
References: <20230426160347.8860-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230426160347.8860-1-farosas@suse.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Apr 26, 2023 at 01:03:46PM -0300, Fabiano Rosas wrote:
> Save a bit of build time by passing the number of jobs option to
> sphinx.
> 
> To avoid warnings from sphinx, alter our plugins to inform whether
> they support parallelism. The two plugins touched are quite simple and
> I don't see anything that would indicate they do not support being
> called in parallel, so return True for both reads and writes.
> 
> before:
>  $ time make -j16 man html
>  ...
>  [1/2] Generating docs/QEMU manual with a custom command
>  [2/2] Generating docs/QEMU man pages with a custom command
> 
>  real    0m49.770s
>  user    0m49.425s
>  sys     0m0.716s
> 
> after:
>  $ time make -j16 man html
>  ...
>  [1/2] Generating docs/QEMU manual with a custom command (wrapped by meson because command contains newlines)
>  [2/2] Generating docs/QEMU man pages with a custom command (wrapped by meson because command contains newlines)
>  real    0m30.153s
>  user    1m5.945s
>  sys     0m2.440s

When I test this on Fedora 38, the docs build hangs forever.

I ran sphinx directly and see it prints a traceback and then
fails to exit after this error

Traceback (most recent call last):
  File "/usr/lib/python3.11/site-packages/sphinx/util/parallel.py", line 105, in join
    if not self._join_one():
           ^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.11/site-packages/sphinx/util/parallel.py", line 129, in _join_one
    self._result_funcs.pop(tid)(self._args.pop(tid), result)
  File "/usr/lib/python3.11/site-packages/sphinx/builders/__init__.py", line 478, in merge
    self.env.merge_info_from(docs, env, self.app)
  File "/usr/lib/python3.11/site-packages/sphinx/environment/__init__.py", line 366, in merge_info_from
    domain.merge_domaindata(docnames, other.domaindata[domainname])
  File "/usr/lib/python3.11/site-packages/sphinx/domains/__init__.py", line 295, in merge_domaindata
    raise NotImplementedError('merge_domaindata must be implemented in %s '
NotImplementedError: merge_domaindata must be implemented in <class 'dbusdomain.DBusDomain'> to be able to do parallel builds!

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/lib/python3.11/site-packages/sphinx/cmd/build.py", line 281, in build_main
    app.build(args.force_all, args.filenames)
  File "/usr/lib/python3.11/site-packages/sphinx/application.py", line 347, in build
    self.builder.build_update()
  File "/usr/lib/python3.11/site-packages/sphinx/builders/__init__.py", line 310, in build_update
    self.build(to_build,


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


