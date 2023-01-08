Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E904266150E
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 13:29:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEUmz-0006x1-3s; Sun, 08 Jan 2023 07:28:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEUmx-0006wo-Kv
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 07:28:35 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEUmw-0005aC-1B
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 07:28:35 -0500
Received: by mail-ed1-x52d.google.com with SMTP id m21so8670419edc.3
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 04:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o+JAMm5Cs247spKaMTh8WJCYNiS+Rvc25SAZgD9udME=;
 b=lBTXg095mdCdrR+kvEfC1BOJxqrATf3lNrch/FKs01YziXJXmqQzq8/78OQED0bb4V
 lIRkedkB+yMoeFEZt+vTFkG1I6ueTKkAwYL8LqQjfSdwyufsUgLgL5wxWVRIFUrDWBVW
 H3GOfd36NdJ2KSk/n+CIKuqqXeKDBXSeuuL5Bv6mF24QHY/TT2igO4/WHehxRDKE+eIL
 1GWIoAPDMgnhKAwSKuZ7Fp61Bcavmbo40ZtCTN6Jtjkh+bDwGeFPPhnWC3u438eYf7mE
 jyACoU0kFdfF59rpIcYt5mt9k1vACao0OTCJZLCRo60qMDTjlS8zFptfhmi2TX9s1gy4
 hcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o+JAMm5Cs247spKaMTh8WJCYNiS+Rvc25SAZgD9udME=;
 b=2R6fPwFaaEiobYTa7Yd1HnJAmepzunerKCxNOV1ruB4p2yiOQT+uz8TUcOFZXB9yF8
 /M894yHqfoh1cmWkfd+SiaxdoTprf1YNaN3Vic0+U96HZfjULgFePmNHfxjMyo/Wg9XU
 uPpEdQvwgi7FlP36yK8ZGqzV/AkvkrkmYTQRg+BFNkapJkinYEew5+OMCi3gnawj0unu
 eKt2tj5mqSOcwHszHjVVLhwmxN0YBGXLE/9wR/AnPVudu7gCFsTgCI7KqpaiqYdbR9T+
 gfNrkHx9bLB9KBY754kxVjfAY4T8RLW2JqgCC0ahT5nFHw5oxmA5MoYY8pehL9YV2TED
 dP8w==
X-Gm-Message-State: AFqh2koeTnI/QywKHTxJmWcMrUklDE8r3lZQdS61Zy3q6m/qu3pxi4FO
 S45e8a4KBRiCGeyv8UaUJIPaiqccwoTDRapW5XaUsOdZ
X-Google-Smtp-Source: AMrXdXv+XWFegm+ZWdu/PW9qH+24ir8sfvno5Umk6gd/3lrOX/0hR51/Hcedu46j/fR88Cp0qoWS2x9la4eGjitNc2g=
X-Received: by 2002:a05:6402:1843:b0:46b:1d60:f60a with SMTP id
 v3-20020a056402184300b0046b1d60f60amr6923673edy.193.1673180912722; Sun, 08
 Jan 2023 04:28:32 -0800 (PST)
MIME-Version: 1.0
References: <20230104220449.41337-1-philmd@linaro.org>
 <20230104220449.41337-16-philmd@linaro.org>
In-Reply-To: <20230104220449.41337-16-philmd@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 8 Jan 2023 20:28:20 +0800
Message-ID: <CAEUhbmV1nt3=eBaZ_QMLkw926Ht=BVi4y3vj06SR6Z-jUg8eyA@mail.gmail.com>
Subject: Re: [PATCH 15/20] hw/block: Make PFlashCFI01 QOM declaration internal
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, Jan 5, 2023 at 6:52 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> Convert the QOM PFlashCFI01 to a forward/opaque pointer declaration.
> Only pflash_cfi01.c is able to poke at the internal fields.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/block/pflash_cfi01.c  | 2 ++
>  include/hw/block/flash.h | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

