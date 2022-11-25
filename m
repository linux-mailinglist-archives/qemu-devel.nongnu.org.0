Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6348D638BF8
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 15:20:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyZYg-0007Sc-C4; Fri, 25 Nov 2022 09:20:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyZYZ-0007OB-8R
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:19:56 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyZYW-00053V-Su
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:19:54 -0500
Received: by mail-pg1-x52b.google.com with SMTP id 130so4071963pgc.5
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 06:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vjwKIKn+XoUpqWUV/u5KisBkHasa/P64ZxyUm3HGW2A=;
 b=DGKy2gvlr7dlieYm9hcP4EmVLkBmXc5qDvleNxpSCXAB04+pFDlRD9p2KG2/fYx4c9
 RXGzHmyiP1O6dx4sYZUzJ7ygNk29jQTL8kI27eVFfAWrE+jwsXBacFqwWs/v6nN/4txH
 tFLM21tEsY8rP3P2Wu9yNmvHEY6qDCkbabTyCpTZVOaFJ5RO7jUWkuuKf+YzWwzbf2bN
 NjC2tgJFZKHiYw79/ReXt9xfcYMbHJRt6vu91etrf2XZ7bw/cj/HTYjEQZQUZUjgi77z
 tU+9XQy7/EXLxFyt+HY0ZlRs3VPk4kzTYEM1l0ircWhZKE0wzV1e5ThIrhzMNzQXRoFA
 DSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vjwKIKn+XoUpqWUV/u5KisBkHasa/P64ZxyUm3HGW2A=;
 b=UYKjy91cN/h+ECEj1W8KRQM1dkbHVH7ERb6M3UzGLUcPc5Yw8O3CKOdbnC/4AlgcbK
 O7OTjEZ2IAxbVLnsrVk6cp/p+XAps/L11kosFuppoSBk8NSjiF7zalxdl2J34NHuzDKQ
 v/Ekdn8UQ/jZUpjy8puDl60DZjVcGVl76yDpZFnPQEnfcdAcWfrEaC2rFmlIFWQtquw6
 X+0NbqJopJc11uGdBTTyN7x+0ugMA5T6dRr5KuL8A6MO1Jsvtas+HLbfxdr1OqGknuxa
 ryxWmOBAReTDRyxZ6kG6Ka/qyUGh69mYSh2uoNYTdfxvBjODl67iybdx4s5TYeqnRzs/
 wzJQ==
X-Gm-Message-State: ANoB5pk9RJYnYA1m/Nd5aw5XrswQmZ6UJXh/R20MNQ4QKoOt1EBpDqFK
 4cO1BMD/0B9iN1U5ErCCuXpySDj+uFbJGVQVhMpVsQ==
X-Google-Smtp-Source: AA0mqf5fXcMCsMhCYd5EDZoVxjHklXLu8mZokPHGkjARDuAlIRBcGFCKLZ1SA4Si+FQ4nCxwClEx2hM5+/31vbzW+R0=
X-Received: by 2002:a65:45c5:0:b0:46b:2753:2a60 with SMTP id
 m5-20020a6545c5000000b0046b27532a60mr18626272pgr.192.1669385990328; Fri, 25
 Nov 2022 06:19:50 -0800 (PST)
MIME-Version: 1.0
References: <20221125140922.56760-1-akihiko.odaki@daynix.com>
In-Reply-To: <20221125140922.56760-1-akihiko.odaki@daynix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Nov 2022 14:19:39 +0000
Message-ID: <CAFEAcA9t-Hv_F1qXNj4q4hZGmmyrpcJfrxAm04JJBXE8B-0fww@mail.gmail.com>
Subject: Re: [PATCH] e1000e: Configure ResettableClass
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, Yan Vugenfirer <yan@daynix.com>, 
 Yuri Benditovich <yuri.benditovich@daynix.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 25 Nov 2022 at 14:10, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> This is part of recent efforts of refactoring e1000 and e1000e.
>
> DeviceClass's reset member is deprecated so migrate to ResettableClass.
> Thre is no behavioral difference.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  hw/net/e1000e.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
> index 7523e9f5d2..4f31a7894a 100644
> --- a/hw/net/e1000e.c
> +++ b/hw/net/e1000e.c
> @@ -512,9 +512,9 @@ static void e1000e_pci_uninit(PCIDevice *pci_dev)
>      msi_uninit(pci_dev);
>  }
>
> -static void e1000e_qdev_reset(DeviceState *dev)
> +static void e1000e_qdev_reset(Object *obj)

We should name this e1000e_qdev_reset_hold().

>  {
> -    E1000EState *s = E1000E(dev);
> +    E1000EState *s = E1000E(obj);
>
>      trace_e1000e_cb_qdev_reset();
>
> @@ -669,6 +669,7 @@ static Property e1000e_properties[] = {
>  static void e1000e_class_init(ObjectClass *class, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(class);
> +    ResettableClass *rc = RESETTABLE_CLASS(class);
>      PCIDeviceClass *c = PCI_DEVICE_CLASS(class);
>
>      c->realize = e1000e_pci_realize;
> @@ -679,8 +680,9 @@ static void e1000e_class_init(ObjectClass *class, void *data)
>      c->romfile = "efi-e1000e.rom";
>      c->class_id = PCI_CLASS_NETWORK_ETHERNET;
>
> +    rc->phases.hold = e1000e_qdev_reset;
> +
>      dc->desc = "Intel 82574L GbE Controller";
> -    dc->reset = e1000e_qdev_reset;
>      dc->vmsd = &e1000e_vmstate;

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

