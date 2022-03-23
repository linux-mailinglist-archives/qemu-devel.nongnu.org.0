Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DAC4E585C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 19:27:02 +0100 (CET)
Received: from localhost ([::1]:58490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX5hF-00033P-L3
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 14:27:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nX5dg-0001RH-Ig
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:23:20 -0400
Received: from [2607:f8b0:4864:20::112f] (port=40716
 helo=mail-yw1-x112f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nX5df-0001tU-3X
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:23:20 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2e5e9025c20so27059177b3.7
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 11:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1fKIlr/RrF+q+SAsC9iArZV01cGc9v3oy4mGG3+be0o=;
 b=wI3HqqcRlY8J51LfM6yVlT1G6aU4VnsG+PmDwI1bOUsg2rmHzrLM0Ptr2A9u8Uh+zv
 VVyyUKTuIXrGzYTW1uSdrMdhgNNmU4XTKJCrI5cbFPPQQojV4SP7RykXFpUpOLppLMVc
 3rQkVOBqNTO8rouGwX2B1nW5Cmbk7h247pBtMOqKfBvvzUBNQ0brmGzz1oRX0yNdFeEO
 siuXkerJDDd+uCTKDaCjM2AGlcxqfDlMp+xA9FSiNiODC50oXatla5Q+wtDXVqT+XQvI
 /ayKgeAJfKv6ji+HQ3Rgz8EpMcWKLmEFEIXGQ+4pFrnHMNtAfFz8qyLIgH5Q9aYx7OEN
 ydXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1fKIlr/RrF+q+SAsC9iArZV01cGc9v3oy4mGG3+be0o=;
 b=Omugi5Gxv/uPJFP7WF+D1fejUXsSl0kQihIcZ38RiUiQaIel+38pdorbFw7j0hdquC
 vdZzpyVxXzGyRAyhxxV5t5gyyJA5h7uCTXn4B7l5Kuyr/fG0+iaHI44YlFm4S3Gs81Ih
 PpuiELqiREeb6Ciurjfbu4Fp9jNvadSckiMkt+mUUrxC8qP1YBAWGreindgtFMTMIuNW
 6PBuqvSUaBdKs+sGryhLfIiFiNP18njZAlRtRRuOab8u7stcLSsytOjb7zIZLqWQ//Gw
 XSwrXZYTqWkQV+IMGBdfekwN5Q3KfkPnnMFSF/p9ZVZ47Uj3Y5jhs0vLK3VlRdw4A0Vu
 HagQ==
X-Gm-Message-State: AOAM5331AGymySTRrdaFziPgD4YRX2HXpT4SxY78h+AhDu22NiNT59mW
 DoVQg7qedxq507r/Xyh5C6NLeOPMZ1gU1lxw+R86Z/VwBJViqQ==
X-Google-Smtp-Source: ABdhPJwAWV4FWoVv8PfLtoWyzFbUZpQ5WvSmhyg+it1Qo8uI9N4HEqfDLhzep8mg1LqzkrNKo0/oMzrAJGGjHx6lWuE=
X-Received: by 2002:a81:a4e:0:b0:2e5:9946:525a with SMTP id
 75-20020a810a4e000000b002e59946525amr1262297ywk.455.1648059798192; Wed, 23
 Mar 2022 11:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220323173543.146442-1-zongyuan.li@smartx.com>
 <20220323173543.146442-2-zongyuan.li@smartx.com>
In-Reply-To: <20220323173543.146442-2-zongyuan.li@smartx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Mar 2022 18:23:05 +0000
Message-ID: <CAFEAcA_EX0Fcm3OWGj-O_RZ8DMZ=Zfrj1MMPb-bD_QOwAV6Wsg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] hw/arm/realview: replace 'qemu_split_irq' with
 'TYPE_SPLIT_IRQ'
To: Zongyuan Li <zongyuan.li@smartx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "open list:Real View" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Mar 2022 at 17:36, Zongyuan Li <zongyuan.li@smartx.com> wrote:
>
> Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
> ---
>  hw/arm/realview.c | 41 ++++++++++++++++++++++++++++++++---------
>  1 file changed, 32 insertions(+), 9 deletions(-)
>
> diff --git a/hw/arm/realview.c b/hw/arm/realview.c
> index 7b424e94a5..97ace560bf 100644
> --- a/hw/arm/realview.c
> +++ b/hw/arm/realview.c
> @@ -13,9 +13,11 @@
>  #include "hw/sysbus.h"
>  #include "hw/arm/boot.h"
>  #include "hw/arm/primecell.h"
> +#include "hw/core/split-irq.h"
>  #include "hw/net/lan9118.h"
>  #include "hw/net/smc91c111.h"
>  #include "hw/pci/pci.h"
> +#include "hw/qdev-core.h"
>  #include "net/net.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/boards.h"
> @@ -53,6 +55,24 @@ static const int realview_board_id[] = {
>      0x76d
>  };
>
> +static bool split_irq_from_named(DeviceState *src, const char* outname,
> +                                 qemu_irq out1, qemu_irq out2) {
> +    DeviceState *splitter = qdev_new(TYPE_SPLIT_IRQ);
> +
> +    qdev_prop_set_uint32(splitter, "num-lines", 2);
> +
> +    if (!qdev_realize_and_unref(splitter, NULL, &error_fatal)) {
> +        return false;

If you pass &error_fatal the function will never return a failure,
so you don't need the if(), and the function as a whole doesn't
need to return a true/false indication.

thanks
-- PMM

