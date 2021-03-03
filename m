Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D1632B635
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 10:32:09 +0100 (CET)
Received: from localhost ([::1]:37256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHNrU-00008r-K0
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 04:32:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lHNoc-0006C3-Km
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:29:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lHNoY-0003Gj-Iz
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:29:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614763745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oHKBGZX+p2Be8uK8LSmwo2zdES0SyYPVy46EpVVgUT0=;
 b=H1tvT8AJygQ6g8flWJFcpE4Ey4kGo7i/A+RW3OV2ijfZydjgJdmjmSs0a3bWDqi43A1vzH
 ruzHqWEA15dKBoEkqi3HZ6INw9cADxk4m/0VJ+8/mOfkxo0YtP+AwZNFnt0ZwmFuYdtS5H
 dZ8Bq7pBmtchaUEkC/I4JpOL5w+V4fo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-OBWi6aS6O6Wqy2cH0sQBCw-1; Wed, 03 Mar 2021 04:29:04 -0500
X-MC-Unique: OBWi6aS6O6Wqy2cH0sQBCw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1821D1868404;
 Wed,  3 Mar 2021 09:29:03 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-195.ams2.redhat.com [10.36.113.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7C4D19635;
 Wed,  3 Mar 2021 09:28:58 +0000 (UTC)
Date: Wed, 3 Mar 2021 10:28:57 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3] qemu-storage-daemon: add --pidfile option
Message-ID: <20210303092857.GA5254@merkur.fritz.box>
References: <20210302142746.170535-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210302142746.170535-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: afrosi@redhat.com, Daniel Berrange <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 "Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.03.2021 um 15:27 hat Stefan Hajnoczi geschrieben:
> Daemons often have a --pidfile option where the pid is written to a file
> so that scripts can stop the daemon by sending a signal.
> 
> The pid file also acts as a lock to prevent multiple instances of the
> daemon from launching for a given pid file.
> 
> QEMU, qemu-nbd, qemu-ga, virtiofsd, and qemu-pr-helper all support the
> --pidfile option. Add it to qemu-storage-daemon too.
> 
> Reported-by: Richard W.M. Jones <rjones@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Thanks, applied to the block branch.

Kevin


