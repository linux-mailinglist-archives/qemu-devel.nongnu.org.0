Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D00300191
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 12:30:42 +0100 (CET)
Received: from localhost ([::1]:55936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ueH-0003GC-FN
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 06:30:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l2ubg-0001rS-Jc
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 06:28:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l2ubd-0000Tk-Ri
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 06:28:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611314874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/BcQUshPnBB0amDWz+g4nF4cIWpLvbWwoxjRX6WA2/0=;
 b=NoAZi5J6PhtoZxyGZLkMN7Z/H4ptiFGpakW5zD2JX+KIpGkF6x9NXJzGnFpXIsZuWAV6A2
 Ac3t+lZyAIeXQt+pfEDPfxX2eIAWi18CfNZLCood7MNRvh95kN5RAAiByFy0zeD0fiuwhs
 rOpK2Y5dpnGIr+1b/MlMuWJ0ACzMu2g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-0hooVRunODyfUW7zQJUCKQ-1; Fri, 22 Jan 2021 06:27:50 -0500
X-MC-Unique: 0hooVRunODyfUW7zQJUCKQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E204801FCC;
 Fri, 22 Jan 2021 11:27:48 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-18.ams2.redhat.com [10.36.115.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B0E526249C;
 Fri, 22 Jan 2021 11:27:46 +0000 (UTC)
Date: Fri, 22 Jan 2021 12:27:45 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v7 00/11] Rework iotests/check
Message-ID: <20210122112745.GB15866@merkur.fritz.box>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <c4bdbd03-7a03-3bf2-3f6e-c8c85dd9897c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c4bdbd03-7a03-3bf2-3f6e-c8c85dd9897c@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 20.01.2021 um 21:52 hat Eric Blake geschrieben:
> On 1/16/21 7:44 AM, Vladimir Sementsov-Ogievskiy wrote:
> > Hi all!
> > 
> > These series has 3 goals:
> > 
> >  - get rid of group file (to forget about rebase and in-list conflicts)
> >  - introduce human-readable names for tests
> >  - rewrite check into python
> > 
> > v7:
> >   - fix wording and grammar
> >   - satisfy python linters
> >   - move argv interfaces all into one in new check script
> >   - support '-n' == '--dry-run' option
> >   - update check-block to run check with correct PYTHON
> 
> I'd really like a second reviewer on 7-11, but I'm queueing 1-6 on my
> NBD tree now.

Oh, you already sent a pull request? Having 6 in without the rest is not
a good state. We now have the group info duplicated and one of them is
ignored, but will become the meaningful copy later. We need to be
careful to not let them diverge now.

I hope the rest is fine so we can switch over quickly, otherwise I'd
prefer to revert 6 and redo it from the then current state when we merge
the whole series.

Kevin


