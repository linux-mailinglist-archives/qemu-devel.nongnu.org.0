Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C380B4FACFA
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Apr 2022 10:58:36 +0200 (CEST)
Received: from localhost ([::1]:47770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndTP1-0004bl-CM
	for lists+qemu-devel@lfdr.de; Sun, 10 Apr 2022 04:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndTNA-0003co-L3
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 04:56:41 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:47097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndTN8-00020y-Re
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 04:56:40 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2ebef467b1bso47831007b3.13
 for <qemu-devel@nongnu.org>; Sun, 10 Apr 2022 01:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XggvBUhDnV601uCEk3Xbd5mzPN3qdhXkLM5Gh1Tg0zs=;
 b=sLXWPpPBJq5wNj4RbSSYArrp30alFTAr/kUfNi0Ya9FdR6v+z07ZtBarAlkQLGIssO
 Rt6M+fBY8zamw2DBceAwJHPH8+g0OV3pZlZzYdF5pS7OJLrGGfaXm+8ux+dH87aboyOu
 LkMPQkSLQx1L3+DC+n8Yi1ZFHheEzV83QZ0kkiGi9LP+0OV6iz5XXUqzh35Yd8WkGrIf
 C4NzDq6vtWNOWv0ZIe/D797t489oNDS8DycJAXjC3RElvAzzxayD6STTDMJEGiZ9tpu9
 akDqokuHA+kfU7/du2GiMN/0JyYvq+ksA78Qw7qyxhrpPaN4Cnb/9PqMNCYBsVukrTC1
 01bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XggvBUhDnV601uCEk3Xbd5mzPN3qdhXkLM5Gh1Tg0zs=;
 b=uRqF9WEMyzBBEbtHGMK/NWrAh14zAWIcKHobaOjhu3pd0euphLtqOo5QTCmioc9m1O
 eKBjPnwGzJUqgYPNxwAjffGyaV2EH0JVZQSreeNSpSkfnkHOaldHJeKyhHZ1QgSDpjmD
 Mdvlt/bU/4EuNVuRUx5wwgZAQ3hXqLsNVanTpF/l9Aa7qYslSTVcwxCe+juQmZekMzff
 A9Cide1DkHIiSzeTRBONxIpVsL/g4Ca6PDxpitlYqbVm91AB7wvH4HmkZ/IWXnle128D
 btyuSOGuJzqDjU/HVfNjr7fR/8i8MzTMW1K9O0AYdliHdcaPzdh1y0F4v3xWvfp1Gv6F
 1Jzw==
X-Gm-Message-State: AOAM5312GjkBTVMe1Mr3z9aJ726kGdXiT7hOqmLI3NBA3ZZg3S2jsb1P
 GEZvIY8sW+5MZTGkJiFvp9IQsBfTpJtayT7Pn95K/w==
X-Google-Smtp-Source: ABdhPJzJPq9HsbE46zhh+03u6hT0urMnLvBSSzfQqWfsb2yvteFFG/KLGM8jNDH8gbNyajMwTfDk/4PWHRAFt1+iz8c=
X-Received: by 2002:a81:4655:0:b0:2eb:2e0e:9d47 with SMTP id
 t82-20020a814655000000b002eb2e0e9d47mr21511500ywa.455.1649580997545; Sun, 10
 Apr 2022 01:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-30-peter.maydell@linaro.org>
 <5d7391a6-21d6-01b4-fee0-289c3891def7@linaro.org>
In-Reply-To: <5d7391a6-21d6-01b4-fee0-289c3891def7@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 10 Apr 2022 09:56:26 +0100
Message-ID: <CAFEAcA87X7z_KSv7=FGHRxZe6wttRvRLwKMvnpnvNY=UZv4bkw@mail.gmail.com>
Subject: Re: [PATCH 29/41] hw/intc/arm_gicv3_redist: Recalculate hppvlpi on
 VPENDBASER writes
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
Cc: Marc Zyngier <maz@kernel.org>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 9 Apr 2022 at 21:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
> It it really valid to write to vpendbaser with other than a 64-bit write?  I suppose it's
> possible to order the 32-bit writes to make sure the update to valid comes last...

Yes, that's valid. The GICv3 spec states specifically when registers are
64-bit only (see for instance GITS_SGIR). As you say, you can write the
bottom half first and the top half with the valid bit second.

thanks
-- PMM

