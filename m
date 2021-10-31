Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A71441177
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 00:40:37 +0100 (CET)
Received: from localhost ([::1]:54882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhKRI-0005cO-L8
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 19:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mhKOC-0004NO-1a
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 19:37:24 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:42560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mhKO9-0004ct-4W
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 19:37:23 -0400
Received: by mail-il1-x131.google.com with SMTP id y17so16710556ilb.9
 for <qemu-devel@nongnu.org>; Sun, 31 Oct 2021 16:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=daZ+v0eQMjqzYUo/bswx1CXKzAffAj+JU+5HJXmvZu4=;
 b=WVaoefYsIR5SmDD61JzPSOL4BcIgbQqEjcR4UO/Rf9xp2gACumQCZq9NqI72BTBvyk
 YFN5r7zzBB5QPQzo3PnRkA+/fT/PnuZAzcWhz/v4WmXtWmFzDlbJDD+CNPPvVd2rCiyi
 kV/QNgj4QAqI2/2B4nwvZzlY6qiU7Iy/cf8PNW5OXwx+KbbDPtPiTu4dmQmaTX3EXRX+
 sAELRshZs7kppzIZdaQStmpLrP+NHgH4XRxrFgrW3P0/jypvTub39DzETkz1PV22zq3N
 tP8cO8lphCvYuy+4vbpW7wLf7w2+s76Ei8vfwJCchp5pip8zgEgLOaJjV1CDPfBtUTBR
 N1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=daZ+v0eQMjqzYUo/bswx1CXKzAffAj+JU+5HJXmvZu4=;
 b=0FbHVMEYJu0yDg+vn9xFy6ecSS1ijsCi9S0r8DQT+OqraYSnPI3y9HT/fXZeSGs9eR
 A3AvaQ6D5JqW3xUNgvqWH2qXTZHbJkuBwGAtRRagDX9wXEPrCAmevV6iT+0VrlkDjnRS
 kydHAMFBXXphoq6/2qIehst/G40xTpKV26kShsWzO/S3UTfA/+KMP5zj+zrP3nf9+JbA
 rscEnc7/H6sU8evjJMwurYsj586cvak2irLecgcHyGQqwyuGnTBgSCeDtnGtgzjjzQ3o
 lfmSJDdrAXXlRrQGNZkRKpbI7THDsoaMpbqquBiroeTrdgYHOCC6c1S/nqNwa/GxFWQK
 L/rg==
X-Gm-Message-State: AOAM531eIQZ1YWeuoLA6KiX/Ib7zIhKPxIuAzvsnIQvG6BWEs3Vn+Op9
 3QEpfERvmqOlOOzWyEF7hm2PtzxYo/GS0Ujo72k=
X-Google-Smtp-Source: ABdhPJyC6RKFOJhb1G59pElXSSHxjggyvfyFaiSItnoutoGD3o8MJVZ5Cc4HFCzQjmkKrOCBBS2Eo5vz0IOoAKD6vog=
X-Received: by 2002:a05:6e02:2149:: with SMTP id
 d9mr4727923ilv.221.1635723438942; 
 Sun, 31 Oct 2021 16:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211029142258.484907-1-damien.hedde@greensocs.com>
 <20211029142258.484907-2-damien.hedde@greensocs.com>
In-Reply-To: <20211029142258.484907-2-damien.hedde@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Nov 2021 09:36:53 +1000
Message-ID: <CAKmqyKOaShwf0sAtEk3RVOom7eDNarmy+dikFPYUwf38QFA63w@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] machine: add device_type_is_dynamic_sysbus function
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Mark Burton <mark.burton@greensocs.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Edgar Iglesias <edgari@xilinx.com>, mirela.grujic@greensocs.com,
 Alistair Francis <alistair.francis@wdc.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Oct 30, 2021 at 12:26 AM Damien Hedde
<damien.hedde@greensocs.com> wrote:
>
> Right now the allowance check for adding a sysbus device using
> -device cli option (or device_add qmp command) is done well after
> the device has been created. It is done during the machine init done
> notifier: machine_init_notify() in hw/core/machine.c
>
> This new function will allow us to do the check at the right time and
> issue an error if it fails.
>
> Also make device_is_dynamic_sysbus() use the new function.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Cc: Ani Sinha <ani@anisinha.ca>
>
> v3: change the function name (Ani)
> ---
>  include/hw/boards.h | 15 +++++++++++++++
>  hw/core/machine.c   | 13 ++++++++++---
>  2 files changed, 25 insertions(+), 3 deletions(-)
>
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 5adbcbb99b..85adf660c1 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -51,6 +51,21 @@ void machine_set_cpu_numa_node(MachineState *machine,
>   */
>  void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type);
>
> +/**
> + * device_type_is_dynamic_sysbus: Check if type is an allowed sysbus device
> + * type for the machine class.
> + * @mc: Machine class
> + * @type: type to check (should be a subtype of TYPE_SYS_BUS_DEVICE)
> + *
> + * Returns: true if @type is a type in the machine's list of
> + * dynamically pluggable sysbus devices; otherwise false.
> + *
> + * Check if the QOM type @type is in the list of allowed sysbus device
> + * types (see machine_class_allowed_dynamic_sysbus_dev()).
> + * Note that if @type has a parent type in the list, it is allowed too.
> + */
> +bool device_type_is_dynamic_sysbus(MachineClass *mc, const char *type);
> +
>  /**
>   * device_is_dynamic_sysbus: test whether device is a dynamic sysbus device
>   * @mc: Machine class
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index b8d95eec32..0d20104796 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -548,18 +548,25 @@ void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type)
>
>  bool device_is_dynamic_sysbus(MachineClass *mc, DeviceState *dev)
>  {
> -    bool allowed = false;
> -    strList *wl;
>      Object *obj = OBJECT(dev);
>
>      if (!object_dynamic_cast(obj, TYPE_SYS_BUS_DEVICE)) {
>          return false;
>      }
>
> +    return device_type_is_dynamic_sysbus(mc, object_get_typename(obj));
> +}
> +
> +bool device_type_is_dynamic_sysbus(MachineClass *mc, const char *type)
> +{
> +    bool allowed = false;
> +    strList *wl;
> +    ObjectClass *klass = object_class_by_name(type);
> +
>      for (wl = mc->allowed_dynamic_sysbus_devices;
>           !allowed && wl;
>           wl = wl->next) {
> -        allowed |= !!object_dynamic_cast(obj, wl->value);
> +        allowed |= !!object_class_dynamic_cast(klass, wl->value);
>      }
>
>      return allowed;
> --
> 2.33.0
>
>

