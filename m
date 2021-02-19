Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C60E731FA28
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 14:57:39 +0100 (CET)
Received: from localhost ([::1]:53706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD6Hq-0007IN-So
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 08:57:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lD6G0-0006Zi-Mx
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:55:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lD6Fy-0006nY-Bb
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:55:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613742941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W3yiB8C23AB1iE3vztys8jMT7GhSGvsOL+AATo3IWa4=;
 b=YZIiZANIkuXtCPLz1h7B1Cx2LfGkNLqTADFYuP3LUDgTmoWe57EN0TWl87uIOa/PNY7Nou
 JqM6NSOCazOWXB3QtxnGJV4KoIMDI49Dbzumf4wX2a6LtEFcph6nuD35q9f13fp5dxiJfx
 PRBYx6Q1NlDAKvbX81sISfZH9AnUGzQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-Uvb0m7D6PV-4SJ4uMYFPtg-1; Fri, 19 Feb 2021 08:55:37 -0500
X-MC-Unique: Uvb0m7D6PV-4SJ4uMYFPtg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 093D6106BC6A;
 Fri, 19 Feb 2021 13:55:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C62855C1BB;
 Fri, 19 Feb 2021 13:55:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 23A2318000A2; Fri, 19 Feb 2021 14:55:34 +0100 (CET)
Date: Fri, 19 Feb 2021 14:55:34 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] ui/cocoa: Remove the uses of full screen APIs
Message-ID: <20210219135534.clmpknifhvgn7vde@sirius.home.kraxel.org>
References: <20210212000540.28486-1-akihiko.odaki@gmail.com>
 <20210217130915.ihqdqxjqmbrzlvpv@sirius.home.kraxel.org>
 <CAMVc7JXvAt6neB2H1Bmp-HKachc3di8FpDWy3=vP2x-PDE+xxA@mail.gmail.com>
 <0d2beba-2a74-3a36-16d3-f1bac83dedce@eik.bme.hu>
 <CAMVc7JUn7gh7DkrM6Vhv0U7Qv5r-G9475vWzy9d5ML3RufvQ3A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMVc7JUn7gh7DkrM6Vhv0U7Qv5r-G9475vWzy9d5ML3RufvQ3A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Howard Spoelstra <hsp.cat7@gmail.com>, qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > I think there are people using QEMU to run old MacOS versions on MacOS
> > X/macOS and may not follow this mailing list but I'm sure they'll complain
> > once you break it.
> 
> It was not clear what "full screen APIs" refer to in my patch. Today
> macOS have three different methods to enter fullscreen:
> - [NSWindow -toggleFullscreen:] (the latest one)
> - [NSView -enterFullScreenModeWithOptions:]
> - Make a borderless window whose frame matches with the screen
> 
> ui/cocoa checks if [NSView -enterFullScreenModeWithOptions:] exists
> and uses it in this case. Otherwise, it chooses the last method.
> However, the detection of [NSView -enterFullScreenModeWithOptions:]
> was broken and I fixed it to find the use of [NSView
> -enterFullScreenModeWithOptions:] was wrong. This patch deletes
> references to [NSView -enterFullScreenModeWithOptions:] but the code
> implementing the last method is still intact and properly functions.

Ah, that explains why fullscreen worked just fine when I tried it
yesterday in my macos test vm.

Can you update the commit message explaining this please?  The text
above should do it for the most part.

thanks,
  Gerd


