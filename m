Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC3931461D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 03:19:37 +0100 (CET)
Received: from localhost ([::1]:56300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Icq-00018v-BY
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 21:19:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1l9Iam-0008EE-3N
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 21:17:28 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:39775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1l9Iai-0007Md-Cx
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 21:17:27 -0500
Received: by mail-pl1-x634.google.com with SMTP id k22so4511903pll.6
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 18:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=9pc03DQGAdCda1V76fue2s2mvBcTa4KEcdXh4cdyP/E=;
 b=P3hg1ZEyRj+px17w/UrdHcxTiyxH/W6aM7z3ixKjkZjtcgQhEivJhLOfTbqawE40tm
 Rs98eRqbN4EcIGDs+XDSo6JZbUZ8YEhsXb6GVea7uUpDKpXT0s0RL9VQz3yuEQgg9cL8
 FX7AbDEJKI5JJNxkQNXocJu49JfxW/Z6NfUlaRIofPNBpBE0TG+tHme3aFNz80TIV0I6
 34fvSPNQeWir+x7OUwK+cQAt+DISr+268TpijbzjeOuEAWddx/HiMPGtgShgNYpjN51L
 knO1DrKKeS7gaO7nRyn0s+AsbQjONMO3ngqALBz0sYv3bOAXg/o+A6j9ns/iwifpptC8
 MxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=9pc03DQGAdCda1V76fue2s2mvBcTa4KEcdXh4cdyP/E=;
 b=XcLcumbBU/Z+GgrWU2mY4ymS6pQMMElC2Oa2MW87nD7LhEqd8hOgpx0Hfjp2wYqMQl
 VvgbIqWpX5BBjKO586AZlrkzLH7ibk4xgL5ycG3JnTq7A5nNCR6AbVK/9RQI1ksRHpzg
 0Xssmk4aYrkejDTWZp+mLgk4PkXLG+Yij+9X9sDbIg2UmxG1eIhz/xXDaOTnDgf8k0+X
 kDCtf/i55kO0PABJGMlxg47NlGTmf+tmMLevWOIwqj/E1ysftemsVZbd/iPstaGSBsQQ
 /RkWEir+0wo5TjFCvafxDvPffMu4b8e+YYBHEjAYR3HwHL2yLd3f/QRcIKTQkHBZLKb/
 CAkw==
X-Gm-Message-State: AOAM533HaVeOLeVijfhFiiDrFtLeK2TNEZhIzK5woesYjOmdl7jerrGd
 pV8I6RhdNtf0W4WM8ykvW4nwiXZIL2wglO0y
X-Google-Smtp-Source: ABdhPJyYM1Yrh3kHnNdfm3F8Cj/nxD3iudfpr/p3bMAqm89j3A+A2U39PTiFeiEdlIkK9Yit0tsQOw==
X-Received: by 2002:a17:902:7c98:b029:e1:8840:8abd with SMTP id
 y24-20020a1709027c98b02900e188408abdmr18474491pll.12.1612837042095; 
 Mon, 08 Feb 2021 18:17:22 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id ob6sm502645pjb.30.2021.02.08.18.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 18:17:21 -0800 (PST)
Date: Mon, 08 Feb 2021 18:17:21 -0800 (PST)
X-Google-Original-Date: Mon, 08 Feb 2021 18:17:19 PST (-0800)
Subject: Re: [PATCH v1 1/1] MAINTAINERS: Add a SiFIve machine section
In-Reply-To: <6bc077e5ae4a9512c8adf81ae194718f2f17c402.1612836645.git.alistair.francis@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-afc75aae-45c8-4c36-ae23-fc22dd426ca8@penguin>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>, bmeng.cn@gmail.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"SiFive", not "SiFIve", in the subject.

On Mon, 08 Feb 2021 18:11:27 PST (-0800), Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Acked-by: Bin Meng <bin.meng@windriver.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8d8b0bf966..c347d49bd2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1359,6 +1359,15 @@ F: include/hw/misc/mchp_pfsoc_dmc.h
>  F: include/hw/misc/mchp_pfsoc_ioscb.h
>  F: include/hw/misc/mchp_pfsoc_sysreg.h
>
> +SiFive Machines
> +M: Alistair Francis <Alistair.Francis@wdc.com>
> +M: Bin Meng <bin.meng@windriver.com>
> +M: Palmer Dabbelt <palmer@dabbelt.com>
> +L: qemu-riscv@nongnu.org
> +S: Supported
> +F: hw/*/*sifive*.c
> +F: include/hw/*/*sifive*.h
> +
>  RX Machines
>  -----------
>  rx-gdbsim

Aside from that

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks!

