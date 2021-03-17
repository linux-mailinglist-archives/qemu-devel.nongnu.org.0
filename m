Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7242833F008
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 13:10:29 +0100 (CET)
Received: from localhost ([::1]:39778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMV0O-0007Ur-HG
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 08:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMUzR-00073a-7I
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 08:09:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMUzO-0003Hb-1R
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 08:09:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615982964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eoHx73f1RMXhzAUtyAK9k4SybgoKORRnSDu6J2jLbtE=;
 b=WlsUPbHgwPZ/v1gxu0d8Hj6dy7mASvb8gjvOly6bfm/5mATQfxb8xvHBabtACi+Jn8Kcc1
 nbzf52+UJxfqn1CROZao8uRFANOjIX2Ns2ceXJ7k4D25ckaYPC7aLVniZgdDDi8wdfD7VD
 i533cQx7JenGQqvIUsK9eaUkaDwLGLw=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-1mFTWXJgO3K_lIJ7mkSCDg-1; Wed, 17 Mar 2021 08:09:23 -0400
X-MC-Unique: 1mFTWXJgO3K_lIJ7mkSCDg-1
Received: by mail-oi1-f200.google.com with SMTP id h21so9417305oib.4
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 05:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eoHx73f1RMXhzAUtyAK9k4SybgoKORRnSDu6J2jLbtE=;
 b=WiihY8G5a7c5LphkBryLe4Ji0IJFA3eNf9EPpRFG/wtaK0ltaIivZa2hGhH8dNPdRU
 6S6aEIZxXxOr7h3HfpqOSl/ZF9ITAV8F71HVSr1T331o3kD3PEI9JLdESSY7p/YYCSr4
 48yxEXnfmz6bvziGpmv9GPsIfOBghlEV+/swXhzjlwboiuoA0tRe9izEdc5Xc+luejTc
 IhzQiu5Sg8UeCcWb8PK6VQ+p3o/q6kYCzMhjo1As1acALz2hlJ228Bx4lj3rxIemIOpT
 TeY3KKrQAMmJdwR9DU5yz1B66DR5Av1O2+FctbytQZJGIFM8UPI9S6C4KKpQF96EIERx
 0S+Q==
X-Gm-Message-State: AOAM532K8Jqa/ghJsArfFYvrag8UfSjNKN7/Mkc0gqHMcEcAYOkiTeLo
 1DmjN677Rgrq/NvTwklUwSl7xiOQHmQTjgg75czi9jW54krLwwiQePZPjniw/ctdu4ynIuhiBYC
 WrqzzIN/oDnlnP+qTbiGfBUX6Xf31usY=
X-Received: by 2002:a05:6830:16d3:: with SMTP id
 l19mr3172421otr.79.1615982962399; 
 Wed, 17 Mar 2021 05:09:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7LPmuoDljy0Viwku+yb66RialDt9cGKu7IrrzwhMeG6+nggbT5jWI1gjorMyh/4l+8hL9ZbRvOBq7vlOB4JY=
X-Received: by 2002:a05:6830:16d3:: with SMTP id
 l19mr3172402otr.79.1615982962197; 
 Wed, 17 Mar 2021 05:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210315170439.2868903-1-philmd@redhat.com>
 <20210317102553.GA52499@gmail.com>
In-Reply-To: <20210317102553.GA52499@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Wed, 17 Mar 2021 13:09:11 +0100
Message-ID: <CAP+75-UDaY=+6vNOeMbEGdxgLefgdGmEfrjFvh459P0sFP43Cg@mail.gmail.com>
Subject: Fwd: [PATCH] hw/core: Only build guest-loader if libfdt is available
To: QEMU Developers <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

forward to the list.

---------- Forwarded message ---------
From: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
Date: Wed, Mar 17, 2021 at 11:26 AM
Subject: Re: [PATCH] hw/core: Only build guest-loader if libfdt is availabl=
e
To: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


On Mon, Mar 15, 2021 at 06:04:39PM +0100, Philippe Mathieu-Daud=C3=A9 wrote=
:
>Add a Kconfig entry for guest-loader so we can optionally deselect
>it (default is built in), and add a Meson dependency on libfdt.
>
>This fixes when building with --disable-fdt:
>
>  /usr/bin/ld: libcommon.fa.p/hw_core_guest-loader.c.o: in function `loade=
r_insert_platform_data':
>  hw/core/guest-loader.c:56: undefined reference to `qemu_fdt_add_subnode'
>  /usr/bin/ld: hw/core/guest-loader.c:57: undefined reference to `qemu_fdt=
_setprop'
>  /usr/bin/ld: hw/core/guest-loader.c:61: undefined reference to `qemu_fdt=
_setprop_string_array'
>  /usr/bin/ld: hw/core/guest-loader.c:68: undefined reference to `qemu_fdt=
_setprop_string'
>  /usr/bin/ld: hw/core/guest-loader.c:74: undefined reference to `qemu_fdt=
_setprop_string_array'
>  collect2: error: ld returned 1 exit status
>
>Fixes: a33ff6d2c6b ("hw/core: implement a guest-loader to support static h=
ypervisor guests")
>Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
>Tested-by: Christian Borntraeger <borntraeger@de.ibm.com>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
Tested-by: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>

Thank you.

>---
> hw/core/Kconfig     | 5 +++++
> hw/core/meson.build | 3 +--
> 2 files changed, 6 insertions(+), 2 deletions(-)
>
>diff --git a/hw/core/Kconfig b/hw/core/Kconfig
>index fdf03514d7d..9397503656d 100644
>--- a/hw/core/Kconfig
>+++ b/hw/core/Kconfig
>@@ -11,6 +11,11 @@ config GENERIC_LOADER
>     bool
>     default y
>
>+config GUEST_LOADER
>+    bool
>+    default y
>+    depends on TCG
>+
> config OR_IRQ
>     bool
>
>diff --git a/hw/core/meson.build b/hw/core/meson.build
>index 9cd72edf513..59f1605bb07 100644
>--- a/hw/core/meson.build
>+++ b/hw/core/meson.build
>@@ -16,6 +16,7 @@
> common_ss.add(files('cpu.c'))
> common_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
> common_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true: files('generic-load=
er.c'))
>+common_ss.add(when: ['CONFIG_GUEST_LOADER', fdt], if_true: files('guest-l=
oader.c'))
> common_ss.add(when: 'CONFIG_OR_IRQ', if_true: files('or-irq.c'))
> common_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('platform-bus.c=
'))
> common_ss.add(when: 'CONFIG_PTIMER', if_true: files('ptimer.c'))
>@@ -37,8 +38,6 @@
>   'clock-vmstate.c',
> ))
>
>-softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('guest-loader.c'))
>-
> specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files(
>   'machine-qmp-cmds.c',
>   'numa.c',
>--
>2.26.2
>
>


