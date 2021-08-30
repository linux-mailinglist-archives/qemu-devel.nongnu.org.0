Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CB83FB9D1
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 18:08:39 +0200 (CEST)
Received: from localhost ([::1]:33450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKjpu-00063s-4G
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 12:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mKjnJ-0003fz-Pl
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 12:05:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mKjnE-0005k7-VE
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 12:05:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630339551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=an4avCciK6eY7SmEjjABpABrddr2nqIpE4xodLP3828=;
 b=V9Ho+216sQN9xZIZusJqoExCiQFoTLt/d+Dd5G5uDlYBSDKhPiHJNs6Fl7boxbGgQBZS3j
 vrCNakGwQbc8gbtRbloKVR0Ea4AIIYLk4ZzQ5oY04F22bEryc6Cacf41aGUNyJT8N3km/U
 9JnbVwAK3D0wF5wL0SqLrrqHOqRqUqE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-svpINaxAMsiZGHJUOsJ8Fg-1; Mon, 30 Aug 2021 12:05:48 -0400
X-MC-Unique: svpINaxAMsiZGHJUOsJ8Fg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9AAF760C0;
 Mon, 30 Aug 2021 16:05:46 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54E245D9F4;
 Mon, 30 Aug 2021 16:05:37 +0000 (UTC)
Date: Mon, 30 Aug 2021 11:05:35 -0500
From: "eblake@redhat.com" <eblake@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH 1/2] storage-daemon: add opt to print when initialized
Message-ID: <20210830160535.e65icwcf4bbvq333@redhat.com>
References: <20210827164954.13951-1-raphael.norwitz@nutanix.com>
 <20210827185148.m6lvdrceygr6iz6y@redhat.com>
 <20210830155611.GA23709@raphael-debian-dev>
MIME-Version: 1.0
In-Reply-To: <20210830155611.GA23709@raphael-debian-dev>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 30, 2021 at 03:56:16PM +0000, Raphael Norwitz wrote:
> On Fri, Aug 27, 2021 at 01:51:48PM -0500, eblake@redhat.com wrote:
> > On Fri, Aug 27, 2021 at 04:50:35PM +0000, Raphael Norwitz wrote:
> > > This change adds a command line option to print a line to standard out
> > > when the storage daemon has completed initialization and is ready to
> > > serve client connections.
> > > 
> > > This option will be used to resolve a hang in the vhost-user-blk-test.
> >  
> > Doesn't the existing --pidfile already serve the same job?  That is,
> > why not fix vhost-user-blk-test to take advantage of the pid-file
> > creation rather than output to stdout as evidence of when the storage
> > daemon is up and running?
> > 
> > Therefore, I don't think we need this patch.
> >
> 
> Sure - that make sense. I didn't use the pid-file because I didn't want to
> risk leaving junk on the filesystem if the storage-daemon crashed.

Ideally, storage-daemon doesn't crash during the test.  But even if it
does, we should still be able to register which files will be cleaned
up while exiting the test (if they exist), regardless of whether the
test succeeded or failed, because we have control over the pidfile
name before starting storage-daemon.  Put another way, the task of
cleaning up a pidfile during a test should not be a show-stopper.

[Side note: A long time ago, there were patches submitted to make the
iotests ./check engine run EVERY test in its own subdirectory, so that
cleaning up all files created by the test was trivial: nuke the
directory.  It also has the benefit that for debugging a failing test,
you merely pass an option to ./check that says to not nuke the
directory.  But it did not get applied at the time, and we have had
enough changes in the meantime that reinstating such a useful patch
would basically be work from scratch at this point]

> 
> I'll send a V2 using pid-file without this change.

Thanks, looking forward to it.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


