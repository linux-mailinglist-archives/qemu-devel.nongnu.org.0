Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F107368F09
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 10:45:10 +0200 (CEST)
Received: from localhost ([::1]:44926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZrQz-0002Dv-EE
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 04:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lZrGz-0001VU-9Y
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 04:34:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lZrGv-0001eQ-7K
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 04:34:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619166884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rdf+H+Dx0vLnVGXw6GVeDkjQ/8rA61r64h8Xk6zvwwo=;
 b=e8Zh3ar5x5uPyDxFAAvAIqlI59TExi+90qsDv6K6+awicQzXIFQCFXQGz0ts1MavlAeQGu
 qp4G4Fq4fHQ+bBC/v9C6JObOwKsdu3xosgWQLwNyegq6ChMaGcid6MTKJR2uzjOzAJa2Ip
 7ghY7aNfUfaLpfejuKJ7Nnipjj2C9kk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-VPZONCdHMCe3UmIhf0C76g-1; Fri, 23 Apr 2021 04:34:41 -0400
X-MC-Unique: VPZONCdHMCe3UmIhf0C76g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3332610054F6;
 Fri, 23 Apr 2021 08:34:39 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-199.ams2.redhat.com [10.36.114.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 027BB19C71;
 Fri, 23 Apr 2021 08:34:33 +0000 (UTC)
Date: Fri, 23 Apr 2021 10:34:32 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 00/36] block: update graph permissions update
Message-ID: <YIKGmAefKhdr8tv1@merkur.fritz.box>
References: <161599451628.29996.16299734673859684875@c9d4d6fbb2f1>
 <dba437c7-dea7-5675-9b88-b72ecca561ee@virtuozzo.com>
 <80051665-bcbc-1d6e-a0fc-02da172f6a21@redhat.com>
 <6c56b00c-3b5e-d5d2-e584-75073171c320@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <6c56b00c-3b5e-d5d2-e584-75073171c320@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: fam@euphon.net, qemu-block@nongnu.org, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.03.2021 um 09:04 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 17.03.2021 20:33, Eric Blake wrote:
> > On 3/17/21 10:38 AM, Vladimir Sementsov-Ogievskiy wrote:
> > 
> > > > 6/36 Checking commit 5780b805277e (block: drop ctx argument from
> > > > bdrv_root_attach_child)
> > > > 7/36 Checking commit 68189c099a3a (block: make bdrv_reopen_{prepare,
> > > > commit, abort} private)
> > > > ERROR: Author email address is mangled by the mailing list
> > > > #2:
> > > > Author: Vladimir Sementsov-Ogievskiy via <qemu-devel@nongnu.org>
> > > > 
> > > 
> > > Who know what is it? Commit message, subject and "From:" header are
> > > clean in the email..
> > 
> > The list mangles mails for setups where DKIM/SCP setups are strict
> > enough that the mail would be rejected by various recipients otherwise.
> > But I have no idea why the mailing list rewrote the headers for that one
> > mail, but not the rest of your series - usually, DKIM setups are
> > persistent enough that it will be an all-or-none conversion to the
> > entire series.
> > 
> > At any rate, a maintainer can manually fix it for one patch, or you can
> > resend (if the mailing list keeps mangling headers, you can add a 'From:
> > ' line in the body of your email that will override the mangled header;
> > but since the list doesn't usually mangle your headers, you may not need
> > to resort to that).
> > 
> 
> I'm looking at 7/36 in my mailbox, and don't see where is it mangled?

My primary copy is good, too, but that seems to be because you CCed me
directly, so it didn't even go through the list. My copy from qemu-devel
seems to be mangled, though. You can look at Patchew's here:

https://patchew.org/QEMU/20210317143529.615584-8-vsementsov@virtuozzo.com/mbox

But that you CCed me means it's not a practical problem for this series.

Kevin


