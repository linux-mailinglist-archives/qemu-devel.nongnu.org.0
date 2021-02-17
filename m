Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1984231DA85
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 14:33:39 +0100 (CET)
Received: from localhost ([::1]:57766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCMxV-0005ZQ-Tx
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 08:33:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lhenriques@suse.de>)
 id 1lCJBb-0000Nr-42
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 04:31:55 -0500
Received: from mx2.suse.de ([195.135.220.15]:48730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lhenriques@suse.de>)
 id 1lCJBZ-00019A-I0
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 04:31:54 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AB76DB131;
 Wed, 17 Feb 2021 09:31:50 +0000 (UTC)
Received: from localhost (brahms [local])
 by brahms (OpenSMTPD) with ESMTPA id 5a080ecb;
 Wed, 17 Feb 2021 09:32:53 +0000 (UTC)
From: Luis Henriques <lhenriques@suse.de>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 0/3] virtiofsd: Add options to enable/disable posix acl
References: <20210216233611.33400-1-vgoyal@redhat.com>
Date: Wed, 17 Feb 2021 09:32:53 +0000
In-Reply-To: <20210216233611.33400-1-vgoyal@redhat.com> (Vivek Goyal's message
 of "Tue, 16 Feb 2021 18:36:08 -0500")
Message-ID: <87zh03hwe2.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.15; envelope-from=lhenriques@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 17 Feb 2021 08:29:52 -0500
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
 stefanha@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vivek Goyal <vgoyal@redhat.com> writes:

> Luis Henriques reported that fstest generic/099 fails with virtiofs.
> Little debugging showed that we don't enable acl support. So this
> patch series provides option to enable/disable posix acl support. By
> default it is disabled.
>
> I have run blogbench and pjdfstests with posix acl enabled and
> things work fine. 
>
> Luis, can you please apply these patches, and run virtiofsd with
> "-o posix_acl" and see if it fixes the failure you are seeing. I
> ran the steps you provided manually and it fixes the issue for
> me.

Awesome, thanks for looking into this.  I'll have a look and test these
patches.  I expect to be able to report back later today.

Cheers,
-- 
Luis


>
> Vivek Goyal (3):
>   virtiofsd: Add an option to enable/disable posix acls
>   virtiofsd: Add umask to seccom allow list
>   virtiofsd: Change umask if posix acls are enabled
>
>  tools/virtiofsd/passthrough_ll.c      | 45 +++++++++++++++++++++++----
>  tools/virtiofsd/passthrough_seccomp.c |  1 +
>  2 files changed, 40 insertions(+), 6 deletions(-)
>
> -- 
> 2.25.4
>

