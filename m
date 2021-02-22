Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430BA321430
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 11:31:29 +0100 (CET)
Received: from localhost ([::1]:37560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE8Uy-00041u-B9
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 05:31:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lE8Tn-0003U5-3U
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:30:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lE8Tl-0003ff-Ij
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:30:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613989813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UQP3GfD43Qqdy8xGACe9a+LpH4Ds3WMvkZN2Jaanhco=;
 b=N84XheSXH1SyXgLTCGNRssHikpFP/RkC3uH3EU1cf7apWgQhWntAvR6Wat6U2TnNKy9flP
 Wnwj2NWcmOeEhM57Tpecenh7uTFFIKdNe4x73bmUUiiwe2Sow0pZ1RxA0Mg2iAuVgw+6zK
 kLYPGD5HoMjU4yOfhXR9ej6mX8Yuh8s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-67KqTh0rM0SjG3EFxEbPVA-1; Mon, 22 Feb 2021 05:30:08 -0500
X-MC-Unique: 67KqTh0rM0SjG3EFxEbPVA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A13AE107ACFA;
 Mon, 22 Feb 2021 10:30:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64BC760C04;
 Mon, 22 Feb 2021 10:30:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A434A1800399; Mon, 22 Feb 2021 11:30:05 +0100 (CET)
Date: Mon, 22 Feb 2021 11:30:05 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2] ui/cocoa: Remove the uses of full screen APIs
Message-ID: <20210222103005.v6h5qpzz5y6elwh4@sirius.home.kraxel.org>
References: <20210219135534.clmpknifhvgn7vde@sirius.home.kraxel.org>
 <20210220013138.51437-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210220013138.51437-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> The detections of [NSView -enterFullScreen:] and
> [NSView -exitFullScreen:] were wrong. A detection is coded as:
> [NSView respondsToSelector:@selector(exitFullScreenModeWithOptions:)]
> but it should be:
> [NSView instancesRespondToSelector:@selector(exitFullScreenModeWithOptions:)]
> 
> Because of those APIs were not detected, ui/cocoa always falled
> back to a borderless window whose frame matches the screen to
> implement fullscreen behavior.
> 
> The code using [NSView -enterFullScreen:] and
> [NSView -exitFullScreen:] will be used if you fix the detections,
> but its behavior is undesirable; the full screen view stretches
> the video, changing the aspect ratio, even if zooming is disabled.
> 
> This change removes the code as it does nothing good.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>

Added to UI queue.

thanks,
  Gerd


