Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCDD33BF98
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 16:20:23 +0100 (CET)
Received: from localhost ([::1]:46572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLp14-0005Vg-4X
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 11:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lLozo-0004yU-Af
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:19:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lLozl-0008C6-2n
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:19:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615821539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CHrZwrgVhZzcXc0vW2NH0xnxkG4Zto2Pj2ybkfCUjgI=;
 b=SRau7HLkL/zNou0sc26oMW/Y4dhktKflnGS8frLT9PlIURPZw2EKyLiIP0lsOIY0ZtZYGc
 ZKlBQQ5Bp14Mre5TUhUPeDGpDBS6RKM0TQ6XeJR4Crb8SC5DMBEJGWE2Suv/bx+Q0WF3AS
 HB29d9ezB0g8jUGUHRdCFNm+X0nIV3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-HJde_w8mP7u7JETAwPvIGA-1; Mon, 15 Mar 2021 11:18:56 -0400
X-MC-Unique: HJde_w8mP7u7JETAwPvIGA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6360F101F002;
 Mon, 15 Mar 2021 15:18:55 +0000 (UTC)
Received: from work-vm (ovpn-114-235.ams2.redhat.com [10.36.114.235])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47EDB1C4;
 Mon, 15 Mar 2021 15:18:51 +0000 (UTC)
Date: Mon, 15 Mar 2021 15:18:48 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [Virtio-fs] [PATCH 3/3] virtiofsd: Don't allow empty filenames
Message-ID: <YE962LeQCJfR03NZ@work-vm>
References: <20210312141003.819108-1-groug@kaod.org>
 <20210312141003.819108-4-groug@kaod.org>
 <20210314233604.GC223210@redhat.com>
 <20210315110630.5ae99490@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20210315110630.5ae99490@bahia.lan>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Greg Kurz (groug@kaod.org) wrote:
> On Sun, 14 Mar 2021 19:36:04 -0400
> Vivek Goyal <vgoyal@redhat.com> wrote:
> 
> > On Fri, Mar 12, 2021 at 03:10:03PM +0100, Greg Kurz wrote:
> > > POSIX.1-2017 clearly stipulates that empty filenames aren't
> > > allowed ([1] and [2]). Since virtiofsd is supposed to mirror
> > > the host file system hierarchy and the host can be assumed to
> > > be linux, we don't really expect clients to pass requests with
> > > an empty path in it. If they do so anyway, this would eventually
> > > cause an error when trying to create/lookup the actual inode
> > > on the underlying POSIX filesystem. But this could still confuse
> > > some code that wouldn't be ready to cope with this.
> > > 
> > > Filter out empty names coming from the client at the top level,
> > > so that the rest doesn't have to care about it. This is done
> > > everywhere we already call is_safe_path_component(), but
> > > in a separate helper since the usual error for empty path
> > > names is ENOENT instead of EINVAL.
> > > 
> > > [1] https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap03.html#tag_03_170
> > > [2] https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap04.html#tag_04_13
> > > 
> > > Signed-off-by: Greg Kurz <groug@kaod.org>
> > 
> > Hi Greg,
> > 
> > Minor nit, if you happen to respin this patch, it probably should come
> > before the first patch in series. Once we make it clear that file server
> > is not expecting empty path in these top level functions, then it is
> > easy to clear AT_EMPTY_PATH in function these paths are calling as
> > appropriate.
> > 
> 
> The patch order is chronological : I just spotted the AT_EMPTY_PATH
> oddity before coming up with the bigger hammer of patch 3. But you're
> right, it probably makes more sense to do the other way around.
> 
> > What about lo_create(). Should we put a check in there as well.
> > 
> 
> Good catch ! I'll post a v2 then ;)

I'm just brewing a pull now, since soft freeze is tomorrow.
I'll take 3,1,2 - please follow up with a separate lo_create one - we
can add that later.

Dave

> > We are passed xattr names in lo_getxattr()/lo_removexattr()/lo_setxattr().
> > In general, should we put an empty in_name check there as well and
> > probably simply return -EINVAL.
> > 
> 
> An empty xattr name doesn't likely make sense either, even if this
> isn't written down anywhere, not in an explicit manner at least.
> 
> The kernel checks this in setxattr() and errors out with -ERANGE
> in this case.
> 
>         error = strncpy_from_user(kname, name, sizeof(kname));
>         if (error == 0 || error == sizeof(kname))
>                 error = -ERANGE;
>         if (error < 0)
>                 return error;
> 
> Same goes for the other *xattr() syscalls, i.e. nothing nasty can ever
> happen with an empty xattr name since this is always considered as an
> error by the kernel. Not sure this would bring much to also check this
> in QEMU. This is a bit different from the empty path name case because
> an empty path name is valid for syscalls that support AT_EMPTY_PATH,
> and we just want to make sure these are never exercised with names
> from the client.
> 
> Cheers,
> 
> --
> Greg
> 
> > Thanks
> > Vivek
> > 
> > > ---
> > >  tools/virtiofsd/passthrough_ll.c | 35 ++++++++++++++++++++++++++++++++
> > >  1 file changed, 35 insertions(+)
> > > 
> > > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > > index f63016d35626..bff9dc2cd26d 100644
> > > --- a/tools/virtiofsd/passthrough_ll.c
> > > +++ b/tools/virtiofsd/passthrough_ll.c
> > > @@ -237,6 +237,11 @@ static bool is_safe_path_component(const char *path)
> > >      return !is_dot_or_dotdot(path);
> > >  }
> > >  
> > > +static bool is_empty(const char *name)
> > > +{
> > > +    return name[0] == '\0';
> > > +}
> > > +
> > >  static struct lo_data *lo_data(fuse_req_t req)
> > >  {
> > >      return (struct lo_data *)fuse_req_userdata(req);
> > > @@ -1083,6 +1088,11 @@ static void lo_lookup(fuse_req_t req, fuse_ino_t parent, const char *name)
> > >      fuse_log(FUSE_LOG_DEBUG, "lo_lookup(parent=%" PRIu64 ", name=%s)\n", parent,
> > >               name);
> > >  
> > > +    if (is_empty(name)) {
> > > +        fuse_reply_err(req, ENOENT);
> > > +        return;
> > > +    }
> > > +
> > >      /*
> > >       * Don't use is_safe_path_component(), allow "." and ".." for NFS export
> > >       * support.
> > > @@ -1174,6 +1184,11 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
> > >      struct fuse_entry_param e;
> > >      struct lo_cred old = {};
> > >  
> > > +    if (is_empty(name)) {
> > > +        fuse_reply_err(req, ENOENT);
> > > +        return;
> > > +    }
> > > +
> > >      if (!is_safe_path_component(name)) {
> > >          fuse_reply_err(req, EINVAL);
> > >          return;
> > > @@ -1246,6 +1261,11 @@ static void lo_link(fuse_req_t req, fuse_ino_t ino, fuse_ino_t parent,
> > >      char procname[64];
> > >      int saverr;
> > >  
> > > +    if (is_empty(name)) {
> > > +        fuse_reply_err(req, ENOENT);
> > > +        return;
> > > +    }
> > > +
> > >      if (!is_safe_path_component(name)) {
> > >          fuse_reply_err(req, EINVAL);
> > >          return;
> > > @@ -1323,6 +1343,11 @@ static void lo_rmdir(fuse_req_t req, fuse_ino_t parent, const char *name)
> > >      struct lo_inode *inode;
> > >      struct lo_data *lo = lo_data(req);
> > >  
> > > +    if (is_empty(name)) {
> > > +        fuse_reply_err(req, ENOENT);
> > > +        return;
> > > +    }
> > > +
> > >      if (!is_safe_path_component(name)) {
> > >          fuse_reply_err(req, EINVAL);
> > >          return;
> > > @@ -1352,6 +1377,11 @@ static void lo_rename(fuse_req_t req, fuse_ino_t parent, const char *name,
> > >      struct lo_inode *newinode = NULL;
> > >      struct lo_data *lo = lo_data(req);
> > >  
> > > +    if (is_empty(name) || is_empty(newname)) {
> > > +        fuse_reply_err(req, ENOENT);
> > > +        return;
> > > +    }
> > > +
> > >      if (!is_safe_path_component(name) || !is_safe_path_component(newname)) {
> > >          fuse_reply_err(req, EINVAL);
> > >          return;
> > > @@ -1405,6 +1435,11 @@ static void lo_unlink(fuse_req_t req, fuse_ino_t parent, const char *name)
> > >      struct lo_inode *inode;
> > >      struct lo_data *lo = lo_data(req);
> > >  
> > > +    if (is_empty(name)) {
> > > +        fuse_reply_err(req, ENOENT);
> > > +        return;
> > > +    }
> > > +
> > >      if (!is_safe_path_component(name)) {
> > >          fuse_reply_err(req, EINVAL);
> > >          return;
> > > -- 
> > > 2.26.2
> > > 
> > > _______________________________________________
> > > Virtio-fs mailing list
> > > Virtio-fs@redhat.com
> > > https://listman.redhat.com/mailman/listinfo/virtio-fs
> > 
> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://listman.redhat.com/mailman/listinfo/virtio-fs
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


