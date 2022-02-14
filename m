Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD7C4B5027
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 13:32:05 +0100 (CET)
Received: from localhost ([::1]:38282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJaWQ-0004UV-Ad
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 07:32:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nJaNS-0005EL-8D
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:22:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nJaNO-00027k-6R
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:22:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644841360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OoMRPdzwKIEgk2EPVwJ/GpUdzq4YqXgb89N6HRpoI3M=;
 b=E1RTaiG1UD/++rVTniGycXC8nwwfMGeUbr2nzVpN5uyoczkbFdt7Lqoip1uC2Mb3Xz5BD1
 Hj/CSvkoBaUEGQu5a/GK43MWfY5OcecWBfT5wlEa1vpiXabppRe7I09Qg54CE7ekQo7n0Y
 M1hKNBOhvBFhJDy05VnGGwmle4X5kX8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-282-bf_MAQKlPJCzlnHb2tdN5g-1; Mon, 14 Feb 2022 07:22:34 -0500
X-MC-Unique: bf_MAQKlPJCzlnHb2tdN5g-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay41-20020a05600c1e2900b0037c5168b3c4so2916394wmb.7
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 04:22:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OoMRPdzwKIEgk2EPVwJ/GpUdzq4YqXgb89N6HRpoI3M=;
 b=ZXIwcL4XuSLzblJPl9z2vm9wlje4Gai/mBLcL1MHPxHMc+t3ifKwsoXjZb9tDMIERs
 I1+n8QgawchbcO1eOF2AqkZmkNBXvdhqfM3iVKTyUlgYYiFUBFGBD0CEEQd5Y1LfBefn
 W8p51sZQ4iaFubwJRidk6si1ZKyIp5/e3wusopjfZ4m+YD/sZcgdmmMEnrrFIIaVirxK
 xnjxM6romUmK8nMSM5PTIMI5jU8ikx0BPj6GGXjdKK2CDUUGAa+4A8ZNyRt3v1g60R84
 preW0GKF5FK4GmrB9ZrwmfZk208jkjUSrFFBELC8iFBOBOCNC3i499AYF5U0P1BQHtlL
 vCQA==
X-Gm-Message-State: AOAM533mI7KPHZ26raZR+CBFci46PX+hEHADc+fusgm9du2Gnie4Gxqm
 jTZ+AAG5rzYDGUfifuDcBJZWtadqo1F0QwF4MT+ZLKe93MPZqx3+Ba9Hf84kxa2ztLVoJEV8hT6
 d5JVqZBpt3xKAgsw=
X-Received: by 2002:a05:600c:414b:: with SMTP id
 h11mr10732922wmm.46.1644841353457; 
 Mon, 14 Feb 2022 04:22:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7ibSUcLgVjtE7fy8TyAg3NCMFQ87xGmjvBhTxRx3LadupVG1xZY2jN/c5klCetsYA5O0ezw==
X-Received: by 2002:a05:600c:414b:: with SMTP id
 h11mr10732895wmm.46.1644841353143; 
 Mon, 14 Feb 2022 04:22:33 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id z7sm8315990wml.40.2022.02.14.04.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 04:22:32 -0800 (PST)
Date: Mon, 14 Feb 2022 12:22:30 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v6 03/10] virtiofsd: Parse extended "struct fuse_init_in"
Message-ID: <YgpJho2KsssMkMK/@work-vm>
References: <20220208204813.682906-1-vgoyal@redhat.com>
 <20220208204813.682906-4-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220208204813.682906-4-vgoyal@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, mszeredi@redhat.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> Add some code to parse extended "struct fuse_init_in". And use a local
