Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4602DBF38
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 12:10:24 +0100 (CET)
Received: from localhost ([::1]:36348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpUhL-0007CP-QT
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 06:10:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kpUgT-0006f1-2f
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 06:09:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kpUgQ-0003xO-9O
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 06:09:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608116965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YUK6MFRA8TFbGNDA0LCSlqKA0W3p5qs3Il+x4g2MnSQ=;
 b=hD3p4XUnjTkvyzAkZsn/tj7ih21aab+kc4efyoIHsEBe8teI73tgEJ5GkvMNm4uLrSP4ND
 jNUQAj61XdHvs+fU8zzXTcJA/6TERAEgNrvcFNVifdGpyY0PkjvImyDY5AHl75VYFkTzOJ
 YbKq6SGQ0Mv6uGMBqnNASAvrEbRryd4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-Ug5RkLENNqGNHDpAvNKDcQ-1; Wed, 16 Dec 2020 06:09:23 -0500
X-MC-Unique: Ug5RkLENNqGNHDpAvNKDcQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0CAD800FF6;
 Wed, 16 Dec 2020 11:09:21 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-50.ams2.redhat.com [10.36.115.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D46D87095E;
 Wed, 16 Dec 2020 11:09:20 +0000 (UTC)
Date: Wed, 16 Dec 2020 12:09:19 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 0/2] iotests: filter qom path in 172
Message-ID: <20201216110919.GA7548@merkur.fritz.box>
References: <20201216095205.526235-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201216095205.526235-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.12.2020 um 10:52 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Hi all!
> 
> Here are two small patches to improve _filter_qom_path filter and reuse
> it for 172 iotest

Thanks, applied to the block branch.

Kevin


