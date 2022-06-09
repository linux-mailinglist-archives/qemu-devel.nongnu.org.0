Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8DC544D3A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:12:54 +0200 (CEST)
Received: from localhost ([::1]:46688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzHy1-0005kN-TP
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFXB-0004s6-GT
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:37:04 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:39428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFXA-0003ks-3H
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:37:01 -0400
Received: by mail-yb1-xb34.google.com with SMTP id r3so6885242ybr.6
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 03:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mY8z+ns2GJC2VAjW9YeA5U790gA2S5mNpYkJoTp1yuY=;
 b=ubgPEl+3SnO96Wb3cDLn080HBVsRkFaQJTAywv+fYk5MNxFkVxYAZm8Y+dFZ2L4zGf
 GKhp7V83Bwa8HGEQjdw9NdbZ7Y02InhlcQn88x0EyEbSaIRUK+k3p8l9puB1leKNfuyP
 8i6hgsHukpPcTTkEBZq5mcPtzs491OsukYRf14+a51nDcV31Wu+ZdDKFWOIF2LWqlfIZ
 9y26xrd/NpVDszfDnZO3DafhD/xtQNTDQCE3UyNOqFS1BhRxe6+0B5d1IUio+jDS1P4Q
 R5uTnapcTjUfS7p4POtp/USkgSkvccuqLOvtnOsi+R0Pk2RQy4FCdnBpsJjvNRzkIp37
 t8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mY8z+ns2GJC2VAjW9YeA5U790gA2S5mNpYkJoTp1yuY=;
 b=kzPitCyMj9EPtuPGwnMSmylrlRrZy7cr7ditRKJyqgO8sr7D4NM8qQjEhJGZ+CxgI3
 tdrFJrJPvtjZr4qJYGxfcIpCCPdVrN9IYfSu4OE0DEcj+aSZUmDyY02BJEC6bRYDDVfz
 5rnjpGP0kumjM/fFRYHXNiSaW3x4cB0bLSNmBFsW2U6hw/gg6afypuxDh1jyPLGqSjdX
 JXmvhU1XtQ/u5bQ+Cq4WsCEmymfQSYQ7c/mEzj8s40ABSA4gWrSFgmhSH7Yp9EE3DF1p
 SUGWWKWStFFd21wd7Ewm3DJLBuqleKd0I0GNA51UsKTUO1XKvgDeo1Uxd/2QKsjFa4n6
 sX3Q==
X-Gm-Message-State: AOAM531WDxBkib0aPSHdk1tzyxmFpVeiNogJkqRJV+2Juv3Hpc0eLo/+
 O1wa1viT7pj0ZvJf9mtq4dIDN2Lh3wUyrIVOrisFdQ==
X-Google-Smtp-Source: ABdhPJy2GNqpRycyRW+mVH0xlyFP4gormzf6zcp8UlxejF3R6ySyNDlyMjgY6zexjZpMzhjZpJL7+tkdi9Tm8CWkc3Y=
X-Received: by 2002:a5b:14c:0:b0:64f:c826:a76b with SMTP id
 c12-20020a5b014c000000b0064fc826a76bmr38586902ybp.479.1654771018599; Thu, 09
 Jun 2022 03:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220608023816.759426-1-richard.henderson@linaro.org>
 <20220608023816.759426-3-richard.henderson@linaro.org>
In-Reply-To: <20220608023816.759426-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 11:36:48 +0100
Message-ID: <CAFEAcA9q6fzATOqHZZ7PZDX_jLiYdc_EsvPEzMqnB+Ehz=uQuQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] target/nios2: Move nios2-semi.c to nios2_softmmu_ss
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 8 Jun 2022 at 03:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Semihosting is not enabled for nios2-linux-user.

True, but maybe it ought to be (in an ideal world)?

Anyway, as far as this patch goes
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

If we ever add semihosting support to linux-user nios2 it's
easy enough to undo this.

thanks
-- PMM

