Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 506E63B6874
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 20:27:42 +0200 (CEST)
Received: from localhost ([::1]:56622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxvyu-0003Kv-Pu
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 14:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lxvxp-0002bI-3r
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 14:26:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lxvxi-00080c-NF
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 14:26:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624904786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VFp+lxXbL0ACuAKsuo7b0AQGpy4MwzLyzQWn9pOdSe8=;
 b=d7/V6J7XJNf3ATra29jP2pASKEn4lskVT1bE2NDyHaITpU2QgbZiKoRrL6w439pL8ND6Si
 DAQFWxtdMzanUXBf80sJlf5NxQWB+VZ+aR4sOcC6owweg2ZFbJVoquKeovCgeuab+Aq22q
 Ij5gxCFJe9Odg2fu/F1suNgnSZNXkSk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-U7vOwHe7PGiO89mIutL7jQ-1; Mon, 28 Jun 2021 14:26:24 -0400
X-MC-Unique: U7vOwHe7PGiO89mIutL7jQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 g8-20020a5d54080000b0290124a2d22ff8so4338184wrv.4
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 11:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VFp+lxXbL0ACuAKsuo7b0AQGpy4MwzLyzQWn9pOdSe8=;
 b=fLuVv4w70fu3mtZ9VQVGGGW7b2iLzgNLZCPRLkBpOMUV5/5lbHKo6oyFv+qRyjg+07
 ou18H+QaVq42QqrdvedgB9ou+7UKBp+ky4xp1ivd5w8sOahKzfGKnZ0AmMXVgGomZPRI
 rw//H/+8sPGWcY4204j0/oqjTho9P7rjpv/7e21nX6HLlud7yDkw6T53Lz+vxuuX+A2l
 nHqqMukHTiiiCgzVIwIFM+nENqxG9Z1hOYW8r1O0T5J2REWEclhUjIf4cY4EGFHGbcNH
 iAox/N/bUcLslwFypG5Pm5/Z2mGJ+WpBzc8SVnbTs27ZSKam2kBXJw1J6JayHbjQOZc8
 B3Vg==
X-Gm-Message-State: AOAM530t3Z722lwdUBZ9iG8Bz5Gqkl0Ss8Hhs2TFByCssNuYGSahuT21
 L7zBAl0LIEBeuEGO87C83kgi+rTqqLDoSCwqp2ESbiYyl0YTTdeAoJjmMbJZs7DTxBo2NjWWHvQ
 tnYsbakOP1YkhJns=
X-Received: by 2002:a05:600c:4f44:: with SMTP id
 m4mr13737142wmq.49.1624904783720; 
 Mon, 28 Jun 2021 11:26:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjkHrdbAezDDuOpK+2OvE5qPeXJYAMLtqdhXo9A9mBSN5nQpPWUAsNQsrj9aiS5/K6byVcYw==
X-Received: by 2002:a05:600c:4f44:: with SMTP id
 m4mr13737126wmq.49.1624904783376; 
 Mon, 28 Jun 2021 11:26:23 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id t128sm267343wma.41.2021.06.28.11.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 11:26:22 -0700 (PDT)
Date: Mon, 28 Jun 2021 19:26:20 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v7 7/7] virtiofsd: Add an option to enable/disable posix
 acls
Message-ID: <YNoUTIANBvLVq9jk@work-vm>
References: <20210622150852.1507204-1-vgoyal@redhat.com>
 <20210622150852.1507204-8-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210622150852.1507204-8-vgoyal@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Cc: virtio-fs@redhat.com, miklos@szeredi.hu, qemu-devel@nongnu.org,
 lhenriques@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> fuse has an option FUSE_POSIX_ACL which needs to be opted in by fuse
> server to enable posix acls. As of now we are not opting in for this,
> so posix acls are disabled on virtiofs by default.
> 
> Add virtiofsd option "-o posix_acl/no_posix_acl" to let users enable/disable
> posix acl support. By default it is disabled as of now due to performance
> concerns with cache=none.
> 
> Currently even if file server has not opted in for FUSE_POSIX_ACL, user can
> still query acl and set acl, and system.posix_acl_access and
> system.posix_acl_default xattrs show up listxattr response.
> 
> Miklos said this is confusing. So he said lets block and filter
> system.posix_acl_access and system.posix_acl_default xattrs in
> getxattr/setxattr/listxattr if user has explicitly disabled
> posix acls using -o no_posix_acl.
> 
> As of now continuing to keeping the existing behavior if user did not
> specify any option to disable acl support due to concerns about backward
> compatibility.
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

