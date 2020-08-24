Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6C924FCB1
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 13:38:18 +0200 (CEST)
Received: from localhost ([::1]:50356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAAnp-0006vk-Jm
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 07:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kAAn9-0006VY-Pd
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 07:37:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kAAn8-000261-5I
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 07:37:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598269053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aizcdrSae72wAR47MI9ksNysT2IdonBpBZ0rqx0ZR4Q=;
 b=bZWX246+SR15uhsm/MgkOvtMGewte6yLklHXvsHm9B8gUWedW/s4LaWWVua8cvqI4atImi
 KPyxJQxfaTOx8YNcFWs/6IAf+VoNnp980I111rVvwnEzReUgaJZCetq9ubDt0WGPfqrkp4
 EKeCE7RvWl+KhcmUn60ysOxZosjsGys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-7BWw849LMdylKBzsaQ7fMw-1; Mon, 24 Aug 2020 07:37:31 -0400
X-MC-Unique: 7BWw849LMdylKBzsaQ7fMw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92914425CE;
 Mon, 24 Aug 2020 11:37:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F19A10512;
 Mon, 24 Aug 2020 11:37:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5592817538; Mon, 24 Aug 2020 13:37:29 +0200 (CEST)
Date: Mon, 24 Aug 2020 13:37:29 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: meson: problems building under msys2/mingw-w64 native
Message-ID: <20200824113729.a3yfnllxep4kjfwc@sirius.home.kraxel.org>
References: <d3adbbd0-fb9e-7f7f-8eaf-857c1d14d233@ilande.co.uk>
MIME-Version: 1.0
In-Reply-To: <d3adbbd0-fb9e-7f7f-8eaf-857c1d14d233@ilande.co.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 04:38:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> 2) GTK UI now depends on CONFIG_VTE
> 
> This one I spotted on my local Linux setup as I didn't have the libvte-dev package
> installed and couldn't understand why I couldn't run QEMU with the GTK UI as I always
> do, even though configure reported that it found the GTK library and headers.
> 
> A quick search showed that the GTK UI was being guarded by "if
> config_host.has_key('CONFIG_GTK') and config_host.has_key('CONFIG_VTE')" in
> ui/meson.build.

That is not correct.  vte is intentionally not a hard dependency ...

> For me the easy solution was to install libvte-dev, but since there are no VTE
> packages for Windows my guess is this will now make the GTK UI unavailable for
> Windows users.

.. because we don't have that on windows.

I think simply dropping the "and config_host.has_key('CONFIG_VTE')"
should work, can you try that?

thanks,
  Gerd


