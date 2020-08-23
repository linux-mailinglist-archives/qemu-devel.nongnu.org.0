Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B10DA24ED5F
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Aug 2020 15:54:25 +0200 (CEST)
Received: from localhost ([::1]:50252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k9qS0-0003mU-9k
	for lists+qemu-devel@lfdr.de; Sun, 23 Aug 2020 09:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k9qRA-0003Ke-CE
 for qemu-devel@nongnu.org; Sun, 23 Aug 2020 09:53:32 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:45273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k9qR8-0000FM-Fm
 for qemu-devel@nongnu.org; Sun, 23 Aug 2020 09:53:31 -0400
Received: by mail-ed1-x533.google.com with SMTP id di22so5755348edb.12
 for <qemu-devel@nongnu.org>; Sun, 23 Aug 2020 06:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V+e3zeHM8D4L+HYiCeYYAQfw/wQ+RPRmVlpbz6tK/3E=;
 b=iWhlV8qBc4K2VuFBcSR31QYUL7vGRhfoc/eMwhwJz4yc5DDuTbugX1kNafjTBGcsm8
 S8YFrAt7oGgJ3kP6LkiNMX6DT/g3Hquo2Z0ZlQuWxz2IPGo6CwfXTZwiSO021iq6gRBx
 VdDXPJqNzKa1LcZEowBaWfxIkojnGurX3HY67sxU4DMzMc0AKhVZuzr1z+AG0F5+fapM
 zazQFh0CCXcs/Z92WTA1GTcE+Y5yjNTBwUOVIB4/PnnMOFFNljkvfbGiKh95ddCe0+Cw
 nTCqaYKp6r6DJJPihBfbUUp6GCkshun0pZzdHXID9tez0nGRfHuRsC6jPxkwpeuexWYd
 e0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V+e3zeHM8D4L+HYiCeYYAQfw/wQ+RPRmVlpbz6tK/3E=;
 b=mCpj5xY5RQflk26mvnNGiCWipV/9qrgIZBTOZbHj8WJHBlPB61vEV0un9b7nihQdqM
 dE7nkzFt4VDpStS5DcNzs2Dtix7cVCpd9ixXCwfPrym4WqIVGVEpOG2IC634ZlJBL1YE
 cLV3+DwtGHTJ3Oc9UEByI2tayblyU11ESLO9jFUed0+EvSzGwNGjy6vN57x7GQBxw72z
 XGpRekKrWMZAPVj5ENWG+V8Eg0FuGlgqZ2x9IdaxkFr3H0wpr5w6JhSX0wtwSxO31ra2
 OcAn8CLM69ylLz7wOg3xuGOOiemohAYkRDmQDMxF2vKWd1eUrL12RqzlGcWqaqtUS+SQ
 7KCg==
X-Gm-Message-State: AOAM531Rd2r/VYS2sJJmPI+gj/5mVsrXGzeZHU0WUZv6BcWPxZ5f0xSd
 IJ17ehrTFJnSXCKsfubyni16/NYfHiZZ582+VIkLYA==
X-Google-Smtp-Source: ABdhPJxgVFxqYk4snW2aloeNcs+KCYCAvZJGgThOMt+HdZTAHrp/sczoHeaHmPZt8z783n2+cMHZCfIG6CrpvyWgn58=
X-Received: by 2002:a50:8f45:: with SMTP id 63mr1489302edy.52.1598190808751;
 Sun, 23 Aug 2020 06:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200822054101.1202175-1-alistair.francis@wdc.com>
In-Reply-To: <20200822054101.1202175-1-alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 23 Aug 2020 14:53:17 +0100
Message-ID: <CAFEAcA-tqTxYvBgnm=488PF+5Kt3mkqxmi1y_6RvQ=ZXbBvMcA@mail.gmail.com>
Subject: Re: [PULL v3 00/20] riscv-to-apply queue
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Alistair Francis <alistair23@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 22 Aug 2020 at 06:53, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> The following changes since commit f86d9a093dada588889bde5582c7ec320487c4b8:
>
>   Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request' into staging (2020-08-21 17:26:52 +0100)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20200821-1
>
> for you to fetch changes up to 01c41d15de13104774d08e951db24815c8cffc79:
>
>   hw/intc: ibex_plic: Honour source priorities (2020-08-21 22:37:55 -0700)
>
> ----------------------------------------------------------------
> The first RISC-V PR for the 5.2 window.
>
> This includes:
>  - NaNBox fixes
>  - Vector extension improvements
>  - a L2 cache controller
>  - PMP fixes
>  - Upgrade to OpenSBI v0.8 and the generic platform
>  - Fixes for the Ibex PLIC
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

