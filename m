Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D97E4191E9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 11:59:05 +0200 (CEST)
Received: from localhost ([::1]:34466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUnPc-0003Kx-4D
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 05:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mUnJX-00052G-Mf
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 05:52:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mUnJT-00040M-8e
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 05:52:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632736361;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/HuHCzIXLbImGMIBrGVjSKpkxWrHVXc+4xP7Huq7qAI=;
 b=JA/1MA7C2+Qlhdnjtf++zIucJcRHf/qk2Ui3/9a/fhSF/Z3q3DaTKt1Kl6bmrNMk02WWeH
 jITfWmb/QC7a1LoxWtxbWpvXQAbD4TCnq0Nx8zOzaE7Nyr+87evnUnkmJa1ydUZlpRk3w7
 b6v3m7uulyfcvVw4SqDSg257JxO5p3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-eE2U1Zc8OA6gdeuWetuA8w-1; Mon, 27 Sep 2021 05:52:37 -0400
X-MC-Unique: eE2U1Zc8OA6gdeuWetuA8w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41249180830B;
 Mon, 27 Sep 2021 09:52:36 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49F7760657;
 Mon, 27 Sep 2021 09:52:34 +0000 (UTC)
Date: Mon, 27 Sep 2021 10:52:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/2] bsd-user: Only process meson rules on BSD host
Message-ID: <YVGUX6FZlFBhhgwn@redhat.com>
References: <20210926220103.1721355-1-f4bug@amsat.org>
 <20210926220103.1721355-2-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210926220103.1721355-2-f4bug@amsat.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 27, 2021 at 12:01:02AM +0200, Philippe Mathieu-Daudé wrote:
> Reported-by: Warner Losh <imp@bsdimp.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  bsd-user/meson.build | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/bsd-user/meson.build b/bsd-user/meson.build
> index 03695493408..a7607e1c884 100644
> --- a/bsd-user/meson.build
> +++ b/bsd-user/meson.build
> @@ -1,3 +1,7 @@
> +if not config_host.has_key('CONFIG_BSD')
> +  subdir_done()
> +endif
> +
>  bsd_user_ss.add(files(
>    'bsdload.c',
>    'elfload.c',

If we look at the big picture across the root meson.build, and this
meson.build we have


  bsd_user_ss = ss.source_set()

  ...

  bsd_user_ss.add(files(
    'bsdload.c',
    'elfload.c',
    'main.c',
    'mmap.c',
    'signal.c',
    'strace.c',
    'syscall.c',
    'uaccess.c',
  ))

  ...

  bsd_user_ss.add(files('gdbstub.c'))
  specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)


So without this change, we're already correctly dropping bsd_user_ss
in its entirity, when not on BSD.

With this change, we're dropping some, but not all, of bsd_user_ss
files - gdbstub.c remains.

So this change on its own doesn't make a whole lot of sense.

If we look at linux-user/meson.build though things are more complex.
There we have alot of sub-dirs, and meson.biuld in those dirs adds
generators for various files. So conceivably skipping linux-user
will mean we won't auto-generate files we don't need on non-Linux.

With that in mind, I think it makes conceptual sense to have this
bsd-user/meson.build change, for the purpose of design consistency,
even if it doesn't have any real world benefit for bsd-user today.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


