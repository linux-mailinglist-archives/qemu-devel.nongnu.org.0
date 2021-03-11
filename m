Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA22336E60
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 09:59:37 +0100 (CET)
Received: from localhost ([::1]:38570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKHAO-0004VN-UD
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 03:59:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKH9W-0003vE-VZ
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 03:58:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKH9U-0004HP-TR
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 03:58:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615453120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MxHhSOWt9lEJj0FjTZhJIIWlqxaMJ5I/bHKEwexA4lE=;
 b=ST7BEaJvfdXJ5f4hNoQSW05lu+KoQ5dH+W43Db071cie1DlI+IR1q2/aCWnPBlfIEVWR5z
 stBUPMc064SfSLWK76U8ggWdL/DX74YGlCSHkhphWxo7d9DNCGOvXCzNE6wdtM1LnTJ8of
 ERg9SCMR3ggb6cmIZu4Uk6btrc9CKBI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-L9nr-WYSOPGcXT9kQpaNdA-1; Thu, 11 Mar 2021 03:58:38 -0500
X-MC-Unique: L9nr-WYSOPGcXT9kQpaNdA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B32A8015BA;
 Thu, 11 Mar 2021 08:58:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7F41421F;
 Thu, 11 Mar 2021 08:58:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 313B9180087E; Thu, 11 Mar 2021 09:58:35 +0100 (CET)
Date: Thu, 11 Mar 2021 09:58:35 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2] ui/cocoa: Fix mouse association state
Message-ID: <20210311085835.dgvcu3c3wkl3yjdn@sirius.home.kraxel.org>
References: <CAFEAcA9bP5TTroWz8k4kkB6bAj81zRBFgR4Uzi0L3BjoNd9JkA@mail.gmail.com>
 <20210222150714.21766-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210222150714.21766-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 23, 2021 at 12:07:14AM +0900, Akihiko Odaki wrote:
> ui/cocoa deassociates the mouse input and the mouse cursor
> position only when relative movement inputs are expected. Such
> inputs may let the mouse cursor leave the view and cause undesired
> side effects if they are associated. On the other hand, the
> problem does not occur when inputting absolute points, and the
> association allows seamless cursor movement across views.
> 
> However, the synchronization of the association and the expected
> input type was only done when grabbing the mouse. In reality, the
> state whether the emulated input device expects absolute pointing
> inputs or relative movement inputs can vary dynamically due to
> USB device hot-plugging, for example.
> 
> This change adds association state updates according to input type
> expectation changes. It also removes an internal flag representing
> the association state because the state can now be determined with
> the current input type expectation and it only adds the
> complexity of the state tracking.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>

Added to usb queue.

thanks,
  Gerd


