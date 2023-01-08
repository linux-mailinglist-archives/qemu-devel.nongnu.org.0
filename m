Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C2B661393
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 05:30:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pENKJ-0001rW-OW; Sat, 07 Jan 2023 23:30:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pENKH-0001r8-AK
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 23:30:29 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pENKB-00018e-3V
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 23:30:27 -0500
Received: by mail-ej1-x62e.google.com with SMTP id fy8so12281657ejc.13
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 20:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=34bBoCajuckcr6tOv7G2CJgSBEKGj3poF5LCv51RrzQ=;
 b=mNJvKxET/IU/5AJkYVsm2J8LS/qnqX3t237dT37EYh8YbmL4wWpgygDFGjMCT/g5hd
 7cGTRMtrU101lvBrp6/Nv4Q89czj+7NE+w1OACbdIAHMrybSLJeBlcm3HiJnHK3tihvV
 lDrhrDoqCykf23ikmTfyG7aLVZcU1f79T/gE2HGzvgBzoosagC+Hcz5QBpIP+OgU1pI3
 9IEIXiSyKjZaKCChNMO3rgZRfXkUfHVc/NiqfOlqmMnl95u4s41RYagW6lR74X19+WaI
 i+AohfHWGeigSBiA3InglLEIuY99BvuDcBfWM9GQsIvmlaSzI7bauxOm3q5ZfPgMzOFy
 fZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=34bBoCajuckcr6tOv7G2CJgSBEKGj3poF5LCv51RrzQ=;
 b=fcAxHI/ti6mkbTJd10qv1u/cbVJDOWp06uwzcP/gDWqO3oA2F5zQEANsWy+lGVLT6I
 T1/1fJGNAcG1QoLktBWzOe27aPhQSSSGK+ThqhgU4ASSmSVmCfskiEVpJasPMNtPvLBZ
 co7dxh1WOCTIdlJIsfLhjOeXjaRW1ecMSEPGkTOo+d/unYJcBNH/uKahMn3KpABTdihq
 ZsUKEKfUe+aKzLFIud7IFRmAUoAt6EO6ljwuN0xhGl+UBevpt8a601ikgoy63PKxZFsD
 KpI6Q7uOm/Vr+c6dYW88pLdydBsnSOcM0VLnMdKC+oZPUEprBA3hsgzydpElEyITn4VX
 301g==
X-Gm-Message-State: AFqh2krxJXNJ8rG2ITTJD2sV76WgxjlVNqElgQGbUMMusF+KgMKrMjtP
 NP4zblz1zu4y6s3NhDCJakCO7eOkgOXpQoS7GWA=
X-Google-Smtp-Source: AMrXdXu+J/5LMrFHYKHFqDIeLpV2dlFUj3K5kUlIuKE9DkKh6xNlOx1u9T+onU9iYkSujUv14+Gdk6jHbll0gzZR7CU=
X-Received: by 2002:a17:907:c302:b0:81b:f6fc:e6d8 with SMTP id
 tl2-20020a170907c30200b0081bf6fce6d8mr5586897ejc.13.1673152221426; Sat, 07
 Jan 2023 20:30:21 -0800 (PST)
MIME-Version: 1.0
References: <20230104220449.41337-1-philmd@linaro.org>
 <20230104220449.41337-4-philmd@linaro.org>
In-Reply-To: <20230104220449.41337-4-philmd@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 8 Jan 2023 12:30:08 +0800
Message-ID: <CAEUhbmXj+ZAJpOrBFz=UE5kuGYagf-8NFhoPnSyJUuyXYCEHjg@mail.gmail.com>
Subject: Re: [PATCH 03/20] hw/block: Pass DeviceState to
 pflash_cfi01_get_memory()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62e.google.com
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

On Thu, Jan 5, 2023 at 6:39 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> The point of a getter() function is to not expose the structure
> internal fields. Otherwise callers could simply access the
> PFlashCFI01::mem field.
>
> Have the callers pass a DeviceState* argument. The QOM
> type check is done in the callee.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/block/pflash_cfi01.c  | 4 +++-
>  hw/i386/pc_sysfw.c       | 2 +-
>  hw/mips/malta.c          | 3 ++-
>  hw/ppc/e500.c            | 2 +-
>  hw/xtensa/xtfpga.c       | 2 +-
>  include/hw/block/flash.h | 2 +-
>  6 files changed, 9 insertions(+), 6 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

