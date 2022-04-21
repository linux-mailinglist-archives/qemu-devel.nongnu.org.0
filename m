Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3D950A0CB
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 15:26:30 +0200 (CEST)
Received: from localhost ([::1]:48106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhWpJ-0001La-P0
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 09:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhWks-0005yH-0X
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:21:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhWko-0000iv-N6
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:21:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650547310;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=sZYPE/3NfBln84Dnp4a3wVYonMsaZ0/n0bim+kBydkA=;
 b=AixUr6hVjndbrTZiQixhM8GI6o55Ov3KJYJlq9TQMJREq0IMYoweNE6qQP0JXxrvOaYyyw
 u8At9DOJgYeDB6b6VRbFxDTrwVEdmAXQ28PIcY/wZ1XDHRTNNHS+8d65xw5nJFs5Jd0vHl
 iWAf1M4es2ry/W6NwORiYr66k7WHE1I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-UADTmHNQNdW8JwoNmvnU9w-1; Thu, 21 Apr 2022 09:18:17 -0400
X-MC-Unique: UADTmHNQNdW8JwoNmvnU9w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B522B280534C;
 Thu, 21 Apr 2022 13:18:16 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6E21415F4E;
 Thu, 21 Apr 2022 13:18:15 +0000 (UTC)
Date: Thu, 21 Apr 2022 14:18:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/crypto: add Allwinner sun4i-ss crypto device
Message-ID: <YmFZlbM/ZAlKM1im@redhat.com>
References: <20220410191238.760733-1-clabbe@baylibre.com>
 <CAFEAcA9L89oN5nfM4RRxyYPBMtwbH1VfO1FbnXFUyC+rmzk51A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA9L89oN5nfM4RRxyYPBMtwbH1VfO1FbnXFUyC+rmzk51A@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: b.galvani@gmail.com, qemu-arm@nongnu.org,
 Corentin Labbe <clabbe@baylibre.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 21, 2022 at 01:38:00PM +0100, Peter Maydell wrote:
> On Sun, 10 Apr 2022 at 20:12, Corentin Labbe <clabbe@baylibre.com> wrote:
> >
> > From: Corentin LABBE <clabbe@baylibre.com>
> >
> > The Allwinner A10 has a cryptographic offloader device which
> > could be easily emulated.
> > The emulated device is tested with Linux only as any of BSD does not
> > support it.
> >
> > Signed-off-by: Corentin LABBE <clabbe@baylibre.com>
> 

> > +The ``sun4i-ss`` emulates the Allwinner cryptographic offloader
> > +present on early Allwinner SoCs (A10, A10s, A13, A20, A33)
> > +In qemu only A10 via the cubieboard machine is supported.
> > +
> > +The emulated hardware is capable of handling the following algorithms:
> > +- SHA1 and MD5 hash algorithms
> > +- AES/DES/DES3 in CBC/ECB
> > +- PRNG
> > +
> > +The emulated hardware does not handle yet:
> > +- CTS for AES
> > +- CTR for AES/DES/DES3



> > @@ -48,6 +50,10 @@ static void aw_a10_init(Object *obj)
> >
> >      object_initialize_child(obj, "emac", &s->emac, TYPE_AW_EMAC);
> >
> > +#if defined CONFIG_NETTLE
> > +    object_initialize_child(obj, "crypto", &s->crypto, TYPE_AW_SUN4I_SS);
> > +#endif
> 
> Don't put this kind of ifdef into device/SoC code, please.
> The device emulation needs to work regardless of what
> the specific crypto backends that got compiled into QEMU are.
> 
> > +#include <nettle/aes.h>
> > +#include <nettle/cbc.h>
> > +#include <nettle/des.h>
> > +#include <nettle/md5.h>
> > +#include <nettle/sha1.h>
> 
> Similarly, don't directly include nettle headers. The device needs
> to use the backend-agnostic headers from include/crypto. To the
> extent that they aren't sufficient to implement this device we
> can look at enhancing them.

The include/crypto/{cipher,hash}.h files should provide APIs that
cover these uses cases from what I see in this patch.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


