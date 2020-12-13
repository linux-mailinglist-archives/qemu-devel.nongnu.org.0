Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9143F2D9058
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:19:44 +0100 (CET)
Received: from localhost ([::1]:40684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koXqJ-0000Jy-47
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:19:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dann.frazier@canonical.com>)
 id 1koXpb-0008L8-1x
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:18:59 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:42147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.90_1) (envelope-from <dann.frazier@canonical.com>)
 id 1koXpY-0004gO-UX
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:18:58 -0500
Received: from mail-wr1-f70.google.com ([209.85.221.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <dann.frazier@canonical.com>) id 1koXpV-0004iY-PK
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 20:18:53 +0000
Received: by mail-wr1-f70.google.com with SMTP id d2so5692787wrr.5
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:18:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JquOMMwWNUzDXJCk58eCf3eMc7v8Eman7ehHSxJ++9U=;
 b=ETbXEBdRtjv2UxR8/PpKLqMin2EU8uWENR3qDjm4wqaAISdEshFXdXsx/93RxaiRfe
 9T/kyWrXiz9rGHIZJiKTf9GNgXzdvkvQuG0MENDwQ3LJn5Taum/trM6X3E44PL/g8WIq
 cHb4m+vHDvJrvxjL9+OMFKDmFxt+HAxOWG/Eow4aBie1vgXf9bOVzs2x6ecxZ5VihxB2
 zWeDJ6EA2ygniiaYv0+moQJa7MOpj8OWXhrQpmXDkq59oLDK4M2eyVuuK5tIvXzuVp+u
 d7GWSz9lX2IXAqeGY/jCq//AEzbd2dn1mnQFQSjWZ+eNbwFhkNoVG5Itq8De1qqYGnKV
 QoFg==
X-Gm-Message-State: AOAM532z7EO39oEeoLgOQkqaGjU0fn/liktSaKfkHCy+UdCYTkGVqj73
 WkYA8CQIDbDR7BUUQtavzriH8SIZHmwng9n4m7MAotirDkvo0ZR41rAiFw27TVSYaf8Hw2oQeio
 5Ms2qUcLo2tSoNai7frcO2G1FCyMi8ctYdmJNPW5CoAYGfgl+
X-Received: by 2002:adf:a388:: with SMTP id l8mr25353428wrb.354.1607890733412; 
 Sun, 13 Dec 2020 12:18:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYTlKDLVPIWUB1FdBgd98+5AjO4W8wHfgZqcRRxPxoUUKV9J7dkPBSWPGOh/g/NWFfC7g213vY1dPljA1eqOE=
X-Received: by 2002:adf:a388:: with SMTP id l8mr25353415wrb.354.1607890733157; 
 Sun, 13 Dec 2020 12:18:53 -0800 (PST)
MIME-Version: 1.0
References: <20200916084117.21828-1-kraxel@redhat.com>
 <20200916084117.21828-2-kraxel@redhat.com>
In-Reply-To: <20200916084117.21828-2-kraxel@redhat.com>
From: dann frazier <dann.frazier@canonical.com>
Date: Sun, 13 Dec 2020 13:18:42 -0700
Message-ID: <CALdTtnsBpZ1fyB=dJMdO7Oq=swHw5AsmZxVru_tf6iZZouC=5g@mail.gmail.com>
Subject: Re: [PATCH 1/2] audio: remove qemu_spice_audio_init()
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=91.189.89.112;
 envelope-from=dann.frazier@canonical.com; helo=youngberry.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 16, 2020 at 2:42 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Handle the spice special case in audio_init instead.
>
> With the qemu_spice_audio_init() symbol dependency being
> gone we can build spiceaudio as module.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/ui/qemu-spice.h |  1 -
>  audio/audio.c           | 16 ++++++++++++++++
>  audio/spiceaudio.c      |  5 -----
>  ui/spice-core.c         |  1 -
>  4 files changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/include/ui/qemu-spice.h b/include/ui/qemu-spice.h
> index 8c23dfe71797..12474d88f40e 100644
> --- a/include/ui/qemu-spice.h
> +++ b/include/ui/qemu-spice.h
> @@ -29,7 +29,6 @@ extern int using_spice;
>
>  void qemu_spice_init(void);
>  void qemu_spice_input_init(void);
> -void qemu_spice_audio_init(void);
>  void qemu_spice_display_init(void);
>  int qemu_spice_display_add_client(int csock, int skipauth, int tls);
>  int qemu_spice_add_interface(SpiceBaseInstance *sin);
> diff --git a/audio/audio.c b/audio/audio.c
> index ce8c6dec5f47..76cdba0943d1 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -34,6 +34,7 @@
>  #include "qemu/module.h"
>  #include "sysemu/replay.h"
>  #include "sysemu/runstate.h"
> +#include "ui/qemu-spice.h"
>  #include "trace.h"
>
>  #define AUDIO_CAP "audio"
> @@ -1658,6 +1659,21 @@ static AudioState *audio_init(Audiodev *dev, const char *name)
>      /* silence gcc warning about uninitialized variable */
>      AudiodevListHead head = QSIMPLEQ_HEAD_INITIALIZER(head);
>
> +    if (using_spice) {
> +        /*
> +         * When using spice allow the spice audio driver being picked
> +         * as default.
> +         *
> +         * Temporary hack.  Using audio devices without explicit
> +         * audiodev= property is already deprecated.  Same goes for
> +         * the -soundhw switch.  Once this support gets finally
> +         * removed we can also drop the concept of a default audio
> +         * backend and this can go away.
> +         */
> +        driver = audio_driver_lookup("spice");
> +        driver->can_be_default = 1;

fyi, one of my libvirt/QEMU guests now segfaults here.
See: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=977301

  -dann

> +    }
> +
>      if (dev) {
>          /* -audiodev option */
>          legacy_config = false;
> diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c
> index b6b5da4812f2..aae420cff997 100644
> --- a/audio/spiceaudio.c
> +++ b/audio/spiceaudio.c
> @@ -310,11 +310,6 @@ static struct audio_driver spice_audio_driver = {
>      .voice_size_in  = sizeof (SpiceVoiceIn),
>  };
>
> -void qemu_spice_audio_init (void)
> -{
> -    spice_audio_driver.can_be_default = 1;
> -}
> -
>  static void register_audio_spice(void)
>  {
>      audio_driver_register(&spice_audio_driver);
> diff --git a/ui/spice-core.c b/ui/spice-core.c
> index ecc2ec2c55c2..10aa309f78f7 100644
> --- a/ui/spice-core.c
> +++ b/ui/spice-core.c
> @@ -804,7 +804,6 @@ void qemu_spice_init(void)
>      qemu_spice_add_interface(&spice_migrate.base);
>
>      qemu_spice_input_init();
> -    qemu_spice_audio_init();
>
>      qemu_add_vm_change_state_handler(vm_change_state_handler, NULL);
>      qemu_spice_display_stop();
> --
> 2.27.0
>
>

