Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0162A5DDCB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 07:43:50 +0200 (CEST)
Received: from localhost ([::1]:32842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiY3a-00087Q-6t
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 01:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40367)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peterx@redhat.com>) id 1hiY1i-0006vm-P0
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 01:41:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1hiY1g-00089P-IC
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 01:41:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35872)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>)
 id 1hiY1c-0007xh-5H; Wed, 03 Jul 2019 01:41:48 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 54D95308339E;
 Wed,  3 Jul 2019 05:41:41 +0000 (UTC)
Received: from xz-x1 (unknown [10.66.60.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB0727BE7A;
 Wed,  3 Jul 2019 05:41:34 +0000 (UTC)
Date: Wed, 3 Jul 2019 13:41:31 +0800
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190703054131.GE10408@xz-x1>
References: <20190701093034.18873-1-eric.auger@redhat.com>
 <20190701093034.18873-2-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190701093034.18873-2-eric.auger@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Wed, 03 Jul 2019 05:41:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 1/6] memory: Remove unused
 memory_region_iommu_replay_all()
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 01, 2019 at 11:30:29AM +0200, Eric Auger wrote:
> memory_region_iommu_replay_all is not used. Remove it.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

