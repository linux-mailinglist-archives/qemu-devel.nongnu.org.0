Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD38A6F3F13
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 10:27:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptlLI-00035C-FH; Tue, 02 May 2023 04:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ptlLH-00034y-5m
 for qemu-devel@nongnu.org; Tue, 02 May 2023 04:26:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ptlLE-0003Rw-VD
 for qemu-devel@nongnu.org; Tue, 02 May 2023 04:26:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683015991;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vAdweXM0zaaill/E7zlsvUVsIxZIbqMwUtELMH+lFqY=;
 b=BRQEp+ksugjS97c7mALKfbO0X570gJZMwq5Jp1+pjaKYnsXm9ld+uJ9+EEJHPYtTgEAf3P
 wABY8SD0rgLx6xnuNunSirfJYOnRfIBAlEc0i9j64djFVoP4+RV2ftDZi3ZzXe0c9ytbqP
 6ookrfS0UZu4Pnb8/ysi0cSfgwBpie8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-QK50k3X-PYiFl7hJL63MUg-1; Tue, 02 May 2023 04:26:27 -0400
X-MC-Unique: QK50k3X-PYiFl7hJL63MUg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F7E81C3A065;
 Tue,  2 May 2023 08:26:27 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31E8CC15BAD;
 Tue,  2 May 2023 08:26:11 +0000 (UTC)
Date: Tue, 2 May 2023 09:25:55 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: MkfsSion <mkfssion@mkfssion.com>
Cc: "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Apache license usage (was Re: [PULL 04/15] hw/usb: Add CanoKey
 Implementation)
Message-ID: <ZFDJE+8+P6tX4bIy@redhat.com>
References: <20220614121610.508356-1-kraxel@redhat.com>
 <20220614121610.508356-5-kraxel@redhat.com>
 <ZEpKXncC/e6FKRe9@redhat.com> <ZE5smpiemFJWsMaQ@Sun>
 <ZE-x296xL_dkvM0N@MkfsSion-LPC>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZE-x296xL_dkvM0N@MkfsSion-LPC>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, May 01, 2023 at 08:39:42PM +0800, MkfsSion wrote:
> On Sun, Apr 30, 2023 at 09:26:50PM +0800, Hongren (Zenithal) Zheng wrote:
> > On Thu, Apr 27, 2023 at 11:11:42AM +0100, Daniel P. Berrangé wrote:
> > > On Tue, Jun 14, 2022 at 02:15:59PM +0200, Gerd Hoffmann wrote:
> > > > From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
> > > > 
> > > > This commit added a new emulated device called CanoKey to QEMU.
> > > > 
> > > > CanoKey implements platform independent features in canokey-core
> > > > https://github.com/canokeys/canokey-core, and leaves the USB implementation
> > > > to the platform.
> > > > 
> > > > In this commit the USB part was implemented in QEMU using QEMU's USB APIs,
> > > > therefore the emulated CanoKey can communicate with the guest OS using USB.
> > > > 
> > > > Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
> > > > Message-Id: <YoY6Mgph6f6Hc/zI@Sun>
> > > > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > > > ---
> > > >  hw/usb/canokey.h |  69 +++++++++++
> > > >  hw/usb/canokey.c | 300 +++++++++++++++++++++++++++++++++++++++++++++++
> > > >  2 files changed, 369 insertions(+)
> > > >  create mode 100644 hw/usb/canokey.h
> > > >  create mode 100644 hw/usb/canokey.c
> > > > 
> > > > diff --git a/hw/usb/canokey.h b/hw/usb/canokey.h
> > > > new file mode 100644
> > > > index 000000000000..24cf30420346
> > > > --- /dev/null
> > > > +++ b/hw/usb/canokey.h
> > > > @@ -0,0 +1,69 @@
> > > > +/*
> > > > + * CanoKey QEMU device header.
> > > > + *
> > > > + * Copyright (c) 2021-2022 Canokeys.org <contact@canokeys.org>
> > > > + * Written by Hongren (Zenithal) Zheng <i@zenithal.me>
> > > > + *
> > > > + * This code is licensed under the Apache-2.0.
> > > > + */
> > > 
> > > > diff --git a/hw/usb/canokey.c b/hw/usb/canokey.c
> > > > new file mode 100644
> > > > index 000000000000..6cb8b7cdb089
> > > > --- /dev/null
> > > > +++ b/hw/usb/canokey.c
> > > > @@ -0,0 +1,300 @@
> > > > +/*
> > > > + * CanoKey QEMU device implementation.
> > > > + *
> > > > + * Copyright (c) 2021-2022 Canokeys.org <contact@canokeys.org>
> > > > + * Written by Hongren (Zenithal) Zheng <i@zenithal.me>
> > > > + *
> > > > + * This code is licensed under the Apache-2.0.
> > > > + */
> > > 
> > > In the process of auditing licensing in QEMU I found this patch
> > > adding code that is Apache-2.0 licensed, and as such I don't
> > > think we should have ever merged the patch as is.
> > > 
> > > QEMU as a combined work is GPLv2-only.
> > > 
> > > There is disagreement between the Apache foundation and FSF on this
> > > topic[1], but FSF considered Apache 2.0 to be incompatible with the
> > > GPL-v2. Fedora licensing follows the same view of Apache being GPLv2
> > > incompatible.
> > > 
> > > More generally I think it is a little dubious to write new devices
> > > while claiming a license that's different from normal QEMU code
> > > license. I expect there is inevitably a degree of cut+paste from
> > > existing QEMU code to handle the device boilerplate code which
> > > would be sufficient to expect a GPLv2-or-later license to apply.
> > > 
> > > The two added files in this commit are the only occurrence of
> > > Apache licensing in QEMU that I see.
> > > 
> > > Hongren, IIUC from the attribution above, you wrote the code but
> > > Canokeys.org claims copyright. Could you report whether Canokeys.org
> > > will agree to change the licensing on these files to QEMU's normal
> > > GPLv2-or-later licensing.
> > 
> > I have discussed it internally with canokeys.org and they agreed
> > to re-license it under GPLv2+
> > 
> > I will send a patch modifying the license.
> > 
> > In the meantime, canokey.c was also modified by
> > MkfsSion <mkfssion@mkfssion.com>
> > 
> > I've Cc'ed MkfsSion for their attitude on this.
> Acked-by: YuanYang Meng <mkfssion@mkfssion.com>

That's great, thanks to all for the quick response.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


