Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDAD40AE4B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:54:55 +0200 (CEST)
Received: from localhost ([::1]:38914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7xe-0007Fx-HH
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mQ7wM-0006UJ-Jk
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:53:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mQ7wJ-0003zM-Mk
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:53:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631624009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z+uvkbrYUwgDKWFKoz/gywtLnkeJVL0PnKEUuaY1B60=;
 b=gyWKEqTXE/kTn2XcGd4rU8OVzX8zz1+SJSxAXx99Q2Ef5VPHAS0OCMqN2tBEZyntyDNgLt
 EAM+aLYQ+1EhMpAMOTPcpqthyWIL+zCccyisetMVkq4Bgkzvc5JZ5NP1joFtewq3V4x7qv
 es3HrgfMzK4PALnXx60e5ExxJSd+kNY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-PsxrgMJ-O6m8GRVDfpWHpw-1; Tue, 14 Sep 2021 08:53:28 -0400
X-MC-Unique: PsxrgMJ-O6m8GRVDfpWHpw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3FA050752;
 Tue, 14 Sep 2021 12:53:27 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.9.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2493E1001281;
 Tue, 14 Sep 2021 12:53:20 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id BDBBA220779; Tue, 14 Sep 2021 08:53:19 -0400 (EDT)
Date: Tue, 14 Sep 2021 08:53:19 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tools/virtiofsd: Add fstatfs64 syscall to the seccomp
 allowlist
Message-ID: <YUCbP3lF4cgPkadR@redhat.com>
References: <20210914123214.181885-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210914123214.181885-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: virtio-fs@redhat.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 14, 2021 at 02:32:14PM +0200, Thomas Huth wrote:
> The virtiofsd currently crashes on s390x when doing something like
> this in the guest:
> 
>  mkdir -p /mnt/myfs
>  mount -t virtiofs myfs /mnt/myfs
>  touch /mnt/myfs/foo.txt
>  stat -f /mnt/myfs/foo.txt
> 
> The problem is that the fstatfs64 syscall is called in this case
> from the virtiofsd. We have to put it on the seccomp allowlist to
> avoid that the daemon gets killed in this case.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2001728
> Suggested-by: Vivek Goyal <vgoyal@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Vivek Goyal <vgoyal@redhat.com>

Thanks Thomas for the patch.

Vivek
> ---
>  tools/virtiofsd/passthrough_seccomp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
> index f49ed94b5e..a3ce9f898d 100644
> --- a/tools/virtiofsd/passthrough_seccomp.c
> +++ b/tools/virtiofsd/passthrough_seccomp.c
> @@ -51,6 +51,7 @@ static const int syscall_allowlist[] = {
>      SCMP_SYS(fsetxattr),
>      SCMP_SYS(fstat),
>      SCMP_SYS(fstatfs),
> +    SCMP_SYS(fstatfs64),
>      SCMP_SYS(fsync),
>      SCMP_SYS(ftruncate),
>      SCMP_SYS(futex),
> -- 
> 2.27.0
> 


