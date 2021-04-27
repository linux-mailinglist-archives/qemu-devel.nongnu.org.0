Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 008A136C603
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 14:23:17 +0200 (CEST)
Received: from localhost ([::1]:35632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbMkF-0003Qt-VI
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 08:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1lbMeJ-00019T-C8
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 08:17:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1lbMeF-00032n-AU
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 08:17:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619525822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FI5gnLUGx4SM6NhvqUteUNXb+eT2jWJAvbRatIFE83A=;
 b=GAkDEg02mQiW7+8yfuLhgR//wSYvDduIidHdr1l8kF6rLZFfIK09QW9CbzpwJO4Gcg0BSR
 cvKdY/9FDed7ZL3d+SpsZVN4AznW2xRdD6Zas7XhmtMcL/3YLZiEMfPpxRDKfGwweLJSFs
 0T/MumFWZHZ4JrzcRQ/D0OtLqoVz/RE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-MR1VgUw2NZyQubgwFsKIYA-1; Tue, 27 Apr 2021 08:16:58 -0400
X-MC-Unique: MR1VgUw2NZyQubgwFsKIYA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49B2B801B1A;
 Tue, 27 Apr 2021 12:16:57 +0000 (UTC)
Received: from paraplu.home (ovpn-114-203.ams2.redhat.com [10.36.114.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D6935946B;
 Tue, 27 Apr 2021 12:16:50 +0000 (UTC)
Date: Tue, 27 Apr 2021 14:16:47 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH] qapi: deprecate drive-backup
Message-ID: <20210427121647.GA3746000@paraplu.home>
References: <20210423125900.3640-1-vsementsov@virtuozzo.com>
 <9a0e7805-c6ae-b55f-431c-4c61a1ab746e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <9a0e7805-c6ae-b55f-431c-4c61a1ab746e@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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
Cc: kwolf@redhat.com, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, libvir-list@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, pkrempa@redhat.com,
 nshirokovskiy@virtuozzo.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 26, 2021 at 01:34:17PM -0400, John Snow wrote:
> On 4/23/21 8:59 AM, Vladimir Sementsov-Ogievskiy wrote:
> > Modern way is using blockdev-add + blockdev-backup, which provides a
> > lot more control on how target is opened.

[...]

> 1) Let's add a sphinx reference to
> https://qemu-project.gitlab.io/qemu/interop/live-block-operations.html#live-disk-backup-drive-backup-and-blockdev-backup
> 
> 
> 2) Just a thought, not a request: We also may wish to update
> https://qemu-project.gitlab.io/qemu/interop/bitmaps.html to use the
> new, preferred method. However, this doc is a bit old and is in need
> of an overhaul anyway (Especially to add the NBD pull workflow.) Since
> the doc is in need of an overhaul anyway, can we ask Kashyap to help
> us here, if he has time?

Yes, I should be able to make time and help here; been putting it off on
the back burner.  Thanks for the reminder.  :) I'd like to update both
these:

    https://qemu-project.gitlab.io/qemu/interop/bitmaps.html
    https://qemu-project.gitlab.io/qemu/interop/live-block-operations.html

Both of them, as you know, refer to 'drive-backup'.  They also need
other adjustments / additions.  Also perhaps break the larger doc into a
couple of smaller ones.

I'll start working on it the end of this week.  First I need to tinker
with some of the recent improvements to refresh my memory and get a
sense of the modifications involved.  So please bear with me.

> 3) Let's add a small explanation here that outlines the differences in
> using these two commands. Here's a suggestion:
> 
> This change primarily separates the creation/opening process of the
> backup target with explicit, separate steps. BlockdevBackup uses
> mostly the same arguments as DriveBackup, except the "format" and
> "mode" options are removed in favor of using explicit
> "blockdev-create" and "blockdev-add" calls.
> 
> The "target" argument changes semantics. It no longer accepts
> filenames, and will now additionally accept arbitrary node names in
> addition to device names.

Yeah; this is something I had figure out by some trial-and-error when I
was playing with it in the past.

> 4) Also not a request: If we want to go above and beyond, it might be nice
> to spell out the exact steps required to transition from the old interface
> to the new one. Here's a (hasty) suggestion for how that might look:
> 
> - The MODE argument is deprecated.
>   - "existing" is replaced by using "blockdev-add" commands.
>   - "absolute-paths" is replaced by using "blockdev-add" and
>     "blockdev-create" commands.
> 
> - The FORMAT argument is deprecated.
>   - Format information is given to "blockdev-add"/"blockdev-create".
> 
> - The TARGET argument has new semantics:
>   - Filenames are no longer supported, use blockdev-add/blockdev-create
>     as necessary instead.
>   - Device targets remain supported.

Agreed; docs like these can be useful for management tools that rely on
the old behaviour and are not as up-to-date as libvirt in keeping track
of QEMU developments.

[...]

-- 
/kashyap


