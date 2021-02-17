Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C624031DA0C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 14:18:03 +0100 (CET)
Received: from localhost ([::1]:39640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCMiQ-0005ZU-1M
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 08:18:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lCMg9-0004mb-AX
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 08:15:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lCMg7-0008Dx-73
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 08:15:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613567738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BR6pA/A0sF7z6ReGk/fWkPk1tnZVv4hy8cewOmH4COA=;
 b=HlfO5NtDYpSQpsOVC+BusJ8ifiqMhM/WV9WyMGAJzAUcvIioOwALFuv5BU02LUclwG4tfx
 mG02dNihhr5OSD3fWc8XcZCc2OFumSGiILMJcKIBPveJxFkmn/K77ANAEj5dH5qOtKs4ar
 9nWcmbpWfuwj5G/OWZdqc/CMbwVcAFM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-dqgIdr8eMlOgxbrAeZm1ug-1; Wed, 17 Feb 2021 08:15:36 -0500
X-MC-Unique: dqgIdr8eMlOgxbrAeZm1ug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E1BA192D785;
 Wed, 17 Feb 2021 13:15:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E61E119C46;
 Wed, 17 Feb 2021 13:15:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CE3181800398; Wed, 17 Feb 2021 14:15:30 +0100 (CET)
Date: Wed, 17 Feb 2021 14:15:30 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] ui/cocoa: Interpret left button down as is when command
 is pressed
Message-ID: <20210217131530.d54ocqf7pr4aaxma@sirius.home.kraxel.org>
References: <20210212000706.28616-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210212000706.28616-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

Comments from the macos folks?

Given that the one-button-mouse days for macs are long over this
looks sensible to me.

In case there are objections we can add a config option for
right-mouse-click emulation, but I don't feel like adding a option
which nobody is going to use ...

take care,
  Gerd


