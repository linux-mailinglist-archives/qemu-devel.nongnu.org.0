Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD12F371C70
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 18:53:55 +0200 (CEST)
Received: from localhost ([::1]:60902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldbpS-0008RF-Ko
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 12:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1ldbna-0007XY-5w
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:51:58 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:34758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1ldbnY-0002Na-EN
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:51:57 -0400
Received: by mail-lf1-x129.google.com with SMTP id z13so9071300lft.1
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 09:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=NFxQsVKBM06tLk2G+ZZrrhAK1JYImXCMOu37Hni+fpI=;
 b=LfqObRQofeMt7Ib25PHooLkyZY/4dNodMZXgg0Ma7RaxGq9i2V8LKeTCNBPEXmyeyE
 KkDhtRqK5DNMChtkml/3HAdaod+hTm1Hx9wIOGGpJA3tRke87bncANmanopM8rbIzv9e
 40mn46X8N6/IkcEl/sC3E9Pjrbr+ChYfOWGZoUAfvxCnT+A8UicVMztOsBBQ/lRjsXFL
 r15Pee1JmrYyZ1Uz3UHS9Q8A8KWSvU6uhGs6N7aQeKaOJU1MWgZOGAfmxcpyEGgeSgjp
 oK2iAYD/i72uzkXPmTj+Z0AwlwGKJJDqUWhB+QgBZXdig6ryQSA7b4f4OM0xg1elJuI8
 jJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=NFxQsVKBM06tLk2G+ZZrrhAK1JYImXCMOu37Hni+fpI=;
 b=bwWoSFqcFIzBLviisuD3b3/x9LXJ4B0SbkINjek0cmjkra5HzBnwu+xM9x7aoZvqYi
 LML7WAl32YFeLGnLW0xn1em5Co6C4ZJb3/yFNhLosI862oe8xsy0o0RPfaVdPolRkG29
 N9jH1xldmcPrUfPsx9hQ5t2k7SY0hczqxdhWRIpqzkcx85MQjPRYt/YyxEW68PieIlgc
 yafdlOPPcA1aujjRtP4uzjDo09bXtnKwQh0Uul0QtjiEzExQeYKSwBLhN6iJZywhhZON
 ohq/kE0sspW0+AoQSvU3TmV88VCaVk18QgF4Yitx+noMe3beNFMk1sQgsyKOvVzQNgJG
 6ihQ==
X-Gm-Message-State: AOAM532LkYrqFLn7XkVLbPPqG/9pOEq8xB1kJ8CDaOCef0l6VmBWMI+P
 9kejzu9bC9Snh4q0Y7R3+Ow=
X-Google-Smtp-Source: ABdhPJzuyTcqyUDZo/8OeSh5do+Bm4ronGqRUt05L+9w1kWOL3OEbHwdxsxKpDBD1dJt8717jmxmWA==
X-Received: by 2002:ac2:5211:: with SMTP id a17mr52220lfl.318.1620060711526;
 Mon, 03 May 2021 09:51:51 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id y7sm13767lfy.50.2021.05.03.09.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 09:51:51 -0700 (PDT)
Date: Mon, 3 May 2021 18:51:50 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 1/2] hw/timer/etraxfs_timer: Convert to 3-phase reset
 (Resettable interface)
Message-ID: <20210503165150.GD477672@toto>
References: <20210502163931.552675-1-f4bug@amsat.org>
 <20210502163931.552675-2-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210502163931.552675-2-f4bug@amsat.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x129.google.com
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

On Sun, May 02, 2021 at 06:39:30PM +0200, Philippe Mathieu-Daudé wrote:
> TYPE_ETRAX_FS_TIMER is a sysbus device, so its DeviceClass::reset()
> handler is called automatically when its qbus parent is reset
> (we don't need to register it manually).
> 
> Convert the generic reset to a enter/hold resettable ones, and
> remove the qemu_register_reset() call.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/timer/etraxfs_timer.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c
> index 5379006086f..4ba662190de 100644
> --- a/hw/timer/etraxfs_timer.c
> +++ b/hw/timer/etraxfs_timer.c
> @@ -309,9 +309,9 @@ static const MemoryRegionOps timer_ops = {
>      }
>  };
>  
> -static void etraxfs_timer_reset(void *opaque)
> +static void etraxfs_timer_reset_enter(Object *obj, ResetType type)
>  {
> -    ETRAXTimerState *t = opaque;
> +    ETRAXTimerState *t = ETRAX_TIMER(obj);
>  
>      ptimer_transaction_begin(t->ptimer_t0);
>      ptimer_stop(t->ptimer_t0);
> @@ -325,6 +325,12 @@ static void etraxfs_timer_reset(void *opaque)
>      t->rw_wd_ctrl = 0;
>      t->r_intr = 0;
>      t->rw_intr_mask = 0;
> +}
> +
> +static void etraxfs_timer_reset_hold(Object *obj)
> +{
> +    ETRAXTimerState *t = ETRAX_TIMER(obj);
> +
>      qemu_irq_lower(t->irq);
>  }
>  
> @@ -343,14 +349,16 @@ static void etraxfs_timer_realize(DeviceState *dev, Error **errp)
>      memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t,
>                            "etraxfs-timer", 0x5c);
>      sysbus_init_mmio(sbd, &t->mmio);
> -    qemu_register_reset(etraxfs_timer_reset, t);
>  }
>  
>  static void etraxfs_timer_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
>  
>      dc->realize = etraxfs_timer_realize;
> +    rc->phases.enter = etraxfs_timer_reset_enter;
> +    rc->phases.hold = etraxfs_timer_reset_hold;
>  }
>  
>  static const TypeInfo etraxfs_timer_info = {
> -- 
> 2.26.3
> 

