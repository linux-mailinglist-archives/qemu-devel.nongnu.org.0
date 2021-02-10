Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A713171C1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 21:56:11 +0100 (CET)
Received: from localhost ([::1]:60992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9wWw-0003bU-3j
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 15:56:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1l9wUa-0002zE-EG
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 15:53:44 -0500
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:36391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1l9wUU-0005MQ-Hu
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 15:53:44 -0500
Received: by mail-lj1-x231.google.com with SMTP id f8so4739858ljk.3
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 12:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Upmrj207BxOX95kqspzCl16Ghw8yBWTgw5KKi36x+Uk=;
 b=OVQY2GritNp+CLkb4Zsj9OqsdQg+nRXK7rvTJsoLCK7eHXZ5/vaFCbYzZj2UubrUYA
 EOtgIFjM3+r4xuokznBS60XKTqPaQk+bSgOSAWuOrmOIslhGpUNgALWPethzskez2f2c
 LVVJqexUKvk7GcJphHBVknqzff7VbdFvCo0uiA9KcCXjHpoknInwT6iVABDDFKswx/9i
 tCBB8w7FPCk39x6k8O8uIJoKLeYYbuIGDB3jRbor91NSHuVYH0ePBMAHoUvihUQwBtiL
 vZX+CugrFZZ8kL9lev68d6WZJ/f/2ExsZJO3SXZDiDXvuR0ZBaRXET38V6KB2UVl+J+t
 6j6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Upmrj207BxOX95kqspzCl16Ghw8yBWTgw5KKi36x+Uk=;
 b=YBYW2bV38LunvprrwvGRix5qbdpLOYE2XpEJ1gRuw1pK4ojyztNXcVAf1YQjXlZuS8
 NAHzIHV7C9fm3QgK6zqAoUTH4tugAu4PM2wnYeWyqPbzpf2VEGhLdxJB/0kzWyjcbw3b
 QMa7EIvBL7zuAqFbJoudWwAgOmEnfLMy5qcRKpnVw4uBNExyGGPvP0d9K//pB6/4L5OG
 RyBMngqiJif6B4LBNpRhqwJ6+XAJHbI9mba3cqPPVcDHlmxPWX4IzuwOa0cI4c2sV3vB
 DB0tTQXvCbpREHIxpHK33pKemqSym9TNnk7L51MR++nFZL7i6Zl+6JsxQjehugBJrNEq
 ccyA==
X-Gm-Message-State: AOAM532i4kfYkx8v4bfCosXdyTBGg1dCPWrTmDfrUz0oLpsN/XrRwN0H
 SzpoeiI5spoyCFphiiB70El93oVO65zstvhI71w33w==
X-Google-Smtp-Source: ABdhPJwNxe0le7scElvOX704bLgX4mZNYA7tGffGLSN/GUoIz/70E45WURfyFISlLPw7dK/5aiFgjBJkastsfkiA2jU=
X-Received: by 2002:a2e:7c02:: with SMTP id x2mr1814451ljc.247.1612990414954; 
 Wed, 10 Feb 2021 12:53:34 -0800 (PST)
MIME-Version: 1.0
References: <20210209132040.5091-1-peter.maydell@linaro.org>
 <20210209132040.5091-2-peter.maydell@linaro.org>
In-Reply-To: <20210209132040.5091-2-peter.maydell@linaro.org>
From: Hao Wu <wuhaotsh@google.com>
Date: Wed, 10 Feb 2021 12:53:22 -0800
Message-ID: <CAGcCb13Jsfk=pqbCZBwrBgi7dv3QQQJ6Mb8ZVPJ0OCgvxxzQtA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] clock: Add ClockEvent parameter to callbacks
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 Tyrone Ting <kfting@nuvoton.com>, Luc Michel <luc@lmichel.fr>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: multipart/alternative; boundary="000000000000b5ec3c05bb019893"
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=wuhaotsh@google.com; helo=mail-lj1-x231.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b5ec3c05bb019893
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 9, 2021 at 5:24 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> The Clock framework allows users to specify a callback which is
> called after the clock's period has been updated.  Some users need to
> also have a callback which is called before the clock period is
> updated.
>
> As the first step in adding support for notifying Clock users on
> pre-update events, add an argument to the ClockCallback to specify
> what event is being notified, and add an argument to the various
> functions for registering a callback to specify which events are
> of interest to that callback.
>
> Note that the documentation update renders correct the previously
> incorrect claim in 'Adding a new clock' that callbacks "will be
> explained in a following section".
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v1->v2: (suggested by Luc) instead of making callback functions check
> whether 'event' is one they are interested in, specify mask of
> interesting events at callback registration time.
> ---
>  docs/devel/clocks.rst            | 52 +++++++++++++++++++++++++++-----
>  include/hw/clock.h               | 21 +++++++++++--
>  include/hw/qdev-clock.h          | 17 ++++++++---
>  hw/adc/npcm7xx_adc.c             |  2 +-
>  hw/arm/armsse.c                  |  9 +++---
>  hw/char/cadence_uart.c           |  4 +--
>  hw/char/ibex_uart.c              |  4 +--
>  hw/char/pl011.c                  |  5 +--
>  hw/core/clock.c                  | 20 +++++++++---
>  hw/core/qdev-clock.c             |  8 +++--
>  hw/mips/cps.c                    |  2 +-
>  hw/misc/bcm2835_cprman.c         | 23 ++++++++------
>  hw/misc/npcm7xx_clk.c            | 26 +++++++++++++---
>  hw/misc/npcm7xx_pwm.c            |  2 +-
>  hw/misc/zynq_slcr.c              |  5 +--
>  hw/timer/cmsdk-apb-dualtimer.c   |  5 +--
>  hw/timer/cmsdk-apb-timer.c       |  4 +--
>  hw/timer/npcm7xx_timer.c         |  2 +-
>  hw/watchdog/cmsdk-apb-watchdog.c |  5 +--
>  target/mips/cpu.c                |  2 +-
>  20 files changed, 160 insertions(+), 58 deletions(-)
>
> diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
> index c54bbb82409..cd344e3fe5d 100644
> --- a/docs/devel/clocks.rst
> +++ b/docs/devel/clocks.rst
> @@ -80,11 +80,12 @@ Adding clocks to a device must be done during the init
> method of the Device
>  instance.
>
>  To add an input clock to a device, the function ``qdev_init_clock_in()``
> -must be used.  It takes the name, a callback and an opaque parameter
> -for the callback (this will be explained in a following section).
> +must be used.  It takes the name, a callback, an opaque parameter
> +for the callback and a mask of events when the callback should be
> +called (this will be explained in a following section).
>  Output is simpler; only the name is required. Typically::
>
> -    qdev_init_clock_in(DEVICE(dev), "clk_in", clk_in_callback, dev);
> +    qdev_init_clock_in(DEVICE(dev), "clk_in", clk_in_callback, dev,
> ClockUpdate);
>      qdev_init_clock_out(DEVICE(dev), "clk_out");
>
>  Both functions return the created Clock pointer, which should be saved in
> the
> @@ -113,7 +114,7 @@ output.
>       * callback for the input clock (see "Callback on input clock
>       * change" section below for more information).
>       */
> -    static void clk_in_callback(void *opaque);
> +    static void clk_in_callback(void *opaque, ClockEvent event);
>
>      /*
>       * static array describing clocks:
> @@ -124,7 +125,7 @@ output.
>       *   the clk_out field of a MyDeviceState structure.
>       */
>      static const ClockPortInitArray mydev_clocks = {
> -        QDEV_CLOCK_IN(MyDeviceState, clk_in, clk_in_callback),
> +        QDEV_CLOCK_IN(MyDeviceState, clk_in, clk_in_callback,
> ClockUpdate),
>          QDEV_CLOCK_OUT(MyDeviceState, clk_out),
>          QDEV_CLOCK_END
>      };
> @@ -153,6 +154,40 @@ nothing else to do. This value will be propagated to
> other clocks when
>  connecting the clocks together and devices will fetch the right value
> during
>  the first reset.
>
> +Clock callbacks
> +---------------
> +
> +You can give a clock a callback function in several ways:
> +
> + * by passing it as an argument to ``qdev_init_clock_in()``
> + * as an argument to the ``QDEV_CLOCK_IN()`` macro initializing an
> +   array to be passed to ``qdev_init_clocks()``
> + * by directly calling the ``clock_set_callback()`` function
> +
> +The callback function must be of this type:
> +
> +.. code-block:: c
> +
> +   typedef void ClockCallback(void *opaque, ClockEvent event);
> +
> +The ``opaque`` argument is the pointer passed to ``qdev_init_clock_in()``
> +or ``clock_set_callback()``; for ``qdev_init_clocks()`` it is the
> +``dev`` device pointer.
> +
> +The ``event`` argument specifies why the callback has been called.
> +When you register the callback you specify a mask of ClockEvent values
> +that you are interested in. The callback will only be called for those
> +events.
> +
> +The events currently supported are:
> +
> + * ``ClockUpdate`` : called after the input clock's period has changed
> +
> +Note that a clock only has one callback: it is not possible to register
> +different functions for different events. You must register a single
> +callback which listens for all of the events you are interested in,
> +and use the ``event`` argument to identify which event has happened.
> +
>  Retrieving clocks from a device
>  -------------------------------
>
> @@ -231,7 +266,7 @@ object during device instance init. For example:
>  .. code-block:: c
>
>      clk = qdev_init_clock_in(DEVICE(dev), "clk-in", clk_in_callback,
> -                             dev);
> +                             dev, ClockUpdate);
>      /* set initial value to 10ns / 100MHz */
>      clock_set_ns(clk, 10);
>
> @@ -267,11 +302,12 @@ next lowest integer. This implies some inaccuracy
> due to the rounding,
>  so be cautious about using it in calculations.
>
>  It is also possible to register a callback on clock frequency changes.
> -Here is an example:
> +Here is an example, which assumes that ``clock_callback`` has been
> +specified as the callback for the ``ClockUpdate`` event:
>
>  .. code-block:: c
>
> -    void clock_callback(void *opaque) {
> +    void clock_callback(void *opaque, ClockEvent event) {
>          MyDeviceState *s = (MyDeviceState *) opaque;
>          /*
>           * 'opaque' is the argument passed to qdev_init_clock_in();
> diff --git a/include/hw/clock.h b/include/hw/clock.h
> index e5f45e2626d..5c73b4e7ae9 100644
> --- a/include/hw/clock.h
> +++ b/include/hw/clock.h
> @@ -22,7 +22,17 @@
>  #define TYPE_CLOCK "clock"
>  OBJECT_DECLARE_SIMPLE_TYPE(Clock, CLOCK)
>
> -typedef void ClockCallback(void *opaque);
> +/*
> + * Argument to ClockCallback functions indicating why the callback
> + * has been called. A mask of these values logically ORed together
> + * is used to specify which events are interesting when the callback
> + * is registered, so these values must all be different bit values.
> + */
> +typedef enum ClockEvent {
> +    ClockUpdate = 1, /* Clock period has just updated */
> +} ClockEvent;
> +
> +typedef void ClockCallback(void *opaque, ClockEvent event);
>
>  /*
>   * clock store a value representing the clock's period in 2^-32ns unit.
> @@ -50,6 +60,7 @@ typedef void ClockCallback(void *opaque);
>   * @canonical_path: clock path string cache (used for trace purpose)
>   * @callback: called when clock changes
>   * @callback_opaque: argument for @callback
> + * @callback_events: mask of events when callback should be called
>   * @source: source (or parent in clock tree) of the clock
>   * @children: list of clocks connected to this one (it is their source)
>   * @sibling: structure used to form a clock list
> @@ -67,6 +78,7 @@ struct Clock {
>      char *canonical_path;
>      ClockCallback *callback;
>      void *callback_opaque;
> +    int callback_events;
>
>      /* Clocks are organized in a clock tree */
>      Clock *source;
> @@ -114,10 +126,15 @@ Clock *clock_new(Object *parent, const char *name);
>   * @clk: the clock to register the callback into
>   * @cb: the callback function
>   * @opaque: the argument to the callback
> + * @events: the events the callback should be called for
> + *          (logical OR of ClockEvent enum values)
>   *
>   * Register a callback called on every clock update.
> + * Note that a clock has only one callback: you cannot register
> + * different callback functions for different events.
>   */
> -void clock_set_callback(Clock *clk, ClockCallback *cb, void *opaque);
> +void clock_set_callback(Clock *clk, ClockCallback *cb,
> +                        void *opaque, int events);
>
>  /**
>   * clock_clear_callback:
> diff --git a/include/hw/qdev-clock.h b/include/hw/qdev-clock.h
> index 64ca4d266f2..348ec363525 100644
> --- a/include/hw/qdev-clock.h
> +++ b/include/hw/qdev-clock.h
> @@ -22,6 +22,8 @@
>   * @name: the name of the clock (can't be NULL).
>   * @callback: optional callback to be called on update or NULL.
>   * @opaque: argument for the callback
> + * @events: the events the callback should be called for
> + *          (logical OR of ClockEvent enum values)
>   * @returns: a pointer to the newly added clock
>   *
>   * Add an input clock to device @dev as a clock named @name.
> @@ -29,7 +31,8 @@
>   * The callback will be called with @opaque as opaque parameter.
>   */
>  Clock *qdev_init_clock_in(DeviceState *dev, const char *name,
> -                          ClockCallback *callback, void *opaque);
> +                          ClockCallback *callback, void *opaque,
> +                          int events);
>
>  /**
>   * qdev_init_clock_out:
> @@ -105,6 +108,7 @@ void qdev_finalize_clocklist(DeviceState *dev);
>   * @output: indicates whether the clock is input or output
>   * @callback: for inputs, optional callback to be called on clock's update
>   * with device as opaque
> + * @callback_events: mask of ClockEvent values for when callback is called
>   * @offset: optional offset to store the ClockIn or ClockOut pointer in
> device
>   * state structure (0 means unused)
>   */
> @@ -112,6 +116,7 @@ struct ClockPortInitElem {
>      const char *name;
>      bool is_output;
>      ClockCallback *callback;
> +    int callback_events;
>      size_t offset;
>  };
>
> @@ -119,10 +124,11 @@ struct ClockPortInitElem {
>      (offsetof(devstate, field) + \
>       type_check(Clock *, typeof_field(devstate, field)))
>
> -#define QDEV_CLOCK(out_not_in, devstate, field, cb) { \
> +#define QDEV_CLOCK(out_not_in, devstate, field, cb, cbevents) {  \
>      .name = (stringify(field)), \
>      .is_output = out_not_in, \
>      .callback = cb, \
> +    .callback_events = cbevents, \
>      .offset = clock_offset_value(devstate, field), \
>  }
>
> @@ -133,14 +139,15 @@ struct ClockPortInitElem {
>   * @field: a field in @_devstate (must be Clock*)
>   * @callback: (for input only) callback (or NULL) to be called with the
> device
>   * state as argument
> + * @cbevents: (for input only) ClockEvent mask for when callback is called
>   *
>   * The name of the clock will be derived from @field
>   */
> -#define QDEV_CLOCK_IN(devstate, field, callback) \
> -    QDEV_CLOCK(false, devstate, field, callback)
> +#define QDEV_CLOCK_IN(devstate, field, callback, cbevents)       \
> +    QDEV_CLOCK(false, devstate, field, callback, cbevents)
>
>  #define QDEV_CLOCK_OUT(devstate, field) \
> -    QDEV_CLOCK(true, devstate, field, NULL)
> +    QDEV_CLOCK(true, devstate, field, NULL, 0)
>
>  #define QDEV_CLOCK_END { .name = NULL }
>
> diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c
> index 870a6d50c27..573f4876dc6 100644
> --- a/hw/adc/npcm7xx_adc.c
> +++ b/hw/adc/npcm7xx_adc.c
> @@ -238,7 +238,7 @@ static void npcm7xx_adc_init(Object *obj)
>      memory_region_init_io(&s->iomem, obj, &npcm7xx_adc_ops, s,
>                            TYPE_NPCM7XX_ADC, 4 * KiB);
>      sysbus_init_mmio(sbd, &s->iomem);
> -    s->clock = qdev_init_clock_in(DEVICE(s), "clock", NULL, NULL);
> +    s->clock = qdev_init_clock_in(DEVICE(s), "clock", NULL, NULL,
> ClockUpdate);
>
Since there's no callback here should it be
 s->clock = qdev_init_clock_in(DEVICE(s), "clock", NULL, NULL, 0);
?

>
>      for (i = 0; i < NPCM7XX_ADC_NUM_INPUTS; ++i) {
>          object_property_add_uint32_ptr(obj, "adci[*]",
> diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
> index 26e1a8c95b6..fa155b72022 100644
> --- a/hw/arm/armsse.c
> +++ b/hw/arm/armsse.c
> @@ -230,9 +230,10 @@ static void armsse_forward_sec_resp_cfg(ARMSSE *s)
>      qdev_connect_gpio_out(dev_splitter, 2, s->sec_resp_cfg_in);
>  }
>
> -static void armsse_mainclk_update(void *opaque)
> +static void armsse_mainclk_update(void *opaque, ClockEvent event)
>  {
>      ARMSSE *s = ARM_SSE(opaque);
> +
>      /*
>       * Set system_clock_scale from our Clock input; this is what
>       * controls the tick rate of the CPU SysTick timer.
> @@ -251,8 +252,8 @@ static void armsse_init(Object *obj)
>      assert(info->num_cpus <= SSE_MAX_CPUS);
>
>      s->mainclk = qdev_init_clock_in(DEVICE(s), "MAINCLK",
> -                                    armsse_mainclk_update, s);
> -    s->s32kclk = qdev_init_clock_in(DEVICE(s), "S32KCLK", NULL, NULL);
> +                                    armsse_mainclk_update, s,
> ClockUpdate);
> +    s->s32kclk = qdev_init_clock_in(DEVICE(s), "S32KCLK", NULL, NULL, 0);
>
>      memory_region_init(&s->container, obj, "armsse-container",
> UINT64_MAX);
>
> @@ -1120,7 +1121,7 @@ static void armsse_realize(DeviceState *dev, Error
> **errp)
>      sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->container);
>
>      /* Set initial system_clock_scale from MAINCLK */
> -    armsse_mainclk_update(s);
> +    armsse_mainclk_update(s, ClockUpdate);
>  }
>
>  static void armsse_idau_check(IDAUInterface *ii, uint32_t address,
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index c603e14012a..ceb677bc5a8 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -519,7 +519,7 @@ static void cadence_uart_realize(DeviceState *dev,
> Error **errp)
>                               uart_event, NULL, s, NULL, true);
>  }
>
> -static void cadence_uart_refclk_update(void *opaque)
> +static void cadence_uart_refclk_update(void *opaque, ClockEvent event)
>  {
>      CadenceUARTState *s = opaque;
>
> @@ -537,7 +537,7 @@ static void cadence_uart_init(Object *obj)
>      sysbus_init_irq(sbd, &s->irq);
>
>      s->refclk = qdev_init_clock_in(DEVICE(obj), "refclk",
> -            cadence_uart_refclk_update, s);
> +                                   cadence_uart_refclk_update, s,
> ClockUpdate);
>      /* initialize the frequency in case the clock remains unconnected */
>      clock_set_hz(s->refclk, UART_DEFAULT_REF_CLK);
>
> diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
> index 89f1182c9bf..edcaa30aded 100644
> --- a/hw/char/ibex_uart.c
> +++ b/hw/char/ibex_uart.c
> @@ -396,7 +396,7 @@ static void ibex_uart_write(void *opaque, hwaddr addr,
>      }
>  }
>
> -static void ibex_uart_clk_update(void *opaque)
> +static void ibex_uart_clk_update(void *opaque, ClockEvent event)
>  {
>      IbexUartState *s = opaque;
>
> @@ -466,7 +466,7 @@ static void ibex_uart_init(Object *obj)
>      IbexUartState *s = IBEX_UART(obj);
>
>      s->f_clk = qdev_init_clock_in(DEVICE(obj), "f_clock",
> -                                  ibex_uart_clk_update, s);
> +                                  ibex_uart_clk_update, s, ClockUpdate);
>      clock_set_hz(s->f_clk, IBEX_UART_CLOCK);
>
>      sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->tx_watermark);
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index ea4a4e52356..c5621a195ff 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -309,7 +309,7 @@ static void pl011_event(void *opaque, QEMUChrEvent
> event)
>          pl011_put_fifo(opaque, 0x400);
>  }
>
> -static void pl011_clock_update(void *opaque)
> +static void pl011_clock_update(void *opaque, ClockEvent event)
>  {
>      PL011State *s = PL011(opaque);
>
> @@ -378,7 +378,8 @@ static void pl011_init(Object *obj)
>          sysbus_init_irq(sbd, &s->irq[i]);
>      }
>
> -    s->clk = qdev_init_clock_in(DEVICE(obj), "clk", pl011_clock_update,
> s);
> +    s->clk = qdev_init_clock_in(DEVICE(obj), "clk", pl011_clock_update, s,
> +                                ClockUpdate);
>
>      s->read_trigger = 1;
>      s->ifl = 0x12;
> diff --git a/hw/core/clock.c b/hw/core/clock.c
> index 76b5f468b6e..71dc1f4de65 100644
> --- a/hw/core/clock.c
> +++ b/hw/core/clock.c
> @@ -39,15 +39,16 @@ Clock *clock_new(Object *parent, const char *name)
>      return clk;
>  }
>
> -void clock_set_callback(Clock *clk, ClockCallback *cb, void *opaque)
> +void clock_set_callback(Clock *clk, ClockCallback *cb, void *opaque, int
> events)
>  {
>      clk->callback = cb;
>      clk->callback_opaque = opaque;
> +    clk->callback_events = events;
>  }
>
>  void clock_clear_callback(Clock *clk)
>  {
> -    clock_set_callback(clk, NULL, NULL);
> +    clock_set_callback(clk, NULL, NULL, 0);
>  }
>
>  bool clock_set(Clock *clk, uint64_t period)
> @@ -62,6 +63,17 @@ bool clock_set(Clock *clk, uint64_t period)
>      return true;
>  }
>
> +static void clock_call_callback(Clock *clk, ClockEvent event)
> +{
> +    /*
> +     * Call the Clock's callback for this event, if it has one and
> +     * is interested in this event.
> +     */
> +    if (clk->callback && (clk->callback_events & event)) {
> +        clk->callback(clk->callback_opaque, event);
> +    }
> +}
> +
>  static void clock_propagate_period(Clock *clk, bool call_callbacks)
>  {
>      Clock *child;
> @@ -72,8 +84,8 @@ static void clock_propagate_period(Clock *clk, bool
> call_callbacks)
>              trace_clock_update(CLOCK_PATH(child), CLOCK_PATH(clk),
>                                 CLOCK_PERIOD_TO_HZ(clk->period),
>                                 call_callbacks);
> -            if (call_callbacks && child->callback) {
> -                child->callback(child->callback_opaque);
> +            if (call_callbacks) {
> +                clock_call_callback(child, ClockUpdate);
>              }
>              clock_propagate_period(child, call_callbacks);
>          }
> diff --git a/hw/core/qdev-clock.c b/hw/core/qdev-clock.c
> index eb05f2a13ca..9c55ddc23ee 100644
> --- a/hw/core/qdev-clock.c
> +++ b/hw/core/qdev-clock.c
> @@ -111,7 +111,8 @@ Clock *qdev_init_clock_out(DeviceState *dev, const
> char *name)
>  }
>
>  Clock *qdev_init_clock_in(DeviceState *dev, const char *name,
> -                            ClockCallback *callback, void *opaque)
> +                          ClockCallback *callback, void *opaque,
> +                          int events)
>  {
>      NamedClockList *ncl;
>
> @@ -120,7 +121,7 @@ Clock *qdev_init_clock_in(DeviceState *dev, const char
> *name,
>      ncl = qdev_init_clocklist(dev, name, false, NULL);
>
>      if (callback) {
> -        clock_set_callback(ncl->clock, callback, opaque);
> +        clock_set_callback(ncl->clock, callback, opaque, events);
>      }
>      return ncl->clock;
>  }
> @@ -137,7 +138,8 @@ void qdev_init_clocks(DeviceState *dev, const
> ClockPortInitArray clocks)
>          if (elem->is_output) {
>              *clkp = qdev_init_clock_out(dev, elem->name);
>          } else {
> -            *clkp = qdev_init_clock_in(dev, elem->name, elem->callback,
> dev);
> +            *clkp = qdev_init_clock_in(dev, elem->name, elem->callback,
> dev,
> +                                       elem->callback_events);
>          }
>      }
>  }
> diff --git a/hw/mips/cps.c b/hw/mips/cps.c
> index 7a0d289efaf..2b436700ce6 100644
> --- a/hw/mips/cps.c
> +++ b/hw/mips/cps.c
> @@ -39,7 +39,7 @@ static void mips_cps_init(Object *obj)
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>      MIPSCPSState *s = MIPS_CPS(obj);
>
> -    s->clock = qdev_init_clock_in(DEVICE(obj), "clk-in", NULL, NULL);
> +    s->clock = qdev_init_clock_in(DEVICE(obj), "clk-in", NULL, NULL, 0);
>      /*
>       * Cover entire address space as there do not seem to be any
>       * constraints for the base address of CPC and GIC.
> diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
> index 7e415a017c9..75e6c574d46 100644
> --- a/hw/misc/bcm2835_cprman.c
> +++ b/hw/misc/bcm2835_cprman.c
> @@ -107,7 +107,7 @@ static void pll_update(CprmanPllState *pll)
>      clock_update_hz(pll->out, freq);
>  }
>
> -static void pll_xosc_update(void *opaque)
> +static void pll_xosc_update(void *opaque, ClockEvent event)
>  {
>      pll_update(CPRMAN_PLL(opaque));
>  }
> @@ -116,7 +116,8 @@ static void pll_init(Object *obj)
>  {
>      CprmanPllState *s = CPRMAN_PLL(obj);
>
> -    s->xosc_in = qdev_init_clock_in(DEVICE(s), "xosc-in",
> pll_xosc_update, s);
> +    s->xosc_in = qdev_init_clock_in(DEVICE(s), "xosc-in", pll_xosc_update,
> +                                    s, ClockUpdate);
>      s->out = qdev_init_clock_out(DEVICE(s), "out");
>  }
>
> @@ -209,7 +210,7 @@ static void pll_update_all_channels(BCM2835CprmanState
> *s,
>      }
>  }
>
> -static void pll_channel_pll_in_update(void *opaque)
> +static void pll_channel_pll_in_update(void *opaque, ClockEvent event)
>  {
>      pll_channel_update(CPRMAN_PLL_CHANNEL(opaque));
>  }
> @@ -219,7 +220,8 @@ static void pll_channel_init(Object *obj)
>      CprmanPllChannelState *s = CPRMAN_PLL_CHANNEL(obj);
>
>      s->pll_in = qdev_init_clock_in(DEVICE(s), "pll-in",
> -                                   pll_channel_pll_in_update, s);
> +                                   pll_channel_pll_in_update, s,
> +                                   ClockUpdate);
>      s->out = qdev_init_clock_out(DEVICE(s), "out");
>  }
>
> @@ -303,7 +305,7 @@ static void clock_mux_update(CprmanClockMuxState *mux)
>      clock_update_hz(mux->out, freq);
>  }
>
> -static void clock_mux_src_update(void *opaque)
> +static void clock_mux_src_update(void *opaque, ClockEvent event)
>  {
>      CprmanClockMuxState **backref = opaque;
>      CprmanClockMuxState *s = *backref;
> @@ -335,7 +337,8 @@ static void clock_mux_init(Object *obj)
>          s->backref[i] = s;
>          s->srcs[i] = qdev_init_clock_in(DEVICE(s), name,
>                                          clock_mux_src_update,
> -                                        &s->backref[i]);
> +                                        &s->backref[i],
> +                                        ClockUpdate);
>          g_free(name);
>      }
>
> @@ -380,7 +383,7 @@ static void dsi0hsck_mux_update(CprmanDsi0HsckMuxState
> *s)
>      clock_update(s->out, clock_get(src));
>  }
>
> -static void dsi0hsck_mux_in_update(void *opaque)
> +static void dsi0hsck_mux_in_update(void *opaque, ClockEvent event)
>  {
>      dsi0hsck_mux_update(CPRMAN_DSI0HSCK_MUX(opaque));
>  }
> @@ -390,8 +393,10 @@ static void dsi0hsck_mux_init(Object *obj)
>      CprmanDsi0HsckMuxState *s = CPRMAN_DSI0HSCK_MUX(obj);
>      DeviceState *dev = DEVICE(obj);
>
> -    s->plla_in = qdev_init_clock_in(dev, "plla-in",
> dsi0hsck_mux_in_update, s);
> -    s->plld_in = qdev_init_clock_in(dev, "plld-in",
> dsi0hsck_mux_in_update, s);
> +    s->plla_in = qdev_init_clock_in(dev, "plla-in",
> dsi0hsck_mux_in_update,
> +                                    s, ClockUpdate);
> +    s->plld_in = qdev_init_clock_in(dev, "plld-in",
> dsi0hsck_mux_in_update,
> +                                    s, ClockUpdate);
>      s->out = qdev_init_clock_out(DEVICE(s), "out");
>  }
>
> diff --git a/hw/misc/npcm7xx_clk.c b/hw/misc/npcm7xx_clk.c
> index 0bcae9ce957..a1ee67dc9a1 100644
> --- a/hw/misc/npcm7xx_clk.c
> +++ b/hw/misc/npcm7xx_clk.c
> @@ -586,15 +586,26 @@ static const DividerInitInfo
> divider_init_info_list[] = {
>      },
>  };
>
> +static void npcm7xx_clk_update_pll_cb(void *opaque, ClockEvent event)
> +{
> +    npcm7xx_clk_update_pll(opaque);
> +}
> +
>  static void npcm7xx_clk_pll_init(Object *obj)
>  {
>      NPCM7xxClockPLLState *pll = NPCM7XX_CLOCK_PLL(obj);
>
>      pll->clock_in = qdev_init_clock_in(DEVICE(pll), "clock-in",
> -            npcm7xx_clk_update_pll, pll);
> +                                       npcm7xx_clk_update_pll_cb, pll,
> +                                       ClockUpdate);
>      pll->clock_out = qdev_init_clock_out(DEVICE(pll), "clock-out");
>  }
>
> +static void npcm7xx_clk_update_sel_cb(void *opaque, ClockEvent event)
> +{
> +    npcm7xx_clk_update_sel(opaque);
> +}
> +
>  static void npcm7xx_clk_sel_init(Object *obj)
>  {
>      int i;
> @@ -603,16 +614,23 @@ static void npcm7xx_clk_sel_init(Object *obj)
>      for (i = 0; i < NPCM7XX_CLK_SEL_MAX_INPUT; ++i) {
>          sel->clock_in[i] = qdev_init_clock_in(DEVICE(sel),
>                  g_strdup_printf("clock-in[%d]", i),
> -                npcm7xx_clk_update_sel, sel);
> +                npcm7xx_clk_update_sel_cb, sel, ClockUpdate);
>      }
>      sel->clock_out = qdev_init_clock_out(DEVICE(sel), "clock-out");
>  }
> +
> +static void npcm7xx_clk_update_divider_cb(void *opaque, ClockEvent event)
> +{
> +    npcm7xx_clk_update_divider(opaque);
> +}
> +
>  static void npcm7xx_clk_divider_init(Object *obj)
>  {
>      NPCM7xxClockDividerState *div = NPCM7XX_CLOCK_DIVIDER(obj);
>
>      div->clock_in = qdev_init_clock_in(DEVICE(div), "clock-in",
> -            npcm7xx_clk_update_divider, div);
> +                                       npcm7xx_clk_update_divider_cb,
> +                                       div, ClockUpdate);
>      div->clock_out = qdev_init_clock_out(DEVICE(div), "clock-out");
>  }
>
> @@ -875,7 +893,7 @@ static void
> npcm7xx_clk_init_clock_hierarchy(NPCM7xxCLKState *s)
>  {
>      int i;
>
> -    s->clkref = qdev_init_clock_in(DEVICE(s), "clkref", NULL, NULL);
> +    s->clkref = qdev_init_clock_in(DEVICE(s), "clkref", NULL, NULL, 0);
>
>      /* First pass: init all converter modules */
>      QEMU_BUILD_BUG_ON(ARRAY_SIZE(pll_init_info_list) !=
> NPCM7XX_CLOCK_NR_PLLS);
> diff --git a/hw/misc/npcm7xx_pwm.c b/hw/misc/npcm7xx_pwm.c
> index dabcb6c0f95..ce192bb2741 100644
> --- a/hw/misc/npcm7xx_pwm.c
> +++ b/hw/misc/npcm7xx_pwm.c
> @@ -493,7 +493,7 @@ static void npcm7xx_pwm_init(Object *obj)
>      memory_region_init_io(&s->iomem, obj, &npcm7xx_pwm_ops, s,
>                            TYPE_NPCM7XX_PWM, 4 * KiB);
>      sysbus_init_mmio(sbd, &s->iomem);
> -    s->clock = qdev_init_clock_in(DEVICE(s), "clock", NULL, NULL);
> +    s->clock = qdev_init_clock_in(DEVICE(s), "clock", NULL, NULL, 0);
>
>      for (i = 0; i < NPCM7XX_PWM_PER_MODULE; ++i) {
>          object_property_add_uint32_ptr(obj, "freq[*]",
> diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
> index 66504a9d3ab..c66d7db177d 100644
> --- a/hw/misc/zynq_slcr.c
> +++ b/hw/misc/zynq_slcr.c
> @@ -307,9 +307,10 @@ static void zynq_slcr_propagate_clocks(ZynqSLCRState
> *s)
>      clock_propagate(s->uart1_ref_clk);
>  }
>
> -static void zynq_slcr_ps_clk_callback(void *opaque)
> +static void zynq_slcr_ps_clk_callback(void *opaque, ClockEvent event)
>  {
>      ZynqSLCRState *s = (ZynqSLCRState *) opaque;
> +
>      zynq_slcr_compute_clocks(s);
>      zynq_slcr_propagate_clocks(s);
>  }
> @@ -576,7 +577,7 @@ static const MemoryRegionOps slcr_ops = {
>  };
>
>  static const ClockPortInitArray zynq_slcr_clocks = {
> -    QDEV_CLOCK_IN(ZynqSLCRState, ps_clk, zynq_slcr_ps_clk_callback),
> +    QDEV_CLOCK_IN(ZynqSLCRState, ps_clk, zynq_slcr_ps_clk_callback,
> ClockUpdate),
>      QDEV_CLOCK_OUT(ZynqSLCRState, uart0_ref_clk),
>      QDEV_CLOCK_OUT(ZynqSLCRState, uart1_ref_clk),
>      QDEV_CLOCK_END
> diff --git a/hw/timer/cmsdk-apb-dualtimer.c
> b/hw/timer/cmsdk-apb-dualtimer.c
> index ef49f5852d3..d4a509c798e 100644
> --- a/hw/timer/cmsdk-apb-dualtimer.c
> +++ b/hw/timer/cmsdk-apb-dualtimer.c
> @@ -449,7 +449,7 @@ static void cmsdk_apb_dualtimer_reset(DeviceState *dev)
>      s->timeritop = 0;
>  }
>
> -static void cmsdk_apb_dualtimer_clk_update(void *opaque)
> +static void cmsdk_apb_dualtimer_clk_update(void *opaque, ClockEvent event)
>  {
>      CMSDKAPBDualTimer *s = CMSDK_APB_DUALTIMER(opaque);
>      int i;
> @@ -478,7 +478,8 @@ static void cmsdk_apb_dualtimer_init(Object *obj)
>          sysbus_init_irq(sbd, &s->timermod[i].timerint);
>      }
>      s->timclk = qdev_init_clock_in(DEVICE(s), "TIMCLK",
> -                                   cmsdk_apb_dualtimer_clk_update, s);
> +                                   cmsdk_apb_dualtimer_clk_update, s,
> +                                   ClockUpdate);
>  }
>
>  static void cmsdk_apb_dualtimer_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
> index ee51ce3369c..68aa1a76360 100644
> --- a/hw/timer/cmsdk-apb-timer.c
> +++ b/hw/timer/cmsdk-apb-timer.c
> @@ -204,7 +204,7 @@ static void cmsdk_apb_timer_reset(DeviceState *dev)
>      ptimer_transaction_commit(s->timer);
>  }
>
> -static void cmsdk_apb_timer_clk_update(void *opaque)
> +static void cmsdk_apb_timer_clk_update(void *opaque, ClockEvent event)
>  {
>      CMSDKAPBTimer *s = CMSDK_APB_TIMER(opaque);
>
> @@ -223,7 +223,7 @@ static void cmsdk_apb_timer_init(Object *obj)
>      sysbus_init_mmio(sbd, &s->iomem);
>      sysbus_init_irq(sbd, &s->timerint);
>      s->pclk = qdev_init_clock_in(DEVICE(s), "pclk",
> -                                 cmsdk_apb_timer_clk_update, s);
> +                                 cmsdk_apb_timer_clk_update, s,
> ClockUpdate);
>  }
>
>  static void cmsdk_apb_timer_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/timer/npcm7xx_timer.c b/hw/timer/npcm7xx_timer.c
> index 36e2c07db26..4efdf135b82 100644
> --- a/hw/timer/npcm7xx_timer.c
> +++ b/hw/timer/npcm7xx_timer.c
> @@ -627,7 +627,7 @@ static void npcm7xx_timer_init(Object *obj)
>      sysbus_init_mmio(sbd, &s->iomem);
>      qdev_init_gpio_out_named(dev, &w->reset_signal,
>              NPCM7XX_WATCHDOG_RESET_GPIO_OUT, 1);
> -    s->clock = qdev_init_clock_in(dev, "clock", NULL, NULL);
> +    s->clock = qdev_init_clock_in(dev, "clock", NULL, NULL, 0);
>  }
>
>  static const VMStateDescription vmstate_npcm7xx_base_timer = {
> diff --git a/hw/watchdog/cmsdk-apb-watchdog.c
> b/hw/watchdog/cmsdk-apb-watchdog.c
> index 302f1711738..5a2cd46eb76 100644
> --- a/hw/watchdog/cmsdk-apb-watchdog.c
> +++ b/hw/watchdog/cmsdk-apb-watchdog.c
> @@ -310,7 +310,7 @@ static void cmsdk_apb_watchdog_reset(DeviceState *dev)
>      ptimer_transaction_commit(s->timer);
>  }
>
> -static void cmsdk_apb_watchdog_clk_update(void *opaque)
> +static void cmsdk_apb_watchdog_clk_update(void *opaque, ClockEvent event)
>  {
>      CMSDKAPBWatchdog *s = CMSDK_APB_WATCHDOG(opaque);
>
> @@ -329,7 +329,8 @@ static void cmsdk_apb_watchdog_init(Object *obj)
>      sysbus_init_mmio(sbd, &s->iomem);
>      sysbus_init_irq(sbd, &s->wdogint);
>      s->wdogclk = qdev_init_clock_in(DEVICE(s), "WDOGCLK",
> -                                    cmsdk_apb_watchdog_clk_update, s);
> +                                    cmsdk_apb_watchdog_clk_update, s,
> +                                    ClockUpdate);
>
>      s->is_luminary = false;
>      s->id = cmsdk_apb_watchdog_id;
> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> index ad163ead625..2f3d9d2ce2c 100644
> --- a/target/mips/cpu.c
> +++ b/target/mips/cpu.c
> @@ -636,7 +636,7 @@ static void mips_cpu_initfn(Object *obj)
>      MIPSCPUClass *mcc = MIPS_CPU_GET_CLASS(obj);
>
>      cpu_set_cpustate_pointers(cpu);
> -    cpu->clock = qdev_init_clock_in(DEVICE(obj), "clk-in", NULL, cpu);
> +    cpu->clock = qdev_init_clock_in(DEVICE(obj), "clk-in", NULL, cpu, 0);
>      env->cpu_model = mcc->cpu_def;
>  }
>
> --
> 2.20.1
>
>
>

