Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4D86613B3
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 06:29:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEOF4-0003BP-5t; Sun, 08 Jan 2023 00:29:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEOEy-0003Ap-5H
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 00:29:04 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEOEv-0007Z7-Tv
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 00:29:03 -0500
Received: by mail-ej1-x634.google.com with SMTP id lc27so3213549ejc.1
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 21:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r/389XXA3IKLkfdO5ylnjvorE8oqKL9wlClmO6oYSnM=;
 b=Jb6Xjx/SsSznwGj/WODv2UO+CsDQNJhmlz2ohwJV7UWWInFMQ8kvlNvxW2JHmUfr1T
 WaSFVFZLEeVxjOMbUnISqn0BdvUqu4DqEH+xK9dVAzvTA2O2992e+zs+/ZAvpZYYZNfo
 8L2dyXUiaTbMBpTtcrdhRjs+J5IJ4MOxUPTryXDmGF51Yy+3KNZxd21+/3VcFTcXz05W
 7PIXo67iJs8OZJgXZOoAlGswmnEeWrmdZaRqa3feVqK4LAwZeprzGpqbBYHC8DcyhcYn
 kAAKmOszo8gI6UEXnqUYugFx+KsXXI4o38I6q7G4FsVrtA407HiakbYxx9aYWx82U+kh
 MBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r/389XXA3IKLkfdO5ylnjvorE8oqKL9wlClmO6oYSnM=;
 b=YPaLj2MDLimyXin73/VLVwEv/YN0n6OZIKnCR+2zknqkT224cB+g7r37dpvxa6mIoH
 yvA8nevpGMft0qzudWvRU2Xslb9yMxZ8ZoJb5odKQJHY+8gLPO58tzQAwejGYLUbj0Ea
 dPtQfJ1zh1U1avVKV/NgcGQ4Lp1Qh2O9o+Dc7SPp2AgxKB1aZNeG+OBWh6lpuwtgGxuL
 rm0xjeycPz0mknJphOpCPc0c/9q+4lT/o1u9+7tketc+pKzz5jwSKF3N6Z4Ba1rAYf7+
 K9YEQTE4vStSiUE6oklwnBONIz3Ph0gew2WJpXjhXkc+YjcwIbljUNHBGoNMX/YQSbhr
 hl1g==
X-Gm-Message-State: AFqh2kqeTqUpuAfBQbArKb1aR3nIvkkZimUUTf3J5+sIyahd4h3Rft5c
 NDGz8o4IfyTvGvLJyUCnHZiXAnG8SRmJKaaQMN/U5+sQ
X-Google-Smtp-Source: AMrXdXuqfSDyB4tF9LDgwdz5iDjYICgZjf228iHOH10bwKtdYjx2wp52/qvWcO6Ps028L8h6aTdCVLCi1RrIqSg0ZBQ=
X-Received: by 2002:a17:907:7782:b0:7c0:e380:3d44 with SMTP id
 ky2-20020a170907778200b007c0e3803d44mr5207917ejc.498.1673155740380; Sat, 07
 Jan 2023 21:29:00 -0800 (PST)
MIME-Version: 1.0
References: <20230104220449.41337-1-philmd@linaro.org>
 <20230104220449.41337-8-philmd@linaro.org>
In-Reply-To: <20230104220449.41337-8-philmd@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 8 Jan 2023 13:28:49 +0800
Message-ID: <CAEUhbmWvWcbZxWb8N75xGB5+c8fnC3Wr0G-eUrptj6Mk2z5E=g@mail.gmail.com>
Subject: Re: [PATCH 07/20] hw/i386: Use generic DeviceState instead of
 PFlashCFI01
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x634.google.com
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

On Thu, Jan 5, 2023 at 6:53 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> Nothing here requires access to PFlashCFI01 internal fields:
> use the inherited generic DeviceState.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/i386/pc_sysfw.c   | 14 +++++++-------
>  include/hw/i386/pc.h |  3 +--
>  2 files changed, 8 insertions(+), 9 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

