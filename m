Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A87863B6878
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 20:29:23 +0200 (CEST)
Received: from localhost ([::1]:33518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxw0Y-0006pN-Ny
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 14:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lxvzS-0005Vx-Co
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 14:28:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lxvzQ-0000yS-Kn
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 14:28:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624904892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8g8RlUMMaNyW6KhZOkNqRXbO41njsHg+rKOQzz/xLyA=;
 b=Q7rkTpFPKhkBILaPPil5b57q/mhVJEERyEbANKnte4X4zht/LwhGZ7glU17XwXwYSdx3/j
 +bTmxV55tVMQGBv8F80me0AXH83ASga+9+YeshvpI/GfgUwhkFtRa/uDiH6dCoNXx2wG04
 ToJIBnO4RGxy583cdrPfP3/m8tONMP8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-o3xrMWbrONeaKUlhgBnxpA-1; Mon, 28 Jun 2021 14:28:10 -0400
X-MC-Unique: o3xrMWbrONeaKUlhgBnxpA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90F28100CCCE;
 Mon, 28 Jun 2021 18:28:09 +0000 (UTC)
Received: from horse.redhat.com (ovpn-115-225.rdu2.redhat.com [10.10.115.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C57B51017CE8;
 Mon, 28 Jun 2021 18:28:00 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 54A8E22054F; Mon, 28 Jun 2021 14:28:00 -0400 (EDT)
Date: Mon, 28 Jun 2021 14:28:00 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v7 3/7] virtiofsd: Add support for extended setxattr
Message-ID: <20210628182800.GG1803896@redhat.com>
References: <20210622150852.1507204-1-vgoyal@redhat.com>
 <20210622150852.1507204-4-vgoyal@redhat.com>
 <YNnvbneBCm4GYRP9@work-vm>
MIME-Version: 1.0
In-Reply-To: <YNnvbneBCm4GYRP9@work-vm>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
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

On Mon, Jun 28, 2021 at 04:49:02PM +0100, Dr. David Alan Gilbert wrote:
> * Vivek Goyal (vgoyal@redhat.com) wrote:
> > Add the bits to enable support for setxattr_ext if fuse offers it. Do not
> > enable it by default yet. Let passthrough_ll opt-in. Enabling it by deafult
> > kind of automatically means that you are taking responsibility of clearing
> > SGID if ACL is set.
> > 
> > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > ---
> >  tools/virtiofsd/fuse_common.h    |  5 +++++
> >  tools/virtiofsd/fuse_lowlevel.c  | 11 ++++++++++-
> >  tools/virtiofsd/fuse_lowlevel.h  |  3 ++-
> >  tools/virtiofsd/passthrough_ll.c |  3 ++-
> >  4 files changed, 19 insertions(+), 3 deletions(-)
> > 
> > diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.h
> > index 0c2665b977..8abac80098 100644
> > --- a/tools/virtiofsd/fuse_common.h
> > +++ b/tools/virtiofsd/fuse_common.h
> > @@ -377,6 +377,11 @@ struct fuse_file_info {
> >   */
> >  #define FUSE_CAP_SETXATTR_EXT (1 << 29)
> >  
> > +/**
> > + * Indicates that file server supports extended struct fuse_setxattr_in
> > + */
> > +#define FUSE_CAP_SETXATTR_EXT (1 << 29)
> > +
> 
> You already added that in 1/7 - but other than that, 

Good catch. Do I need to repost patch/series due to this change or this
is something you can take care of while applying patches.

Vivek

> 
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> >  /**
> >   * Ioctl flags
> >   *
> > diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
> > index c2b6ff1686..d1e24c013f 100644
> > --- a/tools/virtiofsd/fuse_lowlevel.c
> > +++ b/tools/virtiofsd/fuse_lowlevel.c
> > @@ -1439,7 +1439,9 @@ static void do_setxattr(fuse_req_t req, fuse_ino_t nodeid,
> >      }
> >  
> >      if (req->se->op.setxattr) {
> > -        req->se->op.setxattr(req, nodeid, name, value, arg->size, arg->flags);
> > +        uint32_t setxattr_flags = setxattr_ext ? arg->setxattr_flags : 0;
> > +        req->se->op.setxattr(req, nodeid, name, value, arg->size, arg->flags,
> > +                             setxattr_flags);
> >      } else {
> >          fuse_reply_err(req, ENOSYS);
> >      }
> > @@ -1986,6 +1988,9 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
> >      if (arg->flags & FUSE_HANDLE_KILLPRIV_V2) {
> >          se->conn.capable |= FUSE_CAP_HANDLE_KILLPRIV_V2;
> >      }
> > +    if (arg->flags & FUSE_SETXATTR_EXT) {
> > +        se->conn.capable |= FUSE_CAP_SETXATTR_EXT;
> > +    }
> >  #ifdef HAVE_SPLICE
> >  #ifdef HAVE_VMSPLICE
> >      se->conn.capable |= FUSE_CAP_SPLICE_WRITE | FUSE_CAP_SPLICE_MOVE;
> > @@ -2121,6 +2126,10 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
> >          outarg.flags |= FUSE_HANDLE_KILLPRIV_V2;
> >      }
> >  
> > +    if (se->conn.want & FUSE_CAP_SETXATTR_EXT) {
> > +        outarg.flags |= FUSE_SETXATTR_EXT;
> > +    }
> > +
> >      fuse_log(FUSE_LOG_DEBUG, "   INIT: %u.%u\n", outarg.major, outarg.minor);
> >      fuse_log(FUSE_LOG_DEBUG, "   flags=0x%08x\n", outarg.flags);
> >      fuse_log(FUSE_LOG_DEBUG, "   max_readahead=0x%08x\n", outarg.max_readahead);
> > diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowlevel.h
> > index 3bf786b034..4b4e8c9724 100644
> > --- a/tools/virtiofsd/fuse_lowlevel.h
> > +++ b/tools/virtiofsd/fuse_lowlevel.h
> > @@ -798,7 +798,8 @@ struct fuse_lowlevel_ops {
> >       *   fuse_reply_err
> >       */
> >      void (*setxattr)(fuse_req_t req, fuse_ino_t ino, const char *name,
> > -                     const char *value, size_t size, int flags);
> > +                     const char *value, size_t size, int flags,
> > +                     uint32_t setxattr_flags);
> >  
> >      /**
> >       * Get an extended attribute
> > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > index ec91b3c133..9f5cd98fb5 100644
> > --- a/tools/virtiofsd/passthrough_ll.c
> > +++ b/tools/virtiofsd/passthrough_ll.c
> > @@ -2955,7 +2955,8 @@ out:
> >  }
> >  
> >  static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
> > -                        const char *value, size_t size, int flags)
> > +                        const char *value, size_t size, int flags,
> > +                        uint32_t extra_flags)
> >  {
> >      char procname[64];
> >      const char *name;
> > -- 
> > 2.25.4
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 


