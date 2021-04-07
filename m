Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3618357270
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 18:54:24 +0200 (CEST)
Received: from localhost ([::1]:54668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUBRf-0004W3-Qu
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 12:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lUBOU-0001g7-Hm
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 12:51:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lUBOS-0005bV-Se
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 12:51:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617814264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K4YFbKj08FlheOAVGj3I76KcGoO6TV+Y2ZxD+M4j0FU=;
 b=WtFLCAxsj55DJKE8RE4qdg99tKMRoAgn6YJ0VcacxjauwHmwSCOa75zrnnsVoPHq1V3NkY
 cU5dc1iwCPQZMP2Sn7eDz4cwjJmVlItg1SSswYzH9ZTCX/ZuVYyW/dBRjZDtM9XfLx8plN
 DokAslQS2cq/WLsAmzjLXMX7+O2+m58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-GjUCXPhXO0mGmM908qNFmA-1; Wed, 07 Apr 2021 12:51:02 -0400
X-MC-Unique: GjUCXPhXO0mGmM908qNFmA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C99B83DD21;
 Wed,  7 Apr 2021 16:51:00 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-47.ams2.redhat.com [10.36.115.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 935845C27C;
 Wed,  7 Apr 2021 16:50:59 +0000 (UTC)
Date: Wed, 7 Apr 2021 18:50:52 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 0/4] iotests/297: Cover tests/
Message-ID: <YG3i7ECFtLJ7tINA@merkur.fritz.box>
References: <20210329132632.68901-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210329132632.68901-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 29.03.2021 um 15:26 hat Max Reitz geschrieben:
> Hi,
> 
> When reviewing Vladimir’s new addition to tests/, I noticed that 297 so
> far does not cover named tests.  That isn’t so good.
> 
> This series makes it cover them, and because tests/ is rather sparse at
> this point, I decided to also fix up the two tests in there that don’t
> pass pylint’s scrutiny yet.  I think it would be nice if we could keep
> all of tests/ clean.

For patch 2, Vladimir already made the point I would have made.

For the rest:
Reviewed-by: Kevin Wolf <kwolf@redhat.com>


