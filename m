Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F3233BF69
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 16:06:53 +0100 (CET)
Received: from localhost ([::1]:59788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLonz-0005CR-Mt
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 11:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lLolp-0004Uz-8G
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:04:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lLolj-0002xB-ND
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:04:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615820670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gsTnIyjD60Opkm7g69ufbCJgnzrVmakg7+yInPwceKY=;
 b=EoUiq3sgKQj5GiiJpf9s2wXYQ1As1NQi7B2DFDUrLBpS3XaOQ2PcR5bpD6V/Dns4ljCJLE
 Tr+hWR+Vra5i9EM7DUS8RyOWyrYG2O9Wt1u68X8ff3vg19YF4mKN7UTHQPTk1FQsW64QOT
 2HnTTGUVpd7unEhRyNv6lTpC/KcPHBQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-zxqvNDcFPeSkrUvVAFjTjg-1; Mon, 15 Mar 2021 11:04:28 -0400
X-MC-Unique: zxqvNDcFPeSkrUvVAFjTjg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4994480006E;
 Mon, 15 Mar 2021 15:04:27 +0000 (UTC)
Received: from work-vm (ovpn-114-235.ams2.redhat.com [10.36.114.235])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F404D510ED;
 Mon, 15 Mar 2021 15:04:21 +0000 (UTC)
Date: Mon, 15 Mar 2021 15:04:19 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH] virtiofsd: Add qemu version and copyright info
Message-ID: <YE93cwGU75LPUx2N@work-vm>
References: <20210303195339.GB3793@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210303195339.GB3793@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs-list <virtio-fs@redhat.com>, qemu-devel@nongnu.org,
 eric.g.ernst@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> Option "-V" currently displays the fuse protocol version virtiofsd is
> using. For example, I see this.
> 
> $ ./virtiofsd -V
> "using FUSE kernel interface version 7.33"
> 
> People also want to know software version of virtiofsd so that they can
> figure out if a certain fix is part of currently running virtiofsd or
> not. Eric Ernst ran into this issue.
> 
> David Gilbert thinks that it probably is best that we simply carry the
> qemu version and display that information given we are part of qemu
> tree. 
> 
> So this patch enhances version information and also adds qemu version
> and copyright info. Not sure if copyright information is supposed
> to be displayed along with version info. Given qemu-storage-daemon
> and other utilities are doing it, so I continued with same pattern.
> This is how now output looks like.
> 
> $ ./virtiofsd -V
> virtiofsd version 5.2.50 (v5.2.0-2357-gcbcf09872a-dirty)
> Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers
> using FUSE kernel interface version 7.33
> 
> Reported-by: Eric Ernst <eric.g.ernst@gmail.com>
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>

Queued

> ---
>  tools/virtiofsd/passthrough_ll.c |    8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> Index: rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c
> ===================================================================
> --- rhvgoyal-qemu.orig/tools/virtiofsd/passthrough_ll.c	2021-03-03 14:28:04.893672524 -0500
> +++ rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c	2021-03-03 14:37:29.381712706 -0500
> @@ -37,6 +37,8 @@
>  
>  #include "qemu/osdep.h"
>  #include "qemu/timer.h"
> +#include "qemu-version.h"
> +#include "qemu-common.h"
>  #include "fuse_virtio.h"
>  #include "fuse_log.h"
>  #include "fuse_lowlevel.h"
> @@ -3591,6 +3593,11 @@ static void fuse_lo_data_cleanup(struct
>      free(lo->source);
>  }
>  
> +static void qemu_version(void)
> +{
> +    printf("virtiofsd version " QEMU_FULL_VERSION "\n" QEMU_COPYRIGHT "\n");
> +}
> +
>  int main(int argc, char *argv[])
>  {
>      struct fuse_args args = FUSE_ARGS_INIT(argc, argv);
> @@ -3662,6 +3669,7 @@ int main(int argc, char *argv[])
>          ret = 0;
>          goto err_out1;
>      } else if (opts.show_version) {
> +        qemu_version();
>          fuse_lowlevel_version();
>          ret = 0;
>          goto err_out1;
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