> variable "flag" to represent 64 bit flags. This will make it easier
> to add more features without having to worry about two 32bit flags (->flags
> and ->flags2) in "fuse_struct_in".
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tools/virtiofsd/fuse_lowlevel.c | 61 +++++++++++++++++++++------------
>  1 file changed, 39 insertions(+), 22 deletions(-)
> 
> diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
> index ce29a70253..b6712b763a 100644
> --- a/tools/virtiofsd/fuse_lowlevel.c
> +++ b/tools/virtiofsd/fuse_lowlevel.c
> @@ -1881,11 +1881,14 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
>  {
>      size_t compat_size = offsetof(struct fuse_init_in, max_readahead);
>      size_t compat2_size = offsetof(struct fuse_init_in, flags) + sizeof(uint32_t);
> +    /* Fuse structure extended with minor version 36 */
> +    size_t compat3_size = endof(struct fuse_init_in, unused);
>      struct fuse_init_in *arg;
>      struct fuse_init_out outarg;
>      struct fuse_session *se = req->se;
>      size_t bufsize = se->bufsize;
>      size_t outargsize = sizeof(outarg);
> +    uint64_t flags = 0;
>  
>      (void)nodeid;
>  
> @@ -1902,11 +1905,25 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
>              fuse_reply_err(req, EINVAL);
>              return;
>          }
> +        flags |= arg->flags;
> +    }
> +
> +    /*
> +     * fuse_init_in was extended again with minor version 36. Just read
> +     * current known size of fuse_init so that future extension and
> +     * header rebase does not cause breakage.
> +     */
> +    if (sizeof(*arg) > compat2_size && (arg->flags & FUSE_INIT_EXT)) {
> +        if (!fuse_mbuf_iter_advance(iter, compat3_size - compat2_size)) {
> +            fuse_reply_err(req, EINVAL);
> +            return;
> +        }
> +        flags |= (uint64_t) arg->flags2 << 32;
>      }
>  
>      fuse_log(FUSE_LOG_DEBUG, "INIT: %u.%u\n", arg->major, arg->minor);
>      if (arg->major == 7 && arg->minor >= 6) {
> -        fuse_log(FUSE_LOG_DEBUG, "flags=0x%08x\n", arg->flags);
> +        fuse_log(FUSE_LOG_DEBUG, "flags=0x%016llx\n", flags);
>          fuse_log(FUSE_LOG_DEBUG, "max_readahead=0x%08x\n", arg->max_readahead);
>      }
>      se->conn.proto_major = arg->major;
> @@ -1934,68 +1951,68 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
>      if (arg->max_readahead < se->conn.max_readahead) {
>          se->conn.max_readahead = arg->max_readahead;
>      }
> -    if (arg->flags & FUSE_ASYNC_READ) {
> +    if (flags & FUSE_ASYNC_READ) {
>          se->conn.capable |= FUSE_CAP_ASYNC_READ;
>      }
> -    if (arg->flags & FUSE_POSIX_LOCKS) {
> +    if (flags & FUSE_POSIX_LOCKS) {
>          se->conn.capable |= FUSE_CAP_POSIX_LOCKS;
>      }
> -    if (arg->flags & FUSE_ATOMIC_O_TRUNC) {
> +    if (flags & FUSE_ATOMIC_O_TRUNC) {
>          se->conn.capable |= FUSE_CAP_ATOMIC_O_TRUNC;
>      }
> -    if (arg->flags & FUSE_EXPORT_SUPPORT) {
> +    if (flags & FUSE_EXPORT_SUPPORT) {
>          se->conn.capable |= FUSE_CAP_EXPORT_SUPPORT;
>      }
> -    if (arg->flags & FUSE_DONT_MASK) {
> +    if (flags & FUSE_DONT_MASK) {
>          se->conn.capable |= FUSE_CAP_DONT_MASK;
>      }
> -    if (arg->flags & FUSE_FLOCK_LOCKS) {
> +    if (flags & FUSE_FLOCK_LOCKS) {
>          se->conn.capable |= FUSE_CAP_FLOCK_LOCKS;
>      }
> -    if (arg->flags & FUSE_AUTO_INVAL_DATA) {
> +    if (flags & FUSE_AUTO_INVAL_DATA) {
>          se->conn.capable |= FUSE_CAP_AUTO_INVAL_DATA;
>      }
> -    if (arg->flags & FUSE_DO_READDIRPLUS) {
> +    if (flags & FUSE_DO_READDIRPLUS) {
>          se->conn.capable |= FUSE_CAP_READDIRPLUS;
>      }
> -    if (arg->flags & FUSE_READDIRPLUS_AUTO) {
> +    if (flags & FUSE_READDIRPLUS_AUTO) {
>          se->conn.capable |= FUSE_CAP_READDIRPLUS_AUTO;
>      }
> -    if (arg->flags & FUSE_ASYNC_DIO) {
> +    if (flags & FUSE_ASYNC_DIO) {
>          se->conn.capable |= FUSE_CAP_ASYNC_DIO;
>      }
> -    if (arg->flags & FUSE_WRITEBACK_CACHE) {
> +    if (flags & FUSE_WRITEBACK_CACHE) {
>          se->conn.capable |= FUSE_CAP_WRITEBACK_CACHE;
>      }
> -    if (arg->flags & FUSE_NO_OPEN_SUPPORT) {
> +    if (flags & FUSE_NO_OPEN_SUPPORT) {
>          se->conn.capable |= FUSE_CAP_NO_OPEN_SUPPORT;
>      }
> -    if (arg->flags & FUSE_PARALLEL_DIROPS) {
> +    if (flags & FUSE_PARALLEL_DIROPS) {
>          se->conn.capable |= FUSE_CAP_PARALLEL_DIROPS;
>      }
> -    if (arg->flags & FUSE_POSIX_ACL) {
> +    if (flags & FUSE_POSIX_ACL) {
>          se->conn.capable |= FUSE_CAP_POSIX_ACL;
>      }
> -    if (arg->flags & FUSE_HANDLE_KILLPRIV) {
> +    if (flags & FUSE_HANDLE_KILLPRIV) {
>          se->conn.capable |= FUSE_CAP_HANDLE_KILLPRIV;
>      }
> -    if (arg->flags & FUSE_NO_OPENDIR_SUPPORT) {
> +    if (flags & FUSE_NO_OPENDIR_SUPPORT) {
>          se->conn.capable |= FUSE_CAP_NO_OPENDIR_SUPPORT;
>      }
> -    if (!(arg->flags & FUSE_MAX_PAGES)) {
> +    if (!(flags & FUSE_MAX_PAGES)) {
>          size_t max_bufsize = FUSE_DEFAULT_MAX_PAGES_PER_REQ * getpagesize() +
>                               FUSE_BUFFER_HEADER_SIZE;
>          if (bufsize > max_bufsize) {
>              bufsize = max_bufsize;
>          }
>      }
> -    if (arg->flags & FUSE_SUBMOUNTS) {
> +    if (flags & FUSE_SUBMOUNTS) {
>          se->conn.capable |= FUSE_CAP_SUBMOUNTS;
>      }
> -    if (arg->flags & FUSE_HANDLE_KILLPRIV_V2) {
> +    if (flags & FUSE_HANDLE_KILLPRIV_V2) {
>          se->conn.capable |= FUSE_CAP_HANDLE_KILLPRIV_V2;
>      }
> -    if (arg->flags & FUSE_SETXATTR_EXT) {
> +    if (flags & FUSE_SETXATTR_EXT) {
>          se->conn.capable |= FUSE_CAP_SETXATTR_EXT;
>      }
>  #ifdef HAVE_SPLICE
> @@ -2063,7 +2080,7 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
>      if (se->conn.max_write < bufsize - FUSE_BUFFER_HEADER_SIZE) {
>          se->bufsize = se->conn.max_write + FUSE_BUFFER_HEADER_SIZE;
>      }
> -    if (arg->flags & FUSE_MAX_PAGES) {
> +    if (flags & FUSE_MAX_PAGES) {
>          outarg.flags |= FUSE_MAX_PAGES;
>          outarg.max_pages = (se->conn.max_write - 1) / getpagesize() + 1;
>      }
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