--000000000000b5ec3c05bb019893
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 9, 2021 at 5:24 AM Peter =
Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">The Clock framework allows users to specify a callback which is<br>
called after the clock&#39;s period has been updated.=C2=A0 Some users need=
 to<br>
also have a callback which is called before the clock period is<br>
updated.<br>
<br>
As the first step in adding support for notifying Clock users on<br>
pre-update events, add an argument to the ClockCallback to specify<br>
what event is being notified, and add an argument to the various<br>
functions for registering a callback to specify which events are<br>
of interest to that callback.<br>
<br>
Note that the documentation update renders correct the previously<br>
incorrect claim in &#39;Adding a new clock&#39; that callbacks &quot;will b=
e<br>
explained in a following section&quot;.<br>
<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
---<br>
v1-&gt;v2: (suggested by Luc) instead of making callback functions check<br=
>
whether &#39;event&#39; is one they are interested in, specify mask of<br>
interesting events at callback registration time.<br>
---<br>
=C2=A0docs/devel/clocks.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 52 +=
++++++++++++++++++++++++++-----<br>
=C2=A0include/hw/clock.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 21 +++++++++++--<br>
=C2=A0include/hw/qdev-clock.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 17 ++++++=
++---<br>
=C2=A0hw/adc/npcm7xx_adc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
=C2=A0hw/arm/armsse.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 9 +++---<br>
=C2=A0hw/char/cadence_uart.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 4 +--<br>
=C2=A0hw/char/ibex_uart.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 4 +--<br>
=C2=A0hw/char/pl011.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 5 +--<br>
=C2=A0hw/core/clock.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 20 +++++++++---<br>
=C2=A0hw/core/qdev-clock.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 8 +++--<br>
=C2=A0hw/mips/cps.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0hw/misc/bcm2835_cprman.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 23 ++++++=
++------<br>
=C2=A0hw/misc/npcm7xx_clk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 26 +=
++++++++++++---<br>
=C2=A0hw/misc/npcm7xx_pwm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 2 +-<br>
=C2=A0hw/misc/zynq_slcr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 5 +--<br>
=C2=A0hw/timer/cmsdk-apb-dualtimer.c=C2=A0 =C2=A0|=C2=A0 5 +--<br>
=C2=A0hw/timer/cmsdk-apb-timer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +--<br=
>
=C2=A0hw/timer/npcm7xx_timer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +=
-<br>
=C2=A0hw/watchdog/cmsdk-apb-watchdog.c |=C2=A0 5 +--<br>
=C2=A0target/mips/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 +-<br>
=C2=A020 files changed, 160 insertions(+), 58 deletions(-)<br>
<br>
diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst<br>
index c54bbb82409..cd344e3fe5d 100644<br>
--- a/docs/devel/clocks.rst<br>
+++ b/docs/devel/clocks.rst<br>
@@ -80,11 +80,12 @@ Adding clocks to a device must be done during the init =
method of the Device<br>
=C2=A0instance.<br>
<br>
=C2=A0To add an input clock to a device, the function ``qdev_init_clock_in(=
)``<br>
-must be used.=C2=A0 It takes the name, a callback and an opaque parameter<=
br>
-for the callback (this will be explained in a following section).<br>
+must be used.=C2=A0 It takes the name, a callback, an opaque parameter<br>
+for the callback and a mask of events when the callback should be<br>
+called (this will be explained in a following section).<br>
=C2=A0Output is simpler; only the name is required. Typically::<br>
<br>
-=C2=A0 =C2=A0 qdev_init_clock_in(DEVICE(dev), &quot;clk_in&quot;, clk_in_c=
allback, dev);<br>
+=C2=A0 =C2=A0 qdev_init_clock_in(DEVICE(dev), &quot;clk_in&quot;, clk_in_c=
allback, dev, ClockUpdate);<br>
=C2=A0 =C2=A0 =C2=A0qdev_init_clock_out(DEVICE(dev), &quot;clk_out&quot;);<=
br>
<br>
=C2=A0Both functions return the created Clock pointer, which should be save=
d in the<br>
@@ -113,7 +114,7 @@ output.<br>
=C2=A0 =C2=A0 =C2=A0 * callback for the input clock (see &quot;Callback on =
input clock<br>
=C2=A0 =C2=A0 =C2=A0 * change&quot; section below for more information).<br=
>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 static void clk_in_callback(void *opaque);<br>
+=C2=A0 =C2=A0 static void clk_in_callback(void *opaque, ClockEvent event);=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * static array describing clocks:<br>
@@ -124,7 +125,7 @@ output.<br>
=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0the clk_out field of a MyDeviceState str=
ucture.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0static const ClockPortInitArray mydev_clocks =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 QDEV_CLOCK_IN(MyDeviceState, clk_in, clk_in_ca=
llback),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QDEV_CLOCK_IN(MyDeviceState, clk_in, clk_in_ca=
llback, ClockUpdate),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QDEV_CLOCK_OUT(MyDeviceState, clk_out),<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QDEV_CLOCK_END<br>
=C2=A0 =C2=A0 =C2=A0};<br>
@@ -153,6 +154,40 @@ nothing else to do. This value will be propagated to o=
ther clocks when<br>
=C2=A0connecting the clocks together and devices will fetch the right value=
 during<br>
