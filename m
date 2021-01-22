Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F23AD30087F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 17:22:28 +0100 (CET)
Received: from localhost ([::1]:53266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2zCe-0004ls-1e
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 11:22:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l2z98-0003g1-FN
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 11:18:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l2z97-0005ca-0B
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 11:18:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611332327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nV6NJCj633apfAh83qDnpRUxS8QpakEVNPozncN5h9Q=;
 b=eU10aunfKy5yqsjhFdFJZpRQnDbzwyEx6m3B1GdazxOXe130z20mYCvgwx2KTebkvfo9JF
 i6h55yUrpIh7xk1+A+Bji/LzG5KyaTnen9Xsz4tAvWJz19IJTDjOaReHlRd7wHhX8F2RAb
 fOCp+MgpjL5Fu2uND4JY8elC0fCH3aY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-LsvVCnHXMhagfZokOKb4kg-1; Fri, 22 Jan 2021 11:18:43 -0500
X-MC-Unique: LsvVCnHXMhagfZokOKb4kg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DB39107ACE3;
 Fri, 22 Jan 2021 16:18:42 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-18.ams2.redhat.com [10.36.115.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A24965C5E0;
 Fri, 22 Jan 2021 16:18:40 +0000 (UTC)
Date: Fri, 22 Jan 2021 17:18:39 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v7 00/11] Rework iotests/check
Message-ID: <20210122161839.GL15866@merkur.fritz.box>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <c4bdbd03-7a03-3bf2-3f6e-c8c85dd9897c@redhat.com>
 <20210122112745.GB15866@merkur.fritz.box>
 <a078a98f-5251-c702-30d3-6fd037c6e5b7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a078a98f-5251-c702-30d3-6fd037c6e5b7@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Am 22.01.2021 um 17:08 hat Eric Blake geschrieben:
> On 1/22/21 5:27 AM, Kevin Wolf wrote:
> > Am 20.01.2021 um 21:52 hat Eric Blake geschrieben:
> >> On 1/16/21 7:44 AM, Vladimir Sementsov-Ogievskiy wrote:
> >>> Hi all!
> >>>
> >>> These series has 3 goals:
> >>>
> >>>  - get rid of group file (to forget about rebase and in-list conflicts)
> >>>  - introduce human-readable names for tests
> >>>  - rewrite check into python
> >>>
> >>> v7:
> >>>   - fix wording and grammar
> >>>   - satisfy python linters
> >>>   - move argv interfaces all into one in new check script
> >>>   - support '-n' == '--dry-run' option
> >>>   - update check-block to run check with correct PYTHON
> >>
> >> I'd really like a second reviewer on 7-11, but I'm queueing 1-6 on my
> >> NBD tree now.
> > 
> > Oh, you already sent a pull request? Having 6 in without the rest is not
> > a good state. We now have the group info duplicated and one of them is
> > ignored, but will become the meaningful copy later. We need to be
> > careful to not let them diverge now.
> > 
> > I hope the rest is fine so we can switch over quickly, otherwise I'd
> > prefer to revert 6 and redo it from the then current state when we merge
> > the whole series.
> 
> Yeah, I probably jumped the gun there.  If we don't have v8 in good
> working shape soon, I'm happy to send a temporary revert pull request
> for patch 6 - let's shoot for late Monday as the cut-off point where I
> will act if the revert is needed.

I think I'm going to send a pull request anyway, so I could include it
there if necessary.

Kevin


