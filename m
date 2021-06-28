Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C363B68B5
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 20:52:35 +0200 (CEST)
Received: from localhost ([::1]:57852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxwN0-0008Nd-4C
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 14:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lxwMC-0007fT-5n
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 14:51:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lxwM9-00014a-I6
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 14:51:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624906301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UQCYfN4AAqFp8RpXvphsMNZS1hyXcJJUBAZOxvRzjA4=;
 b=Q/HyYu5uixKe2OEjsHyZDHYWDulc2S2DQa7D+2+RqiN+MsTfuJ/pWuIOHe+yvAadGmOooI
 G4K2xfbPoMrSJoiP1qrj7SWH9lmE4pk+xIiOqoAjnR/7UHqPlTbGcLCRhl8/49johfWNbX
 8OZVdD6cnC9APHy2YWZ9kTShKa2q2ds=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-BtaNGsn1Nue88qBzC9F-Iw-1; Mon, 28 Jun 2021 14:51:39 -0400
X-MC-Unique: BtaNGsn1Nue88qBzC9F-Iw-1
Received: by mail-wr1-f71.google.com with SMTP id
 x8-20020a5d54c80000b029012583535285so1174704wrv.8
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 11:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UQCYfN4AAqFp8RpXvphsMNZS1hyXcJJUBAZOxvRzjA4=;
 b=I7PNDPQ0tBhk9bvufUjBU5lteUAnetyfMguAMHJzuIiHg9+yaSn/oFYqEg5CKeobpw
 Z5bSOcISpFhuZHhRTn5O7+Hb8o+pikqyTsbbKWVqsDEzAKStV4pRSPyoOUd7YF0w1sar
 tboE6W5dLUFlP1cmn/uhDFaeH0dC94w4CCYGq6lEYowDLguR5O6IjR6oohDn+T+BzMqx
 /fl7SQGBmM4a7Nfw+78N95Q5hrjlBhiscipI1ltnbPkx3tvu5woMvF7LXP3AIxvtU57r
 9WYWAnUhhpNIKKs6Ycc/o0YKgda8tbw4ZiLOwjtXUeExOUz5hUnwOIEyiP0swz/M3hV2
 rkog==
X-Gm-Message-State: AOAM533dPx4X1ubRvcWiPFuLQIaxx0pdZRM5rwkIw1Y+PY1Mxh6SO+Fo
 VVZueaOk1U38nnbGZGd2SnRoa1KV+Q4EoHDgxAh3hcYAToAUzXoaQtzgiTzSWOcHxzZS8tvtwgX
 aHU5e3JtLosLVDWI=
X-Received: by 2002:a05:600c:3b28:: with SMTP id
 m40mr27676328wms.99.1624906298480; 
 Mon, 28 Jun 2021 11:51:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1JoDeUxY3xy5OFiSQCDQPUTOb88Q40QaKPmP14+mt3fjaOIZf5jpMtciUcdVwcqB59+Sw1g==
X-Received: by 2002:a05:600c:3b28:: with SMTP id
 m40mr27676311wms.99.1624906298314; 
 Mon, 28 Jun 2021 11:51:38 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id c7sm15552340wrs.23.2021.06.28.11.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 11:51:37 -0700 (PDT)
Date: Mon, 28 Jun 2021 19:51:36 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v7 5/7] virtiofsd: Add capability to change/restore umask
Message-ID: <YNoaOCN1G+HqQ8S5@work-vm>
References: <20210622150852.1507204-1-vgoyal@redhat.com>
 <20210622150852.1507204-6-vgoyal@redhat.com>
 <YNn03dfqpGnTTIne@work-vm> <20210628181218.GF1803896@redhat.com>
 <YNoWotomJg1S09pF@work-vm> <20210628184636.GH1803896@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210628184636.GH1803896@redhat.com>
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
> On Mon, Jun 28, 2021 at 07:36:18PM +0100, Dr. David Alan Gilbert wrote:
> > * Vivek Goyal (vgoyal@redhat.com) wrote:
> > > On Mon, Jun 28, 2021 at 05:12:13PM +0100, Dr. David Alan Gilbert wrote:
> > > > * Vivek Goyal (vgoyal@redhat.com) wrote:
> > > > > When parent directory has default acl and a file is created in that
> > > > > directory, then umask is ignored and final file permissions are
> > > > > determined using default acl instead. (man 2 umask).
> > > > > 
> > > > > Currently, fuse applies the umask and sends modified mode in create
> > > > > request accordingly. fuse server can set FUSE_DONT_MASK and tell
> > > > > fuse client to not apply umask and fuse server will take care of
> > > > > it as needed.
> > > > > 
> > > > > With posix acls enabled, requirement will be that we want umask
> > > > > to determine final file mode if parent directory does not have
> > > > > default acl.
> > > > > 
> > > > > So if posix acls are enabled, opt in for FUSE_DONT_MASK. virtiofsd
> > > > > will set umask of the thread doing file creation. And host kernel
> > > > > should use that umask if parent directory does not have default
> > > > > acls, otherwise umask does not take affect.
> > > > > 
> > > > > Miklos mentioned that we already call unshare(CLONE_FS) for
> > > > > every thread. That means umask has now become property of per
> > > > > thread and it should be ok to manipulate it in file creation path.
> > > > > 
> > > > > This patch only adds capability to change umask and restore it. It
> > > > > does not enable it yet. Next few patches will add capability to enable it
> > > > > based on if user enabled posix_acl or not.
> > > > > 
> > > > > This should fix fstest generic/099.
> > > > > 
> > > > > Reported-by: Luis Henriques <lhenriques@suse.de>
> > > > > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > > > > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > > ---
> > > > >  tools/virtiofsd/passthrough_ll.c | 22 ++++++++++++++++------
> > > > >  1 file changed, 16 insertions(+), 6 deletions(-)
> > > > > 
> > > > > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > > > > index 9f5cd98fb5..0c9084ea15 100644
> > > > > --- a/tools/virtiofsd/passthrough_ll.c
> > > > > +++ b/tools/virtiofsd/passthrough_ll.c
> > > > > @@ -122,6 +122,7 @@ struct lo_inode {
> > > > >  struct lo_cred {
> > > > >      uid_t euid;
> > > > >      gid_t egid;
> > > > > +    mode_t umask;
> > > > >  };
> > > > >  
> > > > >  enum {
> > > > > @@ -172,6 +173,8 @@ struct lo_data {
> > > > >      /* An O_PATH file descriptor to /proc/self/fd/ */
> > > > >      int proc_self_fd;
> > > > >      int user_killpriv_v2, killpriv_v2;
> > > > > +    /* If set, virtiofsd is responsible for setting umask during creation */
> > > > > +    bool change_umask;
> > > > >  };
> > > > >  
> > > > >  static const struct fuse_opt lo_opts[] = {
> > > > > @@ -1134,7 +1137,8 @@ static void lo_lookup(fuse_req_t req, fuse_ino_t parent, const char *name)
> > > > >   * ownership of caller.
> > > > >   * TODO: What about selinux context?
> > > > >   */
> > > > > -static int lo_change_cred(fuse_req_t req, struct lo_cred *old)
> > > > > +static int lo_change_cred(fuse_req_t req, struct lo_cred *old,
> > > > > +                          bool change_umask)
> > > > >  {
> > > > >      int res;
> > > > >  
> > > > > @@ -1154,11 +1158,14 @@ static int lo_change_cred(fuse_req_t req, struct lo_cred *old)
> > > > >          return errno_save;
> > > > >      }
> > > > >  
> > > > > +    if (change_umask) {
> > > > > +        old->umask = umask(req->ctx.umask);
> > > > > +    }
> > > > >      return 0;
> > > > >  }
> > > > >  
> > > > >  /* Regain Privileges */
> > > > > -static void lo_restore_cred(struct lo_cred *old)
> > > > > +static void lo_restore_cred(struct lo_cred *old, bool restore_umask)
> > > > >  {
> > > > >      int res;
> > > > >  
> > > > > @@ -1173,6 +1180,9 @@ static void lo_restore_cred(struct lo_cred *old)
> > > > >          fuse_log(FUSE_LOG_ERR, "setegid(%u): %m\n", old->egid);
> > > > >          exit(1);
> > > > >      }
> > > > > +
> > > > > +    if (restore_umask)
> > > > > +        umask(old->umask);
> > > > >  }
> > > > >  
> > > > >  static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
> > > > > @@ -1202,7 +1212,7 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
> > > > >          return;
> > > > >      }
> > > > >  
> > > > > -    saverr = lo_change_cred(req, &old);
> > > > > +    saverr = lo_change_cred(req, &old, lo->change_umask && !S_ISLNK(mode));
> > > > 
> > > > Can you explain what these ISLNK checks are for (insid mknod_symlink, so
> > > > is that always true or irrelevant?)
> > > 
> > > I think I put this check in because if we are creating symlink then we
> > > don't have to change umask as symlink will always get a some fix
> > > mode (usually 777) and umask will not have an affect. So this is
> > > just an optimization to avoid switching umask in some cases. I 
> > > can't think of any other reason.
> > 
> > But this is in 'lo_mknod_symlink' - so when do we call that except for
> > making symlinks?
> 
> I think it is called for other mknod paths as well and not limited to
> symlink only.
> 
> 
> static void lo_mknod(fuse_req_t req, fuse_ino_t parent, const char *name,
>                      mode_t mode, dev_t rdev)
> {
>     lo_mknod_symlink(req, parent, name, mode, rdev, NULL);
> }
> 
> static void lo_mkdir(fuse_req_t req, fuse_ino_t parent, const char *name,
>                      mode_t mode)
> {
>     lo_mknod_symlink(req, parent, name, S_IFDIR | mode, 0, NULL);
> }
> 
> static void lo_symlink(fuse_req_t req, const char *link, fuse_ino_t parent,
>                        const char *name)
> {
>     lo_mknod_symlink(req, parent, name, S_IFLNK, 0, link);
> }

Oh, I see, yeh that confused me - it all then goes through
mknod_wrapper.

Right,

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> Vivek
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