(I'd have some sympathy to making get silently hide it)

> ---
>  docs/tools/virtiofsd.rst         |   3 +
>  tools/virtiofsd/helper.c         |   1 +
>  tools/virtiofsd/passthrough_ll.c | 115 ++++++++++++++++++++++++++++++-
>  3 files changed, 118 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
> index 00554c75bd..a41f934999 100644
> --- a/docs/tools/virtiofsd.rst
> +++ b/docs/tools/virtiofsd.rst
> @@ -101,6 +101,9 @@ Options
>      Enable/disable extended attributes (xattr) on files and directories.  The
>      default is ``no_xattr``.
>  
> +  * posix_acl|no_posix_acl -
> +    Enable/disable posix acl support.  Posix ACLs are disabled by default`.
> +
>  .. option:: --socket-path=PATH
>  
>    Listen on vhost-user UNIX domain socket at PATH.
> diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
> index 5e98ed702b..a8295d975a 100644
> --- a/tools/virtiofsd/helper.c
> +++ b/tools/virtiofsd/helper.c
> @@ -186,6 +186,7 @@ void fuse_cmdline_help(void)
>             "                               to virtiofsd from guest applications.\n"
>             "                               default: no_allow_direct_io\n"
>             "    -o announce_submounts      Announce sub-mount points to the guest\n"
> +           "    -o posix_acl/no_posix_acl  Enable/Disable posix_acl. (default: disabled)\n"
>             );
>  }
>  
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 113c725def..e80fd76d71 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -175,7 +175,7 @@ struct lo_data {
>      int user_killpriv_v2, killpriv_v2;
>      /* If set, virtiofsd is responsible for setting umask during creation */
>      bool change_umask;
> -    int posix_acl;
> +    int user_posix_acl, posix_acl;
>  };
>  
>  static const struct fuse_opt lo_opts[] = {
> @@ -208,6 +208,8 @@ static const struct fuse_opt lo_opts[] = {
>      { "announce_submounts", offsetof(struct lo_data, announce_submounts), 1 },
>      { "killpriv_v2", offsetof(struct lo_data, user_killpriv_v2), 1 },
>      { "no_killpriv_v2", offsetof(struct lo_data, user_killpriv_v2), 0 },
> +    { "posix_acl", offsetof(struct lo_data, user_posix_acl), 1 },
> +    { "no_posix_acl", offsetof(struct lo_data, user_posix_acl), 0 },
>      FUSE_OPT_END
>  };
>  static bool use_syslog = false;
> @@ -706,6 +708,32 @@ static void lo_init(void *userdata, struct fuse_conn_info *conn)
>          conn->want &= ~FUSE_CAP_HANDLE_KILLPRIV_V2;
>          lo->killpriv_v2 = 0;
>      }
> +
> +    if (lo->user_posix_acl == 1) {
> +        /*
> +         * User explicitly asked for this option. Enable it unconditionally.
> +         * If connection does not have this capability, print error message
> +         * now. It will fail later in fuse_lowlevel.c
> +         */
> +        if (!(conn->capable & FUSE_CAP_POSIX_ACL) ||
> +            !(conn->capable & FUSE_CAP_DONT_MASK) ||
> +            !(conn->capable & FUSE_CAP_SETXATTR_EXT)) {
> +            fuse_log(FUSE_LOG_ERR, "lo_init: Can not enable posix acl."
> +                     " kernel does not support FUSE_POSIX_ACL, FUSE_DONT_MASK"
> +                     " or FUSE_SETXATTR_EXT capability.\n");
> +        } else {
> +            fuse_log(FUSE_LOG_DEBUG, "lo_init: enabling posix acl\n");
> +        }
> +
> +        conn->want |= FUSE_CAP_POSIX_ACL | FUSE_CAP_DONT_MASK |
> +                      FUSE_CAP_SETXATTR_EXT;
> +        lo->change_umask = true;
> +        lo->posix_acl = true;
> +    } else {
> +        /* User either did not specify anything or wants it disabled */
> +        fuse_log(FUSE_LOG_DEBUG, "lo_init: disabling posix_acl\n");
> +        conn->want &= ~FUSE_CAP_POSIX_ACL;
> +    }
>  }
>  
>  static void lo_getattr(fuse_req_t req, fuse_ino_t ino,
> @@ -2783,6 +2811,63 @@ static int xattr_map_server(const struct lo_data *lo, const char *server_name,
>          assert(fchdir_res == 0);                       \
>      } while (0)
>  
> +static bool block_xattr(struct lo_data *lo, const char *name)
> +{
> +    /*
> +     * If user explicitly enabled posix_acl or did not provide any option,
> +     * do not block acl. Otherwise block system.posix_acl_access and
> +     * system.posix_acl_default xattrs.
> +     */
> +    if (lo->user_posix_acl) {
> +        return false;
> +    }
> +    if (!strcmp(name, "system.posix_acl_access") ||
> +        !strcmp(name, "system.posix_acl_default"))
> +            return true;
> +
> +    return false;
> +}
> +
> +/*
> + * Returns number of bytes in xattr_list after filtering on success. This
> + * could be zero as well if nothing is left after filtering.
> + *
> + * Returns negative error code on failure.
> + * xattr_list is modified in place.
> + */
> +static int remove_blocked_xattrs(struct lo_data *lo, char *xattr_list,
> +                                 unsigned in_size)
> +{
> +    size_t out_index, in_index;
> +
> +    /*
> +     * As of now we only filter out acl xattrs. If acls are enabled or
> +     * they have not been explicitly disabled, there is nothing to
> +     * filter.
> +     */
> +    if (lo->user_posix_acl) {
> +        return in_size;
> +    }
> +
> +    out_index = 0;
> +    in_index = 0;
> +    while (in_index < in_size) {
> +        char *in_ptr = xattr_list + in_index;
> +
> +        /* Length of current attribute name */
> +        size_t in_len = strlen(xattr_list + in_index) + 1;
> +
> +        if (!block_xattr(lo, in_ptr)) {
> +            if (in_index != out_index) {
> +                memmove(xattr_list + out_index, xattr_list + in_index, in_len);
> +            }
> +            out_index += in_len;
> +        }
> +        in_index += in_len;
> +     }
> +    return out_index;
> +}
> +
>  static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>                          size_t size)
>  {
> @@ -2796,6 +2881,11 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>      int saverr;
>      int fd = -1;
>  
> +    if (block_xattr(lo, in_name)) {
> +        fuse_reply_err(req, EOPNOTSUPP);
> +        return;
> +    }
> +
>      mapped_name = NULL;
>      name = in_name;
>      if (lo->xattrmap) {
> @@ -2986,6 +3076,12 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
>                  goto out;
>              }
>          }
> +
> +        ret = remove_blocked_xattrs(lo, value, ret);
> +        if (ret <= 0) {
> +            saverr = -ret;
> +            goto out;
> +        }
>          fuse_reply_buf(req, value, ret);
>      } else {
>          /*
> @@ -3026,6 +3122,11 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>      bool cap_fsetid_dropped = false;
>      struct lo_cred old = {};
>  
> +    if (block_xattr(lo, in_name)) {
> +        fuse_reply_err(req, EOPNOTSUPP);
> +        return;
> +    }
> +
>      mapped_name = NULL;
>      name = in_name;
>      if (lo->xattrmap) {
> @@ -3118,6 +3219,11 @@ static void lo_removexattr(fuse_req_t req, fuse_ino_t ino, const char *in_name)
>      int saverr;
>      int fd = -1;
>  
> +    if (block_xattr(lo, in_name)) {
> +        fuse_reply_err(req, EOPNOTSUPP);
> +        return;
> +    }
> +
>      mapped_name = NULL;
>      name = in_name;
>      if (lo->xattrmap) {
> @@ -3812,6 +3918,7 @@ int main(int argc, char *argv[])
>          .allow_direct_io = 0,
>          .proc_self_fd = -1,
>          .user_killpriv_v2 = -1,
> +        .user_posix_acl = -1,
>      };
>      struct lo_map_elem *root_elem;
>      struct lo_map_elem *reserve_elem;
> @@ -3940,6 +4047,12 @@ int main(int argc, char *argv[])
>          exit(1);
>      }
>  
> +    if (lo.user_posix_acl == 1 && !lo.xattr) {
> +        fuse_log(FUSE_LOG_ERR, "Can't enable posix ACLs. xattrs are disabled."
> +                 "\n");
> +        exit(1);
> +    }
> +
>      lo.use_statx = true;
>  
>      se = fuse_session_new(&args, &lo_oper, sizeof(lo_oper), &lo);
> -- 
> 2.25.4
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


