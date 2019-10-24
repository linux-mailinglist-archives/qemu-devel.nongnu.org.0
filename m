Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96972E2F60
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 12:49:00 +0200 (CEST)
Received: from localhost ([::1]:38484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNafr-0003zR-K5
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 06:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54648)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iNaK5-0001o5-2a
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 06:26:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iNaK2-0005gD-42
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 06:26:27 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:29253
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iNaK0-0005fM-6H
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 06:26:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571912782;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Phis3ZiVLeE4i/I7Up7oncRANQvVerLgwndX9J9dRX8=;
 b=G5Fy3K9bK/21/jEU7JoOmFDEVAXJlq1o9bBjQUof1s697JyIf/Z95mR/F2UeL5SDQWKXtA
 mkqpXUj3wkb3frHR1WjCw0PCtQf3VjpWHOyRpftRV6BSoD4C5okAgmaq8pOKO6eRoQN4Mv
 dCCkSe2jJkN2wrWTh9wA0h/jLKQPQFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-WuyoZ-MJMBC0fhXuoMP6mQ-1; Thu, 24 Oct 2019 06:26:20 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A4651800DD0
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2019 10:26:19 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CD9360BF3;
 Thu, 24 Oct 2019 10:26:13 +0000 (UTC)
Date: Thu, 24 Oct 2019 11:26:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 2/2] virtiofsd: move to a new pid namespace
Message-ID: <20191024102611.GF3700@redhat.com>
References: <20191016160157.12414-1-stefanha@redhat.com>
 <20191016160157.12414-3-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191016160157.12414-3-stefanha@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: WuyoZ-MJMBC0fhXuoMP6mQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 16, 2019 at 05:01:57PM +0100, Stefan Hajnoczi wrote:
> virtiofsd needs access to /proc/self/fd.  Let's move to a new pid
> namespace so that a compromised process cannot see another other
> processes running on the system.
>=20
> One wrinkle in this approach: unshare(CLONE_NEWPID) affects *child*
> processes and not the current process.  Therefore we need to fork the
> pid 1 process that will actually run virtiofsd and leave a parent in
> waitpid(2).  This is not the same thing as daemonization and parent
> processes should not notice a difference.
>=20
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  contrib/virtiofsd/passthrough_ll.c | 95 ++++++++++++++++++++++--------
>  1 file changed, 72 insertions(+), 23 deletions(-)
>=20
> diff --git a/contrib/virtiofsd/passthrough_ll.c b/contrib/virtiofsd/passt=
hrough_ll.c
> index c27ff7d800..b6ee9b2e90 100644
> --- a/contrib/virtiofsd/passthrough_ll.c
> +++ b/contrib/virtiofsd/passthrough_ll.c
> @@ -56,9 +56,12 @@
>  #include <sys/xattr.h>
>  #include <sys/mman.h>
>  #include <sys/socket.h>
> +#include <sys/types.h>
>  #include <sys/un.h>
> +#include <sys/wait.h>
>  #include <sys/capability.h>
> =20
> +
>  #include "ireg.h"
>  #include <sys/mount.h>
>  #include <sys/resource.h>
> @@ -2749,6 +2752,72 @@ static void setup_net_namespace(void)
>  =09}
>  }
> =20
> +/*
> + * Move to a new pid namespace to prevent access to other processes if t=
his
> + * process is compromised.
> + */
> +static void setup_pid_namespace(void)
> +{
> +=09pid_t child;
> +
> +=09/*
> +=09 * Create a new pid namespace for *child* processes.  We'll have to
> +=09 * fork in order to enter the new pid namespace.  A new mount namespa=
ce
> +=09 * is also needed so that we can remount /proc for the new pid
> +=09 * namespace.
> +=09 */
> +=09if (unshare(CLONE_NEWPID | CLONE_NEWNS) !=3D 0) {
> +=09=09fuse_log(FUSE_LOG_ERR, "unshare(CLONE_NEWPID | CLONE_NEWNS): %m\n"=
);
> +=09=09exit(1);
> +=09}
> +
> +=09child =3D fork();
> +=09if (child < 0) {
> +=09=09fuse_log(FUSE_LOG_ERR, "fork() failed: %m\n");
> +=09=09exit(1);
> +=09}
> +=09if (child > 0) {
> +=09=09pid_t waited;
> +=09=09int wstatus;
> +
> +=09=09/* The parent waits for the child */
> +=09=09do {
> +=09=09=09waited =3D waitpid(child, &wstatus, 0);
> +=09=09} while (waited < 0 && errno =3D=3D EINTR);
> +
> +=09=09if (WIFEXITED(wstatus)) {
> +=09=09=09exit(WEXITSTATUS(wstatus));
> +=09=09}
> +
> +=09=09exit(1);
> +=09}

It might be useful to call prctl(PR_SET_PDEATHSIG) here, so that
if the parent process exits for any reason, the child will be killed
off too.

> +
> +=09/*
> +=09 * If the mounts have shared propagation then we want to opt out so o=
ur
> +=09 * mount changes don't affect the parent mount namespace.
> +=09 */
> +=09if (mount(NULL, "/", NULL, MS_REC|MS_SLAVE, NULL) < 0) {
> +=09=09fuse_log(FUSE_LOG_ERR, "mount(/, MS_REC|MS_SLAVE): %m\n");
> +=09=09exit(1);
> +=09}
> +
> +=09/* The child must remount /proc to use the new pid namespace */
> +=09if (mount("proc", "/proc", "proc",
> +=09=09  MS_NODEV | MS_NOEXEC | MS_NOSUID | MS_RELATIME, NULL) < 0) {
> +=09=09fuse_log(FUSE_LOG_ERR, "mount(/proc): %m\n");
> +=09=09exit(1);
> +=09}
> +}

