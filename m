Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4156131DBEB
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 16:09:34 +0100 (CET)
Received: from localhost ([::1]:56946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCOSL-0000Ru-3z
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 10:09:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lCOQR-00084j-Fp
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 10:07:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lCOQP-0006OM-De
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 10:07:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613574452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EtwpQHjWWAasxGKEcM7GUWplSkAB49xApVy3n5SO49U=;
 b=Hk4ThWPtCE7ClPVI1fv1/HcPKNs5CSGn1MG02hAoC18Nv0zllx5lOcKi0cMI+q/yRIGrZ2
 r8Cqnq0b19jK+ZPxbRe8ErGgcwqi/v4+iGbJuqR/2zZZqAGA8sCsJ/Tn8CukLTjnqoRmCF
 uVjtwYPqk6jU825KXMrgy5CmUPKOUSg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-ZVsvJSqZPwqbnDnedSqJFw-1; Wed, 17 Feb 2021 10:07:30 -0500
X-MC-Unique: ZVsvJSqZPwqbnDnedSqJFw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43615801975;
 Wed, 17 Feb 2021 15:07:28 +0000 (UTC)
Received: from horse.redhat.com (ovpn-114-123.rdu2.redhat.com [10.10.114.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A502719D6C;
 Wed, 17 Feb 2021 15:07:21 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 3707A220BCF; Wed, 17 Feb 2021 10:07:21 -0500 (EST)
Date: Wed, 17 Feb 2021 10:07:21 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [PATCH 1/3] virtiofsd: Add an option to enable/disable posix acls
Message-ID: <20210217150721.GB31184@redhat.com>
References: <20210216233611.33400-1-vgoyal@redhat.com>
 <20210216233611.33400-2-vgoyal@redhat.com>
 <CAJfpegspJGL_W+8zaXyHfuAhtB_Q7V0YyOZJEhpCd=KaL_W71A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJfpegspJGL_W+8zaXyHfuAhtB_Q7V0YyOZJEhpCd=KaL_W71A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs-list <virtio-fs@redhat.com>, Luis Henriques <lhenriques@suse.de>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 17, 2021 at 09:53:04AM +0100, Miklos Szeredi wrote:
> On Wed, Feb 17, 2021 at 12:36 AM Vivek Goyal <vgoyal@redhat.com> wrote:
> >
> > fuse has an option FUSE_POSIX_ACL which needs to be opted in by fuse
> > server to enable posix acls.
> >
> > Add virtiofsd option "-o posix_acl/no_posix_acl" to let users enable/disable
> > posix acl support. By default it is disabled as of now.
> 
> If I read the code correctly, then no_posix_acl will still result in
> system.posix_acl_* xattr ops being passed through to virtiofsd, which
> will forward them to the underlying fs, resulting in posix acls
> appearing to work, but doing so incorrectly (i.e. no change from
> previous behavior).

Yes, and this is confuing me a lot. fuse server has not indicated
support for POSIX_ACL, still user can get and set ACLs. fuse_xattr_get()
and fuse_xattr_set() must be kicking in.

I do see that we have fuse_no_acl_xattr_handlers and that should
be able to block setting/getting acls if acl support is not there
but we register it only if we are not mounted in init_user_ns.

        if (sb->s_user_ns != &init_user_ns)
                sb->s_xattr = fuse_no_acl_xattr_handlers;

So question is, should fuse client be fixed as well to block setting
and getting acls if fuse server does not support ACL? Or we now need
to keep it around for backward compatibility.

> Possibly better would be to have three different
> modes of operation:
> 
> 1) no option: default fall back to broken acl support for backward
> compat (this could be removed in the future)

What about FUSE_DONT_MASK in this mode. ACLs are not enabled but
user can get/set these. Should that mean we still honor default
acl and not apply umask?

Probably I should opt for FUSE_DONT_MASK only if posix_acl support is
enabled. Given this does not work even today (atleast for virtiofs), so
it is not a backward compatibility issue. And its confusing anyway.

> 2) no_posix_acl: really disable acl support

That is block getting and setting system.posix_acl xattr. Will do that.
I think we will have to block it even if somebody has remapped xattrs
in virtiofsd.

> 3) posix_acl: enable proper acl support

Thanks
Vivek

> 
> Thanks,
> Miklos
> 


