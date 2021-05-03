Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3620371CD2
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 18:56:39 +0200 (CEST)
Received: from localhost ([::1]:37854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldbs7-0002M3-1T
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 12:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1ldboU-0008FD-4K
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:52:54 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:40829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1ldboP-0002m4-5Q
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:52:53 -0400
Received: by mail-lf1-x131.google.com with SMTP id c3so5016584lfs.7
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 09:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=YpEuQ7hF0GoltZceckdMT9YwteGoJXdZProS9A1Zy1c=;
 b=qfD11lkkLObJrWcnPKDbCcwEqtss203KUgytqrMDr+fMhHsviS+UyPmfJc/JrE8oof
 qSh9wpGroEuYW6TXO1nWvvONq81dA3ZJmAYJdPyJvbPW20Pq/jd2wOsW4ANhLwLlPaDi
 l6IV5nO89/dodcCUxw85vjoOkrFgejrTqyCrpbNOdX8GqD+4grRCKqB3/kXDtM76irON
 FdjAAB7EUa6mm+YKWb1SSrzT2fYYXfoVi1XcKUoY6YUBHTr1OsraoeAZcE30hWbtGLE1
 kLEcSGb5W6oc92ytFKtHzITeLQ6V4NFciaKPCqpg9YX8XR0glb655qpirdip9TgbVoCF
 uELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=YpEuQ7hF0GoltZceckdMT9YwteGoJXdZProS9A1Zy1c=;
 b=amVlHn3N9dnpccbaXFfcVKqqhledshSLaP2lPmDl4X8qQMMpZ7yCTfC3lDZFunaAQk
 BLkXyX2NYJmcFm5gdRkIHHE/2GIiCqP5o2qnJABiA5Tqb6xgSPeFZBT0bfOZJWWrXNSB
 1scfFibttEG7yLGdyzJwwgqT+LoTnSyAE9Nn1Npco6pTmRBcF5jq+GRG6ZooOK7u1U21
 lSC2Er/HuhzJB37tKd3MzYeB6Fw7SiDws69H5pH/X631QtBfDJd9HMxiurLqsIqPsnjp
 mX+HAcIIAmhW5eFPKncJc5/okjyG3Rz0Cq2dwZwWvAqK5ziMP9iKgsC0NE5WWOUfxY3b
 hQrQ==
X-Gm-Message-State: AOAM5326FoITjDtc21teKUNuJYWBwmfp1eV00y05CU3/jbMZ6D2vKlgJ
 9NP+8jrZ3Ift1Le1nBsnAaA=
X-Google-Smtp-Source: ABdhPJwDYjR7Z7+8sRizBz9j/JB2V9WjYjiDLB3Hs9R4v3Lq9Yk8so6nEOn5rkWz0wf/dOhXZaDCpQ==
X-Received: by 2002:a19:5208:: with SMTP id m8mr13628480lfb.372.1620060767340; 
 Mon, 03 May 2021 09:52:47 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id 21sm1301087ljz.60.2021.05.03.09.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 09:52:47 -0700 (PDT)
Date: Mon, 3 May 2021 18:52:46 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 2/2] hw/rtc/mc146818rtc: Convert to 3-phase reset
 (Resettable interface)
Message-ID: <20210503165246.GE477672@toto>
References: <20210502163931.552675-1-f4bug@amsat.org>
 <20210502163931.552675-3-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210502163931.552675-3-f4bug@amsat.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, May 02, 2021 at 06:39:31PM +0200, Philippe Mathieu-Daudé wrote:
> TYPE_MC146818_RTC is an ISA device, so its DeviceClass::reset()
> handler is called automatically when its qbus parent is reset
> (we don't need to register it manually).
> 
> We have 2 reset() methods: a generic one and the qdev one.
> Merge them into a reset_enter handler (keeping the IRQ lowering
> to a reset_hold one), and remove the qemu_register_reset() call.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/rtc/mc146818rtc.c | 42 ++++++++++++++++++++++--------------------
>  1 file changed, 22 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
> index 5d0fcacd0c0..836c3691706 100644
> --- a/hw/rtc/mc146818rtc.c
> +++ b/hw/rtc/mc146818rtc.c
> @@ -872,22 +872,6 @@ static void rtc_notify_suspend(Notifier *notifier, void *data)
>      rtc_set_memory(ISA_DEVICE(s), 0xF, 0xFE);
>  }
>  
> -static void rtc_reset(void *opaque)
> -{
> -    RTCState *s = opaque;
> -
> -    s->cmos_data[RTC_REG_B] &= ~(REG_B_PIE | REG_B_AIE | REG_B_SQWE);
> -    s->cmos_data[RTC_REG_C] &= ~(REG_C_UF | REG_C_IRQF | REG_C_PF | REG_C_AF);
> -    check_update_timer(s);
> -
> -    qemu_irq_lower(s->irq);
> -
> -    if (s->lost_tick_policy == LOST_TICK_POLICY_SLEW) {
> -        s->irq_coalesced = 0;
> -        s->irq_reinject_on_ack_count = 0;
> -    }
> -}
> -
>  static const MemoryRegionOps cmos_ops = {
>      .read = cmos_ioport_read,
>      .write = cmos_ioport_write,
> @@ -962,7 +946,6 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
>      memory_region_add_coalescing(&s->coalesced_io, 0, 1);
>  
>      qdev_set_legacy_instance_id(dev, RTC_ISA_BASE, 3);
> -    qemu_register_reset(rtc_reset, s);
>  
>      object_property_add_tm(OBJECT(s), "date", rtc_get_date);
>  
> @@ -998,15 +981,32 @@ static Property mc146818rtc_properties[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> -static void rtc_resetdev(DeviceState *d)
> +static void rtc_reset_enter(Object *obj, ResetType type)
>  {
> -    RTCState *s = MC146818_RTC(d);
> +    RTCState *s = MC146818_RTC(obj);
>  
>      /* Reason: VM do suspend self will set 0xfe
>       * Reset any values other than 0xfe(Guest suspend case) */
>      if (s->cmos_data[0x0f] != 0xfe) {
>          s->cmos_data[0x0f] = 0x00;
>      }
> +
> +    s->cmos_data[RTC_REG_B] &= ~(REG_B_PIE | REG_B_AIE | REG_B_SQWE);
> +    s->cmos_data[RTC_REG_C] &= ~(REG_C_UF | REG_C_IRQF | REG_C_PF | REG_C_AF);
> +    check_update_timer(s);
> +
> +
> +    if (s->lost_tick_policy == LOST_TICK_POLICY_SLEW) {
> +        s->irq_coalesced = 0;
> +        s->irq_reinject_on_ack_count = 0;
> +    }
> +}
> +
> +static void rtc_reset_hold(Object *obj)
> +{
> +    RTCState *s = MC146818_RTC(obj);
> +
> +    qemu_irq_lower(s->irq);
>  }
>  
>  static void rtc_build_aml(ISADevice *isadev, Aml *scope)
> @@ -1033,11 +1033,13 @@ static void rtc_build_aml(ISADevice *isadev, Aml *scope)
>  static void rtc_class_initfn(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
>      ISADeviceClass *isa = ISA_DEVICE_CLASS(klass);
>  
>      dc->realize = rtc_realizefn;
> -    dc->reset = rtc_resetdev;
>      dc->vmsd = &vmstate_rtc;
> +    rc->phases.enter = rtc_reset_enter;
> +    rc->phases.hold = rtc_reset_hold;
>      isa->build_aml = rtc_build_aml;
>      device_class_set_props(dc, mc146818rtc_properties);
>  }
> -- 
> 2.26.3
> 