=C2=A0the first reset.<br>
<br>
+Clock callbacks<br>
+---------------<br>
+<br>
+You can give a clock a callback function in several ways:<br>
+<br>
+ * by passing it as an argument to ``qdev_init_clock_in()``<br>
+ * as an argument to the ``QDEV_CLOCK_IN()`` macro initializing an<br>
+=C2=A0 =C2=A0array to be passed to ``qdev_init_clocks()``<br>
+ * by directly calling the ``clock_set_callback()`` function<br>
+<br>
+The callback function must be of this type:<br>
+<br>
+.. code-block:: c<br>
+<br>
+=C2=A0 =C2=A0typedef void ClockCallback(void *opaque, ClockEvent event);<b=
r>
+<br>
+The ``opaque`` argument is the pointer passed to ``qdev_init_clock_in()``<=
br>
+or ``clock_set_callback()``; for ``qdev_init_clocks()`` it is the<br>
+``dev`` device pointer.<br>
+<br>
+The ``event`` argument specifies why the callback has been called.<br>
+When you register the callback you specify a mask of ClockEvent values<br>
+that you are interested in. The callback will only be called for those<br>
+events.<br>
+<br>
+The events currently supported are:<br>
+<br>
+ * ``ClockUpdate`` : called after the input clock&#39;s period has changed=
<br>
+<br>
+Note that a clock only has one callback: it is not possible to register<br=
>
+different functions for different events. You must register a single<br>
+callback which listens for all of the events you are interested in,<br>
+and use the ``event`` argument to identify which event has happened.<br>
+<br>
=C2=A0Retrieving clocks from a device<br>
=C2=A0-------------------------------<br>
<br>
@@ -231,7 +266,7 @@ object during device instance init. For example:<br>
=C2=A0.. code-block:: c<br>
<br>
=C2=A0 =C2=A0 =C2=A0clk =3D qdev_init_clock_in(DEVICE(dev), &quot;clk-in&qu=
ot;, clk_in_callback,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev, ClockUpdate);<br>
=C2=A0 =C2=A0 =C2=A0/* set initial value to 10ns / 100MHz */<br>
=C2=A0 =C2=A0 =C2=A0clock_set_ns(clk, 10);<br>
<br>
@@ -267,11 +302,12 @@ next lowest integer. This implies some inaccuracy due=
 to the rounding,<br>
