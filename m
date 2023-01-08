Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F8666151E
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 13:36:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEUt2-0002h4-QY; Sun, 08 Jan 2023 07:34:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEUsy-0002gQ-6s
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 07:34:48 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEUsw-0006pv-IR
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 07:34:47 -0500
Received: by mail-ed1-x532.google.com with SMTP id j16so8641010edw.11
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 04:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R5F2cXC1XzINmlP8gSq2GzxCC6dn0W6pyd7g4k9yGMI=;
 b=WMH/Y1B089OkdRcUI9BJUvCpKl0sCNg7d7ZfVcXqMYR/riIVFZPHABbMt8Gr20RnPR
 RQ2ufhwWFMbyo8LAB2HsWRaYu9oD22kkWm8Z/INI63mP30gNHcyE+oV7HDZmZbp1HO/l
 XPoU8xgbRvhx1TbbKx9cXN2E/jKQ5n9m1dWxjWnA1fxwuHel8olKs3hodW/gdTRUD3ME
 Ww4CU/xCJrUlboxpYBrl9H76udX14T19gfzTKJH85OmlVZMqM1XVP54u5ZrLVhfvDTcb
 WqlTUlhTcEQtn0IPHQVgC3feg7suNWhzbcGAEQ2aTpBSTNS1afB0jNRKK1JANwllbv61
 YcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R5F2cXC1XzINmlP8gSq2GzxCC6dn0W6pyd7g4k9yGMI=;
 b=uIZuEPjpO4iFmBgK0gzDPoBd59q9NFG2a6rTQDN91dVqXQ6QyqT3EMruFUXUTDDF+8
 r5vkW31dN8QkfSzsZGMWObLy496SFGFOveqgTLjpJuLytc0RGdk5uSV4Yf5qy2SSAHjV
 bSLg1ek0CxcsRKrTKBc6qZmK+2vQRUs6ShUvmPeQL7UeyohkN1T3vBuUmZIZGO/9R0e0
 F0Wv9mMwCRRGgB62V7JT5A7TWuSA62RucqVpSt+V5ms6g3pzAqawAw6kKUoJtD4anWCp
 YdVGUqhVNEFHDvtanyWs9qarbdLwoTOJdbYsSmFr5JquQy4u0V7ajELqL2BGbg0QSEXN
 huew==
X-Gm-Message-State: AFqh2kqAcxb19qvZ4T/PZlRwFkVNep6r9X0hywsmmvKQdD8oMoDkhE69
 sih8+wUtSrs9LF0FxoZVZaGBkbnS1vwfir8+LtCqOK/H
X-Google-Smtp-Source: AMrXdXs1zjADhya3tL5miM6VRyRhLl6KgDjzYG53k/NEWHom8zHZ8kUgQHPcCFuL351GAIvauFvEMJMf28XeF4vWp7g=
X-Received: by 2002:a05:6402:2a06:b0:496:a74d:b752 with SMTP id
 ey6-20020a0564022a0600b00496a74db752mr651642edb.318.1673181285227; Sun, 08
 Jan 2023 04:34:45 -0800 (PST)
MIME-Version: 1.0
References: <20230104220449.41337-1-philmd@linaro.org>
 <20230104220449.41337-18-philmd@linaro.org>
In-Reply-To: <20230104220449.41337-18-philmd@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 8 Jan 2023 20:34:33 +0800
Message-ID: <CAEUhbmUFzTCj1b3VzZECZL58x17ZHDS4miozA=JnEjO4pZ_xOQ@mail.gmail.com>
Subject: Re: [PATCH 17/20] hw/arm: Open-code pflash_cfi02_register()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x532.google.com
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

On Thu, Jan 5, 2023 at 6:48 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> pflash_cfi02_register() hides an implicit sysbus mapping of
> MMIO region #0. This is not practical in a heterogeneous world
> where multiple cores use different address spaces. In order to
> remove to remove pflash_cfi02_register() from the pflash API,

same issue as the cfi 01 commits

> open-code it as a qdev creation call followed by an explicit
> sysbus mapping.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/digic_boards.c | 14 ++++++++------
>  hw/arm/musicpal.c     | 13 +++++++------
>  hw/arm/xilinx_zynq.c  | 10 +++++-----
>  3 files changed, 20 insertions(+), 17 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

