Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC304ABEC3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 14:03:08 +0100 (CET)
Received: from localhost ([::1]:47718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH3fe-0007LM-8a
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 08:03:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nH3L0-0003Kk-Uh
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 07:41:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nH3Kl-0004E1-Ig
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 07:41:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644237626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KwgrAQ5FpGuSjeXA/lEtMv/kO0XyR6/mmzqAEZE/Qks=;
 b=c+uR5lRxaloYPSttMPNCI5wPpLGwahUDxhXhhl3tIPVmJb5reqvHxDs6wrxVl+h0OykcR/
 E+f2qq5OOG6ojqy2tH3z492cLufn4aKK52uVhTPOxObDSXCy9pn1qSQpVnMtofOVV8JWk2
 nlonSM+aJLcKQmWG8KAKal6fLQsVAdU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-9asA23IkPmu1ROsg57H4QQ-1; Mon, 07 Feb 2022 07:40:25 -0500
X-MC-Unique: 9asA23IkPmu1ROsg57H4QQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 h82-20020a1c2155000000b003552c13626cso7808991wmh.3
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 04:40:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KwgrAQ5FpGuSjeXA/lEtMv/kO0XyR6/mmzqAEZE/Qks=;
 b=JhtTUbgEk06A7hWoDFPJFb96735QDEaMbmdqKULSu/3XcinzQ7+NN3+etzewG3vRPW
 GcLDh29JO8eCzw7Bq0uOtZBTinDzq4QdKIM2VQ5M2pkL6ikX4QUqrfQ/hwxDqkS2MuO7
 j+GHAJSZATKngUZCMU+fhthjdspGz5p2kY9sw9o3X5ERUkZ1z+1ol2YnCtW7xY5kgPh5
 MhbuJxIwuhDUvAIZtZcBt/47AvIpOKS95p1+bAYa1A89I/+PV0sysRx/WB6gNnOebmME
 vuQGNxib0bi9fZm94jmTrO8DvaZiCWLhxndHl0V2ikMt05kMX8fYSpZ+a1chqGBesM8J
 vL3A==
X-Gm-Message-State: AOAM532X6uPxGlVCp8zGl48fgx74kfgi62SXXP8Ne4QIpcBzGm5mrhgD
 JFdzxeLe4UkF1/mxET7eVSKBLfVEMqs6hyaD/E3SYrsrxJQnSm8wH7ZjFDWGudNKiAUXUx55Tx7
 NfOdcQRjm/hDrFgA=
X-Received: by 2002:a5d:6c61:: with SMTP id r1mr10223573wrz.414.1644237624157; 
 Mon, 07 Feb 2022 04:40:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+wFG8K8+5Cs7kmNSyybWdDBEEEX3Gl8Vc7J4S2+iIzzaU4YmhRmT5EPVPqVbbJQ2F5FvgUQ==
X-Received: by 2002:a5d:6c61:: with SMTP id r1mr10223558wrz.414.1644237623935; 
 Mon, 07 Feb 2022 04:40:23 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id e10sm10998367wrq.53.2022.02.07.04.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 04:40:23 -0800 (PST)
Date: Mon, 7 Feb 2022 12:40:21 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v5 9/9] virtiofsd: Add an option to enable/disable
 security label
Message-ID: <YgETNXv8AnnuLQR/@work-vm>
References: <20220202193935.268777-1-vgoyal@redhat.com>
 <20220202193935.268777-10-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220202193935.268777-10-vgoyal@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, mszeredi@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> Provide an option "-o security_label/no_security_label" to enable/disable
