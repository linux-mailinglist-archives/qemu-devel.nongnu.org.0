Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D2B373F1D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 18:01:14 +0200 (CEST)
Received: from localhost ([::1]:50634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leJxZ-0000Fb-M8
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 12:01:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1leJuS-00077E-5D
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:58:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1leJuP-0005zm-Hd
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:57:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620230276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MK6EnlR2xVGAGP6VOkN1LDuWe7lPXiuJf109TBJoDwM=;
 b=cgy294AUui43OFFZ9oHiB/+03wiXXMSKe85vt4uBkG9BixLU1pR6CW1EcQMQ8GiQd4EPVo
 kMEzevEsILyvq7gf/lSO2TB1MqSa5op4nuZXVf/YNjyZKGMwcePQaZninlW6dFfeuNT8cu
 wMpopeWlM/tl2stbkFIXPNuKEUdcIVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-BAmkBV7cN4uI8Zg6ysTyeg-1; Wed, 05 May 2021 11:57:52 -0400
X-MC-Unique: BAmkBV7cN4uI8Zg6ysTyeg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E428D1006C81;
 Wed,  5 May 2021 15:57:51 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-138.ams2.redhat.com [10.36.115.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDE512BFE1;
 Wed,  5 May 2021 15:57:49 +0000 (UTC)
Date: Wed, 5 May 2021 17:57:48 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Alberto Garcia <berto@igalia.com>
Subject: Re: [PATCH v4 3/6] iotests: Test replacing files with
 x-blockdev-reopen
Message-ID: <YJLAfLip+uL9gCsg@merkur.fritz.box>
References: <cover.1616000692.git.berto@igalia.com>
 <6e521df2f95da4a8df679bf15ad6cb4af33fe18f.1616000692.git.berto@igalia.com>
MIME-Version: 1.0
In-Reply-To: <6e521df2f95da4a8df679bf15ad6cb4af33fe18f.1616000692.git.berto@igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.03.2021 um 18:15 hat Alberto Garcia geschrieben:
> This patch adds new tests in which we use x-blockdev-reopen to change
> bs->file
> 
> Signed-off-by: Alberto Garcia <berto@igalia.com>

Looks good, but I wonder if we should also test the error paths. I think
we're testing them for backing files, but as patch 2 shows, we need to
check different things for update the file link.

Kevin


