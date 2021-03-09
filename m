Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AE433233A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:40:48 +0100 (CET)
Received: from localhost ([::1]:56506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJZnD-0000xA-NZ
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:40:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJZgq-0003o0-Kc
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:34:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJZgn-0000Sg-P1
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:34:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615286049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Az8VGfx09/UIDVmery9EGmxdvKGsdBBka7suv74oabU=;
 b=NecUeZb08QqHT4Q4nLofzUdZDs7LHkkuUv7NVln+H3m4oI6OWewOOPlQkDpdItb93PD7lo
 7iBSdgoxHDXy8atsa4e9D5COJy3aXIRDTbX4XGQUQlZTezGbmLEWhgE7y0KgejU/iEBN9e
 gTsQOvNqltqbAQDT4skgBoxefG4Ll6o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-L1I75TQwNfmW37DVx_olTQ-1; Tue, 09 Mar 2021 05:34:06 -0500
X-MC-Unique: L1I75TQwNfmW37DVx_olTQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74A7B1005D4A;
 Tue,  9 Mar 2021 10:34:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-41.ams2.redhat.com
 [10.36.113.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DF1C61F55;
 Tue,  9 Mar 2021 10:34:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C586F18000A2; Tue,  9 Mar 2021 11:34:03 +0100 (CET)
Date: Tue, 9 Mar 2021 11:34:03 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/9] hw/display/pl110, pxa2xx_lcd: Tidy up template headers
Message-ID: <20210309103403.wvvnkmz7cekl5iet@sirius.home.kraxel.org>
References: <20210211141515.8755-1-peter.maydell@linaro.org>
 <CAFEAcA-yS0XcCU7CW2hDr=SLMB2WcNQbdtK=Ei8tk-86bW+i8g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-yS0XcCU7CW2hDr=SLMB2WcNQbdtK=Ei8tk-86bW+i8g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 05, 2021 at 02:48:11PM +0000, Peter Maydell wrote:
> Ping for review?

Looks all sane from ui point of view.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

I suspect we still have some code duplication here due to each display
device having its own set of line render functions.  We should be able
to share them at least for common formats.  hw/display/framebuffer.c
looks like a good place for shared helpers.

take care,
  Gerd


