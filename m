Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0BE32D670
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 16:21:38 +0100 (CET)
Received: from localhost ([::1]:36270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpnF-000714-Lb
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 10:21:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lHpPk-0002Tb-S8
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:57:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lHpPh-0003Ee-Jk
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:57:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614869835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UrNpg9A+G3S+f52NYl4k5arjFsrFLJYWX7KuVkpyD6E=;
 b=VCy6do46GxCkUAAiOy2RJOeCq2F5be2h7MNMQMdisDg1bWIRXys8mzKbI6YlzMwUHxEqCn
 UnDKlsl3CM3WNX+NRmsjTePW89wv9JkuabT5JVyjlEFlqtKlWH5ZvkDqrPGm8jAdMnNPPU
 Lps4sp68hlTK7eRcUnM0k+r39PAiX8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-oTK3LR_cP22gQRBEdB5fhg-1; Thu, 04 Mar 2021 09:57:12 -0500
X-MC-Unique: oTK3LR_cP22gQRBEdB5fhg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C22AA196632E;
 Thu,  4 Mar 2021 14:57:11 +0000 (UTC)
Received: from work-vm (ovpn-114-208.ams2.redhat.com [10.36.114.208])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E182101F512;
 Thu,  4 Mar 2021 14:57:06 +0000 (UTC)
Date: Thu, 4 Mar 2021 14:57:03 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, qemu-stable@nongnu.org
Subject: Re: [PULL 1/1] virtiofs: drop remapped security.capability xattr as
 needed
Message-ID: <YED1P3Rd97Pfr8ug@work-vm>
References: <20210304103858.38400-1-dgilbert@redhat.com>
 <20210304103858.38400-2-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210304103858.38400-2-dgilbert@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: mcascell@redhat.com, vgoyal@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Oops, forgot to copy in qemu-stable; since xattrmap is in 5.2.0
it probably should go into stable.
(Taking 1e08f16 'virtiofsd: Save error code early at the failure
callsite' makes it easier to backport)

Dave

* Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> On Linux, the 'security.capability' xattr holds a set of
> capabilities that can change when an executable is run, giving
> a limited form of privilege escalation to those programs that
> the writer of the file deemed worthy.
> 
> Any write causes the 'security.capability' xattr to be dropped,
> stopping anyone from gaining privilege by modifying a blessed
> file.
> 
> Fuse relies on the daemon to do this dropping, and in turn the
> daemon relies on the host kernel to drop the xattr for it.  However,
> with the addition of -o xattrmap, the xattr that the guest
> stores its capabilities in is now not the same as the one that
> the host kernel automatically clears.
> 
> Where the mapping changes 'security.capability', explicitly clear
> the remapped name to preserve the same behaviour.
> 
> This bug is assigned CVE-2021-20263.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  docs/tools/virtiofsd.rst         |  4 ++
>  tools/virtiofsd/passthrough_ll.c | 77 +++++++++++++++++++++++++++++++-
>  2 files changed, 80 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
> index 866b7db3ee..00554c75bd 100644
> --- a/docs/tools/virtiofsd.rst
> +++ b/docs/tools/virtiofsd.rst
> @@ -228,6 +228,10 @@ The 'map' type adds a number of separate rules to add **prepend** as a prefix
>  to the matched **key** (or all attributes if **key** is empty).
>  There may be at most one 'map' rule and it must be the last rule in the set.
>  
> +Note: When the 'security.capability' xattr is remapped, the daemon has to do
> +extra work to remove it during many operations, which the host kernel normally
> +does itself.
> +
>  xattr-mapping Examples
>  ----------------------
>  
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 58d24c0010..fc7e1b1e8e 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -148,6 +148,7 @@ struct lo_data {
>      int posix_lock;
>      int xattr;
>      char *xattrmap;
> +    char *xattr_security_capability;
>      char *source;
>      char *modcaps;
>      double timeout;
> @@ -217,6 +218,8 @@ static __thread bool cap_loaded = 0;
>  
>  static struct lo_inode *lo_find(struct lo_data *lo, struct stat *st,
>                                  uint64_t mnt_id);
> +static int xattr_map_client(const struct lo_data *lo, const char *client_name,
> +                            char **out_name);
>  
>  static int is_dot_or_dotdot(const char *name)
>  {
> @@ -356,6 +359,37 @@ out:
>      return ret;
>  }
>  
> +/*
> + * The host kernel normally drops security.capability xattr's on
> + * any write, however if we're remapping xattr names we need to drop
> + * whatever the clients security.capability is actually stored as.
> + */
> +static int drop_security_capability(const struct lo_data *lo, int fd)
> +{
> +    if (!lo->xattr_security_capability) {
> +        /* We didn't remap the name, let the host kernel do it */
> +        return 0;
> +    }
> +    if (!fremovexattr(fd, lo->xattr_security_capability)) {
> +        /* All good */
> +        return 0;
> +    }
> +
> +    switch (errno) {
> +    case ENODATA:
> +        /* Attribute didn't exist, that's fine */
> +        return 0;
> +
> +    case ENOTSUP:
> +        /* FS didn't support attribute anyway, also fine */
> +        return 0;
> +
> +    default:
> +        /* Hmm other error */
> +        return errno;
> +    }
> +}
> +
>  static void lo_map_init(struct lo_map *map)
>  {
>      map->elems = NULL;
> @@ -737,6 +771,11 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
>          uid_t uid = (valid & FUSE_SET_ATTR_UID) ? attr->st_uid : (uid_t)-1;
>          gid_t gid = (valid & FUSE_SET_ATTR_GID) ? attr->st_gid : (gid_t)-1;
>  
> +        saverr = drop_security_capability(lo, ifd);
> +        if (saverr) {
> +            goto out_err;
> +        }
> +
>          res = fchownat(ifd, "", uid, gid, AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW);
>          if (res == -1) {
>              saverr = errno;
> @@ -759,6 +798,14 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
>              }
>          }
>  
> +        saverr = drop_security_capability(lo, truncfd);
> +        if (saverr) {
> +            if (!fi) {
> +                close(truncfd);
> +            }
> +            goto out_err;
> +        }
> +
>          if (kill_suidgid) {
>              res = drop_effective_cap("FSETID", &cap_fsetid_dropped);
>              if (res != 0) {
> @@ -1784,6 +1831,13 @@ static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
>          if (fd < 0) {
>              return -fd;
>          }
> +        if (fi->flags & (O_TRUNC)) {
> +            int err = drop_security_capability(lo, fd);
> +            if (err) {
> +                close(fd);
> +                return err;
> +            }
> +        }
>      }
>  
>      pthread_mutex_lock(&lo->mutex);
> @@ -2191,6 +2245,12 @@ static void lo_write_buf(fuse_req_t req, fuse_ino_t ino,
>               "lo_write_buf(ino=%" PRIu64 ", size=%zd, off=%lu kill_priv=%d)\n",
>               ino, out_buf.buf[0].size, (unsigned long)off, fi->kill_priv);
>  
> +    res = drop_security_capability(lo_data(req), out_buf.buf[0].fd);
> +    if (res) {
> +        fuse_reply_err(req, res);
> +        return;
> +    }
> +
>      /*
>       * If kill_priv is set, drop CAP_FSETID which should lead to kernel
>       * clearing setuid/setgid on file. Note, for WRITE, we need to do
> @@ -2432,6 +2492,7 @@ static void parse_xattrmap(struct lo_data *lo)
>  {
>      const char *map = lo->xattrmap;
>      const char *tmp;
> +    int ret;
>  
>      lo->xattr_map_nentries = 0;
>      while (*map) {
> @@ -2462,7 +2523,7 @@ static void parse_xattrmap(struct lo_data *lo)
>               * the last entry.
>               */
>              parse_xattrmap_map(lo, map, sep);
> -            return;
> +            break;
>          } else {
>              fuse_log(FUSE_LOG_ERR,
>                       "%s: Unexpected type;"
> @@ -2531,6 +2592,19 @@ static void parse_xattrmap(struct lo_data *lo)
>          fuse_log(FUSE_LOG_ERR, "Empty xattr map\n");
>          exit(1);
>      }
> +
> +    ret = xattr_map_client(lo, "security.capability",
> +                           &lo->xattr_security_capability);
> +    if (ret) {
> +        fuse_log(FUSE_LOG_ERR, "Failed to map security.capability: %s\n",
> +                strerror(ret));
> +        exit(1);
> +    }
> +    if (!strcmp(lo->xattr_security_capability, "security.capability")) {
> +        /* 1-1 mapping, don't need to do anything */
> +        free(lo->xattr_security_capability);
> +        lo->xattr_security_capability = NULL;
> +    }
>  }
>  
>  /*
> @@ -3588,6 +3662,7 @@ static void fuse_lo_data_cleanup(struct lo_data *lo)
>  
>      free(lo->xattrmap);
>      free_xattrmap(lo);
> +    free(lo->xattr_security_capability);
>      free(lo->source);
>  }
>  
> -- 
> 2.29.2
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


