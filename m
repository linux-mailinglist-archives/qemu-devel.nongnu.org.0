Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0C53F8B83
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 18:05:49 +0200 (CEST)
Received: from localhost ([::1]:46262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJHsx-0003Ne-Rc
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 12:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJHoG-0006er-58
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 12:00:57 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:38892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJHoE-0007I6-Dd
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 12:00:55 -0400
Received: by mail-ed1-x52f.google.com with SMTP id q3so5407702edt.5
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 09:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8gbn3X/nu8V4Q/q99sHWqdOIY8KbcKu3BBHVRr2N+QA=;
 b=Qc/PYuj6i3pmQpTyohohIb0VgUwKT7dCisfN8DsP/H8yUASYGnvCosfH7dhrxrN4C3
 DI0iwi9kqmHYHYXmi7cW7RFW+edH6zqxQHAgeoWHtAPVXyXWZHuYdawAsdXlzr9/NzjU
 4SjrshQmVWNkuObEJUQpNufhszUe07N1QtOFhVuLQatsH9Lbr7B/WQQ3GNkEmeeCVb53
 dj8Vqb9N/kF5xNtH4fc8cTgm5TCs8YQWCvpaBYGof9aonQ7paYGloNoQ0hiqO1PYew1G
 nkbSVhy0fZ+A6M89QkA4JC+5y9G9hvYvy9SMMXSDvfC71/GKLNMNWV0N7HZMHEX3cSfN
 rO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8gbn3X/nu8V4Q/q99sHWqdOIY8KbcKu3BBHVRr2N+QA=;
 b=rDNWpR2exQgJGfO1XdXO/AbH4JhqXzUtqwrH4VkltWUMDNKi1IRGRIb8v3sPV/UV3/
 5MJxUl7mUTAJrmXfTwDO8RuJ4itdupbWMA5TOwA1IKcjCPw/dAJHpQDGJAO+GM/jRhpH
 TveTjjG0Ity2PPQgbxlj4Qbm7j0at0sL9VHjfCPd7qKXKEPjknaqz1XcVi0pVb9/B9+K
 bOPGLUPnk9zVhJQScsswJat5YlrxRsZiLlGAAKgeGICOs6MhbVYsb+uNbzrsn9zHAMTl
 ZByGQ61G7slYkm5RFoSkBAvcbfpEghE3Y/IwQH1d0F16KZmRV+L22qtXm1a/egcnbijc
 AlOg==
X-Gm-Message-State: AOAM530PlMHJlS6LGfueYpgzN15WfrV1jtuUdsAd2tEdCMbYRWSHMHTv
 UTTYPOd+Pv70O3Slaogs3Ao5Fr/hLot2cUGLINR/Ug==
X-Google-Smtp-Source: ABdhPJwfviuPvvZ7a2aSBnZaWsmVebbL45+KzHlsjOukynqbpd7jwqu0Xu44/6BsknwoDa/tbee4iKtsaQJ4rYM6PQM=
X-Received: by 2002:aa7:dd48:: with SMTP id o8mr4892664edw.44.1629993652973;
 Thu, 26 Aug 2021 09:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210823173818.201259-1-tong.ho@xilinx.com>
In-Reply-To: <20210823173818.201259-1-tong.ho@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 17:00:05 +0100
Message-ID: <CAFEAcA8TxyiLhpRcWmjHzEpg5vqtqmJEW5h=RGBd_6kTJw_BdA@mail.gmail.com>
Subject: Re: [Patch v2 0/2] hw/arm/xlnx-versal: hw/arm/xlnx-zynqmp: Add
 unimplemented mmio
To: Tong Ho <tong.ho@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Aug 2021 at 18:38, Tong Ho <tong.ho@xilinx.com> wrote:
>
> This series adds the APU mmio region as an unimplemented device
> to each of two Xilinx SoC to support booting guests built with
> the standalone bsp published at:
>   https://github.com/Xilinx/embeddedsw/tree/master/lib/bsp/standalone/src/arm/ARMv8/64bit
>
> ---


Applied to target-arm.next, thanks.

-- PMM

