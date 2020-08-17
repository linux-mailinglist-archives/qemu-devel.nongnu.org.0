Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 187AD245CA6
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 08:48:04 +0200 (CEST)
Received: from localhost ([::1]:38510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7Yw7-0000TO-5k
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 02:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1k7YvI-0008TH-E6
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 02:47:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1k7YvG-0007aL-Lh
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 02:47:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597646828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IrtgfrwCltgIy7aQOlDAhUYWBg08VRfIJMyq2T8VKmE=;
 b=Q9gsdsn3PwNzmjUZQOB6CDnRx0PI2o4zZWnnfJnRUcW+O2dvVNGnZ4U3d5J+iS/dpsXn8V
 TCS+HVtF8SpnBssMPQC4DBKUSqoZ8ElXksn6j4KBElAg9Kc0LZnp3Tum836MmnicKE7qpW
 fW2f4WhyIF2MTZKbEzWsiNc+qm6DzHU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-buojIStbMxaMtnogZ01LBw-1; Mon, 17 Aug 2020 02:47:04 -0400
X-MC-Unique: buojIStbMxaMtnogZ01LBw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB4451005E5F;
 Mon, 17 Aug 2020 06:47:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62C7E78438;
 Mon, 17 Aug 2020 06:47:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BAAA31753B; Mon, 17 Aug 2020 08:47:01 +0200 (CEST)
Date: Mon, 17 Aug 2020 08:47:01 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Michael Trimarchi <michael@amarulasolutions.com>
Subject: Re: [PATCH] hw: dev-wacom: Support wacom tablet emulation in linux
 qemu
Message-ID: <20200817064701.o3q3plnjhzyz3s42@sirius.home.kraxel.org>
References: <20200812152149.260163-1-michael@amarulasolutions.com>
MIME-Version: 1.0
In-Reply-To: <20200812152149.260163-1-michael@amarulasolutions.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/17 02:47:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 12, 2020 at 05:21:49PM +0200, Michael Trimarchi wrote:
> Linux need to fill up the hid descriptor in order to let
> the driver be emulated. This patch was tested on top of
> qemu 4.2.0 and recent linux kernel.
> 
> modprobe wacom.ko
> evtest tool
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> ---
>  hw/usb/dev-wacom.c | 70 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
> index 8aba44b8bc..fe95699672 100644
> --- a/hw/usb/dev-wacom.c
> +++ b/hw/usb/dev-wacom.c
> @@ -259,6 +259,64 @@ static void usb_wacom_handle_reset(USBDevice *dev)
>      s->mode = WACOM_MODE_HID;
>  }
>  
> +static const uint8_t qemu_wacom_hid_report_descriptor[] = {
> +	0x05, 0x01,
> +	0x09, 0x02,

Where does this come from?  Created from scratch?  Copied from real
wacom tablet?  Any chance this can get descriptive comments like the
other report descriptors (see dev-hid.c)?

thanks,
  Gerd


