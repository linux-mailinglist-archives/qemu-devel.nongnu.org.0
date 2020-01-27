Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FD614A376
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 13:04:31 +0100 (CET)
Received: from localhost ([::1]:43810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iw382-0002rG-DN
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 07:04:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60025)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dinechin@redhat.com>) id 1iw37E-0002Q4-T0
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 07:03:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dinechin@redhat.com>) id 1iw37D-0004Ww-N4
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 07:03:40 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57625
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dinechin@redhat.com>) id 1iw37D-0004Vw-Je
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 07:03:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580126619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TyHNs6Kin7B1Gzfv0g559L8W4rdf87VCCsSmoO0beGk=;
 b=ckP3HkehgOItRviud1Ja9ZGQWlVCXAtpVCDzCX2esetayBerdjWGOcgxnfJHFpnYib83Dn
 PEiJS8QoOnECQKbeV6C3bRqCV/8xyKvBtAf22ytOg2DS+2Ue+FZ8noFzDCkbXt22CD64YT
 4P3mE3UntMrDKZFw03oBE+lLFgvGN+4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-FNGUGwHgOgy0jLlPUEBkyA-1; Mon, 27 Jan 2020 07:03:36 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1B808017CC
 for <qemu-devel@nongnu.org>; Mon, 27 Jan 2020 12:03:35 +0000 (UTC)
Received: from ptitpuce (unknown [10.34.244.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DEE391BC6D;
 Mon, 27 Jan 2020 12:03:32 +0000 (UTC)
References: <20200123115841.138849-1-dgilbert@redhat.com>
 <20200123115841.138849-17-dgilbert@redhat.com>
User-agent: mu4e 1.3.5; emacs 26.2
From: Christophe de Dinechin <dinechin@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PULL 016/111] virtiofsd: Add options for virtio
In-reply-to: <20200123115841.138849-17-dgilbert@redhat.com>
Message-ID: <m1r1zlqf71.fsf@redhat.com>
Date: Mon, 27 Jan 2020 13:03:30 +0100
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: FNGUGwHgOgy0jLlPUEBkyA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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
Cc: stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Dr. David Alan Gilbert (git) writes:

> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> Add options to specify parameters for virtio-fs paths, i.e.
>
>    ./virtiofsd -o vhost_user_socket=3D/tmp/vhostqemu

Shouldn't that be --socket-path=3D/tmp/vhostqemu now?

>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  tools/virtiofsd/fuse_i.h        |  1 +
>  tools/virtiofsd/fuse_lowlevel.c | 11 ++++++++---
>  tools/virtiofsd/helper.c        | 14 +++++++-------
>  3 files changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/tools/virtiofsd/fuse_i.h b/tools/virtiofsd/fuse_i.h
> index bae06992e0..26b1a7da88 100644
> --- a/tools/virtiofsd/fuse_i.h
> +++ b/tools/virtiofsd/fuse_i.h
> @@ -63,6 +63,7 @@ struct fuse_session {
>      struct fuse_notify_req notify_list;
>      size_t bufsize;
>      int error;
> +    char *vu_socket_path;
>  };
>
>  struct fuse_chan {
> diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowle=
vel.c
> index 8552cfb8af..17e8718283 100644
> --- a/tools/virtiofsd/fuse_lowlevel.c
> +++ b/tools/virtiofsd/fuse_lowlevel.c
> @@ -2115,8 +2115,11 @@ reply_err:
>      }
>
>  static const struct fuse_opt fuse_ll_opts[] =3D {
> -    LL_OPTION("debug", debug, 1), LL_OPTION("-d", debug, 1),
> -    LL_OPTION("--debug", debug, 1), LL_OPTION("allow_root", deny_others,=
 1),
> +    LL_OPTION("debug", debug, 1),
> +    LL_OPTION("-d", debug, 1),
> +    LL_OPTION("--debug", debug, 1),
> +    LL_OPTION("allow_root", deny_others, 1),
> +    LL_OPTION("--socket-path=3D%s", vu_socket_path, 0),
>      FUSE_OPT_END
>  };
>
> @@ -2132,7 +2135,9 @@ void fuse_lowlevel_help(void)
>       * These are not all options, but the ones that are
>       * potentially of interest to an end-user
>       */
> -    printf("    -o allow_root          allow access by root\n");
> +    printf(
> +        "    -o allow_root              allow access by root\n"
> +        "    --socket-path=3DPATH         path for the vhost-user socket=
\n");
>  }
>
>  void fuse_session_destroy(struct fuse_session *se)
> diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
> index 9333691525..676032e71f 100644
> --- a/tools/virtiofsd/helper.c
> +++ b/tools/virtiofsd/helper.c
> @@ -127,13 +127,13 @@ static const struct fuse_opt conn_info_opt_spec[] =
=3D {
>
>  void fuse_cmdline_help(void)
>  {
> -    printf(
> -        "    -h   --help            print help\n"
> -        "    -V   --version         print version\n"
> -        "    -d   -o debug          enable debug output (implies -f)\n"
> -        "    -f                     foreground operation\n"
> -        "    -o max_idle_threads    the maximum number of idle worker th=
reads\n"
> -        "                           allowed (default: 10)\n");
> +    printf("    -h   --help                print help\n"
> +           "    -V   --version             print version\n"
> +           "    -d   -o debug              enable debug output (implies =
-f)\n"
> +           "    -f                         foreground operation\n"
> +           "    -o max_idle_threads        the maximum number of idle wo=
rker "
> +           "threads\n"
> +           "                               allowed (default: 10)\n");
>  }
>
>  static int fuse_helper_opt_proc(void *data, const char *arg, int key,


--
Cheers,
Christophe de Dinechin (IRC c3d)


