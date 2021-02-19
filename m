Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A5C31FA3F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 15:03:39 +0100 (CET)
Received: from localhost ([::1]:32868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD6Ne-0002QW-Gr
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 09:03:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lD6Lw-0001wl-7b
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:01:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lD6Lr-0000zu-Pu
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:01:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613743306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lAWGE9hAUCOyucomy6cfWzMUcjuIWjIPQcDHpaoBiSQ=;
 b=I2GR//XiU5hqE6ulJkHyVVovUFRY210CpBzf9lb2MXcOLRh6oZHZRrA06xcNXqNhrqW4qs
 vZcwXZRFzGahs5upKGTARHDOC8bUk38muyJDvP3IE8nm/R5j5RVl7SU9QT/58ab0867B4/
 rES36GxN5IeKGRrYTudGmz07oOqNr18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-3dyWwcouNT6UB7sxHWNRwg-1; Fri, 19 Feb 2021 09:01:43 -0500
X-MC-Unique: 3dyWwcouNT6UB7sxHWNRwg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6E09192FDA0;
 Fri, 19 Feb 2021 14:01:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE66F5D9C2;
 Fri, 19 Feb 2021 14:01:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1D0C418000A2; Fri, 19 Feb 2021 15:01:40 +0100 (CET)
Date: Fri, 19 Feb 2021 15:01:40 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] ui/cocoa: Interpret left button down as is when command
 is pressed
Message-ID: <20210219140140.6kdnv67gfyvlcw5p@sirius.home.kraxel.org>
References: <20210212000706.28616-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210212000706.28616-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

On Fri, Feb 12, 2021 at 09:07:06AM +0900, Akihiko Odaki wrote:
> Old Macs were not equipped with mice with an ability to perform
> "right clicks" and ui/cocoa interpreted left button down with
> left command key pressed as right button down as a workaround.
> 
> The workaround has an obvious downside: you cannot tell the guest
> that the left button is down while the left command key is
> pressed.
> 
> Today, Macs has trackpads, Apple Mice, or Magic Mice. They are
> capable to emulate right clicks with gestures, which also allows
> to perform right clicks on "BootCamp" OSes like Windows.
> 
> By removing the workaround, we overcome its downside, and provide
> a behavior consistent with BootCamp.

Added to UI patch queue now.

thanks,
  Gerd


