Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15934308790
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 10:52:05 +0100 (CET)
Received: from localhost ([::1]:33042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5QRg-0003uK-4r
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 04:52:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l5QQ8-0003N6-NZ
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:50:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l5QQ6-0001vs-Il
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:50:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611913825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q1Cw20bDifaRG52gM7Eej5qL7fASSOAqDkutOD0GRJo=;
 b=VvPe+Nh5b8pgM4sD2zNBicJinQYpQnMkSEN5yJQa6KBR5W0bPDZQXWrgN1CG3ns6FAsCoq
 blC3zb1/4v+m9QPORSgeZAYOHZMZbt0aWEwXlMTczKhv2pIlxJLBH+CLOsp9U5VqXBPlLK
 bAapPR3mM9EV57ntuOovsAX1KUBkS2w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-x3Fy3-9ZNZS8qPsFq6K52g-1; Fri, 29 Jan 2021 04:50:22 -0500
X-MC-Unique: x3Fy3-9ZNZS8qPsFq6K52g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60630911E4;
 Fri, 29 Jan 2021 09:50:21 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-198.ams2.redhat.com [10.36.114.198])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A27A71C93;
 Fri, 29 Jan 2021 09:50:19 +0000 (UTC)
Date: Fri, 29 Jan 2021 10:50:18 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] iotests/297: pylint: ignore too many statements
Message-ID: <20210129095018.GB10888@merkur.fritz.box>
References: <20210128200417.303775-1-vsementsov@virtuozzo.com>
 <7490fbd7-90d0-c1b9-172e-5d507453bf1a@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <7490fbd7-90d0-c1b9-172e-5d507453bf1a@virtuozzo.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 28.01.2021 um 21:08 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 28.01.2021 23:04, Vladimir Sementsov-Ogievskiy wrote:
> > Ignore two complains, which now lead to 297 failure on testenv.py and
> > testrunner.py.
> > 
> > Fixes: 2e5a2f57db481f18fcf70be2a36b1417370b8476
> > Fixes: d74c754c924ca34e90b7c96ce2f5609d82c0e628
> > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > ---
> 
> Forget to note:
> 
> I don't add exclusions to pylintrc intentionally, as I think these
> warnings are reasonable, and it's good that vim ALE show them.. Still,
> adding them to pylintrc works too if you prefer.

I would have disabled the warning completely because I don't think
length in lines is a good measure for code quality. But if we think that
these warnings are in fact reasonable, then we should fix them and not
just disable them partially.

It's the same reason why we have -Werror enabled. If you leave warnings
around without any intention to fix them, the useful warnings will drown
in the masses of intentionally ignored ones.

Kevin


