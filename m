Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B96DF65EA71
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 13:09:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDP3j-0006TX-9t; Thu, 05 Jan 2023 07:09:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDP3Y-0006RE-FR
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:09:12 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDP3W-0004RC-TQ
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:09:12 -0500
Received: by mail-pg1-x532.google.com with SMTP id v3so24370550pgh.4
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 04:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4zUYZNjpnzAONC6x1VSQ74oyRwP63RRosniNkdwYtz0=;
 b=QisTFh6wtlifhj3tvsxbPi2AXPz+gw2f897VkpAdv6FrBTdIydopkGIbLrxXwx9r46
 AwKV4KFbJckqLZg1UtiTZZVrjzc/c3TfmS43ztrioYk8NTOIKiDDsJzNgoCzCdYSgkki
 w+rSLWsCt0D6oe0PdjJooOurm6r+RMSjeY71KlKjgh80Jv/3LIjbCaFM1hhgYTNXOWG1
 juJcjNnGj5IwlztspKfkItorD2H7qepDRmDSiwOPFekY+yC68PB+knttgVUz0sCPtatq
 ucb0sMWgcakrCiPXIECc40Xra1qpVVhqr6ZmaChWPjJzAPmnMVbYIO1STA6BIJupk+Aq
 55jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4zUYZNjpnzAONC6x1VSQ74oyRwP63RRosniNkdwYtz0=;
 b=U5FhcuIwMA3st12lMZyF1pZl2cHnVaWfbmYGo73ykpXEjN5NUiwNW8fVwm5vRPPnDi
 j4/8gVNNbwwMGQF6nOCD7cbYD4grKfeTjgHDCdOTl12G8zoinB0C0UE2gQzx156OQhH/
 pkLXOLKJ31GBmV6U2ru6iRNv17iYMEhGUFNnzaycUJJXUXoGgMfjxTN0tt/ED5bdG0wx
 xi3EXS/15LKTS5psOk5MFxqNkrJVx2NMR5u1qoGxD46HqABuwgN9P4VGvBwWl/pc/0qp
 c/dD13rRj0xLyjE12k7PcvEtVZN4p+s8YW/kD8VpAg8uaGaIDR8xnzn7i1b6E4QHUY1B
 OIWQ==
X-Gm-Message-State: AFqh2krCB/s4zAQdqmOadE0fnINP0gMlYnFrRtQrN7MjO0u7+oSYgj+h
 fH3CtQqWyNC8mrDwDw9VEwqqCMMUIDuYnKosFrBNKQ==
X-Google-Smtp-Source: AMrXdXu1HE507zXLrbZGSgW80Zo63Bs1SqPwXjED0OtfK51D6yPH7Jn3v+XX87rAkTlHB7kLp1OQTR1NJ8y5z+OUQsY=
X-Received: by 2002:a63:3d4:0:b0:492:50dc:da4d with SMTP id
 203-20020a6303d4000000b0049250dcda4dmr2313145pgd.192.1672920548737; Thu, 05
 Jan 2023 04:09:08 -0800 (PST)
MIME-Version: 1.0
References: <166990932074.29941.8709118178538288040-0@git.sr.ht>
 <166990932074.29941.8709118178538288040-7@git.sr.ht>
In-Reply-To: <166990932074.29941.8709118178538288040-7@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 12:08:57 +0000
Message-ID: <CAFEAcA_bXUFZi1hBO22pC7vxHHoPiKS-aTheJxBQu=-+nctSXA@mail.gmail.com>
Subject: Re: [PATCH qemu.git v3 7/8] hw/timer/imx_epit: remove explicit fields
 cnt and freq
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x532.google.com
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

On Thu, 1 Dec 2022 at 15:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> The CNT register is a read-only register. There is no need to
> store it's value, it can be calculated on demand.
> The calculated frequency is needed temporarily only.
>
> Note that this is a migration compatibility break for all boards
> types that use the EPIT peripheral.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

