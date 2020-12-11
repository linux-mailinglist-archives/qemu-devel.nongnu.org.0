Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E6A2D747B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 12:07:12 +0100 (CET)
Received: from localhost ([::1]:37178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kngGV-0006ix-6F
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 06:07:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kngF0-0005lH-37
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 06:05:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kngEw-0004ss-Ro
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 06:05:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607684732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TuqqMNd6KdgWXzXrH/uSeC2TGNixtjOSNF9kl58w+MU=;
 b=ZUjfmmmUp3K7YkIjgn6GN/oRc53Itbssw3DOEl54hAv2w5BcsAFCBU00kTn293WoA3fOQp
 0D4kQ5KEhnzZ63vi53t7seslw25gmar2oIXtnh3brQq1AowNlGlCTcv6QVdM6ZkxctS9wu
 Nlk0IbyYtToDslAmNpaiWK8MvdB9+iA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-OgAyxmltPJ-vwL28nRW5gg-1; Fri, 11 Dec 2020 06:05:30 -0500
X-MC-Unique: OgAyxmltPJ-vwL28nRW5gg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5F4315723;
 Fri, 11 Dec 2020 11:05:29 +0000 (UTC)
Received: from work-vm (ovpn-113-63.ams2.redhat.com [10.36.113.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 799956F992;
 Fri, 11 Dec 2020 11:05:25 +0000 (UTC)
Date: Fri, 11 Dec 2020 11:05:22 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Harry G. Coin" <hgcoin@gmail.com>
Subject: Re: ceph + freeipa ubuntu/fedora common small bug
Message-ID: <20201211110522.GB3380@work-vm>
References: <20201207183021.22752-1-vgoyal@redhat.com>
 <20201207183021.22752-4-vgoyal@redhat.com>
 <20201210200303.GN3629@work-vm>
 <20201210200931.GA185111@redhat.com>
 <97a0de57-8422-2fdc-e16e-0d6f133f615c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <97a0de57-8422-2fdc-e16e-0d6f133f615c@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, lersek@redhat.com, qemu-devel@nongnu.org,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Harry G. Coin (hgcoin@gmail.com) wrote:
> FYI.  Same thing we saw on Fedora installing freeipa, this on ubuntu
> with ceph.  Identical bitmask report.
> 
> ...
> 
> Fixing /var/run/ceph ownership....done
> 
> Cannot set file attribute for '/var/log/journal', value=0x00800000,
> mask=0x00800000, ignoring: Function not implemented
> 
> Cannot set file attribute for
> '/var/log/journal/fd007229322043ad8778c214d19ed3ac', value=0x00800000,
> mask=0x00800000, ignoring: Function not implemented

This looks like it comes out of systemd's  src/tmpfiles/tmpfiles.c:

        r = chattr_fd(procfs_fd, f, item->attribute_mask, NULL);
        if (r < 0)
                log_full_errno(IN_SET(r, -ENOTTY, -EOPNOTSUPP) ? LOG_DEBUG : LOG_WARNING,
                               r,
                               "Cannot set file attribute for '%s', value=0x%08x, mask=0x%08x, ignoring: %m",
                               path, item->attribute_value, item->attribute_mask);

and it's chattr_fd is in it's src/basic/chattr-util.c
which is using FS_IOC_GET/SETFLAGS, which seems to be an older
way of doing things.

Now, is that supposed to promote itself to a newer call or is it OK?

Dave

> ...
> 
> Host has xattrs on, btrfs.
> 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