=C2=A0so be cautious about using it in calculations.<br>
<br>
=C2=A0It is also possible to register a callback on clock frequency changes=
.<br>
-Here is an example:<br>
+Here is an example, which assumes that ``clock_callback`` has been<br>
+specified as the callback for the ``ClockUpdate`` event:<br>
<br>
=C2=A0.. code-block:: c<br>
<br>
-=C2=A0 =C2=A0 void clock_callback(void *opaque) {<br>
+=C2=A0 =C2=A0 void clock_callback(void *opaque, ClockEvent event) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MyDeviceState *s =3D (MyDeviceState *) op=
aque;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * &#39;opaque&#39; is the argument passe=
d to qdev_init_clock_in();<br>
diff --git a/include/hw/clock.h b/include/hw/clock.h<br>
index e5f45e2626d..5c73b4e7ae9 100644<br>
--- a/include/hw/clock.h<br>
+++ b/include/hw/clock.h<br>
@@ -22,7 +22,17 @@<br>
=C2=A0#define TYPE_CLOCK &quot;clock&quot;<br>
=C2=A0OBJECT_DECLARE_SIMPLE_TYPE(Clock, CLOCK)<br>
<br>
-typedef void ClockCallback(void *opaque);<br>
+/*<br>
+ * Argument to ClockCallback functions indicating why the callback<br>
+ * has been called. A mask of these values logically ORed together<br>
+ * is used to specify which events are interesting when the callback<br>
+ * is registered, so these values must all be different bit values.<br>
+ */<br>
+typedef enum ClockEvent {<br>
+=C2=A0 =C2=A0 ClockUpdate =3D 1, /* Clock period has just updated */<br>
+} ClockEvent;<br>
+<br>
+typedef void ClockCallback(void *opaque, ClockEvent event);<br>
<br>
=C2=A0/*<br>
=C2=A0 * clock store a value representing the clock&#39;s period in 2^-32ns=
 unit.<br>
@@ -50,6 +60,7 @@ typedef void ClockCallback(void *opaque);<br>
=C2=A0 * @canonical_path: clock path string cache (used for trace purpose)<=
br>
=C2=A0 * @callback: called when clock changes<br>
=C2=A0 * @callback_opaque: argument for @callback<br>
+ * @callback_events: mask of events when callback should be called<br>
=C2=A0 * @source: source (or parent in clock tree) of the clock<br>
=C2=A0 * @children: list of clocks connected to this one (it is their sourc=
e)<br>
=C2=A0 * @sibling: structure used to form a clock list<br>
@@ -67,6 +78,7 @@ struct Clock {<br>
=C2=A0 =C2=A0 =C2=A0char *canonical_path;<br>
=C2=A0 =C2=A0 =C2=A0ClockCallback *callback;<br>
=C2=A0 =C2=A0 =C2=A0void *callback_opaque;<br>
+=C2=A0 =C2=A0 int callback_events;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Clocks are organized in a clock tree */<br>
=C2=A0 =C2=A0 =C2=A0Clock *source;<br>
@@ -114,10 +126,15 @@ Clock *clock_new(Object *parent, const char *name);<b=
r>
=C2=A0 * @clk: the clock to register the callback into<br>
=C2=A0 * @cb: the callback function<br>
=C2=A0 * @opaque: the argument to the callback<br>
+ * @events: the events the callback should be called for<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (logical OR of ClockEvent enum values=
)<br>
=C2=A0 *<br>
=C2=A0 * Register a callback called on every clock update.<br>
+ * Note that a clock has only one callback: you cannot register<br>
+ * different callback functions for different events.<br>
=C2=A0 */<br>
-void clock_set_callback(Clock *clk, ClockCallback *cb, void *opaque);<br>
+void clock_set_callback(Clock *clk, ClockCallback *cb,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 void *opaque, int events);<br>
<br>
=C2=A0/**<br>
=C2=A0 * clock_clear_callback:<br>
diff --git a/include/hw/qdev-clock.h b/include/hw/qdev-clock.h<br>
index 64ca4d266f2..348ec363525 100644<br>
--- a/include/hw/qdev-clock.h<br>
+++ b/include/hw/qdev-clock.h<br>
@@ -22,6 +22,8 @@<br>
=C2=A0 * @name: the name of the clock (can&#39;t be NULL).<br>
=C2=A0 * @callback: optional callback to be called on update or NULL.<br>
=C2=A0 * @opaque: argument for the callback<br>
+ * @events: the events the callback should be called for<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (logical OR of ClockEvent enum values=
)<br>
=C2=A0 * @returns: a pointer to the newly added clock<br>
=C2=A0 *<br>
=C2=A0 * Add an input clock to device @dev as a clock named @name.<br>
@@ -29,7 +31,8 @@<br>
=C2=A0 * The callback will be called with @opaque as opaque parameter.<br>
=C2=A0 */<br>
=C2=A0Clock *qdev_init_clock_in(DeviceState *dev, const char *name,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ClockCallback *callback, void *opaque);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ClockCallback *callback, void *opaque,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 int events);<br>
<br>
=C2=A0/**<br>
=C2=A0 * qdev_init_clock_out:<br>
@@ -105,6 +108,7 @@ void qdev_finalize_clocklist(DeviceState *dev);<br>
=C2=A0 * @output: indicates whether the clock is input or output<br>
=C2=A0 * @callback: for inputs, optional callback to be called on clock&#39=
;s update<br>
=C2=A0 * with device as opaque<br>
+ * @callback_events: mask of ClockEvent values for when callback is called=
<br>
=C2=A0 * @offset: optional offset to store the ClockIn or ClockOut pointer =
in device<br>
=C2=A0 * state structure (0 means unused)<br>
=C2=A0 */<br>
@@ -112,6 +116,7 @@ struct ClockPortInitElem {<br>
=C2=A0 =C2=A0 =C2=A0const char *name;<br>
=C2=A0 =C2=A0 =C2=A0bool is_output;<br>
=C2=A0 =C2=A0 =C2=A0ClockCallback *callback;<br>
+=C2=A0 =C2=A0 int callback_events;<br>
=C2=A0 =C2=A0 =C2=A0size_t offset;<br>
=C2=A0};<br>
<br>
@@ -119,10 +124,11 @@ struct ClockPortInitElem {<br>
=C2=A0 =C2=A0 =C2=A0(offsetof(devstate, field) + \<br>
=C2=A0 =C2=A0 =C2=A0 type_check(Clock *, typeof_field(devstate, field)))<br=
>
<br>
-#define QDEV_CLOCK(out_not_in, devstate, field, cb) { \<br>
+#define QDEV_CLOCK(out_not_in, devstate, field, cb, cbevents) {=C2=A0 \<br=
>
=C2=A0 =C2=A0 =C2=A0.name =3D (stringify(field)), \<br>
=C2=A0 =C2=A0 =C2=A0.is_output =3D out_not_in, \<br>
=C2=A0 =C2=A0 =C2=A0.callback =3D cb, \<br>
+=C2=A0 =C2=A0 .callback_events =3D cbevents, \<br>
=C2=A0 =C2=A0 =C2=A0.offset =3D clock_offset_value(devstate, field), \<br>
=C2=A0}<br>
<br>
@@ -133,14 +139,15 @@ struct ClockPortInitElem {<br>
=C2=A0 * @field: a field in @_devstate (must be Clock*)<br>
=C2=A0 * @callback: (for input only) callback (or NULL) to be called with t=
he device<br>
=C2=A0 * state as argument<br>
+ * @cbevents: (for input only) ClockEvent mask for when callback is called=
<br>
=C2=A0 *<br>
=C2=A0 * The name of the clock will be derived from @field<br>
=C2=A0 */<br>
-#define QDEV_CLOCK_IN(devstate, field, callback) \<br>
-=C2=A0 =C2=A0 QDEV_CLOCK(false, devstate, field, callback)<br>
+#define QDEV_CLOCK_IN(devstate, field, callback, cbevents)=C2=A0 =C2=A0 =
=C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 QDEV_CLOCK(false, devstate, field, callback, cbevents)<br>
<br>
=C2=A0#define QDEV_CLOCK_OUT(devstate, field) \<br>
-=C2=A0 =C2=A0 QDEV_CLOCK(true, devstate, field, NULL)<br>
+=C2=A0 =C2=A0 QDEV_CLOCK(true, devstate, field, NULL, 0)<br>
<br>
=C2=A0#define QDEV_CLOCK_END { .name =3D NULL }<br>
<br>
diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c<br>
index 870a6d50c27..573f4876dc6 100644<br>
--- a/hw/adc/npcm7xx_adc.c<br>
+++ b/hw/adc/npcm7xx_adc.c<br>
@@ -238,7 +238,7 @@ static void npcm7xx_adc_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0memory_region_init_io(&amp;s-&gt;iomem, obj, &amp;npcm7=
xx_adc_ops, s,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0TYPE_NPCM7XX_ADC, 4 * KiB);<br>
=C2=A0 =C2=A0 =C2=A0sysbus_init_mmio(sbd, &amp;s-&gt;iomem);<br>
-=C2=A0 =C2=A0 s-&gt;clock =3D qdev_init_clock_in(DEVICE(s), &quot;clock&qu=
ot;, NULL, NULL);<br>
+=C2=A0 =C2=A0 s-&gt;clock =3D qdev_init_clock_in(DEVICE(s), &quot;clock&qu=
ot;, NULL, NULL, ClockUpdate);<br></blockquote><div>Since there&#39;s no ca=
llback here should it be</div><div>=C2=A0s-&gt;clock =3D qdev_init_clock_in=
(DEVICE(s), &quot;clock&quot;, NULL, NULL, 0);</div><div>?</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; NPCM7XX_ADC_NUM_INPUTS; ++i) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0object_property_add_uint32_ptr(obj, &quot=
;adci[*]&quot;,<br>
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c<br>
index 26e1a8c95b6..fa155b72022 100644<br>
--- a/hw/arm/armsse.c<br>
+++ b/hw/arm/armsse.c<br>
@@ -230,9 +230,10 @@ static void armsse_forward_sec_resp_cfg(ARMSSE *s)<br>
=C2=A0 =C2=A0 =C2=A0qdev_connect_gpio_out(dev_splitter, 2, s-&gt;sec_resp_c=
fg_in);<br>
=C2=A0}<br>
<br>
-static void armsse_mainclk_update(void *opaque)<br>
+static void armsse_mainclk_update(void *opaque, ClockEvent event)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0ARMSSE *s =3D ARM_SSE(opaque);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * Set system_clock_scale from our Clock input; this is=
 what<br>
