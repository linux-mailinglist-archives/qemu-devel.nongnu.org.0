Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D693F1B00
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 15:57:33 +0200 (CEST)
Received: from localhost ([::1]:40580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGiY0-0001ZU-NS
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 09:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGiXE-0000id-WB
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:56:45 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:44655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGiXB-000266-36
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:56:43 -0400
Received: by mail-ej1-x636.google.com with SMTP id bq25so13072924ejb.11
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 06:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JkTN3cANiCoT96mDR4Bg4jj2nYUDJmAAiM1fkolr8Wk=;
 b=kB2wvWHw5k9+ZmybXgQOglnNQsXdknib7twOdre5sMDhWV31g1RGepKJI/Cjxuw2CV
 XGoFvawy6wCUTi85y3CzJHaFKJc3+zw4cTPNYpyq20SL3defQX1kdiLnljp3xZ0NvQQs
 r+lDeZgyHCzzUZydQgC932LDkwLX+k3iQkakeZT/dhrbkbjtUrKJSJT/DDqO8FHeMpCW
 +0HKh8ENRZYv2EobmqDI3/vz/6TRWF/yhbeIJ8zV1holbnxzAzLAMDdB6T2NQbTkOrlP
 nuNBSOICIK293khljxf8uiUTAmLdt7HhOsXoLwhfeaubE53IxHgy4lVreKG52hzaKCwt
 mKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JkTN3cANiCoT96mDR4Bg4jj2nYUDJmAAiM1fkolr8Wk=;
 b=pMUel9Dwkhi65nz/Sh0p8eGsyYPB8+OvFfqZxXfnKQKzBF46YRw31acW7sPnC9oZt4
 iNwEpN6+ZW2nGp15j13r+Mh8cXq+ZBtPt7AZza1BahxQCaIYS7LGSwA647QeiqzhlGIw
 XnToU+JGhEVpkvEWS97mPir8q00/K19GenMeh/yRlpqlxHJfTFxq16xhQNBF22Rm/NvK
 J3zHM+54svWACaZKn3i6VvNlrzuM7f0jswIWPC4w4eZY7/UUpHzkX0Bu6PGdV6SlLuPj
 z/X6TcAWAY8gl1DFUUWZziz0xjzPKEG2s/8aW1SgFxHNbJUDCGGxCizkUelwYnelOzYR
 AArg==
X-Gm-Message-State: AOAM5304HaL+WPHN6aexid+lS/MYrW/iJSUfBo2MDnZA9qpdGOJz/TJl
 LQVxsoI5BAThAKlhecRvbl3rYkz4jmoZa4wGeRThKQ==
X-Google-Smtp-Source: ABdhPJz1aQq8vYo5Y4u3IgkpmW7C2jOexFJZCHlKs+xONdtaoTs8E8SMKCPfdEmE8JMAk3x/dTM4hX3YmAn62+9K/Jw=
X-Received: by 2002:a17:906:584:: with SMTP id 4mr16315931ejn.56.1629381398493; 
 Thu, 19 Aug 2021 06:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210813233353.2099459-1-wuhaotsh@google.com>
 <20210813233353.2099459-7-wuhaotsh@google.com>
In-Reply-To: <20210813233353.2099459-7-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 14:55:52 +0100
Message-ID: <CAFEAcA8s4dW3rh+-5Cd9k4tTNRhUqvTaLpprenermJSFUM0mKQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] hw/arm: quanta-gbs-bmc add i2c devices
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Corey Minyard <minyard@acm.org>, Titus Rwantare <titusr@google.com>,
 Patrick Venture <venture@google.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 14 Aug 2021 at 00:34, Hao Wu <wuhaotsh@google.com> wrote:
>
> From: Patrick Venture <venture@google.com>
>
> Adds supported i2c devices to the quanta-gbc-bmc board.
>
> Signed-off-by: Patrick Venture <venture@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/arm/npcm7xx_boards.c | 79 +++++++++++++++++++++++------------------
>  1 file changed, 45 insertions(+), 34 deletions(-)
>

Does the documentation need updating to mention these newly supported devices ?

>  static void quanta_gbs_i2c_init(NPCM7xxState *soc)
>  {
> -    /*
> -     * i2c-0:
> -     *     pca9546@71
> -     *
> -     * i2c-1:
> +    I2CSlave *i2c_mux;
> +
> +    /* i2c-0: */
> +    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 0), TYPE_PCA9546, 0x71);
> +
> +    /* i2c-1:
>       *     pca9535@24
>       *     pca9535@20
>       *     pca9535@21

This leaves this multiline block comment with the wrong format: QEMU's
coding style wants the leading "/*" on a line of its own. Similarly
for some others in this patch.

thanks
-- PMM

