Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE2E3BE732
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 13:33:08 +0200 (CEST)
Received: from localhost ([::1]:42648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m15nf-0001Ml-O8
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 07:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1m15mj-0008RG-Js
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 07:32:09 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:46899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1m15mg-00067A-Fd
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 07:32:09 -0400
Received: by mail-qt1-x831.google.com with SMTP id h2so1694385qtq.13
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 04:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YpB0CWoaikLuNUsBk5nrKfOcgPqdd03yuBVf9klUaa4=;
 b=U1HC71GV6j/nHXyeplIdjWHhjlCwDeGmxquDXMCCvcyz/QRlOZ8Q/9E8gOlItf+fIp
 2wJTSnwT8Am2rhO8NmuV6EY683UPlXomICvYFq3PXB124YiNrizcHjvjrEESoByQNQbO
 zbgxZ53OGmA6T/FeeB/uMQbnXrWgbbUFBzHn7UhmtxHFGsUPtS/j5rAF7hzbgCaCB8Te
 r66mxRPxvJPjQLiK1FCUOwYtlOQg8to5XrTXUuBGZ/yJ0/W5FC6GTxB9u44mEb6nRINF
 wy31PxK9eJkZBQgEd56TdkM/Nr61UFagJwGDY/sDZ4TEOBEdQM+71OQ5Cr86kxkttZ1C
 x7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YpB0CWoaikLuNUsBk5nrKfOcgPqdd03yuBVf9klUaa4=;
 b=iU2zkyngXtOdiiCEYrUx5b1S40SrjWVxKtdQTYgVgMfQ/MtVq7GSxGEPN25Gzmmt/G
 Rc2kM4Wb3MYFvpTuS97exX8AJUy5xUECHens0tL3W8cA/vD7vC5HYD66ORQOunZVU2dS
 G26sdPcWsmca0wkkmjVi0tnSZDULesHNChXMnYOJaKupn27kV2znirMT56uXy+RFi4LR
 9dohgOi45YOyjYpCC/qSShzZ+nQLJExJnB9DYBTTnPfZD734T0n9ufGyjSR92QkdzkWv
 yghmLMb0N0AA79xKFadvS4VuoW3x6M21WV8+sYI0FL/Zz18R3V1lzzAvX3ong4mG/GXe
 OLvw==
X-Gm-Message-State: AOAM5336gAZ51glKhq3VBOnI8EIQFZztwPyAgt6cGDIsFkIsCVC9BCdf
 5yuYumKGDukPX1OOKLrZb367KdrCmggru62oz9pJbrkwo9FUe/jd
X-Google-Smtp-Source: ABdhPJxYn04viI5IB96y+mti+6YV+ZylmlDJX5aJmXoxFe2QLLKYmI0j4Z7P76WebHGWdopOjXSUemSfcFmdZWrBIqs=
X-Received: by 2002:ac8:7ec5:: with SMTP id x5mr7792768qtj.328.1625657523879; 
 Wed, 07 Jul 2021 04:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210629133823.9908-1-arkaisp2021@gmail.com>
In-Reply-To: <20210629133823.9908-1-arkaisp2021@gmail.com>
From: Arkadiy Isp <arkaisp2021@gmail.com>
Date: Wed, 7 Jul 2021 14:31:53 +0300
Message-ID: <CAE2screCnxx6jHTqQ7_h7a__5xStty_f7NRbGXJC-LqjeDU8zQ@mail.gmail.com>
Subject: Re: [PATCH] trace: add hardware interrupt calls tracing
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000003cc32b05c686e3f9"
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=arkaisp2021@gmail.com; helo=mail-qt1-x831.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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
Cc: pbonzini@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 pavel.dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003cc32b05c686e3f9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping?

https://patchwork.kernel.org/project/qemu-devel/patch/20210625073844.1229-3=
-mark.cave-ayland@ilande.co.uk/


=D0=B2=D1=82, 29 =D0=B8=D1=8E=D0=BD. 2021 =D0=B3. =D0=B2 16:38, Arkadiy <ar=
kaisp2021@gmail.com>:

> From: NDNF <arkaisp2021@gmail.com>
>
> Adds hardware interrupt call tracing. This is necessary to debugging Qemu
> and
> virtual devices. It was decided to use function names. This allow us
> tracing
> IRQ without global code changes.
> There was an attempt to use device names, but appeared the problem:
> it wasn't always possible to find out the name of the calling device or
> the receiver. For example GSI is not a device in Qemu.
> Hence, there will be a gap in the interrupt chain.
>
> Signed-off-by: NDNF <arkaisp2021@gmail.com>
> ---
>  hw/core/irq.c          | 28 ++++++++++++++++------
>  hw/core/qdev.c         | 20 ++++++++++------
>  hw/core/trace-events   |  3 +++
>  include/hw/irq.h       | 54 ++++++++++++++++++++++++++++--------------
>  include/hw/qdev-core.h | 32 ++++++++++++++++++-------
>  5 files changed, 97 insertions(+), 40 deletions(-)
>
> diff --git a/hw/core/irq.c b/hw/core/irq.c
> index 8a9cbdd556..ee32b58cec 100644
> --- a/hw/core/irq.c
> +++ b/hw/core/irq.c
> @@ -26,6 +26,9 @@
>  #include "hw/irq.h"
>  #include "qom/object.h"
>
> +
> +#include "trace.h"
> +
>  DECLARE_INSTANCE_CHECKER(struct IRQState, IRQ,
>                           TYPE_IRQ)
>
> @@ -35,18 +38,24 @@ struct IRQState {
>      qemu_irq_handler handler;
>      void *opaque;
>      int n;
> +    const char *targetFunc;
>  };
>
> -void qemu_set_irq(qemu_irq irq, int level)
> +void qemu_set_irq_with_trace(qemu_irq irq, int level, const char
> *callFunc)
>  {
>      if (!irq)
>          return;
>
> +    const char *targetFunc =3D irq->targetFunc;
> +    trace_irq_tracker(callFunc, targetFunc, irq->n, level);
>      irq->handler(irq->opaque, irq->n, level);
>  }
>
> -qemu_irq *qemu_extend_irqs(qemu_irq *old, int n_old, qemu_irq_handler
> handler,
> -                           void *opaque, int n)
> +/*Tracking irq function*/
> +
> +qemu_irq *qemu_extend_irqs_with_trace(qemu_irq *old, int n_old,
> +                                      qemu_irq_handler handler, void
> *opaque,
> +                                      int n, const char *targetFunc)
>  {
>      qemu_irq *s;
>      int i;
> @@ -56,17 +65,19 @@ qemu_irq *qemu_extend_irqs(qemu_irq *old, int n_old,
> qemu_irq_handler handler,
>      }
>      s =3D old ? g_renew(qemu_irq, old, n + n_old) : g_new(qemu_irq, n);
>      for (i =3D n_old; i < n + n_old; i++) {
> -        s[i] =3D qemu_allocate_irq(handler, opaque, i);
> +        s[i] =3D qemu_allocate_irq_with_trace(handler, opaque, i,
> targetFunc);
>      }
>      return s;
>  }
>
> -qemu_irq *qemu_allocate_irqs(qemu_irq_handler handler, void *opaque, int
> n)
> +qemu_irq *qemu_allocate_irqs_with_trace(qemu_irq_handler handler, void
> *opaque,
> +                                        int n, const char *targetFunc)
>  {
> -    return qemu_extend_irqs(NULL, 0, handler, opaque, n);
> +    return qemu_extend_irqs_with_trace(NULL, 0, handler, opaque, n,
> targetFunc);
>  }
>
> -qemu_irq qemu_allocate_irq(qemu_irq_handler handler, void *opaque, int n=
)
> +qemu_irq qemu_allocate_irq_with_trace(qemu_irq_handler handler, void
> *opaque,
> +                                      int n, const char *targetFunc)
>  {
>      struct IRQState *irq;
>
> @@ -74,10 +85,13 @@ qemu_irq qemu_allocate_irq(qemu_irq_handler handler,
> void *opaque, int n)
>      irq->handler =3D handler;
>      irq->opaque =3D opaque;
>      irq->n =3D n;
> +    irq->targetFunc =3D targetFunc;
>
>      return irq;
>  }
>
> +/*Tracking irq function*/
> +
>  void qemu_free_irqs(qemu_irq *s, int n)
>  {
>      int i;
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index cefc5eaa0a..e621de506d 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -450,17 +450,20 @@ static NamedGPIOList
> *qdev_get_named_gpio_list(DeviceState *dev,
>      return ngl;
>  }
>
> -void qdev_init_gpio_in_named_with_opaque(DeviceState *dev,
> +/*Tracking irq function*/
> +
> +void qdev_init_gpio_in_named_with_opaque_with_trace(DeviceState *dev,
>                                           qemu_irq_handler handler,
> -                                         void *opaque,
> -                                         const char *name, int n)
> +                                         void *opaque, const char *name,
> +                                         int n, const char *target)
>  {
>      int i;
>      NamedGPIOList *gpio_list =3D qdev_get_named_gpio_list(dev, name);
>
>      assert(gpio_list->num_out =3D=3D 0 || !name);
> -    gpio_list->in =3D qemu_extend_irqs(gpio_list->in, gpio_list->num_in,
> handler,
> -                                     opaque, n);
> +    gpio_list->in =3D qemu_extend_irqs_with_trace(gpio_list->in,
> +                                                gpio_list->num_in,
> handler,
> +                                                opaque, n, target);
>
>      if (!name) {
>          name =3D "unnamed-gpio-in";
> @@ -476,11 +479,14 @@ void qdev_init_gpio_in_named_with_opaque(DeviceStat=
e
> *dev,
>      gpio_list->num_in +=3D n;
>  }
>
> -void qdev_init_gpio_in(DeviceState *dev, qemu_irq_handler handler, int n=
)
> +void qdev_init_gpio_in_with_trace(DeviceState *dev, qemu_irq_handler
> handler,
> +                                  int n, const char *target)
>  {
> -    qdev_init_gpio_in_named(dev, handler, NULL, n);
> +    qdev_init_gpio_in_named_with_trace(dev, handler, NULL, n, target);
>  }
>
> +/*Tracking irq function*/
> +
>  void qdev_init_gpio_out_named(DeviceState *dev, qemu_irq *pins,
>                                const char *name, int n)
>  {
> diff --git a/hw/core/trace-events b/hw/core/trace-events
> index 360ddeb2c8..a2a09d597f 100644
> --- a/hw/core/trace-events
> +++ b/hw/core/trace-events
> @@ -34,3 +34,6 @@ clock_disconnect(const char *clk) "'%s'"
>  clock_set(const char *clk, uint64_t old, uint64_t new) "'%s',
> %"PRIu64"Hz->%"PRIu64"Hz"
>  clock_propagate(const char *clk) "'%s'"
>  clock_update(const char *clk, const char *src, uint64_t hz, int cb)
> "'%s', src=3D'%s', val=3D%"PRIu64"Hz cb=3D%d"
> +
> +# irq.c
> +irq_tracker(const char *call_function, const char *target_function, int
> number, int level) ": callFunction =3D %s, targetFunction =3D %s, n =3D %=
i, level
> =3D %i"
> diff --git a/include/hw/irq.h b/include/hw/irq.h
> index dc7abf199e..dfcdff14a1 100644
> --- a/include/hw/irq.h
> +++ b/include/hw/irq.h
> @@ -5,40 +5,58 @@
>
>  #define TYPE_IRQ "irq"
>
> -void qemu_set_irq(qemu_irq irq, int level);
> +/*Tracking irq define*/
>
> -static inline void qemu_irq_raise(qemu_irq irq)
> -{
> -    qemu_set_irq(irq, 1);
> -}
> +#define qemu_set_irq(irq, level) \
> +    qemu_set_irq_with_trace(irq, level, __func__)
>
> -static inline void qemu_irq_lower(qemu_irq irq)
> -{
> -    qemu_set_irq(irq, 0);
> -}
> +#define qemu_irq_raise(irq) \
> +    qemu_set_irq(irq, 1)
>
> -static inline void qemu_irq_pulse(qemu_irq irq)
> -{
> -    qemu_set_irq(irq, 1);
> +#define qemu_irq_lower(irq) \
>      qemu_set_irq(irq, 0);
> -}
> +
> +#define qemu_irq_pulse(irq) \
> +    do { \
> +        qemu_set_irq(irq, 1); \
> +        qemu_set_irq(irq, 0); \
> +    } while (0)
> +
> +#define qemu_allocate_irqs(handler, opaque, n) \
> +    qemu_allocate_irqs_with_trace(handler, opaque, n, #handler)
> +
> +#define qemu_allocate_irq(handler, opaque, n) \
> +    qemu_allocate_irq_with_trace(handler, opaque, n, #handler)
> +
> +#define qemu_extend_irqs(old, n_old, handler, opaque, n) \
> +    qemu_extend_irqs_with_trace(old, n_old, handler, opaque, n, __func__=
)
> +
> +/*Tracking irq define*/
> +
> +/*Tracking irq function*/
> +
> +void qemu_set_irq_with_trace(qemu_irq irq, int level, const char
> *callFunc);
>
>  /* Returns an array of N IRQs. Each IRQ is assigned the argument handler
> and
>   * opaque data.
>   */
> -qemu_irq *qemu_allocate_irqs(qemu_irq_handler handler, void *opaque, int
> n);
> +qemu_irq *qemu_allocate_irqs_with_trace(qemu_irq_handler handler, void
> *opaque,
> +                                        int n, const char *targetFunc);
>
>  /*
>   * Allocates a single IRQ. The irq is assigned with a handler, an opaque
>   * data and the interrupt number.
>   */
> -qemu_irq qemu_allocate_irq(qemu_irq_handler handler, void *opaque, int n=
);
> -
> +qemu_irq qemu_allocate_irq_with_trace(qemu_irq_handler handler, void
> *opaque,
> +                                      int n, const char *targetFunc);
>  /* Extends an Array of IRQs. Old IRQs have their handlers and opaque dat=
a
>   * preserved. New IRQs are assigned the argument handler and opaque data=
.
>   */
> -qemu_irq *qemu_extend_irqs(qemu_irq *old, int n_old, qemu_irq_handler
> handler,
> -                                void *opaque, int n);
> +qemu_irq *qemu_extend_irqs_with_trace(qemu_irq *old, int n_old,
> +                                      qemu_irq_handler handler, void
> *opaque,
> +                                      int n, const char *targetFunc);
> +
> +/*Tracking irq function*/
>
>  void qemu_free_irqs(qemu_irq *s, int n);
>  void qemu_free_irq(qemu_irq irq);
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index bafc311bfa..f6f4642ac3 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -557,6 +557,20 @@ BusState *qdev_get_child_bus(DeviceState *dev, const
> char *name);
>
>  /*** Device API.  ***/
>
> +/*Tracking irq define*/
> +
> +#define qdev_init_gpio_in(dev, handler, n) \
> +    qdev_init_gpio_in_with_trace(dev, handler, n, #handler)
> +
> +#define qdev_init_gpio_in_named_with_opaque(dev, handler, opaque, name,
> n) \
> +    qdev_init_gpio_in_named_with_opaque_with_trace(dev, handler, opaque,
> name, \
> +                                              n, #handler)
> +
> +#define qdev_init_gpio_in_named(dev, handler, name, n) \
> +    qdev_init_gpio_in_named_with_trace(dev, handler, name, n, #handler)
> +
> +/*Tracking irq define*/
> +
>  /**
>   * qdev_init_gpio_in: create an array of anonymous input GPIO lines
>   * @dev: Device to create input GPIOs for
> @@ -574,7 +588,8 @@ BusState *qdev_get_child_bus(DeviceState *dev, const
> char *name);
>   * See qdev_get_gpio_in() for how code that uses such a device can get
>   * hold of an input GPIO line to manipulate it.
>   */
> -void qdev_init_gpio_in(DeviceState *dev, qemu_irq_handler handler, int n=
);
> +void qdev_init_gpio_in_with_trace(DeviceState *dev, qemu_irq_handler
> handler,
> +                                  int n, const char *target);
>  /**
>   * qdev_init_gpio_out: create an array of anonymous output GPIO lines
>   * @dev: Device to create output GPIOs for
> @@ -622,11 +637,10 @@ void qdev_init_gpio_out_named(DeviceState *dev,
> qemu_irq *pins,
>   * @name: Name of the GPIO input (must be unique for this device)
>   * @n: Number of GPIO lines in this input set
>   */
> -void qdev_init_gpio_in_named_with_opaque(DeviceState *dev,
> +void qdev_init_gpio_in_named_with_opaque_with_trace(DeviceState *dev,
>                                           qemu_irq_handler handler,
> -                                         void *opaque,
> -                                         const char *name, int n);
> -
> +                                         void *opaque, const char *name,
> +                                         int n, const char *target);
>  /**
>   * qdev_init_gpio_in_named: create an array of input GPIO lines
>   *   for the specified device
> @@ -634,11 +648,13 @@ void qdev_init_gpio_in_named_with_opaque(DeviceStat=
e
> *dev,
>   * Like qdev_init_gpio_in_named_with_opaque(), but the opaque pointer
>   * passed to the handler is @dev (which is the most commonly desired
> behaviour).
>   */
> -static inline void qdev_init_gpio_in_named(DeviceState *dev,
> +static inline void qdev_init_gpio_in_named_with_trace(DeviceState *dev,
>                                             qemu_irq_handler handler,
> -                                           const char *name, int n)
> +                                           const char *name, int n,
> +                                           const char *target)
>  {
> -    qdev_init_gpio_in_named_with_opaque(dev, handler, dev, name, n);
> +    qdev_init_gpio_in_named_with_opaque_with_trace(dev, handler, dev,
> +                                                   name, n, target);
>  }
>
>  /**
> --
> 2.17.1
>
>

--0000000000003cc32b05c686e3f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><pre style=3D"white-spac=
e:pre-wrap;color:rgb(0,0,0)"><span class=3D"gmail-il">Ping</span>?</pre><pr=
e><font color=3D"#000000"><span style=3D"white-space:pre-wrap"><a href=3D"h=
ttps://patchwork.kernel.org/project/qemu-devel/patch/20210625073844.1229-3-=
mark.cave-ayland@ilande.co.uk/">https://patchwork.kernel.org/project/qemu-d=
evel/patch/20210625073844.1229-3-mark.cave-ayland@ilande.co.uk/</a><br></sp=
an></font></pre></div></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">=D0=B2=D1=82, 29 =D0=B8=D1=8E=D0=BD. 2021 =D0=
=B3. =D0=B2 16:38, Arkadiy &lt;<a href=3D"mailto:arkaisp2021@gmail.com">ark=
aisp2021@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: NDNF &lt;<a href=3D"mailto:arkaisp2021@gmail.com" target=
=3D"_blank">arkaisp2021@gmail.com</a>&gt;<br>
<br>
Adds hardware interrupt call tracing. This is necessary to debugging Qemu a=
nd<br>
virtual devices. It was decided to use function names. This allow us tracin=
g<br>
IRQ without global code changes.<br>
There was an attempt to use device names, but appeared the problem:<br>
it wasn&#39;t always possible to find out the name of the calling device or=
<br>
the receiver. For example GSI is not a device in Qemu.<br>
Hence, there will be a gap in the interrupt chain.<br>
<br>
Signed-off-by: NDNF &lt;<a href=3D"mailto:arkaisp2021@gmail.com" target=3D"=
_blank">arkaisp2021@gmail.com</a>&gt;<br>
---<br>
=C2=A0hw/core/irq.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 28 ++++++++++++++++=
------<br>
=C2=A0hw/core/qdev.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 20 ++++++++++------=
<br>
=C2=A0hw/core/trace-events=C2=A0 =C2=A0|=C2=A0 3 +++<br>
=C2=A0include/hw/irq.h=C2=A0 =C2=A0 =C2=A0 =C2=A0| 54 +++++++++++++++++++++=
+++++++--------------<br>
=C2=A0include/hw/qdev-core.h | 32 ++++++++++++++++++-------<br>
=C2=A05 files changed, 97 insertions(+), 40 deletions(-)<br>
<br>
diff --git a/hw/core/irq.c b/hw/core/irq.c<br>
index 8a9cbdd556..ee32b58cec 100644<br>
--- a/hw/core/irq.c<br>
+++ b/hw/core/irq.c<br>
@@ -26,6 +26,9 @@<br>
=C2=A0#include &quot;hw/irq.h&quot;<br>
=C2=A0#include &quot;qom/object.h&quot;<br>
<br>
+<br>
+#include &quot;trace.h&quot;<br>
+<br>
=C2=A0DECLARE_INSTANCE_CHECKER(struct IRQState, IRQ,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 TYPE_IRQ)<br>
<br>
@@ -35,18 +38,24 @@ struct IRQState {<br>
=C2=A0 =C2=A0 =C2=A0qemu_irq_handler handler;<br>
=C2=A0 =C2=A0 =C2=A0void *opaque;<br>
=C2=A0 =C2=A0 =C2=A0int n;<br>
+=C2=A0 =C2=A0 const char *targetFunc;<br>
=C2=A0};<br>
<br>
-void qemu_set_irq(qemu_irq irq, int level)<br>
+void qemu_set_irq_with_trace(qemu_irq irq, int level, const char *callFunc=
)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (!irq)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
<br>
+=C2=A0 =C2=A0 const char *targetFunc =3D irq-&gt;targetFunc;<br>
+=C2=A0 =C2=A0 trace_irq_tracker(callFunc, targetFunc, irq-&gt;n, level);<b=
r>
=C2=A0 =C2=A0 =C2=A0irq-&gt;handler(irq-&gt;opaque, irq-&gt;n, level);<br>
=C2=A0}<br>
<br>
-qemu_irq *qemu_extend_irqs(qemu_irq *old, int n_old, qemu_irq_handler hand=
ler,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0void *opaque, int n)<br>
+/*Tracking irq function*/<br>
+<br>
+qemu_irq *qemu_extend_irqs_with_trace(qemu_irq *old, int n_old,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq_handle=
r handler, void *opaque,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int n, const ch=
ar *targetFunc)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0qemu_irq *s;<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
@@ -56,17 +65,19 @@ qemu_irq *qemu_extend_irqs(qemu_irq *old, int n_old, qe=
mu_irq_handler handler,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0s =3D old ? g_renew(qemu_irq, old, n + n_old) : g_new(q=
emu_irq, n);<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D n_old; i &lt; n + n_old; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s[i] =3D qemu_allocate_irq(handler, opaque, i)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s[i] =3D qemu_allocate_irq_with_trace(handler,=
 opaque, i, targetFunc);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return s;<br>
=C2=A0}<br>
<br>
-qemu_irq *qemu_allocate_irqs(qemu_irq_handler handler, void *opaque, int n=
)<br>
+qemu_irq *qemu_allocate_irqs_with_trace(qemu_irq_handler handler, void *op=
aque,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int n, c=
onst char *targetFunc)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return qemu_extend_irqs(NULL, 0, handler, opaque, n);<br>
+=C2=A0 =C2=A0 return qemu_extend_irqs_with_trace(NULL, 0, handler, opaque,=
 n, targetFunc);<br>
=C2=A0}<br>
<br>
-qemu_irq qemu_allocate_irq(qemu_irq_handler handler, void *opaque, int n)<=
br>
+qemu_irq qemu_allocate_irq_with_trace(qemu_irq_handler handler, void *opaq=
ue,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int n, const ch=
ar *targetFunc)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0struct IRQState *irq;<br>
<br>
@@ -74,10 +85,13 @@ qemu_irq qemu_allocate_irq(qemu_irq_handler handler, vo=
id *opaque, int n)<br>
=C2=A0 =C2=A0 =C2=A0irq-&gt;handler =3D handler;<br>
=C2=A0 =C2=A0 =C2=A0irq-&gt;opaque =3D opaque;<br>
=C2=A0 =C2=A0 =C2=A0irq-&gt;n =3D n;<br>
+=C2=A0 =C2=A0 irq-&gt;targetFunc =3D targetFunc;<br>
<br>
=C2=A0 =C2=A0 =C2=A0return irq;<br>
=C2=A0}<br>
<br>
+/*Tracking irq function*/<br>
+<br>
=C2=A0void qemu_free_irqs(qemu_irq *s, int n)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
diff --git a/hw/core/qdev.c b/hw/core/qdev.c<br>
index cefc5eaa0a..e621de506d 100644<br>
--- a/hw/core/qdev.c<br>
+++ b/hw/core/qdev.c<br>
@@ -450,17 +450,20 @@ static NamedGPIOList *qdev_get_named_gpio_list(Device=
State *dev,<br>
=C2=A0 =C2=A0 =C2=A0return ngl;<br>
=C2=A0}<br>
<br>
-void qdev_init_gpio_in_named_with_opaque(DeviceState *dev,<br>
+/*Tracking irq function*/<br>
+<br>
+void qdev_init_gpio_in_named_with_opaque_with_trace(DeviceState *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q=
emu_irq_handler handler,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vo=
id *opaque,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0co=
nst char *name, int n)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vo=
id *opaque, const char *name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in=
t n, const char *target)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
=C2=A0 =C2=A0 =C2=A0NamedGPIOList *gpio_list =3D qdev_get_named_gpio_list(d=
ev, name);<br>
<br>
=C2=A0 =C2=A0 =C2=A0assert(gpio_list-&gt;num_out =3D=3D 0 || !name);<br>
-=C2=A0 =C2=A0 gpio_list-&gt;in =3D qemu_extend_irqs(gpio_list-&gt;in, gpio=
_list-&gt;num_in, handler,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opaque, n);<br>
+=C2=A0 =C2=A0 gpio_list-&gt;in =3D qemu_extend_irqs_with_trace(gpio_list-&=
gt;in,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 gpio_list-&gt;num_in, handler,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 opaque, n, target);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!name) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name =3D &quot;unnamed-gpio-in&quot;;<br>
@@ -476,11 +479,14 @@ void qdev_init_gpio_in_named_with_opaque(DeviceState =
*dev,<br>
=C2=A0 =C2=A0 =C2=A0gpio_list-&gt;num_in +=3D n;<br>
=C2=A0}<br>
<br>
-void qdev_init_gpio_in(DeviceState *dev, qemu_irq_handler handler, int n)<=
br>
+void qdev_init_gpio_in_with_trace(DeviceState *dev, qemu_irq_handler handl=
er,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int n, const char *target)<br=
>
=C2=A0{<br>
-=C2=A0 =C2=A0 qdev_init_gpio_in_named(dev, handler, NULL, n);<br>
+=C2=A0 =C2=A0 qdev_init_gpio_in_named_with_trace(dev, handler, NULL, n, ta=
rget);<br>
=C2=A0}<br>
<br>
+/*Tracking irq function*/<br>
+<br>
=C2=A0void qdev_init_gpio_out_named(DeviceState *dev, qemu_irq *pins,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name, int n)<br>
=C2=A0{<br>
diff --git a/hw/core/trace-events b/hw/core/trace-events<br>
index 360ddeb2c8..a2a09d597f 100644<br>
--- a/hw/core/trace-events<br>
+++ b/hw/core/trace-events<br>
@@ -34,3 +34,6 @@ clock_disconnect(const char *clk) &quot;&#39;%s&#39;&quot=
;<br>
=C2=A0clock_set(const char *clk, uint64_t old, uint64_t new) &quot;&#39;%s&=
#39;, %&quot;PRIu64&quot;Hz-&gt;%&quot;PRIu64&quot;Hz&quot;<br>
=C2=A0clock_propagate(const char *clk) &quot;&#39;%s&#39;&quot;<br>
=C2=A0clock_update(const char *clk, const char *src, uint64_t hz, int cb) &=
quot;&#39;%s&#39;, src=3D&#39;%s&#39;, val=3D%&quot;PRIu64&quot;Hz cb=3D%d&=
quot;<br>
+<br>
+# irq.c<br>
+irq_tracker(const char *call_function, const char *target_function, int nu=
mber, int level) &quot;: callFunction =3D %s, targetFunction =3D %s, n =3D =
%i, level =3D %i&quot;<br>
diff --git a/include/hw/irq.h b/include/hw/irq.h<br>
index dc7abf199e..dfcdff14a1 100644<br>
--- a/include/hw/irq.h<br>
+++ b/include/hw/irq.h<br>
@@ -5,40 +5,58 @@<br>
<br>
=C2=A0#define TYPE_IRQ &quot;irq&quot;<br>
<br>
-void qemu_set_irq(qemu_irq irq, int level);<br>
+/*Tracking irq define*/<br>
<br>
-static inline void qemu_irq_raise(qemu_irq irq)<br>
-{<br>
-=C2=A0 =C2=A0 qemu_set_irq(irq, 1);<br>
-}<br>
+#define qemu_set_irq(irq, level) \<br>
+=C2=A0 =C2=A0 qemu_set_irq_with_trace(irq, level, __func__)<br>
<br>
-static inline void qemu_irq_lower(qemu_irq irq)<br>
-{<br>
-=C2=A0 =C2=A0 qemu_set_irq(irq, 0);<br>
-}<br>
+#define qemu_irq_raise(irq) \<br>
+=C2=A0 =C2=A0 qemu_set_irq(irq, 1)<br>
<br>
-static inline void qemu_irq_pulse(qemu_irq irq)<br>
-{<br>
-=C2=A0 =C2=A0 qemu_set_irq(irq, 1);<br>
+#define qemu_irq_lower(irq) \<br>
=C2=A0 =C2=A0 =C2=A0qemu_set_irq(irq, 0);<br>
-}<br>
+<br>
+#define qemu_irq_pulse(irq) \<br>
+=C2=A0 =C2=A0 do { \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_set_irq(irq, 1); \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_set_irq(irq, 0); \<br>
+=C2=A0 =C2=A0 } while (0)<br>
+<br>
+#define qemu_allocate_irqs(handler, opaque, n) \<br>
+=C2=A0 =C2=A0 qemu_allocate_irqs_with_trace(handler, opaque, n, #handler)<=
br>
+<br>
+#define qemu_allocate_irq(handler, opaque, n) \<br>
+=C2=A0 =C2=A0 qemu_allocate_irq_with_trace(handler, opaque, n, #handler)<b=
r>
+<br>
+#define qemu_extend_irqs(old, n_old, handler, opaque, n) \<br>
+=C2=A0 =C2=A0 qemu_extend_irqs_with_trace(old, n_old, handler, opaque, n, =
__func__)<br>
+<br>
+/*Tracking irq define*/<br>
+<br>
+/*Tracking irq function*/<br>
+<br>
+void qemu_set_irq_with_trace(qemu_irq irq, int level, const char *callFunc=
);<br>
<br>
=C2=A0/* Returns an array of N IRQs. Each IRQ is assigned the argument hand=
ler and<br>
=C2=A0 * opaque data.<br>
=C2=A0 */<br>
-qemu_irq *qemu_allocate_irqs(qemu_irq_handler handler, void *opaque, int n=
);<br>
+qemu_irq *qemu_allocate_irqs_with_trace(qemu_irq_handler handler, void *op=
aque,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int n, c=
onst char *targetFunc);<br>
<br>
=C2=A0/*<br>
=C2=A0 * Allocates a single IRQ. The irq is assigned with a handler, an opa=
que<br>
=C2=A0 * data and the interrupt number.<br>
=C2=A0 */<br>
-qemu_irq qemu_allocate_irq(qemu_irq_handler handler, void *opaque, int n);=
<br>
-<br>
+qemu_irq qemu_allocate_irq_with_trace(qemu_irq_handler handler, void *opaq=
ue,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int n, const ch=
ar *targetFunc);<br>
=C2=A0/* Extends an Array of IRQs. Old IRQs have their handlers and opaque =
data<br>
=C2=A0 * preserved. New IRQs are assigned the argument handler and opaque d=
ata.<br>
=C2=A0 */<br>
-qemu_irq *qemu_extend_irqs(qemu_irq *old, int n_old, qemu_irq_handler hand=
ler,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *opaque, int n);<br>
+qemu_irq *qemu_extend_irqs_with_trace(qemu_irq *old, int n_old,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq_handle=
r handler, void *opaque,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int n, const ch=
ar *targetFunc);<br>
+<br>
+/*Tracking irq function*/<br>
<br>
=C2=A0void qemu_free_irqs(qemu_irq *s, int n);<br>
=C2=A0void qemu_free_irq(qemu_irq irq);<br>
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h<br>
index bafc311bfa..f6f4642ac3 100644<br>
--- a/include/hw/qdev-core.h<br>
+++ b/include/hw/qdev-core.h<br>
@@ -557,6 +557,20 @@ BusState *qdev_get_child_bus(DeviceState *dev, const c=
har *name);<br>
<br>
=C2=A0/*** Device API.=C2=A0 ***/<br>
<br>
+/*Tracking irq define*/<br>
+<br>
+#define qdev_init_gpio_in(dev, handler, n) \<br>
+=C2=A0 =C2=A0 qdev_init_gpio_in_with_trace(dev, handler, n, #handler)<br>
+<br>
+#define qdev_init_gpio_in_named_with_opaque(dev, handler, opaque, name, n)=
 \<br>
+=C2=A0 =C2=A0 qdev_init_gpio_in_named_with_opaque_with_trace(dev, handler,=
 opaque, name, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 n, #handler)<br>
+<br>
+#define qdev_init_gpio_in_named(dev, handler, name, n) \<br>
+=C2=A0 =C2=A0 qdev_init_gpio_in_named_with_trace(dev, handler, name, n, #h=
andler)<br>
+<br>
+/*Tracking irq define*/<br>
+<br>
=C2=A0/**<br>
=C2=A0 * qdev_init_gpio_in: create an array of anonymous input GPIO lines<b=
r>
=C2=A0 * @dev: Device to create input GPIOs for<br>
@@ -574,7 +588,8 @@ BusState *qdev_get_child_bus(DeviceState *dev, const ch=
ar *name);<br>
=C2=A0 * See qdev_get_gpio_in() for how code that uses such a device can ge=
t<br>
=C2=A0 * hold of an input GPIO line to manipulate it.<br>
=C2=A0 */<br>
-void qdev_init_gpio_in(DeviceState *dev, qemu_irq_handler handler, int n);=
<br>
+void qdev_init_gpio_in_with_trace(DeviceState *dev, qemu_irq_handler handl=
er,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int n, const char *target);<b=
r>
=C2=A0/**<br>
=C2=A0 * qdev_init_gpio_out: create an array of anonymous output GPIO lines=
<br>
=C2=A0 * @dev: Device to create output GPIOs for<br>
@@ -622,11 +637,10 @@ void qdev_init_gpio_out_named(DeviceState *dev, qemu_=
irq *pins,<br>
=C2=A0 * @name: Name of the GPIO input (must be unique for this device)<br>
=C2=A0 * @n: Number of GPIO lines in this input set<br>
=C2=A0 */<br>
-void qdev_init_gpio_in_named_with_opaque(DeviceState *dev,<br>
+void qdev_init_gpio_in_named_with_opaque_with_trace(DeviceState *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q=
emu_irq_handler handler,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vo=
id *opaque,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0co=
nst char *name, int n);<br>
-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vo=
id *opaque, const char *name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in=
t n, const char *target);<br>
=C2=A0/**<br>
=C2=A0 * qdev_init_gpio_in_named: create an array of input GPIO lines<br>
=C2=A0 *=C2=A0 =C2=A0for the specified device<br>
@@ -634,11 +648,13 @@ void qdev_init_gpio_in_named_with_opaque(DeviceState =
*dev,<br>
=C2=A0 * Like qdev_init_gpio_in_named_with_opaque(), but the opaque pointer=
<br>
=C2=A0 * passed to the handler is @dev (which is the most commonly desired =
behaviour).<br>
=C2=A0 */<br>
-static inline void qdev_init_gpio_in_named(DeviceState *dev,<br>
+static inline void qdev_init_gpio_in_named_with_trace(DeviceState *dev,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 qemu_irq_handler handler,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0const char *name, int n)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0const char *name, int n,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0const char *target)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 qdev_init_gpio_in_named_with_opaque(dev, handler, dev, name,=
 n);<br>
+=C2=A0 =C2=A0 qdev_init_gpio_in_named_with_opaque_with_trace(dev, handler,=
 dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name, n, target);<br>
=C2=A0}<br>
<br>
=C2=A0/**<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--0000000000003cc32b05c686e3f9--