=C2=A0 =C2=A0 =C2=A0 * controls the tick rate of the CPU SysTick timer.<br>
@@ -251,8 +252,8 @@ static void armsse_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0assert(info-&gt;num_cpus &lt;=3D SSE_MAX_CPUS);<br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;mainclk =3D qdev_init_clock_in(DEVICE(s), &quot;M=
AINCLK&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 armsse_mainclk_update,=
 s);<br>
-=C2=A0 =C2=A0 s-&gt;s32kclk =3D qdev_init_clock_in(DEVICE(s), &quot;S32KCL=
K&quot;, NULL, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 armsse_mainclk_update,=
 s, ClockUpdate);<br>
+=C2=A0 =C2=A0 s-&gt;s32kclk =3D qdev_init_clock_in(DEVICE(s), &quot;S32KCL=
K&quot;, NULL, NULL, 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0memory_region_init(&amp;s-&gt;container, obj, &quot;arm=
sse-container&quot;, UINT64_MAX);<br>
<br>
@@ -1120,7 +1121,7 @@ static void armsse_realize(DeviceState *dev, Error **=
errp)<br>
=C2=A0 =C2=A0 =C2=A0sysbus_init_mmio(SYS_BUS_DEVICE(s), &amp;s-&gt;containe=
r);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Set initial system_clock_scale from MAINCLK */<br>
-=C2=A0 =C2=A0 armsse_mainclk_update(s);<br>
+=C2=A0 =C2=A0 armsse_mainclk_update(s, ClockUpdate);<br>
=C2=A0}<br>
<br>
=C2=A0static void armsse_idau_check(IDAUInterface *ii, uint32_t address,<br=
>
diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c<br>
index c603e14012a..ceb677bc5a8 100644<br>
--- a/hw/char/cadence_uart.c<br>
+++ b/hw/char/cadence_uart.c<br>
@@ -519,7 +519,7 @@ static void cadence_uart_realize(DeviceState *dev, Erro=
r **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uart_event, NULL, s, NULL, true);<br>
=C2=A0}<br>
<br>
-static void cadence_uart_refclk_update(void *opaque)<br>
+static void cadence_uart_refclk_update(void *opaque, ClockEvent event)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CadenceUARTState *s =3D opaque;<br>
<br>
@@ -537,7 +537,7 @@ static void cadence_uart_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0sysbus_init_irq(sbd, &amp;s-&gt;irq);<br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;refclk =3D qdev_init_clock_in(DEVICE(obj), &quot;=
refclk&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cadence_uart_refclk_update, s);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cadence_uart_refclk_upd=
ate, s, ClockUpdate);<br>
=C2=A0 =C2=A0 =C2=A0/* initialize the frequency in case the clock remains u=
nconnected */<br>
=C2=A0 =C2=A0 =C2=A0clock_set_hz(s-&gt;refclk, UART_DEFAULT_REF_CLK);<br>
<br>
diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c<br>
index 89f1182c9bf..edcaa30aded 100644<br>
--- a/hw/char/ibex_uart.c<br>
+++ b/hw/char/ibex_uart.c<br>
@@ -396,7 +396,7 @@ static void ibex_uart_write(void *opaque, hwaddr addr,<=
br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-static void ibex_uart_clk_update(void *opaque)<br>
+static void ibex_uart_clk_update(void *opaque, ClockEvent event)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0IbexUartState *s =3D opaque;<br>
<br>
@@ -466,7 +466,7 @@ static void ibex_uart_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0IbexUartState *s =3D IBEX_UART(obj);<br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;f_clk =3D qdev_init_clock_in(DEVICE(obj), &quot;f=
_clock&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibex_uart_clk_update, s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibex_uart_clk_update, s, Cloc=
kUpdate);<br>
=C2=A0 =C2=A0 =C2=A0clock_set_hz(s-&gt;f_clk, IBEX_UART_CLOCK);<br>
<br>
=C2=A0 =C2=A0 =C2=A0sysbus_init_irq(SYS_BUS_DEVICE(obj), &amp;s-&gt;tx_wate=
rmark);<br>
diff --git a/hw/char/pl011.c b/hw/char/pl011.c<br>
index ea4a4e52356..c5621a195ff 100644<br>
--- a/hw/char/pl011.c<br>
+++ b/hw/char/pl011.c<br>
@@ -309,7 +309,7 @@ static void pl011_event(void *opaque, QEMUChrEvent even=
t)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pl011_put_fifo(opaque, 0x400);<br>
=C2=A0}<br>
<br>
-static void pl011_clock_update(void *opaque)<br>
+static void pl011_clock_update(void *opaque, ClockEvent event)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0PL011State *s =3D PL011(opaque);<br>
<br>
@@ -378,7 +378,8 @@ static void pl011_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sysbus_init_irq(sbd, &amp;s-&gt;irq[i]);<=
br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 s-&gt;clk =3D qdev_init_clock_in(DEVICE(obj), &quot;clk&quot=
;, pl011_clock_update, s);<br>
+=C2=A0 =C2=A0 s-&gt;clk =3D qdev_init_clock_in(DEVICE(obj), &quot;clk&quot=
;, pl011_clock_update, s,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ClockUpdate);<br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;read_trigger =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;ifl =3D 0x12;<br>
diff --git a/hw/core/clock.c b/hw/core/clock.c<br>
index 76b5f468b6e..71dc1f4de65 100644<br>
--- a/hw/core/clock.c<br>
+++ b/hw/core/clock.c<br>
@@ -39,15 +39,16 @@ Clock *clock_new(Object *parent, const char *name)<br>
=C2=A0 =C2=A0 =C2=A0return clk;<br>
=C2=A0}<br>
<br>
-void clock_set_callback(Clock *clk, ClockCallback *cb, void *opaque)<br>
+void clock_set_callback(Clock *clk, ClockCallback *cb, void *opaque, int e=
vents)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0clk-&gt;callback =3D cb;<br>
=C2=A0 =C2=A0 =C2=A0clk-&gt;callback_opaque =3D opaque;<br>
+=C2=A0 =C2=A0 clk-&gt;callback_events =3D events;<br>
=C2=A0}<br>
<br>
=C2=A0void clock_clear_callback(Clock *clk)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 clock_set_callback(clk, NULL, NULL);<br>
+=C2=A0 =C2=A0 clock_set_callback(clk, NULL, NULL, 0);<br>
=C2=A0}<br>
<br>
=C2=A0bool clock_set(Clock *clk, uint64_t period)<br>
@@ -62,6 +63,17 @@ bool clock_set(Clock *clk, uint64_t period)<br>
=C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0}<br>
<br>
+static void clock_call_callback(Clock *clk, ClockEvent event)<br>
+{<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Call the Clock&#39;s callback for this event, if it =
has one and<br>
+=C2=A0 =C2=A0 =C2=A0* is interested in this event.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (clk-&gt;callback &amp;&amp; (clk-&gt;callback_events &am=
p; event)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 clk-&gt;callback(clk-&gt;callback_opaque, even=
t);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
=C2=A0static void clock_propagate_period(Clock *clk, bool call_callbacks)<b=
r>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0Clock *child;<br>
@@ -72,8 +84,8 @@ static void clock_propagate_period(Clock *clk, bool call_=
callbacks)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_clock_update(CLOCK_PA=
TH(child), CLOCK_PATH(clk),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CLOCK_PERIOD_TO_HZ(clk-&gt;period),<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 call_callbacks);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (call_callbacks &amp;&amp; ch=
ild-&gt;callback) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 child-&gt;callback=
(child-&gt;callback_opaque);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (call_callbacks) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock_call_callbac=
k(child, ClockUpdate);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clock_propagate_period(chil=
d, call_callbacks);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/hw/core/qdev-clock.c b/hw/core/qdev-clock.c<br>
index eb05f2a13ca..9c55ddc23ee 100644<br>
--- a/hw/core/qdev-clock.c<br>
+++ b/hw/core/qdev-clock.c<br>
@@ -111,7 +111,8 @@ Clock *qdev_init_clock_out(DeviceState *dev, const char=
 *name)<br>
=C2=A0}<br>
<br>
=C2=A0Clock *qdev_init_clock_in(DeviceState *dev, const char *name,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ClockCallback *callback, void *opaque)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ClockCallback *callback, void *opaque,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 int events)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0NamedClockList *ncl;<br>
<br>
@@ -120,7 +121,7 @@ Clock *qdev_init_clock_in(DeviceState *dev, const char =
*name,<br>
=C2=A0 =C2=A0 =C2=A0ncl =3D qdev_init_clocklist(dev, name, false, NULL);<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0if (callback) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 clock_set_callback(ncl-&gt;clock, callback, op=
aque);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 clock_set_callback(ncl-&gt;clock, callback, op=
aque, events);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return ncl-&gt;clock;<br>
=C2=A0}<br>
@@ -137,7 +138,8 @@ void qdev_init_clocks(DeviceState *dev, const ClockPort=
InitArray clocks)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (elem-&gt;is_output) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*clkp =3D qdev_init_clock_o=
ut(dev, elem-&gt;name);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *clkp =3D qdev_init_clock_in(dev=
, elem-&gt;name, elem-&gt;callback, dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *clkp =3D qdev_init_clock_in(dev=
, elem-&gt;name, elem-&gt;callback, dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elem-&gt;=
callback_events);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
diff --git a/hw/mips/cps.c b/hw/mips/cps.c<br>
index 7a0d289efaf..2b436700ce6 100644<br>
--- a/hw/mips/cps.c<br>
+++ b/hw/mips/cps.c<br>
@@ -39,7 +39,7 @@ static void mips_cps_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);<br>
=C2=A0 =C2=A0 =C2=A0MIPSCPSState *s =3D MIPS_CPS(obj);<br>
<br>
-=C2=A0 =C2=A0 s-&gt;clock =3D qdev_init_clock_in(DEVICE(obj), &quot;clk-in=
&quot;, NULL, NULL);<br>
+=C2=A0 =C2=A0 s-&gt;clock =3D qdev_init_clock_in(DEVICE(obj), &quot;clk-in=
&quot;, NULL, NULL, 0);<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * Cover entire address space as there do not seem to b=
e any<br>
=C2=A0 =C2=A0 =C2=A0 * constraints for the base address of CPC and GIC.<br>
diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c<br>
index 7e415a017c9..75e6c574d46 100644<br>
--- a/hw/misc/bcm2835_cprman.c<br>
+++ b/hw/misc/bcm2835_cprman.c<br>
@@ -107,7 +107,7 @@ static void pll_update(CprmanPllState *pll)<br>
=C2=A0 =C2=A0 =C2=A0clock_update_hz(pll-&gt;out, freq);<br>
=C2=A0}<br>
<br>
-static void pll_xosc_update(void *opaque)<br>
+static void pll_xosc_update(void *opaque, ClockEvent event)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0pll_update(CPRMAN_PLL(opaque));<br>
=C2=A0}<br>
@@ -116,7 +116,8 @@ static void pll_init(Object *obj)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CprmanPllState *s =3D CPRMAN_PLL(obj);<br>
<br>
-=C2=A0 =C2=A0 s-&gt;xosc_in =3D qdev_init_clock_in(DEVICE(s), &quot;xosc-i=
n&quot;, pll_xosc_update, s);<br>
+=C2=A0 =C2=A0 s-&gt;xosc_in =3D qdev_init_clock_in(DEVICE(s), &quot;xosc-i=
n&quot;, pll_xosc_update,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s, ClockUpdate);<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;out =3D qdev_init_clock_out(DEVICE(s), &quot;out&=
quot;);<br>
=C2=A0}<br>
<br>
@@ -209,7 +210,7 @@ static void pll_update_all_channels(BCM2835CprmanState =
*s,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-static void pll_channel_pll_in_update(void *opaque)<br>
+static void pll_channel_pll_in_update(void *opaque, ClockEvent event)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0pll_channel_update(CPRMAN_PLL_CHANNEL(opaque));<br>
=C2=A0}<br>
@@ -219,7 +220,8 @@ static void pll_channel_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0CprmanPllChannelState *s =3D CPRMAN_PLL_CHANNEL(obj);<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;pll_in =3D qdev_init_clock_in(DEVICE(s), &quot;pl=
l-in&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pll_channel_pll_in_upda=
te, s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pll_channel_pll_in_upda=
te, s,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ClockUpdate);<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;out =3D qdev_init_clock_out(DEVICE(s), &quot;out&=
quot;);<br>
=C2=A0}<br>
<br>
@@ -303,7 +305,7 @@ static void clock_mux_update(CprmanClockMuxState *mux)<=
br>
=C2=A0 =C2=A0 =C2=A0clock_update_hz(mux-&gt;out, freq);<br>
=C2=A0}<br>
<br>
-static void clock_mux_src_update(void *opaque)<br>
+static void clock_mux_src_update(void *opaque, ClockEvent event)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CprmanClockMuxState **backref =3D opaque;<br>
=C2=A0 =C2=A0 =C2=A0CprmanClockMuxState *s =3D *backref;<br>
@@ -335,7 +337,8 @@ static void clock_mux_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;backref[i] =3D s;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;srcs[i] =3D qdev_init_clock_in(DEVI=
CE(s), name,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cl=
ock_mux_src_update,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;s-&=
gt;backref[i]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;s-&=
gt;backref[i],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ClockUpd=
ate);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(name);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -380,7 +383,7 @@ static void dsi0hsck_mux_update(CprmanDsi0HsckMuxState =
*s)<br>
=C2=A0 =C2=A0 =C2=A0clock_update(s-&gt;out, clock_get(src));<br>
=C2=A0}<br>
<br>
-static void dsi0hsck_mux_in_update(void *opaque)<br>
+static void dsi0hsck_mux_in_update(void *opaque, ClockEvent event)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0dsi0hsck_mux_update(CPRMAN_DSI0HSCK_MUX(opaque));<br>
=C2=A0}<br>
@@ -390,8 +393,10 @@ static void dsi0hsck_mux_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0CprmanDsi0HsckMuxState *s =3D CPRMAN_DSI0HSCK_MUX(obj);=
<br>
=C2=A0 =C2=A0 =C2=A0DeviceState *dev =3D DEVICE(obj);<br>
<br>
-=C2=A0 =C2=A0 s-&gt;plla_in =3D qdev_init_clock_in(dev, &quot;plla-in&quot=
;, dsi0hsck_mux_in_update, s);<br>
-=C2=A0 =C2=A0 s-&gt;plld_in =3D qdev_init_clock_in(dev, &quot;plld-in&quot=
;, dsi0hsck_mux_in_update, s);<br>
+=C2=A0 =C2=A0 s-&gt;plla_in =3D qdev_init_clock_in(dev, &quot;plla-in&quot=
;, dsi0hsck_mux_in_update,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s, ClockUpdate);<br>
+=C2=A0 =C2=A0 s-&gt;plld_in =3D qdev_init_clock_in(dev, &quot;plld-in&quot=
;, dsi0hsck_mux_in_update,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s, ClockUpdate);<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;out =3D qdev_init_clock_out(DEVICE(s), &quot;out&=
quot;);<br>
=C2=A0}<br>
<br>
diff --git a/hw/misc/npcm7xx_clk.c b/hw/misc/npcm7xx_clk.c<br>
index 0bcae9ce957..a1ee67dc9a1 100644<br>
--- a/hw/misc/npcm7xx_clk.c<br>
+++ b/hw/misc/npcm7xx_clk.c<br>
@@ -586,15 +586,26 @@ static const DividerInitInfo divider_init_info_list[]=
 =3D {<br>
=C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0};<br>
<br>
+static void npcm7xx_clk_update_pll_cb(void *opaque, ClockEvent event)<br>
+{<br>
+=C2=A0 =C2=A0 npcm7xx_clk_update_pll(opaque);<br>
+}<br>
+<br>
=C2=A0static void npcm7xx_clk_pll_init(Object *obj)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0NPCM7xxClockPLLState *pll =3D NPCM7XX_CLOCK_PLL(obj);<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0pll-&gt;clock_in =3D qdev_init_clock_in(DEVICE(pll), &q=
uot;clock-in&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_clk_update_pll, pll);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_c=
lk_update_pll_cb, pll,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ClockUpda=
te);<br>
=C2=A0 =C2=A0 =C2=A0pll-&gt;clock_out =3D qdev_init_clock_out(DEVICE(pll), =
&quot;clock-out&quot;);<br>
=C2=A0}<br>
<br>
+static void npcm7xx_clk_update_sel_cb(void *opaque, ClockEvent event)<br>
+{<br>
+=C2=A0 =C2=A0 npcm7xx_clk_update_sel(opaque);<br>
+}<br>
+<br>
=C2=A0static void npcm7xx_clk_sel_init(Object *obj)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
@@ -603,16 +614,23 @@ static void npcm7xx_clk_sel_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; NPCM7XX_CLK_SEL_MAX_INPUT; ++i) {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sel-&gt;clock_in[i] =3D qdev_init_clock_i=
n(DEVICE(sel),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_strdup_prin=
tf(&quot;clock-in[%d]&quot;, i),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_clk_update=
_sel, sel);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_clk_update=
_sel_cb, sel, ClockUpdate);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0sel-&gt;clock_out =3D qdev_init_clock_out(DEVICE(sel), =
&quot;clock-out&quot;);<br>
=C2=A0}<br>
+<br>
+static void npcm7xx_clk_update_divider_cb(void *opaque, ClockEvent event)<=
br>
+{<br>
+=C2=A0 =C2=A0 npcm7xx_clk_update_divider(opaque);<br>
+}<br>
+<br>
=C2=A0static void npcm7xx_clk_divider_init(Object *obj)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0NPCM7xxClockDividerState *div =3D NPCM7XX_CLOCK_DIVIDER=
(obj);<br>
<br>
=C2=A0 =C2=A0 =C2=A0div-&gt;clock_in =3D qdev_init_clock_in(DEVICE(div), &q=
uot;clock-in&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_clk_update_divider, div)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_c=
lk_update_divider_cb,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div, Cloc=
kUpdate);<br>
=C2=A0 =C2=A0 =C2=A0div-&gt;clock_out =3D qdev_init_clock_out(DEVICE(div), =
&quot;clock-out&quot;);<br>
=C2=A0}<br>
<br>
@@ -875,7 +893,7 @@ static void npcm7xx_clk_init_clock_hierarchy(NPCM7xxCLK=
State *s)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
<br>
-=C2=A0 =C2=A0 s-&gt;clkref =3D qdev_init_clock_in(DEVICE(s), &quot;clkref&=
quot;, NULL, NULL);<br>
+=C2=A0 =C2=A0 s-&gt;clkref =3D qdev_init_clock_in(DEVICE(s), &quot;clkref&=
quot;, NULL, NULL, 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* First pass: init all converter modules */<br>
=C2=A0 =C2=A0 =C2=A0QEMU_BUILD_BUG_ON(ARRAY_SIZE(pll_init_info_list) !=3D N=
PCM7XX_CLOCK_NR_PLLS);<br>
diff --git a/hw/misc/npcm7xx_pwm.c b/hw/misc/npcm7xx_pwm.c<br>
index dabcb6c0f95..ce192bb2741 100644<br>
--- a/hw/misc/npcm7xx_pwm.c<br>
+++ b/hw/misc/npcm7xx_pwm.c<br>
@@ -493,7 +493,7 @@ static void npcm7xx_pwm_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0memory_region_init_io(&amp;s-&gt;iomem, obj, &amp;npcm7=
xx_pwm_ops, s,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0TYPE_NPCM7XX_PWM, 4 * KiB);<br>
=C2=A0 =C2=A0 =C2=A0sysbus_init_mmio(sbd, &amp;s-&gt;iomem);<br>
-=C2=A0 =C2=A0 s-&gt;clock =3D qdev_init_clock_in(DEVICE(s), &quot;clock&qu=
ot;, NULL, NULL);<br>
+=C2=A0 =C2=A0 s-&gt;clock =3D qdev_init_clock_in(DEVICE(s), &quot;clock&qu=
ot;, NULL, NULL, 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; NPCM7XX_PWM_PER_MODULE; ++i) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0object_property_add_uint32_ptr(obj, &quot=
;freq[*]&quot;,<br>
diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c<br>
index 66504a9d3ab..c66d7db177d 100644<br>
--- a/hw/misc/zynq_slcr.c<br>
+++ b/hw/misc/zynq_slcr.c<br>
@@ -307,9 +307,10 @@ static void zynq_slcr_propagate_clocks(ZynqSLCRState *=
s)<br>
=C2=A0 =C2=A0 =C2=A0clock_propagate(s-&gt;uart1_ref_clk);<br>
=C2=A0}<br>
<br>
-static void zynq_slcr_ps_clk_callback(void *opaque)<br>
+static void zynq_slcr_ps_clk_callback(void *opaque, ClockEvent event)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0ZynqSLCRState *s =3D (ZynqSLCRState *) opaque;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0zynq_slcr_compute_clocks(s);<br>
=C2=A0 =C2=A0 =C2=A0zynq_slcr_propagate_clocks(s);<br>
=C2=A0}<br>
@@ -576,7 +577,7 @@ static const MemoryRegionOps slcr_ops =3D {<br>
=C2=A0};<br>
<br>
=C2=A0static const ClockPortInitArray zynq_slcr_clocks =3D {<br>
-=C2=A0 =C2=A0 QDEV_CLOCK_IN(ZynqSLCRState, ps_clk, zynq_slcr_ps_clk_callba=
ck),<br>
+=C2=A0 =C2=A0 QDEV_CLOCK_IN(ZynqSLCRState, ps_clk, zynq_slcr_ps_clk_callba=
ck, ClockUpdate),<br>
=C2=A0 =C2=A0 =C2=A0QDEV_CLOCK_OUT(ZynqSLCRState, uart0_ref_clk),<br>
=C2=A0 =C2=A0 =C2=A0QDEV_CLOCK_OUT(ZynqSLCRState, uart1_ref_clk),<br>
=C2=A0 =C2=A0 =C2=A0QDEV_CLOCK_END<br>
diff --git a/hw/timer/cmsdk-apb-dualtimer.c b/hw/timer/cmsdk-apb-dualtimer.=
c<br>
index ef49f5852d3..d4a509c798e 100644<br>
--- a/hw/timer/cmsdk-apb-dualtimer.c<br>
+++ b/hw/timer/cmsdk-apb-dualtimer.c<br>
@@ -449,7 +449,7 @@ static void cmsdk_apb_dualtimer_reset(DeviceState *dev)=
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;timeritop =3D 0;<br>
=C2=A0}<br>
<br>
-static void cmsdk_apb_dualtimer_clk_update(void *opaque)<br>
+static void cmsdk_apb_dualtimer_clk_update(void *opaque, ClockEvent event)=
<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CMSDKAPBDualTimer *s =3D CMSDK_APB_DUALTIMER(opaque);<b=
r>
=C2=A0 =C2=A0 =C2=A0int i;<br>
@@ -478,7 +478,8 @@ static void cmsdk_apb_dualtimer_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sysbus_init_irq(sbd, &amp;s-&gt;timermod[=
i].timerint);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;timclk =3D qdev_init_clock_in(DEVICE(s), &quot;TI=
MCLK&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmsdk_apb_dualtimer_clk=
_update, s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmsdk_apb_dualtimer_clk=
_update, s,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ClockUpdate);<br>
=C2=A0}<br>
<br>
=C2=A0static void cmsdk_apb_dualtimer_realize(DeviceState *dev, Error **err=
p)<br>
diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c<br>
index ee51ce3369c..68aa1a76360 100644<br>
--- a/hw/timer/cmsdk-apb-timer.c<br>
+++ b/hw/timer/cmsdk-apb-timer.c<br>
@@ -204,7 +204,7 @@ static void cmsdk_apb_timer_reset(DeviceState *dev)<br>
=C2=A0 =C2=A0 =C2=A0ptimer_transaction_commit(s-&gt;timer);<br>
=C2=A0}<br>
<br>
-static void cmsdk_apb_timer_clk_update(void *opaque)<br>
+static void cmsdk_apb_timer_clk_update(void *opaque, ClockEvent event)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CMSDKAPBTimer *s =3D CMSDK_APB_TIMER(opaque);<br>
<br>
@@ -223,7 +223,7 @@ static void cmsdk_apb_timer_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0sysbus_init_mmio(sbd, &amp;s-&gt;iomem);<br>
=C2=A0 =C2=A0 =C2=A0sysbus_init_irq(sbd, &amp;s-&gt;timerint);<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;pclk =3D qdev_init_clock_in(DEVICE(s), &quot;pclk=
&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmsdk_apb_timer_clk_update, s)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmsdk_apb_timer_clk_update, s,=
 ClockUpdate);<br>
