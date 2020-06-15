Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3591F9D5F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 18:27:10 +0200 (CEST)
Received: from localhost ([::1]:58160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkrwz-0004jD-5I
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 12:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jkrvb-0003bE-0T
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 12:25:43 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:52718
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jkrvZ-0005qs-8F
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 12:25:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592238338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NMcH9iG/KHNzRMwTDGOIJUwoN0RJVPszI1mZ2NcJYzE=;
 b=Y13sn6KhAl8m0xsqLdD8ysMZjf/ypfgJujZoQ7seKcw0oPNQ11lCi5budf3jVofRNgIfBX
 sg4vedI6Pbpx8o7g0V7cdEABh0r3eQoI02zOB39WdyS4zOCkM7VqXHDIaggsa5BMOaCECg
 +Qo5zoePPYHgUwIihekjDoSQ2dFEznU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-yWIQ5Lv-NgGoGIozcCiAUw-1; Mon, 15 Jun 2020 12:25:36 -0400
X-MC-Unique: yWIQ5Lv-NgGoGIozcCiAUw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F740115AF44;
 Mon, 15 Jun 2020 16:21:22 +0000 (UTC)
Received: from linux.fritz.box (ovpn-112-88.ams2.redhat.com [10.36.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C85FF5D9CC;
 Mon, 15 Jun 2020 16:21:20 +0000 (UTC)
Date: Mon, 15 Jun 2020 18:21:19 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v7 00/22] nvme: small fixes, refactoring and cleanups
Message-ID: <20200615162119.GC7273@linux.fritz.box>
References: <20200609190333.59390-1-its@irrelevant.dk>
MIME-Version: 1.0
In-Reply-To: <20200609190333.59390-1-its@irrelevant.dk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 01:12:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.06.2020 um 21:03 hat Klaus Jensen geschrieben:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Hi all,
> 
> As per our discussion about how to amend the bug I introduced in
> "hw/block/nvme: allow use of any valid msix vector", this is a respin
> without that patch.
> 
> Kevin, it applies cleanly on top of your block tree with all current
> hw/block/bnvme patches removed.

Thanks, applied to the block branch.

Kevin


