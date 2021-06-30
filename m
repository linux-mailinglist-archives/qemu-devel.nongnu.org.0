Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C913B8037
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 11:42:43 +0200 (CEST)
Received: from localhost ([::1]:45862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyWjy-0001rJ-Cd
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 05:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyWiH-0000B7-8x
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 05:41:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyWiD-00010y-Nj
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 05:40:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625046052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MN2Z2wEaZkO83mHZ6q3FL5hWcYdeotNl+BrOirI1ijI=;
 b=dHsG/TVViYhoWt0hKnqZRm2YXLqDCDGpgIbXHRhuhAPh1YP7S8/r2ds8FHMB2bOa52vpTX
 ogXcRL3tfPH/qirOk80PyTVTL8VpVYyp/mB+RMckL+AFqo1iOHKjS8WdIvIOAYeMjpDws/
 pixReCrENT+H/yw70XxdgCU2ZK3Zqdg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-rCFcZi5NNSynza6CuNAb6w-1; Wed, 30 Jun 2021 05:40:50 -0400
X-MC-Unique: rCFcZi5NNSynza6CuNAb6w-1
Received: by mail-wr1-f71.google.com with SMTP id
 l6-20020a0560000226b029011a80413b4fso633530wrz.23
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 02:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MN2Z2wEaZkO83mHZ6q3FL5hWcYdeotNl+BrOirI1ijI=;
 b=KSjpBJssLzjvbi648ZPPM1Y82+iOBaEXpdgpDDqHwEAhZK9eikcJwA4yLS97LkvwPn
 JzXqCIeO+KejrHUekO4SoJ5wKNXqjA06TuJqoNmwpT2v+UVAaFyYvoO0kxxdvMRtccFx
 5zn1NW0PMbr5VRoMMYDkr8BAOjdlCMj5Oy2A6a5ZF97Ziq8XNk5Gg8Wx0gm7dLcg+q0Y
 Ifz9tqAmChy/pLtF2JxGKnISdV6y2uMeIZpD+aZ5fLFJizlaK3HQRkoMwT6T7WviyE1/
 omS8ln7h7ETPRe5rBgnauc71G1UJECeFhHd2nYj1emMAUoMf0nKfEStbr6FjV/j0OZip
 G5sA==
X-Gm-Message-State: AOAM531klC8aaY7P+/ZiasNa3MjqI8SwCj6faz/1GI5IMfx/wAbtuEkD
 KXaHztzbN3OFWYQSAA8sYj7QnwE6HsJ9iE7PZE4Cj0rc58zxRz3QV0So3uOT8gOOjDlWsbflq7w
 X6Ipa9nxEDQT4gFw=
X-Received: by 2002:a5d:6511:: with SMTP id x17mr44642wru.212.1625046049577;
 Wed, 30 Jun 2021 02:40:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWhm3U4mChfFCm2xhqzficYbm2Y+bM3mZQRTsXsVhIIGAWsEXUEU6p8FAvCnS3Ev266SwYQw==
X-Received: by 2002:a5d:6511:: with SMTP id x17mr44630wru.212.1625046049440;
 Wed, 30 Jun 2021 02:40:49 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id b187sm6491697wmh.32.2021.06.30.02.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 02:40:48 -0700 (PDT)
Date: Wed, 30 Jun 2021 10:40:46 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2] virtiofsd: Don't allow file creation with FUSE_OPEN
Message-ID: <YNw8HnJbDii9YuVJ@work-vm>
References: <20210624101809.48032-1-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210624101809.48032-1-groug@kaod.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, Miklos Szeredi <miklos@szeredi.hu>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Greg Kurz (groug@kaod.org) wrote:
> A well behaved FUSE client uses FUSE_CREATE to create files. It isn't
> supposed to pass O_CREAT along a FUSE_OPEN request, as documented in
> the "fuse_lowlevel.h" header :
> 
>     /**
>      * Open a file
>      *
>      * Open flags are available in fi->flags. The following rules
>      * apply.
>      *
>      *  - Creation (O_CREAT, O_EXCL, O_NOCTTY) flags will be
>      *    filtered out / handled by the kernel.
> 
> But if the client happens to do it anyway, the server ends up passing
> this flag to open() without the mandatory mode_t 4th argument. Since
> open() is a variadic function, glibc will happily pass whatever it
> finds on the stack to the syscall. If this file is compiled with
> -D_FORTIFY_SOURCE=2, glibc will even detect that and abort:
> 
> *** invalid openat64 call: O_CREAT or O_TMPFILE without mode ***: terminated
> 
> Specifying O_CREAT with FUSE_OPEN is a protocol violation. Check this
> in do_open(), print out a message and return an error to the client,
> EINVAL like we already do when fuse_mbuf_iter_advance() fails.
> 
> The FUSE filesystem doesn't currently support O_TMPFILE, but the very
> same would happen if O_TMPFILE was passed in a FUSE_OPEN request. Check
> that as well.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
> 
> v2:
>  - do the check in core FUSE code instead of passthrough_ll (libfuse folks)
> 
> 
>  tools/virtiofsd/fuse_lowlevel.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
> index 7fe2cef1eb3b..3d725bcba2ca 100644
> --- a/tools/virtiofsd/fuse_lowlevel.c
> +++ b/tools/virtiofsd/fuse_lowlevel.c
> @@ -1084,6 +1084,12 @@ static void do_open(fuse_req_t req, fuse_ino_t nodeid,
>          return;
>      }
>  
> +    /* File creation is handled by do_create() or do_mknod() */
> +    if (arg->flags & (O_CREAT | O_TMPFILE)) {
> +        fuse_reply_err(req, EINVAL);
> +        return;
> +    }
> +
>      memset(&fi, 0, sizeof(fi));
>      fi.flags = arg->flags;
>      fi.kill_priv = arg->open_flags & FUSE_OPEN_KILL_SUIDGID;
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


