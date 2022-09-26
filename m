Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B055EAF39
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 20:08:36 +0200 (CEST)
Received: from localhost ([::1]:39900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocsWx-0005dH-8x
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 14:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ocrY9-0004OH-HN
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:05:49 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:45919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ocrY4-0004ws-Ph
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:05:45 -0400
Received: by mail-ed1-x534.google.com with SMTP id m3so9879124eda.12
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 10:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=x5WVwvqac6ocZsT4uTCOm7/mV5XP51dO92NriWVcDQg=;
 b=Xz3fF17EXGqqfT9J+8pkKJ4eAxt6fB9sQ59kxATzfasuEf3RI2sSqM03eLpV/d2kni
 9UDN3e8r7uI7wuAvkf0kahJi283cn2skKIz366zBIB0GAYL0kzyNail4Sj7WTKkcwIU3
 xfkIsTvU2CEYQW3vY3MnCwhBa/bSBRVyKYQA4m/DmP2KFb7NPQAva1iA70BEx7PPU9lY
 2wSZFPxaGfi2Wxc7eHjwYfYo4dL1mFD/I3P6elxTWnU0W/jLAuEv4Udr6hV1nvTNSdk4
 UNHNAgzDLtiImgKU4+JFSu4UgnZI5VKdIFphjDH2RcfSjWyicG/YURUv8f8zWeGVd6m7
 GF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=x5WVwvqac6ocZsT4uTCOm7/mV5XP51dO92NriWVcDQg=;
 b=kdF/hn6FefPJ+rhtK8gmyyvPS1YLkMyRjJh6tvPPkDU0S1SoqkyLIZmhkl0FbeUudK
 Tv8XS+UFN4y6SVNXWT9YgQ3YhwR0vjZC0UHw7miQu2ic3m5AZN89HLP11Sep1a6pP05Q
 kPUYj+DJMa2/o0up335sjmsTSIVdnNtGz2aoL/4nTb9XMBWZWjEVf4KTZdc1hQnC+3Mo
 XsHHDJgUdwiDzXMKxlVSE4OFeW3qt+WCvP1d0UCDlrfR2OqdptYyPzLucONmpWIprrKH
 Dq34bA+d1vmqsQhb8MD3azJFK5E3snzcEYjAwaNxZIa2K1haQRBr2Qsvv9IGG/FfGh6Q
 D5aw==
X-Gm-Message-State: ACrzQf3QZYDQfxzs0kUi9QsvcowbdXKy7kaeDd0XiKOnogjtEHputzYH
 IFsHN+9q5fsNG3j5VFppcWxOiZhbvgCASYkfhySVIg==
X-Google-Smtp-Source: AMsMyM4phOX0bMR/6ALnDy3aq06tVRRAKejdyk5tEAqdR89DzIxJKTQMyzRL6Zj0YzmFA6+31YGKUPtC65afRR0K/c4=
X-Received: by 2002:a05:6402:2787:b0:451:d655:9269 with SMTP id
 b7-20020a056402278700b00451d6559269mr23657189ede.375.1664211937802; Mon, 26
 Sep 2022 10:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220922152847.3670513-1-Jason@zx2c4.com>
 <CAHmME9oOSwx5hJBap-rbgxJrXZ7vfpPnzCymKfDt69RsNrBJyw@mail.gmail.com>
 <CABgObfbBMVnn29uwQETFUSCKQybzzHKRsL6EEq=-sK663dwxew@mail.gmail.com>
 <YzHQ8PnBS/FM3aEh@zx2c4.com>
In-Reply-To: <YzHQ8PnBS/FM3aEh@zx2c4.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Sep 2022 18:05:26 +0100
Message-ID: <CAFEAcA-Tg-mTqe4BwGxuETOkO0ntnUwqvda+-CQ2hjdZqHJ4aw@mail.gmail.com>
Subject: Re: [PATCH] x86: re-initialize RNG seed when selecting kernel
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Sept 2022 at 17:53, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On both x86 and dtb-based archs, the seed in memory is zeroed out by the
> kernel after reading. So, as far as the guest is concerned, there's
> forward secrecy. Except! Except if the guest has someway of
> re-requesting that seed from the host. This patch prevents that from
> happening through fw_cfg on x86. Somebody told me last week that device
> tree archs don't use fw_cfg, so this won't be a problem there. I haven't
> yet looked to verify that yet, though, or looked if there are other
> mechanisms.

I am leaping in here with no context, so I may well have
the wrong end of the stick, but:

"does this system have a fw_cfg device" and "does this system
pass a device tree to the kernel" are orthogonal questions:

 fw_cfg, no device tree: classic x86 pc; arm virt board when
   booting UEFI firmware in the guest
 fw_cfg, device tree: arm virt board booting a kernel directly
 no fw_cfg, device tree: arm vexpress-a15 board (or any other
   just-emulating-hardware machine type)
 no fw_cfg, no device tree: arm sbsa-ref board (and probably
   lots of non-arm architecture machines too)

PS: if we're going to give FW_CFG_KERNEL_DATA magic side
effect behaviour, is there somewhere we can document that magic?

thanks
-- PMM

