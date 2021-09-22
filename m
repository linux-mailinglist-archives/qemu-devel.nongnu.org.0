Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F2241491A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 14:38:51 +0200 (CEST)
Received: from localhost ([::1]:34614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT1WU-0004i4-Ni
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 08:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mT1ON-0004oS-Be
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:30:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mT1OJ-0007E1-0r
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:30:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632313820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jxYBomOSutjGd4VUrWwmss+Iqr0DKxw9CJsdofGJXFo=;
 b=cweUPWWIuU7fYCFWr6MxiVAcw0pIZogfOt/4kh9ytpYb2OFJOKh4WcU5RmqWwNhA8Vxa3p
 Apz79u0Ja+yig+xm8TlwjvdkCksAuf8AzwIF1US0ElWbjXn9m9SSiDD7tT3C4kDjj8pJCY
 1jGNZKYXNsbCed5SVR5fHP6QQo5RjTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-0EPz-w6NNquGCy7dFha9AA-1; Wed, 22 Sep 2021 08:30:19 -0400
X-MC-Unique: 0EPz-w6NNquGCy7dFha9AA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B5A719067E7
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 12:30:19 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.9.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDF2E19C79;
 Wed, 22 Sep 2021 12:30:18 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 5F301222E4F; Wed, 22 Sep 2021 08:30:18 -0400 (EDT)
Date: Wed, 22 Sep 2021 08:30:18 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 0/2] virtiofsd: Add capability to block xattrs
Message-ID: <YUsh2s/oJhVCLpoL@redhat.com>
References: <20210826211937.317558-1-vgoyal@redhat.com>
 <YUsMwfZI3sQyT/Rj@work-vm>
MIME-Version: 1.0
In-Reply-To: <YUsMwfZI3sQyT/Rj@work-vm>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Sep 22, 2021 at 12:00:17PM +0100, Dr. David Alan Gilbert wrote:
> * Vivek Goyal (vgoyal@redhat.com) wrote:
> > As of now we have a knob "-o xattr/no_xattr" which either enables
> > all xattrs or disables all xattrs.
> 
> Hi Vivek,
>   Thanks for this.
> 
> > We need something more fine grained where we can selectively disable
> > only certain xattrs (and not all).
> > 
> > For example, in some cases we want to disable "security.selinux"
> > xattr. This is equivalent to virtiofs not supporting security.selinux
> > and guest kernel will fallback to a single label for whole fs
> > (virtiofs_t).
> > 
> > So add an option "-o block_xattr=<list-of-xattrs>" which will allow
> > specifying a list of xattrs to block.
> 
> This is quite interesting; I'd not noticed you had the exisitng blocking
> mechanism,

Yes, that's for blocking posix acl xattrs if needed. If xattr map
support blocking, then we could probably insert an internal rule
to block posix acl xattrs. But that's more of a cleanup exercise
I will take up some other time.

> however, as discussed, I think my preference is if this could
> be done as a modification of the xattrmap it would avoid another set of
> options.
> 
> The mapping code already has 'type's of:
> 
>   prefix, ok, bad
> 
> I think you just need to add a 'reject' type
> that produces the error code you need.

How about "unsupported" and then return -EOPNOTSUPP? 

I am looking at selinux kernel code and it expect -EOPNOTSUPP to decide
that selinux xattr is not supported and looks into fallback options.

static int sb_check_xattr_support(struct super_block *sb)
{
        rc = __vfs_getxattr(root, root_inode, XATTR_NAME_SELINUX, NULL, 0);
        if (rc < 0 && rc != -ENODATA) {
                if (rc == -EOPNOTSUPP) {
                        pr_warn("SELinux: (dev %s, type %s) has no security xattr handler\n",
                                sb->s_id, sb->s_type->name);
                        goto fallback;
...
...
}

Vivek


