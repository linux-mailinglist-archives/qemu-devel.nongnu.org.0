Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A68B27DB2C
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Sep 2020 23:55:02 +0200 (CEST)
Received: from localhost ([::1]:58336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNNaP-0005cD-D7
	for lists+qemu-devel@lfdr.de; Tue, 29 Sep 2020 17:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kNNZ1-0004pP-DA
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 17:53:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kNNYy-0006g9-3o
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 17:53:34 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601416410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dUFX51nMqsyNZct2HESBedJZiKizhojAJM4dWFMTFHY=;
 b=hrETZ1ORx0iMLA38jJIVOR+1v8i8ie2sh0dXVC3I9JurWLOIoiNCBTmJwfzS5BjgnSB7vH
 iVROmAf5nZ6S7InOCnO/VssxmJdoMUQL3ki5wJgTthyCL0BgkZSf+FJQEewV5+NswQgj53
 rIiWCzzhGPXNTQFvrtRcjCRbPPeieXc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-2ROOq1IONmKBEzY-hsHXNQ-1; Tue, 29 Sep 2020 17:53:28 -0400
X-MC-Unique: 2ROOq1IONmKBEzY-hsHXNQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3530B801AE1;
 Tue, 29 Sep 2020 21:53:27 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-167.rdu2.redhat.com [10.10.116.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 723735C1C4;
 Tue, 29 Sep 2020 21:53:20 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id E9902220203; Tue, 29 Sep 2020 17:53:19 -0400 (EDT)
Date: Tue, 29 Sep 2020 17:53:19 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PULL 26/26] virtiofsd: Add -o
 allow_direct_io|no_allow_direct_io options
Message-ID: <20200929215319.GI220516@redhat.com>
References: <20200925120655.295142-1-dgilbert@redhat.com>
 <20200925120655.295142-27-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200925120655.295142-27-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/29 02:22:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lvivier@redhat.com, quintela@redhat.com, hgcoin@gmail.com,
 qemu-devel@nongnu.org, peterx@redhat.com, zhengchuan@huawei.com,
 dovmurik@linux.vnet.ibm.com, zhangjiachen.jaycee@bytedance.com,
 stefanha@redhat.com, jinyan12@huawei.com, ann.zhuangyanying@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 25, 2020 at 01:06:55PM +0100, Dr. David Alan Gilbert (git) wrote:
> From: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
> 
> Due to the commit 65da4539803373ec4eec97ffc49ee90083e56efd, the O_DIRECT
> open flag of guest applications will be discarded by virtiofsd. While
> this behavior makes it consistent with the virtio-9p scheme when guest
> applications use direct I/O, we no longer have any chance to bypass the
> host page cache.
> 
> Therefore, we add a flag 'allow_direct_io' to lo_data. If '-o
>  no_allow_direct_io' option is added, or none of '-o allow_direct_io' or
>  '-o no_allow_direct_io' is added, the 'allow_direct_io' will be set to
>  0, and virtiofsd discards O_DIRECT as before. If '-o allow_direct_io'
> is added to the starting command-line, 'allow_direct_io' will be set to
> 1, so that the O_DIRECT flags will be retained and host page cache can
> be bypassed.

Hi Jiachen,

Curious that in what cases you want to bypass host page cache.

Thanks
Vivek

> 
> Signed-off-by: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Message-Id: <20200824105957.61265-1-zhangjiachen.jaycee@bytedance.com>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  tools/virtiofsd/helper.c         |  4 ++++
>  tools/virtiofsd/passthrough_ll.c | 20 ++++++++++++++------
>  2 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
> index 7bc5d7dc5a..85770d63f1 100644
> --- a/tools/virtiofsd/helper.c
> +++ b/tools/virtiofsd/helper.c
> @@ -178,6 +178,10 @@ void fuse_cmdline_help(void)
>             "                               (0 leaves rlimit unchanged)\n"
>             "                               default: min(1000000, fs.file-max - 16384)\n"
>             "                                        if the current rlimit is lower\n"
> +           "    -o allow_direct_io|no_allow_direct_io\n"
> +           "                               retain/discard O_DIRECT flags passed down\n"
> +           "                               to virtiofsd from guest applications.\n"
> +           "                               default: no_allow_direct_io\n"
>             );
>  }
>  
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 784330e0e4..0b229ebd57 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -151,6 +151,7 @@ struct lo_data {
>      int timeout_set;
>      int readdirplus_set;
>      int readdirplus_clear;
> +    int allow_direct_io;
>      struct lo_inode root;
>      GHashTable *inodes; /* protected by lo->mutex */
>      struct lo_map ino_map; /* protected by lo->mutex */
> @@ -179,6 +180,8 @@ static const struct fuse_opt lo_opts[] = {
>      { "cache=always", offsetof(struct lo_data, cache), CACHE_ALWAYS },
>      { "readdirplus", offsetof(struct lo_data, readdirplus_set), 1 },
>      { "no_readdirplus", offsetof(struct lo_data, readdirplus_clear), 1 },
> +    { "allow_direct_io", offsetof(struct lo_data, allow_direct_io), 1 },
> +    { "no_allow_direct_io", offsetof(struct lo_data, allow_direct_io), 0 },
>      FUSE_OPT_END
>  };
>  static bool use_syslog = false;
> @@ -1516,7 +1519,8 @@ static void lo_releasedir(fuse_req_t req, fuse_ino_t ino,
>      fuse_reply_err(req, 0);
>  }
>  
> -static void update_open_flags(int writeback, struct fuse_file_info *fi)
> +static void update_open_flags(int writeback, int allow_direct_io,
> +                              struct fuse_file_info *fi)
>  {
>      /*
>       * With writeback cache, kernel may send read requests even
> @@ -1541,10 +1545,13 @@ static void update_open_flags(int writeback, struct fuse_file_info *fi)
>  
>      /*
>       * O_DIRECT in guest should not necessarily mean bypassing page
> -     * cache on host as well. If somebody needs that behavior, it
> -     * probably should be a configuration knob in daemon.
> +     * cache on host as well. Therefore, we discard it by default
> +     * ('-o no_allow_direct_io'). If somebody needs that behavior,
> +     * the '-o allow_direct_io' option should be set.
>       */
> -    fi->flags &= ~O_DIRECT;
> +    if (!allow_direct_io) {
> +        fi->flags &= ~O_DIRECT;
> +    }
>  }
>  
>  static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
> @@ -1576,7 +1583,7 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
>          goto out;
>      }
>  
> -    update_open_flags(lo->writeback, fi);
> +    update_open_flags(lo->writeback, lo->allow_direct_io, fi);
>  
>      fd = openat(parent_inode->fd, name, (fi->flags | O_CREAT) & ~O_NOFOLLOW,
>                  mode);
> @@ -1786,7 +1793,7 @@ static void lo_open(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
>      fuse_log(FUSE_LOG_DEBUG, "lo_open(ino=%" PRIu64 ", flags=%d)\n", ino,
>               fi->flags);
>  
> -    update_open_flags(lo->writeback, fi);
> +    update_open_flags(lo->writeback, lo->allow_direct_io, fi);
>  
>      sprintf(buf, "%i", lo_fd(req, ino));
>      fd = openat(lo->proc_self_fd, buf, fi->flags & ~O_NOFOLLOW);
> @@ -2823,6 +2830,7 @@ int main(int argc, char *argv[])
>          .debug = 0,
>          .writeback = 0,
>          .posix_lock = 0,
> +        .allow_direct_io = 0,
>          .proc_self_fd = -1,
>      };
>      struct lo_map_elem *root_elem;
> -- 
> 2.26.2
> 


