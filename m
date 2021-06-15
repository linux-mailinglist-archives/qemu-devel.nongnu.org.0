Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEB53A8649
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:20:58 +0200 (CEST)
Received: from localhost ([::1]:56460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBo9-0007GP-9L
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ltBLE-0007LG-FT
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:51:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ltBL8-00047R-V3
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:51:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623772257;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SOcE1dUkhDap1K2YzOd7qBVXlPmOvF+WIO4UpnJdnpE=;
 b=XuGC6974ezQPOM0v/WU152vQLzuIdUjIliAp1Z3yO0NwBOJqoojQrBpbQM8A161qHkNa6z
 OOwtLEFwgd+Sir361k2aoPOMgnG6TDBYhLW3pQzGNjObd7W4np9lJ/fKTU30KfVjwdQgTN
 lYmDWVnLBhC77I+1Y0swQDcBFxmIsg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-BWzbkQ-5PryOkz_N0XcBGQ-1; Tue, 15 Jun 2021 11:50:55 -0400
X-MC-Unique: BWzbkQ-5PryOkz_N0XcBGQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D5858049C5
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 15:50:54 +0000 (UTC)
Received: from redhat.com (ovpn-115-226.ams2.redhat.com [10.36.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76AC860C13;
 Tue, 15 Jun 2021 15:50:53 +0000 (UTC)
Date: Tue, 15 Jun 2021 16:50:50 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 15/26] meson: sort header tests
Message-ID: <YMjMWr9FwIIY3Szy@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
 <20210608112301.402434-16-pbonzini@redhat.com>
 <YMi9kmqPiXVZKSir@redhat.com>
 <80f8b227-343b-3693-aed3-7f9c09bb7acc@redhat.com>
MIME-Version: 1.0
In-Reply-To: <80f8b227-343b-3693-aed3-7f9c09bb7acc@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 15, 2021 at 05:16:48PM +0200, Paolo Bonzini wrote:
> On 15/06/21 16:47, Daniel P. Berrangé wrote:
> > On Tue, Jun 08, 2021 at 01:22:50PM +0200, Paolo Bonzini wrote:
> > > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > > ---
> > >   meson.build | 7 ++++---
> > >   1 file changed, 4 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/meson.build b/meson.build
> > > index 28825dec18..5fdb757751 100644
> > > --- a/meson.build
> > > +++ b/meson.build
> > > @@ -1258,16 +1258,17 @@ config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0]
> > >   config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
> > >   config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2])
> > > +config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
> > > +
> > >   config_host_data.set('HAVE_BTRFS_H', cc.has_header('linux/btrfs.h'))
> > >   config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
> > >   config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
> > > +config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
> > >   config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
> > >   config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
> > > -config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
> > > -config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
> > > -config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
> > >   config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
> > > +config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
> > 
> > Was tis supposde to be sorting based on header name or cpp macro name ?
> > 
> > Either way, IIUC, this is in the wrong place because "HAVE_SYSTEM"
> > would be before CONFIG_PREADV, and stdlib.h is before sys/uio.h
> 
> Based on macro name.  HAVE_SYSTEM_FUNCTION is sorted after CONFIG_PREADV
> among the users of has_function.  I'll explain this better in the commit
> message.

Oh, so you're attempting to group the checks first by 'has_header'
and 'has_function', and then alpha based on macro name within the
group.


Probably worth putting comments inline in the meson.build explicitly
marking the start of each group of checks. Future people modifying
the file won't look at the commit message and are going to find it
hard to figure out the sorting used without inline comment hints

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


