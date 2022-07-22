Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D0C57E360
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 17:05:45 +0200 (CEST)
Received: from localhost ([::1]:38806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEuDo-0002no-Rs
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 11:05:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oEuBW-0006rw-Tv
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 11:03:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oEuBU-0000h6-OG
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 11:03:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658502200;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Yga76Kv7JAsxxSkOSMV9T3jJ7r1DmT60evX2wTJjqjE=;
 b=Yc94/uj+SfYs5LcHdQslxP0jQV8QlJWyaxyf1zhiegwhXkDsW/fFr49IjfVQ33vdJPWcA7
 FVUXGuWTni6/lSzZlmFwepjsubxhV7QKJ37oZQ8T/n/hLZAPtzAPDzSwK5repR1CYEU9+e
 MJljOSMYaoTdPxhq9QTRRKLbC+KhLR4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-345-wMdl-ztrMK-RZxe5UAMctg-1; Fri, 22 Jul 2022 11:03:16 -0400
X-MC-Unique: wMdl-ztrMK-RZxe5UAMctg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7BDC2803520;
 Fri, 22 Jul 2022 15:03:16 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB3CE1415122;
 Fri, 22 Jul 2022 15:03:15 +0000 (UTC)
Date: Fri, 22 Jul 2022 16:03:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] trivial: Fix duplicated words
Message-ID: <Ytq8MarsylEWxvhQ@redhat.com>
References: <20220722145859.1952732-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220722145859.1952732-1-thuth@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 22, 2022 at 04:58:59PM +0200, Thomas Huth wrote:
> Some files wrongly contain the same word twice in a row.
> One of them should be removed or replaced.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Removing duplicated words seems to be the new hip trend on the
>  Linux kernel mailing lists - so let's be hip in QEMU land, too! ;-)

I've got patches proposed for this, as well as test to detect it:

https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg01405.html
https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg01403.html

though I'm not checking 'this this' or 'a a'