I feel like this is making things a bit misleading.

 setup_pid_namespace()

is now creating the mount namespace and pid namespace, and doing
some mount point config

 setup_mount_namespace()

is not creating the mount namespace, but is doing some more mount
point config.

And then there's setup_net_namespace() too.

I think there could be a  single

  setup_namespaces()

method that does the unshare(CLONE_NEWNS|CLONE_NEWNET|CLONE_NEWPID)
and forking the child.

And a setup_mounts()

method that does all the mount() calls.

> +
> +static void setup_proc_self_fd(struct lo_data *lo)
> +{
> +=09lo->proc_self_fd =3D open("/proc/self/fd", O_PATH);
> +=09if (lo->proc_self_fd =3D=3D -1) {
> +=09=09fuse_log(FUSE_LOG_ERR, "open(/proc/self/fd, O_PATH): %m\n");
> +=09=09exit(1);
> +=09}
> +}
> +
>  /* This magic is based on lxc's lxc_pivot_root() */
>  static void setup_pivot_root(const char *source)
>  {
> @@ -2803,20 +2872,10 @@ static void setup_pivot_root(const char *source)
> =20
>  /*
>   * Make the source directory our root so symlinks cannot escape and no o=
ther
> - * files are accessible.
> + * files are accessible.  Assumes unshare(CLONE_NEWNS) was already calle=
d.
>   */
>  static void setup_mount_namespace(const char *source)
>  {
> -=09if (unshare(CLONE_NEWNS) !=3D 0) {
> -=09=09fuse_log(FUSE_LOG_ERR, "unshare(CLONE_NEWNS): %m\n");
> -=09=09exit(1);
> -=09}
> -
> -=09if (mount(NULL, "/", NULL, MS_REC|MS_SLAVE, NULL) < 0) {
> -=09=09fuse_log(FUSE_LOG_ERR, "mount(/, MS_REC|MS_PRIVATE): %m\n");
> -=09=09exit(1);
> -=09}
> -
>  =09if (mount(source, source, NULL, MS_BIND, NULL) < 0) {
>  =09=09fuse_log(FUSE_LOG_ERR, "mount(%s, %s, MS_BIND): %m\n", source, sou=
rce);
>  =09=09exit(1);
> @@ -2831,6 +2890,8 @@ static void setup_mount_namespace(const char *sourc=
e)
>   */
>  static void setup_sandbox(struct lo_data *lo, bool enable_syslog)
>  {
> +=09setup_pid_namespace();
> +=09setup_proc_self_fd(lo);
>  =09setup_net_namespace();
>  =09setup_mount_namespace(lo->source);
>  =09setup_seccomp(enable_syslog);
> @@ -2860,15 +2921,6 @@ static void setup_root(struct lo_data *lo, struct =
lo_inode *root)
>  =09g_atomic_int_set(&root->refcount, 2);
>  }
> =20
> -static void setup_proc_self_fd(struct lo_data *lo)
> -{
> -=09lo->proc_self_fd =3D open("/proc/self/fd", O_PATH);
> -=09if (lo->proc_self_fd =3D=3D -1) {
> -=09=09fuse_log(FUSE_LOG_ERR, "open(/proc/self/fd, O_PATH): %m\n");
> -=09=09exit(1);
> -=09}
> -}
> -
>  /* Raise the maximum number of open file descriptors to the system limit=
 */
>  static void setup_nofile_rlimit(void)
>  {
> @@ -3110,9 +3162,6 @@ int main(int argc, char *argv[])
>  =09=09get_shared(&lo, &lo.root);
>  =09}
> =20
> -=09/* Must be after daemonize to get the right /proc/self/fd */
> -=09setup_proc_self_fd(&lo);
> -
>  =09setup_sandbox(&lo, opts.syslog);
> =20
>  =09setup_root(&lo, &lo.root);
> --=20
> 2.21.0
>=20
>=20

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


