Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0207431BA2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 15:31:59 +0200 (CEST)
Received: from localhost ([::1]:44410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcSkA-0001TD-M5
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 09:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mcS8c-0004UP-4D
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 08:53:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mcS8Y-0006Xa-IX
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 08:53:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634561584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RY+dC4ufpB4hYpwD7IxdVau4POZ/Mm3gsuIggQmM+ns=;
 b=aW1uixqgx68boRM7MsJOIv0hzCK1JxXVn9l2toVXnIZ/mTGLfnfcMTLPdoi2QVR5lvo3xN
 Q1x6eqesgzk7lnGz1zjqBRYfd31Oza8M77OqET7AMlKkmzJ2FGgBkARKImjs/AkzLpxDvo
 hmIvkuQb0ywGQieFhS2gSSqFU82C8T4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-U6kIpH2hPWev3MCvGus4hg-1; Mon, 18 Oct 2021 08:53:03 -0400
X-MC-Unique: U6kIpH2hPWev3MCvGus4hg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3F8110144E0
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 12:53:02 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.33.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9DA71A26A;
 Mon, 18 Oct 2021 12:52:59 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 759D122045E; Mon, 18 Oct 2021 08:52:59 -0400 (EDT)
Date: Mon, 18 Oct 2021 08:52:59 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: Error on bad socket group name
Message-ID: <YW1uK9J9GzNUbC6S@redhat.com>
References: <20211014122554.34599-1-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211014122554.34599-1-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, xiagao@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 14, 2021 at 01:25:54PM +0100, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Make the '--socket-group=' option fail if the group name is unknown:
> 
> ./tools/virtiofsd/virtiofsd .... --socket-group=zaphod
> vhost socket: unable to find group 'zaphod'
> 
> Reported-by: Xiaoling Gao <xiagao@redhat.com>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Hi Dave,

This looks good to me. Just a minor nit for code cleanup. It could
be done in a separate patch or sometime later as well.

Reviewed-by: Vivek Goyal <vgoyal@redhat.com>

> ---
>  tools/virtiofsd/fuse_virtio.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> index 8f4fd165b9..39eebffb62 100644
> --- a/tools/virtiofsd/fuse_virtio.c
> +++ b/tools/virtiofsd/fuse_virtio.c
> @@ -999,6 +999,13 @@ static int fv_create_listen_socket(struct fuse_session *se)
>                           "vhost socket failed to set group to %s (%d): %m\n",
>                           se->vu_socket_group, g->gr_gid);
>              }
> +        } else {
> +            fuse_log(FUSE_LOG_ERR,
> +                     "vhost socket: unable to find group '%s'\n",
> +                     se->vu_socket_group);
> +            close(listen_sock);
> +            umask(old_umask);
		^^^
> +            return -1;
>          }
>      }
>      umask(old_umask);

This umask() call could be moved little early right after bind() call and
that way we don't have to take care of calling umask(old_umask) in error
path if group name could not be found.

Vivek
> -- 
> 2.31.1
> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://listman.redhat.com/mailman/listinfo/virtio-fs
> 