> security label functionality. By default these are turned off.
> 
> If enabled, server will indicate to client that it is capable of handling
> one security label during file creation. Typically this is expected to
> be a SELinux label. File server will set this label on the file. It will
> try to set it atomically wherever possible. But its not possible in
> all the cases.
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  docs/tools/virtiofsd.rst         |  7 +++++++
>  tools/virtiofsd/helper.c         |  1 +
>  tools/virtiofsd/passthrough_ll.c | 15 +++++++++++++++
>  3 files changed, 23 insertions(+)
> 
> diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
> index 07ac0be551..a2c005f4a0 100644
> --- a/docs/tools/virtiofsd.rst
> +++ b/docs/tools/virtiofsd.rst
> @@ -104,6 +104,13 @@ Options
>    * posix_acl|no_posix_acl -
>      Enable/disable posix acl support.  Posix ACLs are disabled by default.
>  
> +  * security_label|no_security_label -
> +    Enable/disable security label support. Security labels are disabled by
> +    default. This will allow client to send a MAC label of file during
                                ^ the                        ^ a
> +    file creation. Typically this is expected to be SELinux security
                                                      ^ an

> +    label. Server will try to set that label on newly created file
              ^The server
> +    atomically wherever possible.
> +
>  .. option:: --socket-path=PATH
>  
>    Listen on vhost-user UNIX domain socket at PATH.
> diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
> index a8295d975a..e226fc590f 100644
> --- a/tools/virtiofsd/helper.c
> +++ b/tools/virtiofsd/helper.c
> @@ -187,6 +187,7 @@ void fuse_cmdline_help(void)
>             "                               default: no_allow_direct_io\n"
>             "    -o announce_submounts      Announce sub-mount points to the guest\n"
>             "    -o posix_acl/no_posix_acl  Enable/Disable posix_acl. (default: disabled)\n"
> +           "    -o security_label/no_security_label  Enable/Disable security label. (default: disabled)\n"
>             );
>  }
>  
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 43c9b6dbe5..fe8f3ccbb6 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -181,6 +181,7 @@ struct lo_data {
>      int user_posix_acl, posix_acl;
>      /* Keeps track if /proc/<pid>/attr/fscreate should be used or not */
>      bool use_fscreate;
> +    int user_security_label;
>  };
>  
>  static const struct fuse_opt lo_opts[] = {
> @@ -215,6 +216,8 @@ static const struct fuse_opt lo_opts[] = {
>      { "no_killpriv_v2", offsetof(struct lo_data, user_killpriv_v2), 0 },
>      { "posix_acl", offsetof(struct lo_data, user_posix_acl), 1 },
>      { "no_posix_acl", offsetof(struct lo_data, user_posix_acl), 0 },
> +    { "security_label", offsetof(struct lo_data, user_security_label), 1 },
> +    { "no_security_label", offsetof(struct lo_data, user_security_label), 0 },
>      FUSE_OPT_END
>  };
>  static bool use_syslog = false;
> @@ -771,6 +774,17 @@ static void lo_init(void *userdata, struct fuse_conn_info *conn)
>          fuse_log(FUSE_LOG_DEBUG, "lo_init: disabling posix_acl\n");
>          conn->want &= ~FUSE_CAP_POSIX_ACL;
>      }
> +
> +    if (lo->user_security_label == 1) {
> +        if (!(conn->capable & FUSE_CAP_SECURITY_CTX)) {
> +            fuse_log(FUSE_LOG_ERR, "lo_init: Can not enable security label."
> +                     " kernel does not support FUSE_SECURITY_CTX capability.\n");
> +        }

Do you need to exit in this case - or at least clear the flag?

Dave

> +        conn->want |= FUSE_CAP_SECURITY_CTX;
> +    } else {
> +        fuse_log(FUSE_LOG_DEBUG, "lo_init: disabling security label\n");
> +        conn->want &= ~FUSE_CAP_SECURITY_CTX;
> +    }
>  }
>  
>  static void lo_getattr(fuse_req_t req, fuse_ino_t ino,
> @@ -4279,6 +4293,7 @@ int main(int argc, char *argv[])
>          .proc_self_task = -1,
>          .user_killpriv_v2 = -1,
>          .user_posix_acl = -1,
> +        .user_security_label = -1,
>      };
>      struct lo_map_elem *root_elem;
>      struct lo_map_elem *reserve_elem;
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


