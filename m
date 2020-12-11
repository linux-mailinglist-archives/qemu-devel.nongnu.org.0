Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 902A42D78CF
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:08:14 +0100 (CET)
Received: from localhost ([::1]:56038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knk1l-00033U-Ja
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:08:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1knk0C-0001uf-F2
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:06:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1knk09-0007v1-4p
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:06:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607699191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AMyOQ/SQr1ylYm5dL7mzpknuvUVVtyg3g7QaEdmNMR4=;
 b=OjNKDSKoU9ztIiDgrvyquqherKk2av7pwVqWeNm0CvmnOs4FcE1snwLLDZsp22c+IkBB3r
 5qid4CBBmyvugi0aqz0QZGPTQPWeWWAkY/kU+CLHjBDkIN/3xemco4F3nAI2pHF0Apgu7C
 TV2goTWYZQaG73KZ8B7aSssoNqq+04w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-oYpHdVuHP9CZd3yH5MBn0w-1; Fri, 11 Dec 2020 10:06:29 -0500
X-MC-Unique: oYpHdVuHP9CZd3yH5MBn0w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C3E71009471;
 Fri, 11 Dec 2020 15:06:28 +0000 (UTC)
Received: from horse.redhat.com (ovpn-115-237.rdu2.redhat.com [10.10.115.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7C361992D;
 Fri, 11 Dec 2020 15:06:24 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 71E5C220BCF; Fri, 11 Dec 2020 10:06:24 -0500 (EST)
Date: Fri, 11 Dec 2020 10:06:24 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: ceph + freeipa ubuntu/fedora common small bug
Message-ID: <20201211150624.GC3285@redhat.com>
References: <20201207183021.22752-1-vgoyal@redhat.com>
 <20201207183021.22752-4-vgoyal@redhat.com>
 <20201210200303.GN3629@work-vm>
 <20201210200931.GA185111@redhat.com>
 <97a0de57-8422-2fdc-e16e-0d6f133f615c@gmail.com>
 <20201211110522.GB3380@work-vm>
MIME-Version: 1.0
In-Reply-To: <20201211110522.GB3380@work-vm>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, "Harry G. Coin" <hgcoin@gmail.com>, lersek@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 11, 2020 at 11:05:22AM +0000, Dr. David Alan Gilbert wrote:
> * Harry G. Coin (hgcoin@gmail.com) wrote:
> > FYI.  Same thing we saw on Fedora installing freeipa, this on ubuntu
> > with ceph.  Identical bitmask report.
> > 
> > ...
> > 
> > Fixing /var/run/ceph ownership....done
> > 
> > Cannot set file attribute for '/var/log/journal', value=0x00800000,
> > mask=0x00800000, ignoring: Function not implemented
> > 
> > Cannot set file attribute for
> > '/var/log/journal/fd007229322043ad8778c214d19ed3ac', value=0x00800000,
> > mask=0x00800000, ignoring: Function not implemented
> 
> This looks like it comes out of systemd's  src/tmpfiles/tmpfiles.c:
> 
>         r = chattr_fd(procfs_fd, f, item->attribute_mask, NULL);
>         if (r < 0)
>                 log_full_errno(IN_SET(r, -ENOTTY, -EOPNOTSUPP) ? LOG_DEBUG : LOG_WARNING,
>                                r,
>                                "Cannot set file attribute for '%s', value=0x%08x, mask=0x%08x, ignoring: %m",
>                                path, item->attribute_value, item->attribute_mask);
> 
> and it's chattr_fd is in it's src/basic/chattr-util.c
> which is using FS_IOC_GET/SETFLAGS, which seems to be an older
> way of doing things.
> 
> Now, is that supposed to promote itself to a newer call or is it OK?

I see that we don't have any ->ioctl function registered in
passthrough_ll.c and that's why do_ioctl() (fuse_lowlevel.c) will
return -ENOSYS.

So we probably need to modify passthrough_ll.c to support some select
ioctls. Right now it looks like all fs ioctls will return -ENOSYS.

I tried "chattr +i foo.txt" and that return -ENOSYS as well.

Vivek