=C2=A0}<br>
<br>
=C2=A0static void cmsdk_apb_timer_realize(DeviceState *dev, Error **errp)<b=
r>
diff --git a/hw/timer/npcm7xx_timer.c b/hw/timer/npcm7xx_timer.c<br>
index 36e2c07db26..4efdf135b82 100644<br>
--- a/hw/timer/npcm7xx_timer.c<br>
+++ b/hw/timer/npcm7xx_timer.c<br>
@@ -627,7 +627,7 @@ static void npcm7xx_timer_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0sysbus_init_mmio(sbd, &amp;s-&gt;iomem);<br>
=C2=A0 =C2=A0 =C2=A0qdev_init_gpio_out_named(dev, &amp;w-&gt;reset_signal,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_WATCHDOG_RESET_GPIO=
_OUT, 1);<br>
-=C2=A0 =C2=A0 s-&gt;clock =3D qdev_init_clock_in(dev, &quot;clock&quot;, N=
ULL, NULL);<br>
+=C2=A0 =C2=A0 s-&gt;clock =3D qdev_init_clock_in(dev, &quot;clock&quot;, N=
ULL, NULL, 0);<br>
=C2=A0}<br>
<br>
=C2=A0static const VMStateDescription vmstate_npcm7xx_base_timer =3D {<br>
diff --git a/hw/watchdog/cmsdk-apb-watchdog.c b/hw/watchdog/cmsdk-apb-watch=
dog.c<br>
index 302f1711738..5a2cd46eb76 100644<br>
--- a/hw/watchdog/cmsdk-apb-watchdog.c<br>
+++ b/hw/watchdog/cmsdk-apb-watchdog.c<br>
@@ -310,7 +310,7 @@ static void cmsdk_apb_watchdog_reset(DeviceState *dev)<=
br>
=C2=A0 =C2=A0 =C2=A0ptimer_transaction_commit(s-&gt;timer);<br>
=C2=A0}<br>
<br>
-static void cmsdk_apb_watchdog_clk_update(void *opaque)<br>
+static void cmsdk_apb_watchdog_clk_update(void *opaque, ClockEvent event)<=
br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CMSDKAPBWatchdog *s =3D CMSDK_APB_WATCHDOG(opaque);<br>
<br>
@@ -329,7 +329,8 @@ static void cmsdk_apb_watchdog_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0sysbus_init_mmio(sbd, &amp;s-&gt;iomem);<br>
=C2=A0 =C2=A0 =C2=A0sysbus_init_irq(sbd, &amp;s-&gt;wdogint);<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;wdogclk =3D qdev_init_clock_in(DEVICE(s), &quot;W=
DOGCLK&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmsdk_apb_watchdog_clk=
_update, s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmsdk_apb_watchdog_clk=
_update, s,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ClockUpdate);<br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;is_luminary =3D false;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;id =3D cmsdk_apb_watchdog_id;<br>
diff --git a/target/mips/cpu.c b/target/mips/cpu.c<br>
index ad163ead625..2f3d9d2ce2c 100644<br>
--- a/target/mips/cpu.c<br>
+++ b/target/mips/cpu.c<br>
@@ -636,7 +636,7 @@ static void mips_cpu_initfn(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0MIPSCPUClass *mcc =3D MIPS_CPU_GET_CLASS(obj);<br>
<br>
=C2=A0 =C2=A0 =C2=A0cpu_set_cpustate_pointers(cpu);<br>
-=C2=A0 =C2=A0 cpu-&gt;clock =3D qdev_init_clock_in(DEVICE(obj), &quot;clk-=
in&quot;, NULL, cpu);<br>
+=C2=A0 =C2=A0 cpu-&gt;clock =3D qdev_init_clock_in(DEVICE(obj), &quot;clk-=
in&quot;, NULL, cpu, 0);<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;cpu_model =3D mcc-&gt;cpu_def;<br>
=C2=A0}<br>
<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000b5ec3c05bb019893--

