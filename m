Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7742D3011
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 17:44:30 +0100 (CET)
Received: from localhost ([::1]:57852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmg6G-0006jy-WF
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 11:44:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kmg1x-0005FK-Ob
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 11:40:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kmg1u-00050i-Gu
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 11:40:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607445597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9piFO8LCBFMo9lL/S4GBdB/3i5C+epd9IiPblYH9a1I=;
 b=Qf1mQJGU5H1UrVG3ITHVT5M6xpUrmko3twxX3iB+xf6SvOD+OftvUYrPOfoQLiU2XRZXY3
 yHpRRS0lZw2LUs5f1Zd2MGYvIsq+vN48KQW9nhFMRFyHEqCdX7Dd7MWl0SaTEFNIjpsbbd
 CRhOqZRoNEZwAtf7kysu+cmUZT4r5e4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-zPtrZoYlOGyV4BxApY4qPQ-1; Tue, 08 Dec 2020 11:39:53 -0500
X-MC-Unique: zPtrZoYlOGyV4BxApY4qPQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50DB4100E337;
 Tue,  8 Dec 2020 16:39:28 +0000 (UTC)
Received: from work-vm (ovpn-114-53.ams2.redhat.com [10.36.114.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 614905C1A1;
 Tue,  8 Dec 2020 16:39:25 +0000 (UTC)
Date: Tue, 8 Dec 2020 16:39:22 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Yutao Ai <aiyutao@huawei.com>
Subject: Re: [PATCH 0/3] Fix some style problems in monitor
Message-ID: <20201208163922.GA31369@work-vm>
References: <20201125014514.55562-1-aiyutao@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201125014514.55562-1-aiyutao@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: alex.chen@huawei.com, armbru@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Yutao Ai (aiyutao@huawei.com) wrote:
> I find some style problems while using checkpatch.pl to check monitor codes.
> And I fixed these style problems in the submit patches.
> 
> Yutao Ai (3):
>   monitor:open brace '{' following struct go on the same line
>   monitor:braces {} are necessary for all arms of this statement
>   monitor:Don't use '#' flag of printf format ('%#') in format strings
> 
>  monitor/hmp-cmds.c |  3 +--
>  monitor/misc.c     | 16 ++++++++++------
>  2 files changed, 11 insertions(+), 8 deletions(-)

Queued

> -- 
> 2.19.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


