Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD046F3128
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 14:47:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptSuj-0005pY-DR; Mon, 01 May 2023 08:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkfssion@mkfssion.com>)
 id 1ptSuH-0005p5-27
 for qemu-devel@nongnu.org; Mon, 01 May 2023 08:45:29 -0400
Received: from mail-108-mta191.mxroute.com ([136.175.108.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mkfssion@mkfssion.com>)
 id 1ptSuE-0005JV-Ow
 for qemu-devel@nongnu.org; Mon, 01 May 2023 08:45:28 -0400
Received: from mail-111-mta2.mxroute.com ([136.175.111.2]
 filter006.mxroute.com) (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta191.mxroute.com (ZoneMTA) with ESMTPSA id
 187d7536be3000becb.002 for <qemu-devel@nongnu.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Mon, 01 May 2023 12:39:41 +0000
X-Zone-Loop: 52c84a440b9d156d620e2581665bda90cf1790eb02af
X-Originating-IP: [136.175.111.2]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mkfssion.com; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OuhtTynaswRM8xX1/gGipQiozjUSQQVglQtm2pFZMHo=; b=pTP+bEzxGYT1IsYGNjLqo1kX30
 G404BAtXbF3FxCJDPHyWsNmbCVJYfxoEKVutTPnYv7dsV2S0aWprmZOr/1pPpfSGlMvF2xkZo5F16
 q/f8LzB+WHJzjaomoNxw6hG48JVakE1pnJK9bNsz7TxXakrtFexK2WQ9AavCNBPyfL37wRjWrK5Xj
 x0WbmPwokvN3l1/kH7q86WHsWAR+EyaVzBGyEPqV0yK/1Ke5kg1b7gj8OfusIzZ9dr+ckJTialSEz
 KROHYGfbTCtK5PRPgp/6Hb7tkMk5/ErUqBerhz40P1/vEApCgW3RDGxvs7sIWzNYFwSugSm+0Iqtn
 TE6oyeDA==;
Date: Mon, 1 May 2023 20:39:42 +0800
From: MkfsSion <mkfssion@mkfssion.com>
To: "Hongren (Zenithal) Zheng" <i@zenithal.me>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Apache license usage (was Re: [PULL 04/15] hw/usb: Add CanoKey
 Implementation)
Message-ID: <ZE-x296xL_dkvM0N@MkfsSion-LPC>
References: <20220614121610.508356-1-kraxel@redhat.com>
 <20220614121610.508356-5-kraxel@redhat.com>
 <ZEpKXncC/e6FKRe9@redhat.com> <ZE5smpiemFJWsMaQ@Sun>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZE5smpiemFJWsMaQ@Sun>
X-Authenticated-Id: mkfssion@mkfssion.com
Received-SPF: pass client-ip=136.175.108.191;
 envelope-from=mkfssion@mkfssion.com; helo=mail-108-mta191.mxroute.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Apr 30, 2023 at 09:26:50PM +0800, Hongren (Zenithal) Zheng wrote:
> On Thu, Apr 27, 2023 at 11:11:42AM +0100, Daniel P. Berrangé wrote:
> > On Tue, Jun 14, 2022 at 02:15:59PM +0200, Gerd Hoffmann wrote:
> > > From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
> > > 
> > > This commit added a new emulated device called CanoKey to QEMU.
> > > 
> > > CanoKey implements platform independent features in canokey-core
> > > https://github.com/canokeys/canokey-core, and leaves the USB implementation
> > > to the platform.
> > > 
> > > In this commit the USB part was implemented in QEMU using QEMU's USB APIs,
> > > therefore the emulated CanoKey can communicate with the guest OS using USB.
> > > 
> > > Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
> > > Message-Id: <YoY6Mgph6f6Hc/zI@Sun>
> > > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > > ---
> > >  hw/usb/canokey.h |  69 +++++++++++
> > >  hw/usb/canokey.c | 300 +++++++++++++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 369 insertions(+)
> > >  create mode 100644 hw/usb/canokey.h
> > >  create mode 100644 hw/usb/canokey.c
> > > 
> > > diff --git a/hw/usb/canokey.h b/hw/usb/canokey.h
> > > new file mode 100644
> > > index 000000000000..24cf30420346
> > > --- /dev/null
> > > +++ b/hw/usb/canokey.h
> > > @@ -0,0 +1,69 @@
> > > +/*
> > > + * CanoKey QEMU device header.
> > > + *
> > > + * Copyright (c) 2021-2022 Canokeys.org <contact@canokeys.org>
> > > + * Written by Hongren (Zenithal) Zheng <i@zenithal.me>
> > > + *
> > > + * This code is licensed under the Apache-2.0.
> > > + */
> > 
> > > diff --git a/hw/usb/canokey.c b/hw/usb/canokey.c
> > > new file mode 100644
> > > index 000000000000..6cb8b7cdb089
> > > --- /dev/null
> > > +++ b/hw/usb/canokey.c
> > > @@ -0,0 +1,300 @@
> > > +/*
> > > + * CanoKey QEMU device implementation.
> > > + *
> > > + * Copyright (c) 2021-2022 Canokeys.org <contact@canokeys.org>
> > > + * Written by Hongren (Zenithal) Zheng <i@zenithal.me>
> > > + *
> > > + * This code is licensed under the Apache-2.0.
> > > + */
> > 
> > In the process of auditing licensing in QEMU I found this patch
> > adding code that is Apache-2.0 licensed, and as such I don't
> > think we should have ever merged the patch as is.
> > 
> > QEMU as a combined work is GPLv2-only.
> > 
> > There is disagreement between the Apache foundation and FSF on this
> > topic[1], but FSF considered Apache 2.0 to be incompatible with the
> > GPL-v2. Fedora licensing follows the same view of Apache being GPLv2
> > incompatible.
> > 
> > More generally I think it is a little dubious to write new devices
> > while claiming a license that's different from normal QEMU code
> > license. I expect there is inevitably a degree of cut+paste from
> > existing QEMU code to handle the device boilerplate code which
> > would be sufficient to expect a GPLv2-or-later license to apply.
> > 
> > The two added files in this commit are the only occurrence of
> > Apache licensing in QEMU that I see.
> > 
> > Hongren, IIUC from the attribution above, you wrote the code but
> > Canokeys.org claims copyright. Could you report whether Canokeys.org
> > will agree to change the licensing on these files to QEMU's normal
> > GPLv2-or-later licensing.
> 
> I have discussed it internally with canokeys.org and they agreed
> to re-license it under GPLv2+
> 
> I will send a patch modifying the license.
> 
> In the meantime, canokey.c was also modified by
> MkfsSion <mkfssion@mkfssion.com>
> 
> I've Cc'ed MkfsSion for their attitude on this.
Acked-by: YuanYang Meng <mkfssion@mkfssion.com>
> 
> > 
> > With regards,
> > Daniel
> > 
> > [1] https://www.apache.org/licenses/GPL-compatibility.html
> > -- 
> > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> > |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> > 