> 
>  docs/system/s390x/bootdevices.rst             | 2 +-
>  hw/usb/u2f.h                                  | 2 +-
>  include/hw/qdev-core.h                        | 2 +-
>  block/linux-aio.c                             | 2 +-
>  contrib/plugins/cache.c                       | 2 +-
>  hw/arm/omap2.c                                | 2 +-
>  hw/misc/mac_via.c                             | 2 +-
>  hw/s390x/s390-ccw.c                           | 2 +-
>  linux-user/i386/cpu_loop.c                    | 2 +-
>  target/arm/helper.c                           | 2 +-
>  tools/virtiofsd/fuse_virtio.c                 | 2 +-
>  ui/vdagent.c                                  | 2 +-
>  tests/docker/dockerfiles/debian-native.docker | 2 +-
>  13 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/docs/system/s390x/bootdevices.rst b/docs/system/s390x/bootdevices.rst
> index 9e591cb9dc..b5950133e8 100644
> --- a/docs/system/s390x/bootdevices.rst
> +++ b/docs/system/s390x/bootdevices.rst
> @@ -65,7 +65,7 @@ you can specify it via the ``-global s390-ipl.netboot_fw=filename``
>  command line option.
>  
>  The ``bootindex`` property is especially important for booting via the network.
> -If you don't specify the the ``bootindex`` property here, the network bootloader
> +If you don't specify the ``bootindex`` property here, the network bootloader
>  firmware code won't get loaded into the guest memory so that the network boot
>  will fail. For a successful network boot, try something like this::
>  
> diff --git a/hw/usb/u2f.h b/hw/usb/u2f.h
> index db30f3586b..a408a82927 100644
> --- a/hw/usb/u2f.h
> +++ b/hw/usb/u2f.h
> @@ -74,7 +74,7 @@ typedef struct U2FKeyState {
>  
>  /*
>   * API to be used by the U2F key device variants (i.e. hw/u2f-*.c)
> - * to interact with the the U2F key base device (i.e. hw/u2f.c)
> + * to interact with the U2F key base device (i.e. hw/u2f.c)
>   */
>  void u2f_send_to_guest(U2FKeyState *key,
>                         const uint8_t packet[U2FHID_PACKET_SIZE]);
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 98774e2835..785dd5a56e 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -386,7 +386,7 @@ bool qdev_realize_and_unref(DeviceState *dev, BusState *bus, Error **errp);
>   *
>   *  - unrealize any child buses by calling qbus_unrealize()
>   *    (this will recursively unrealize any devices on those buses)
> - *  - call the the unrealize method of @dev
> + *  - call the unrealize method of @dev
>   *
>   * The device can then be freed by causing its reference count to go
>   * to zero.
> diff --git a/block/linux-aio.c b/block/linux-aio.c
> index 9c2393a2f7..d2cfb7f523 100644
> --- a/block/linux-aio.c
> +++ b/block/linux-aio.c
> @@ -461,7 +461,7 @@ LinuxAioState *laio_init(Error **errp)
>      s = g_malloc0(sizeof(*s));
>      rc = event_notifier_init(&s->e, false);
>      if (rc < 0) {
> -        error_setg_errno(errp, -rc, "failed to to initialize event notifier");
> +        error_setg_errno(errp, -rc, "failed to initialize event notifier");
>          goto out_free_state;
>      }
>  
> diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
> index b9226e7c40..ac1510aaa1 100644
> --- a/contrib/plugins/cache.c
> +++ b/contrib/plugins/cache.c
> @@ -38,7 +38,7 @@ enum EvictionPolicy policy;
>   * put in any of the blocks inside the set. The number of block per set is
>   * called the associativity (assoc).
>   *
> - * Each block contains the the stored tag and a valid bit. Since this is not
> + * Each block contains the stored tag and a valid bit. Since this is not
>   * a functional simulator, the data itself is not stored. We only identify
>   * whether a block is in the cache or not by searching for its tag.
>   *
> diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
> index 02b1aa8c97..8571eedd73 100644
> --- a/hw/arm/omap2.c
> +++ b/hw/arm/omap2.c
> @@ -274,7 +274,7 @@ static void omap_eac_format_update(struct omap_eac_s *s)
>      fmt.freq = s->codec.rate;
>      /* TODO: signedness possibly depends on the CODEC hardware - or
>       * does I2S specify it?  */
> -    /* All register writes are 16 bits so we we store 16-bit samples
> +    /* All register writes are 16 bits so we store 16-bit samples
>       * in the buffers regardless of AGCFR[B8_16] value.  */
>      fmt.fmt = AUDIO_FORMAT_U16;
>  
> diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
> index fba85a53d7..f42c12755a 100644
> --- a/hw/misc/mac_via.c
> +++ b/hw/misc/mac_via.c
> @@ -587,7 +587,7 @@ static void adb_via_poll(void *opaque)
>          /*
>           * For older Linux kernels that switch to IDLE mode after sending the
>           * ADB command, detect if there is an existing response and return that
> -         * as a a "fake" autopoll reply or bus timeout accordingly
> +         * as a "fake" autopoll reply or bus timeout accordingly
>           */
>          *data = v1s->adb_data_out[0];
>          olen = v1s->adb_data_in_size;
> diff --git a/hw/s390x/s390-ccw.c b/hw/s390x/s390-ccw.c
> index 2fc8bb9c23..e2d86d96e7 100644
> --- a/hw/s390x/s390-ccw.c
> +++ b/hw/s390x/s390-ccw.c
> @@ -57,7 +57,7 @@ IOInstEnding s390_ccw_store(SubchDev *sch)
>  
>      /*
>       * This code is called for both virtual and passthrough devices,
> -     * but only applies to to the latter.  This ugly check makes that
> +     * but only applies to the latter.  This ugly check makes that
>       * distinction for us.
>       */
>      if (object_dynamic_cast(OBJECT(sch->driver_data), TYPE_S390_CCW)) {
> diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
> index 492701dd9a..42837399bc 100644
> --- a/linux-user/i386/cpu_loop.c
> +++ b/linux-user/i386/cpu_loop.c
> @@ -137,7 +137,7 @@ static void emulate_vsyscall(CPUX86State *env)
>      }
>  
>      /*
> -     * Validate the the pointer arguments.
> +     * Validate the pointer arguments.
>       */
>      switch (syscall) {
>      case TARGET_NR_gettimeofday:
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 1a8b06410e..e1bdc80c35 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3898,7 +3898,7 @@ static const ARMCPRegInfo cache_dirty_status_cp_reginfo[] = {
>  };
>  
>  static const ARMCPRegInfo cache_block_ops_cp_reginfo[] = {
> -    /* We never have a a block transfer operation in progress */
> +    /* We never have a block transfer operation in progress */
>      { .name = "BXSR", .cp = 15, .crn = 7, .crm = 12, .opc1 = 0, .opc2 = 4,
>        .access = PL0_R, .type = ARM_CP_CONST | ARM_CP_NO_RAW,
>        .resetvalue = 0 },
> diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> index a52eacf82e..9368e292e4 100644
> --- a/tools/virtiofsd/fuse_virtio.c
> +++ b/tools/virtiofsd/fuse_virtio.c
> @@ -379,7 +379,7 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
>      copy_iov(iov, count, in_sg, in_num, iov_len);
>  
>      /*
> -     * Build a copy of the the in_sg iov so we can skip bits in it,
> +     * Build a copy of the in_sg iov so we can skip bits in it,
>       * including changing the offsets
>       */
>      in_sg_cpy = g_new(struct iovec, in_num);
> diff --git a/ui/vdagent.c b/ui/vdagent.c
> index aa6167f0b4..a899eed195 100644
> --- a/ui/vdagent.c
> +++ b/ui/vdagent.c
> @@ -544,7 +544,7 @@ static void vdagent_clipboard_recv_grab(VDAgentChardev *vd, uint8_t s, uint32_t
>      if (size > sizeof(uint32_t) * 10) {
>          /*
>           * spice has 6 types as of 2021. Limiting to 10 entries
> -         * so we we have some wiggle room.
> +         * so we have some wiggle room.
>           */
>          return;
>      }
> diff --git a/tests/docker/dockerfiles/debian-native.docker b/tests/docker/dockerfiles/debian-native.docker
> index efd55cb6e0..8dd033097c 100644
> --- a/tests/docker/dockerfiles/debian-native.docker
> +++ b/tests/docker/dockerfiles/debian-native.docker
> @@ -1,7 +1,7 @@
>  #
>  # Docker Debian Native
>  #
> -# This this intended to build QEMU on native host systems. Debian is
> +# This is intended to build QEMU on native host systems. Debian is
>  # chosen due to the broadest range on supported host systems for QEMU.
>  #
>  # This docker target is based on the docker.io Debian Bullseye base
> -- 
> 2.31.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


