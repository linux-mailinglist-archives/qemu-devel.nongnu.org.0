Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 715662003E6
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 10:29:31 +0200 (CEST)
Received: from localhost ([::1]:49786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmCOw-0001hx-HO
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 04:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jmCNZ-0001HA-D2
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 04:28:05 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:27994
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jmCNW-0003G2-Rv
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 04:28:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592555281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tIFtivP24xj2BSDTJADXbSAsOUZQkPz1t0pC66IpN9c=;
 b=cMrPpua8StHN6/S5HMZa7pHj1qkni3iTVa/P7vaxFUBhafRcC4zqEQ2S2IOgskqXJavJOB
 zb8Kr6ozb23/KmtuU8jd0ZJrz8jb59oZjzal6vL1wK6WNZGWPvJfZp2PBB8x6racRo467M
 bsmCmVht3Sus/PhoGjDGuFCqRoZ2pxE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-Jsr8U1JxPwedBVrP4wsGYA-1; Fri, 19 Jun 2020 04:27:57 -0400
X-MC-Unique: Jsr8U1JxPwedBVrP4wsGYA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BE85EC1A0;
 Fri, 19 Jun 2020 08:27:56 +0000 (UTC)
Received: from work-vm (ovpn-114-215.ams2.redhat.com [10.36.114.215])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2D765BAC3;
 Fri, 19 Jun 2020 08:27:48 +0000 (UTC)
Date: Fri, 19 Jun 2020 09:27:46 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [Virtio-fs] [PATCH 0/2] virtiofsd: drop Linux capabilities(7)
Message-ID: <20200619082746.GA2690@work-vm>
References: <20200416164907.244868-1-stefanha@redhat.com>
 <20200618190816.GD3814@redhat.com> <20200618191655.GI2769@work-vm>
 <20200618192717.GE3814@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200618192717.GE3814@redhat.com>
User-Agent: Mutt/1.14.0 (2020-05-02)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 02:45:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Stefan Hajnoczi <stefanha@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> On Thu, Jun 18, 2020 at 08:16:55PM +0100, Dr. David Alan Gilbert wrote:
> > * Vivek Goyal (vgoyal@redhat.com) wrote:
> > > On Thu, Apr 16, 2020 at 05:49:05PM +0100, Stefan Hajnoczi wrote:
> > > > virtiofsd doesn't need of all Linux capabilities(7) available to root.  Keep a
> > > > whitelisted set of capabilities that we require.  This improves security in
> > > > case virtiofsd is compromised by making it hard for an attacker to gain further
> > > > access to the system.
> > > 
> > > Hi Stefan,
> > > 
> > > I just noticed that this patch set breaks overlayfs on top of virtiofs.
> > > 
> > > overlayfs sets "trusted.overlay.*" and xattrs in trusted domain
> > > need CAP_SYS_ADMIN.
> > > 
> > > man xattr says.
> > > 
> > >    Trusted extended attributes
> > >        Trusted  extended  attributes  are  visible and accessible only to pro‐
> > >        cesses that have the  CAP_SYS_ADMIN  capability.   Attributes  in  this
> > >        class are used to implement mechanisms in user space (i.e., outside the
> > >        kernel) which keep information in extended attributes to which ordinary
> > >        processes should not have access.
> > > 
> > > There is a chance that overlay moves away from trusted xattr in future.
> > > But for now we need to make it work. This is an important use case for
> > > kata docker in docker build.
> > > 
> > > May be we can add an option to virtiofsd say "--add-cap <capability>" and
> > > ask user to pass in "--add-cap cap_sys_admin" if they need to run daemon
> > > with this capaibility.
> > 
> > I'll admit I don't like the idea of giving it cap_sys_admin.
> > Can you explain:
> >   a) What overlayfs uses trusted for?
> 
> overlayfs stores bunch of metadata and uses "trusted" xattrs for it.

Tell me more about this metadata.
Taking a juicy looking one, what does OVL_XATTR_REDIRECT do?
Or what happens if I was to write random numbers into OVL_XATTR_NLINK?

> >   b) If something nasty was to write junk into the trusted attributes,
> >     what would happen?
> 
> This directory is owned by guest. So it should be able to write
> anything it wants, as long as process in guest has CAP_SYS_ADMIN, right?

Well, we shouldn't be able to break/crash/escape into the host; how
much does overlayfs validate trusted.* it uses?

> >   c) I see overlayfs has a fallback check if xattr isn't supported at
> > all - what is the consequence?
> 
> It falls back to I think read only mode. 

It looks like the fallback is more subtle to me:
        /*
         * Check if upper/work fs supports trusted.overlay.* xattr
         */
        err = ovl_do_setxattr(ofs->workdir, OVL_XATTR_OPAQUE, "0", 1, 0);
        if (err) {
                ofs->noxattr = true;
                ofs->config.index = false;
                ofs->config.metacopy = false;
                pr_warn("upper fs does not support xattr, falling back to index=off and metacopy=off.\n");

but I don't know what index and metacopy are.

> For a moment forget about overlayfs. Say a user process in guest with
> CAP_SYS_ADMIN is writing trusted.foo. Should that succeed? Is a
> passthrough filesystem, so it should go through. But currently it
> wont.

As long as any effects of what it writes are contained to the area of
the filesystem exposed to the guest, yes - however it worries me what
the consequences of broken trusted metadata is.  If it's delicate enough
that it's guarded by CAP_SYS_ADMIN someone must have worried about it.

Dave

> Thanks
> Vivek
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


