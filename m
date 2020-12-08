Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DDF2D30B5
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 18:13:36 +0100 (CET)
Received: from localhost ([::1]:49916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmgYR-0003q3-2Y
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 12:13:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kmgI6-000648-Ar
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 11:56:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kmgI3-0002BC-Vn
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 11:56:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607446598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gCIkrUks90VDpUvLecRVukrKiaxVUxY/GxI2sp+JV4c=;
 b=S5JldStAA9EpSFiJDNA7OIcfXHEUyahtREQQw/zCvLmxxCiSXlf37sUC0eWl+2RH7FVaiR
 RBQyvrkrk2UcbQVkidfeJxycm2nScGD2IJX3/7bGWkwzsMHua3yUECpo8oYZFcmPU+x68q
 w4dwQrbs11KM5+gwOKiC/uWi/GPrXlI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-olWQ9fstOBaxXvsZQZ7FhA-1; Tue, 08 Dec 2020 11:56:35 -0500
X-MC-Unique: olWQ9fstOBaxXvsZQZ7FhA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACA808049F4
 for <qemu-devel@nongnu.org>; Tue,  8 Dec 2020 16:56:34 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-241.rdu2.redhat.com [10.10.116.241])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B2A510074E0;
 Tue,  8 Dec 2020 16:56:11 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 885FD220BCF; Tue,  8 Dec 2020 11:56:10 -0500 (EST)
Date: Tue, 8 Dec 2020 11:56:10 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: update FUSE_FORGET comment on
 "lo_inode.nlookup"
Message-ID: <20201208165610.GA20722@redhat.com>
References: <20201208073936.8629-1-lersek@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208073936.8629-1-lersek@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 08, 2020 at 08:39:36AM +0100, Laszlo Ersek wrote:
> Miklos confirms it's *only* the FUSE_FORGET request that the client can
> use for decrementing "lo_inode.nlookup".
> 
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: Miklos Szeredi <mszeredi@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Fixes: 1222f015558fc34cea02aa3a5a92de608c82cec8
> Signed-off-by: Laszlo Ersek <lersek@redhat.com>

Looks correct. unref_inode() calls in lo_rmdir() lo_rename() are dropping
->nlookup they have taken internally during the function execution.

Reviewed-by: Vivek Goyal <vgoyal@redhat.com>

Thanks
Vivek

> ---
>  tools/virtiofsd/passthrough_ll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 06543b20dcbb..d3be680e92c3 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -113,7 +113,7 @@ struct lo_inode {
>       * This counter keeps the inode alive during the FUSE session.
>       * Incremented when the FUSE inode number is sent in a reply
>       * (FUSE_LOOKUP, FUSE_READDIRPLUS, etc).  Decremented when an inode is
> -     * released by requests like FUSE_FORGET, FUSE_RMDIR, FUSE_RENAME, etc.
> +     * released by a FUSE_FORGET request.
>       *
>       * Note that this value is untrusted because the client can manipulate
>       * it arbitrarily using FUSE_FORGET requests.
> -- 
> 2.19.1.3.g30247aa5d201
> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://www.redhat.com/mailman/listinfo/virtio-fs


