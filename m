Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE056F0AE3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 19:35:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps5VN-0005DE-3b; Thu, 27 Apr 2023 13:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ps5VD-0005Cq-MJ
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 13:33:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ps5V8-0001fa-6z
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 13:33:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682616827;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NxxT+TeYXBgs0TUaE3Gu5jIOfQv1GAqMfv0VPNw7xz0=;
 b=Pig6mRWyhaunbBlPFuWm/+beDehnXUZKhaOEQgZ4kokQ9sPLDRHCiPqjOGhmOgoHsXR2yh
 nTNvVgayrfHzf3jM9yiGfyWk9UMpBOwtwp0nWj7iY/2FcE6YPt66QK2sPcTxeqPt33lLLx
 2XloLetexiZaIBZtaLBk8VdS6DJK6ak=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-InD75eZlPpegyAlfLpZXgg-1; Thu, 27 Apr 2023 13:33:44 -0400
X-MC-Unique: InD75eZlPpegyAlfLpZXgg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38CAB858F0E;
 Thu, 27 Apr 2023 17:33:44 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 342C563F4D;
 Thu, 27 Apr 2023 17:33:43 +0000 (UTC)
Date: Thu, 27 Apr 2023 18:33:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2] meson: Pass -j option to sphinx
Message-ID: <ZEqx9DfCkqz/Qj07@redhat.com>
References: <20230427172516.19003-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230427172516.19003-1-farosas@suse.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

On Thu, Apr 27, 2023 at 02:25:16PM -0300, Fabiano Rosas wrote:
> Save a bit of build time by passing the number of jobs option to
> sphinx.
> 
> We cannot use the -j option from make because meson does not support
> setting build time parameters for custom targets. Use nproc instead or
> the equivalent sphinx option "-j auto", if that is available.
> 
> Also make sure our plugins support parallelism and report it properly
> to sphinx. Particularly, implement the merge_domaindata method in
> DBusDomain that is used to merge in data from other subprocesses.
> 
> before:
>   $ time make man html
>   ...
>   [1/2] Generating docs/QEMU manual with a custom command
>   [2/2] Generating docs/QEMU man pages with a custom command
> 
>   real    0m43.157s
>   user    0m42.642s
>   sys     0m0.576s
> 
> after:
>   $ time make man html
>   ...
>   [1/2] Generating docs/QEMU manual with a custom command
>   [2/2] Generating docs/QEMU man pages with a custom command
> 
>   real    0m25.014s
>   user    0m51.288s
>   sys     0m2.085s

On my 12 CPU laptop I see a similar magnitude benefit - about
20 seconds is cut from the docs build time - 50 down to 30 secs.

Watching the CPU usage I see sphinx is not very good at keeping
all CPUs busy. For perhaps 2 seconds I'll see  8 sphinx processes
burning CPUs, but the majority of the time it'll only be 1 or 2
sphinx processes.

IOW, we do get a benefit, but it is not nearly as good as one
might hope for given the number of CPUs potentially available.

> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>  docs/meson.build           | 12 ++++++++++++
>  docs/sphinx/dbusdomain.py  |  4 ++++
>  docs/sphinx/fakedbusdoc.py |  5 +++++
>  docs/sphinx/qmp_lexer.py   |  5 +++++
>  4 files changed, 26 insertions(+)

Tested-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> diff --git a/docs/meson.build b/docs/meson.build
> index f220800e3e..9e4bed6fa0 100644
> --- a/docs/meson.build
> +++ b/docs/meson.build
> @@ -10,6 +10,18 @@ if sphinx_build.found()
>      SPHINX_ARGS += [ '-W', '-Dkerneldoc_werror=1' ]
>    endif
>  
> +  sphinx_version = run_command(SPHINX_ARGS + ['--version'],
> +                               check: false).stdout().split()[1]
> +  if sphinx_version.version_compare('>=5.1.2')
> +    SPHINX_ARGS += ['-j', 'auto']
> +  else
> +    nproc = find_program('nproc')
> +    if nproc.found()
> +      jobs = run_command(nproc, check:false).stdout()
> +      SPHINX_ARGS += ['-j', jobs]
> +    endif
> +  endif

ANy reason for check: false in these 2 run_command calls ?

They'll both return 0 on success, so I would have though
'check: true' was more robust at error reporting ?


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


