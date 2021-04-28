Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1E036D677
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 13:30:13 +0200 (CEST)
Received: from localhost ([::1]:46280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbiOS-0002uz-BR
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 07:30:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lbiMc-0001Zd-1u
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:28:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lbiMZ-0003D1-Pd
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:28:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619609295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7h5otiS1/0dEfJIr9jk6bEygj5XWo3up45fNAdmxsCQ=;
 b=dq2mPh697zmAXPK0LtndmPBsORmPrlWnMCV+47RnAwjm2YfSkdCAvemni4mCkQ/tlfKdSL
 dwCpH/zKtDOkN7+iBcDt16Vv1duVVY6hTK1yoDwVtXXCOVzWDtRfuxxBCzk5qhwRPOm5iW
 U3x7QuRVCj8OhaAJMbLw4BEVG5gZ6Z0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-q_EXMMu_MjCnRJXjXKb6zw-1; Wed, 28 Apr 2021 07:28:11 -0400
X-MC-Unique: q_EXMMu_MjCnRJXjXKb6zw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD37A801106;
 Wed, 28 Apr 2021 11:28:10 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-9.ams2.redhat.com [10.36.115.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7CAB6B8E5;
 Wed, 28 Apr 2021 11:28:05 +0000 (UTC)
Date: Wed, 28 Apr 2021 13:28:04 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 00/36] block: update graph permissions update
Message-ID: <YIlGxMrdooxXxbOJ@merkur.fritz.box>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210317143529.615584-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: fam@euphon.net, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 armbru@redhat.com, stefanha@redhat.com, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.03.2021 um 15:34 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Hi all!
> 
> Finally, I finished v3. Phew.
> 
> Missed a soft-freeze. Should we consider it a bugfix? There are bugfixes
> here but they are mostly theoretical. So, up to Kevin, should it go to
> current release or to the next..
> 
> The main point of the series is fixing some permission update problems
> (see patches 01-03 as examples), that in turn makes possible more clean
> inserting and removing of filters (see patch 26 where .active field is
> dropped finally from backup-top filter, we don't need a workaround
> anymore).
> 
> The series brings util/transactions.c (patch 10) and use of it in
> block.c, which allows clean block graph change transactions, with
> possibility of reverting all modifications (movement and removement of
> children, changing aio context, changing permissions) in reverse order
> on failure path.
> 
> The series also helps Alberto's "Allow changing bs->file on reopen"
> which we want to merge prior dropping x- prefix from blockdev-reopen
> command.

Ok, I made it through the whole series. Looking quite good, I just had
some minor comments, but maybe not quite trival enough to just fix them
up while applying.

I had comments on patches 1, 4, 8, 18 and 22. With these addressed, you
can add to all patches in the whole series:
Reviewed-by: Kevin Wolf <kwolf@redhat.com>

v4 should then be the final version. :-)

Kevin


