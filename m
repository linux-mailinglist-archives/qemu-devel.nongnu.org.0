Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CCF32715F
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 08:04:01 +0100 (CET)
Received: from localhost ([::1]:33512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGG7T-0003sn-NO
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 02:03:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGG6K-0003L7-Gz; Sun, 28 Feb 2021 02:02:48 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:41339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGG6G-000853-Sd; Sun, 28 Feb 2021 02:02:48 -0500
Received: by mail-yb1-xb36.google.com with SMTP id m9so13567897ybk.8;
 Sat, 27 Feb 2021 23:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OTS2Bv7u2zuoEHNXZAC8AjB7KF8JaWNx+0CMX+73I5o=;
 b=JxooICF/3S+3IwbNbAUOT1RK33RU2YxMVBC6EP6XvrZoeKR0C13dd0d5moZ87zKm+f
 VNyMZQAnrjWiXxLQzPo3EBIWv91dViHYXnhFbLutTjfakqWJA45nFS80Kor/+rWERvil
 d/vi9tljJ9izsgymFxvLwwJGJAokHzil6YG1X1ByFBqHObI5MlfNH1wjakfNtUBZlKes
 fZE2jwJM7iG72V8uWmRfYy510PLocufn2Zuw9VwQEaWm83O7RLYx5dy2HfDH0sFdDEJf
 q8sVasvEZgKIGUIQaIll6Bitk+m5AMVH8smHlHPE7cV4QoX+uYYFEiFzwYD33f1BJ33I
 4icA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OTS2Bv7u2zuoEHNXZAC8AjB7KF8JaWNx+0CMX+73I5o=;
 b=nU8PXshWYGtM/HvUGX4ONDPP3d9PQkuW6JEtRzBw+92jueKoswToK4glASwNNF9VZd
 2mBI+dFitkulC1x2Vu8HI79IMb2SjYhtkhIrf8uvcwy+YaOZAhI8BAV+DIOBM/RKOJth
 szKMitW2GvTWt3/qkUOeUX8gG8/9te9m/hqTwa8EQUMRTJnvht1AYzgldKt4sDghXOXq
 1fCD6aX4YKhEgNDQNxiXo4CNqQRv8Voceaq5JZWTpk1BmTXiHskdKAWoMDvaOUxA4dqY
 8SAItiHkccOLdgFa38K+W95EnKgY2wO4Hf8Ep5lZeXmo80uYW0/ZKyK970adInnkHVW4
 gDDQ==
X-Gm-Message-State: AOAM531RdoOzIyZYJmqqIa1QafbRdJ2ErIVlMYBYqBf2aqBG8b49pylx
 FhVr38qcB8393Ek/RcyH2XTIYeN9uY46DJ+hjN0=
X-Google-Smtp-Source: ABdhPJyeKf8+fGWcciH/llTU74Jd1qiKkH6OltgLyilCl/cXgk4Slo4FoH5+iQpSazXZ9bmp/xeE9+F/cAWfHbka0U0=
X-Received: by 2002:a25:abce:: with SMTP id v72mr16545688ybi.152.1614495763477; 
 Sat, 27 Feb 2021 23:02:43 -0800 (PST)
MIME-Version: 1.0
References: <1614158919-9473-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1614158919-9473-1-git-send-email-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 28 Feb 2021 15:02:32 +0800
Message-ID: <CAEUhbmW2HNpx1J5QGMixEcX8jD4VjaCByMtG=+Mtg-ZpTsL5pQ@mail.gmail.com>
Subject: Re: [PATCH] hw/ppc: e500: Add missing <ranges> in the eTSEC node
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 24, 2021 at 5:28 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> The eTSEC node should provide an empty <ranges> property in the
> eTSEC node, otherwise of_translate_address() in the Linux kernel
> fails to get the eTSEC register base, reporting:
>
>   OF: ** translation for device /platform@f00000000/ethernet@0/queue-group **
>   OF: bus is default (na=1, ns=1) on /platform@f00000000/ethernet@0
>   OF: translating address: 00000000
>   OF: parent bus is default (na=1, ns=1) on /platform@f00000000
>   OF: no ranges; cannot translate
>
> Per devicetree spec v0.3 [1] chapter 2.3.8:
>
>   If the property is not present in a bus node, it is assumed that
>   no mapping exists between children of the node and the parent
>   address space.
>
> This is why of_translate_address() aborts the address translation.
> Apparently U-Boot devicetree parser seems to be tolerant with
> missing <ranges> as this was not noticed when testing with U-Boot.
> The empty <ranges> property is present in all kernel shipped dtsi
> files for eTSEC, Let's add it to conform with the spec.
>
> [1] https://github.com/devicetree-org/devicetree-specification/releases/download/v0.3/devicetree-specification-v0.3.pdf
>
> Fixes: fdfb7f2cdb2d ("e500: Add support for eTSEC in device tree")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  hw/ppc/e500.c | 1 +
>  1 file changed, 1 insertion(+)
>

Ping?

