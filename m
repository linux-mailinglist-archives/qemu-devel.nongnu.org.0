Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7473633A8DE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 00:40:14 +0100 (CET)
Received: from localhost ([::1]:39896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLaLF-000226-Gi
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 19:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lLaHU-0007qp-GQ
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:36:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lLaHQ-0006hG-S3
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:36:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615764975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WlkDLsykKBaRjNvypcrmjPkYaDp3FpZFIkvQieCxHEI=;
 b=PQVs3CN0XzxTHUkwLwLf6IHZ7JLktk6bpJjirDUPKbhwy710nNVOsa6z+8woS5qgwhLGey
 NqVjBn+bwoBxjMlJhsG78yKydTAIlrwdDSYhOwNXw+txm5PBuCrXBShht+FmqbxJmJE3Ly
 cus4GxjazFEHkL+9VkspbtdstjgoppM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-hcRNIjQSNaWz2Wm9w84ANA-1; Sun, 14 Mar 2021 19:36:10 -0400
X-MC-Unique: hcRNIjQSNaWz2Wm9w84ANA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECA9280D686;
 Sun, 14 Mar 2021 23:36:08 +0000 (UTC)
Received: from horse.redhat.com (ovpn-112-132.rdu2.redhat.com [10.10.112.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC4BD620DE;
 Sun, 14 Mar 2021 23:36:04 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 5777622054F; Sun, 14 Mar 2021 19:36:04 -0400 (EDT)
Date: Sun, 14 Mar 2021 19:36:04 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [Virtio-fs] [PATCH 3/3] virtiofsd: Don't allow empty filenames
Message-ID: <20210314233604.GC223210@redhat.com>
References: <20210312141003.819108-1-groug@kaod.org>
 <20210312141003.819108-4-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210312141003.819108-4-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

On Fri, Mar 12, 2021 at 03:10:03PM +0100, Greg Kurz wrote:
> POSIX.1-2017 clearly stipulates that empty filenames aren't
> allowed ([1] and [2]). Since virtiofsd is supposed to mirror
> the host file system hierarchy and the host can be assumed to
> be linux, we don't really expect clients to pass requests with
> an empty path in it. If they do so anyway, this would eventually
> cause an error when trying to create/lookup the actual inode
> on the underlying POSIX filesystem. But this could still confuse
> some code that wouldn't be ready to cope with this.
> 
> Filter out empty names coming from the client at the top level,
> so that the rest doesn't have to care about it. This is done
> everywhere we already call is_safe_path_component(), but
> in a separate helper since the usual error for empty path
> names is ENOENT instead of EINVAL.
> 
> [1] https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap03.html#tag_03_170
> [2] https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap04.html#tag_04_13
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>

Hi Greg,

Minor nit, if you happen to respin this patch, it probably should come
before the first patch in series. Once we make it clear that file server
is not expecting empty path in these top level functions, then it is
easy to clear AT_EMPTY_PATH in function these paths are calling as
appropriate.

What about lo_create(). Should we put a check in there as well.

We are passed xattr names in lo_getxattr()/lo_removexattr()/lo_setxattr().
In general, should we put an empty in_name check there as well and
probably simply return -EINVAL.

Thanks
Vivek

> ---
>  tools/virtiofsd/passthrough_ll.c | 35 ++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index f63016d35626..bff9dc2cd26d 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -237,6 +237,11 @@ static bool is_safe_path_component(const char *path)
>      return !is_dot_or_dotdot(path);
>  }
>  
> +static bool is_empty(const char *name)
> +{
> +    return name[0] == '\0';
> +}
> +
>  static struct lo_data *lo_data(fuse_req_t req)
>  {
>      return (struct lo_data *)fuse_req_userdata(req);
> @@ -1083,6 +1088,11 @@ static void lo_lookup(fuse_req_t req, fuse_ino_t parent, const char *name)
>      fuse_log(FUSE_LOG_DEBUG, "lo_lookup(parent=%" PRIu64 ", name=%s)\n", parent,
>               name);
>  
> +    if (is_empty(name)) {
> +        fuse_reply_err(req, ENOENT);
> +        return;
> +    }
> +
>      /*
>       * Don't use is_safe_path_component(), allow "." and ".." for NFS export
>       * support.
> @@ -1174,6 +1184,11 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
>      struct fuse_entry_param e;
>      struct lo_cred old = {};
>  
> +    if (is_empty(name)) {
> +        fuse_reply_err(req, ENOENT);
> +        return;
> +    }
> +
>      if (!is_safe_path_component(name)) {
>          fuse_reply_err(req, EINVAL);
>          return;
> @@ -1246,6 +1261,11 @@ static void lo_link(fuse_req_t req, fuse_ino_t ino, fuse_ino_t parent,
>      char procname[64];
>      int saverr;
>  
> +    if (is_empty(name)) {
> +        fuse_reply_err(req, ENOENT);
> +        return;
> +    }
> +
>      if (!is_safe_path_component(name)) {
>          fuse_reply_err(req, EINVAL);
>          return;
> @@ -1323,6 +1343,11 @@ static void lo_rmdir(fuse_req_t req, fuse_ino_t parent, const char *name)
>      struct lo_inode *inode;
>      struct lo_data *lo = lo_data(req);
>  
> +    if (is_empty(name)) {
> +        fuse_reply_err(req, ENOENT);
> +        return;
> +    }
> +
>      if (!is_safe_path_component(name)) {
>          fuse_reply_err(req, EINVAL);
>          return;
> @@ -1352,6 +1377,11 @@ static void lo_rename(fuse_req_t req, fuse_ino_t parent, const char *name,
>      struct lo_inode *newinode = NULL;
>      struct lo_data *lo = lo_data(req);
>  
> +    if (is_empty(name) || is_empty(newname)) {
> +        fuse_reply_err(req, ENOENT);
> +        return;
> +    }
> +
>      if (!is_safe_path_component(name) || !is_safe_path_component(newname)) {
>          fuse_reply_err(req, EINVAL);
>          return;
> @@ -1405,6 +1435,11 @@ static void lo_unlink(fuse_req_t req, fuse_ino_t parent, const char *name)
>      struct lo_inode *inode;
>      struct lo_data *lo = lo_data(req);
>  
> +    if (is_empty(name)) {
> +        fuse_reply_err(req, ENOENT);
> +        return;
> +    }
> +
>      if (!is_safe_path_component(name)) {
>          fuse_reply_err(req, EINVAL);
>          return;
> -- 
> 2.26.2
> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://listman.redhat.com/mailman/listinfo/virtio-fs


