Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D1431D9F6
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 14:06:29 +0100 (CET)
Received: from localhost ([::1]:57936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCMXE-0000fk-Jy
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 08:06:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lCMVY-00005e-51
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 08:04:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lCMVW-00057h-26
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 08:04:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613567080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DsYFCjrCrdnSzIPAw3UeK3sSS4FElXC0w5Wl3Ak+s0A=;
 b=IOsfsIQrg1mbqDF8WY/VLZSK0TiYgiiluzTfUbAWOSqokgwqzWZuNjbsySao2pVtJboeuj
 Hu/CIMbljNj3zNYuSNoahq9B06jZ3ixUdn+IJUCHn6yjA/YYMDC5a8w2fOsJZ8YMD7agZO
 iAcw0SpV1dLzGnRfmgmIU79Ykv5uLfc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-_occ2citPGi0CFua1dfyBw-1; Wed, 17 Feb 2021 08:04:37 -0500
X-MC-Unique: _occ2citPGi0CFua1dfyBw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E325B192CC40;
 Wed, 17 Feb 2021 13:04:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FCB919C46;
 Wed, 17 Feb 2021 13:04:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 964F01800398; Wed, 17 Feb 2021 14:04:28 +0100 (CET)
Date: Wed, 17 Feb 2021 14:04:28 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] ui/cocoa: Do not copy members of pixman image
Message-ID: <20210217130428.ez6qc5444vqxfxc7@sirius.home.kraxel.org>
References: <20210212000629.28551-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210212000629.28551-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Fri, Feb 12, 2021 at 09:06:29AM +0900, Akihiko Odaki wrote:
> The old CocoaView had an idea of synchronizing the host window
> configuration and the guest screen configuration. Here, the guest screen
> actually means pixman image given ui/cocoa display implementation.
> 
> However, [CocoaView -drawRect:] directly interacts with the pixman
> image buffer in reality. There is no such distinction of "host" and
> "guest." This change removes the "host" configuration and let drawRect
> consistently have the direct reference to pixman image. It allows to
> get rid of the error-prone "sync" and reduce code size a bit.

Added to UI patch queue.

thanks,
  Gerd


