Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C1830AC0F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:54:36 +0100 (CET)
Received: from localhost ([::1]:57086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bX9-0006Hc-GI
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:54:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6bSn-0001Vr-8F
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:50:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6bSl-0007ye-4P
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:50:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612194602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3U2AE6GWhCxanRyU4fLr16Q9FVPr2aArTvjULUTKAzU=;
 b=Aj99OmB+xWZnYDu1/ZR8Fb3rb22dBSZkH66mNqOoGTyKRU1e7mdGmSXrF/SsFTYiK2aFnc
 lL5jYs9rTrrFeg3az1xLYZN42RoTZDmB7ghqXW7S/SLLgFbT+94vU1TgdZ+Y2To87GAUKS
 7hhiD8Ia90jXrx2iLo9fNYsU1XH4EvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-1Spba94gO0a_PTOpfMxa7A-1; Mon, 01 Feb 2021 10:49:59 -0500
X-MC-Unique: 1Spba94gO0a_PTOpfMxa7A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B32708B9507;
 Mon,  1 Feb 2021 15:48:53 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AF205D6BA;
 Mon,  1 Feb 2021 15:48:52 +0000 (UTC)
Date: Mon, 1 Feb 2021 16:48:50 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2] iotests/297: pylint: ignore too many statements
Message-ID: <20210201154850.GF13157@merkur.fritz.box>
References: <20210129161323.615027-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210129161323.615027-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 29.01.2021 um 17:13 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Ignore two complains, which now lead to 297 failure on testenv.py and
> testrunner.py.
> 
> Fixes: 2e5a2f57db481f18fcf70be2a36b1417370b8476
> Fixes: d74c754c924ca34e90b7c96ce2f5609d82c0e628
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Thanks, applied to the block branch.

Kevin


