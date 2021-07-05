Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079973BBC61
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 13:47:35 +0200 (CEST)
Received: from localhost ([::1]:49328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0N4X-0000mr-PZ
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 07:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0N2U-0008Oi-KK
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 07:45:26 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:37777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0N2Q-0001jo-GM
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 07:45:26 -0400
Received: by mail-ed1-x52c.google.com with SMTP id y40so8188014ede.4
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 04:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zHwIszA0ugIbK3qsgCzmENvkgivHdwwz6vVgmtfRIag=;
 b=JmsiL0gJbLeNpirAzIXlh2+aycs/u033jwStJomHj8P4CcDFTUVgyZXxKQa0VzkSGR
 ZaLvQrEAqa01T+N1Qxh9RSCAkBYow48J8EGSGWmpE2TNOz7WjGTVY8wuChcPUx2Y6TCN
 VGOvq9LKU2iGQ+IIb5eRK/gS8+9y+hO3gSZHQ95s3fGLXlRWhmF6qneO+HZPt0Z1Ps00
 rx6dtjmNtl92nGJmobzyIegAVVWq8Ggr5g6ApPxXN/YZriQd5MRpFMgLqZAGE+Z5t463
 SudvSOPDALATQU6ZeBQtJWTOMACf6TeUoJTGIGBNGNAyLhRxYoVJrIPwSUrh6JUOHzuS
 4oxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zHwIszA0ugIbK3qsgCzmENvkgivHdwwz6vVgmtfRIag=;
 b=lm8DguF02qC/70ozGUUbHmmQTd8t0lkLrHhD+xWsyF4ZwRiZQMANUEAGRA69L38w6m
 UfdRfyLaZkUMQ9lzxo1eNqI0TrE3rSh0K/7CKxAq4OLFFIfsyPmilVwc7fB/tf4R9TLi
 ISN/a3fZ5lL2Pm3/gsbpyDPy+YW/XLi+p/AfPrtVEisf71dmzWFSsk+L5Eul43DwVZCx
 XgOSLb2k3aIYtjit5M/B7FAmECbD8Z6qdU9YBJK5HpPh0kbMZmtbDELgvSQe+L0ewKbY
 +EM3f5ySg/GPH/56NmAmLdObPXWDorso7cOicvdGa0JwdjSyz+A1/RkZg6vv1SYpvmZ6
 rx7g==
X-Gm-Message-State: AOAM531NvtGFLDrdqW/h0Kk87xAZW6GTNeNbC3aLafw6sPhsgBQ6Y+qR
 g/1ddMSwh9CE/fmTH2BvzfcJCQrADoee8fTzDQ022Q==
X-Google-Smtp-Source: ABdhPJzOCwSDMxAl/xKQINqJTVUVsLIVBgNw/HNAGBMob4XZ8Vcm5TO6RT8RZ6PYMHrPK8QoC5VvMn2ykpYyW/X/lBs=
X-Received: by 2002:a50:99cf:: with SMTP id n15mr16053633edb.146.1625485520617; 
 Mon, 05 Jul 2021 04:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210704205255.27124-1-marcel.apfelbaum@gmail.com>
In-Reply-To: <20210704205255.27124-1-marcel.apfelbaum@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jul 2021 12:44:42 +0100
Message-ID: <CAFEAcA8ZPPpSNvb8W+HGXj4N4qQ-ApoePKhjMnBHkrKdrmRpwg@mail.gmail.com>
Subject: Re: [PULL V2 0/3] PVRDMA queue
To: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, vv474172261@gmail.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 4 Jul 2021 at 21:52, Marcel Apfelbaum
<marcel.apfelbaum@gmail.com> wrote:
>
> The following changes since commit 9c2647f75004c4f7d64c9c0ec55f8c6f0739a8b1:
>
>   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2021-07-02 11:46:32 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/marcel-apf/qemu tags/pvrdma-04-07-2021-v2
>
> for you to fetch changes up to 66ae37d8cc313f89272e711174a846a229bcdbd3:
>
>   pvrdma: Fix the ring init error flow (CVE-2021-3608) (2021-07-04 22:47:51 +0300)
>
> ----------------------------------------------------------------
> PVRDMA queue
>
> Several CVE fixes for the PVRDMA device.
>



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

