Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D815229DC4
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 19:05:42 +0200 (CEST)
Received: from localhost ([::1]:45560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyIBZ-0008AV-8S
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 13:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jyI4r-00063W-AB
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 12:58:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54439
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jyI4l-0002km-45
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 12:58:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595437118;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=+2zfk5o8UlVgIu60zicjn8XYb3iryUXa9wupF5gKnW8=;
 b=XxcFGQKAmtrJyM6L0valoO7JusG93OzvDuc35Q38tOmvVQtxuh43aVF3spKwMLk4GmvM0V
 cKpE3dSH+g0hlvRAtbDBaQJqaNcdNNdYE0l52oHclH0RTOJ1SEYhVytf9PK6f8FSdhuznY
 UpbkAgvqfRbobzRBNI5SeJgIY0Zdk7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-ufpg9FFzNcC2pgXjtJodoQ-1; Wed, 22 Jul 2020 12:58:32 -0400
X-MC-Unique: ufpg9FFzNcC2pgXjtJodoQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF25B8017FB
 for <qemu-devel@nongnu.org>; Wed, 22 Jul 2020 16:58:31 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9105069316;
 Wed, 22 Jul 2020 16:58:14 +0000 (UTC)
Date: Wed, 22 Jul 2020 17:58:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH for-5.1 2/3] virtiofsd: add container-friendly -o chroot
 sandboxing option
Message-ID: <20200722165811.GT2324845@redhat.com>
References: <20200722130206.224898-1-stefanha@redhat.com>
 <20200722130206.224898-3-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200722130206.224898-3-stefanha@redhat.com>
User-Agent: Mutt/1.14.5 (2020-06-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/22 00:40:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, vromanso@redhat.com, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, rmohr@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 22, 2020 at 02:02:05PM +0100, Stefan Hajnoczi wrote:
> virtiofsd cannot run in an unprivileged container because CAP_SYS_ADMIN
> is required to create namespaces.
> 
> Introduce a weaker sandbox that is sufficient in container environments
> because the container runtime already sets up namespaces. Use chroot to
> restrict path traversal to the shared directory.
> 
> virtiofsd loses the following:
> 
> 1. Mount namespace. The process chroots to the shared directory but
>    leaves the mounts in place. Seccomp rejects mount(2)/umount(2)
>    syscalls.
> 
> 2. Pid namespace. This should be fine because virtiofsd is the only
>    process running in the container.
> 
> 3. Network namespace. This should be fine because seccomp already
>    rejects the connect(2) syscall, but an additional layer of security
>    is lost. Container runtime-specific network security policies can be
>    used drop network traffic (except for the vhost-user UNIX domain
>    socket).

IIUC this relies on the fact that the container will still have 
CAP_SYS_CHROOT IOW, we still don't have a solution for running
virtiofsd as an unprivileged user.

Bearing in mind possibly need for future improvements to handle
unprivileged users....

> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  tools/virtiofsd/helper.c         |  3 +++
>  tools/virtiofsd/passthrough_ll.c | 44 ++++++++++++++++++++++++++++++--
>  2 files changed, 45 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
> index 3105b6c23a..7421c9ca1a 100644
> --- a/tools/virtiofsd/helper.c
> +++ b/tools/virtiofsd/helper.c
> @@ -151,6 +151,9 @@ void fuse_cmdline_help(void)
>             "    -o cache=<mode>            cache mode. could be one of \"auto, "
>             "always, none\"\n"
>             "                               default: auto\n"
> +           "    -o chroot|no_chroot        use container-friendly chroot instead\n"
> +           "                               of stronger mount namespace sandbox\n"
> +           "                               default: false\n"

A simple boolean like this feels like it lacks future-proofing.

Should we have an option that takes an enumerated arg string:

   -o sandbox=[namespace|chroot|....]

so we can add more options later with the same syntax.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


