Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E696531D9FD
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 14:12:13 +0100 (CET)
Received: from localhost ([::1]:34228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCMcm-0002pC-DB
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 08:12:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lCMa5-00027I-P3
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 08:09:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lCMa3-0006Si-EF
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 08:09:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613567362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wot+VZLx+lFv02YAKxdUTSRJ6j+aHYWDMyUP0jjKF5A=;
 b=V0ahElDI+pT+tVE9JNplUfDNXSG9KY+mVd40NPzAn/Kmr9+0OfqBxPZ1Y+yMm5v1RTnfSr
 5hNq2/yFlmrNl2XVrD9RogEnZaszHz+2i4KwKgh4pD6JmVmIQFaZlNUsl+pcH6HuBoTorG
 1EPXUCwBWQuaAN3e7hMankG3po+vtCw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-biBSvWIjMGKH3RoLe5xoMQ-1; Wed, 17 Feb 2021 08:09:20 -0500
X-MC-Unique: biBSvWIjMGKH3RoLe5xoMQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9449192D785;
 Wed, 17 Feb 2021 13:09:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74A471349A;
 Wed, 17 Feb 2021 13:09:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 60ED31800398; Wed, 17 Feb 2021 14:09:15 +0100 (CET)
Date: Wed, 17 Feb 2021 14:09:15 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] ui/cocoa: Remove the uses of full screen APIs
Message-ID: <20210217130915.ihqdqxjqmbrzlvpv@sirius.home.kraxel.org>
References: <20210212000540.28486-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210212000540.28486-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 12, 2021 at 09:05:40AM +0900, Akihiko Odaki wrote:
> The detections of full screen APIs were wrong. A detection is coded as:
> [NSView respondsToSelector:@selector(exitFullScreenModeWithOptions:)]
> but it should be:
> [NSView instancesRespondToSelector:@selector(exitFullScreenModeWithOptions:)]
> 
> The uses of full screen APIs were also incorrect, and if you fix the
> detections, the full screen view stretches the video, changing the
> aspect ratio, even if zooming is disabled.
> 
> Remove the code as it does nothing good.

So, it's broken right now (and probably for quite a while without anyone
complaining).  And the attempt to fix it didn't work out very well.
Correct?

Just dropping the code makes sense to me then.

Any objections or better suggestions from the macos camp?
If not I'll go queue it for the next UI pull request in a day or two.

thanks,
  Gerd


