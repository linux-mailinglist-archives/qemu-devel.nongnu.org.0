Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044D465EA60
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 13:05:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDOys-0002PN-MN; Thu, 05 Jan 2023 07:04:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDOyp-0002LL-TS
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:04:19 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDOyo-0001ib-Cx
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:04:19 -0500
Received: by mail-pl1-x635.google.com with SMTP id d9so22378567pll.9
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 04:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8HaL0nOf7xsQRBvzxe685FoKKacHw+aq6HvggY0WJ8A=;
 b=SjiWGaFG2Urm+Cfb/BVW35quRkC8ZEIUDeZ5m9KmlrzIds3Kf4hCrqTkpif3Gw4ySF
 lVnkB9XN77D/RBSeTZdg7nJysQObtEGbWI9KS4D1zd0WXQtcz3NX/zQ288coSjowwimF
 QtV8/Qp3dMSWazy01i7JKe9b5PqvcFFiBNGsX9ns3DNCascv+IfYlEUNkZawct9ry+NZ
 RKDVkiy7N3dY4jkhUgGhu9KPSQxNvqom7mJ3AKRbXrm9+KkuP4wvTZ1hAQjV1psVfjNu
 Y+WE1zAwFAjzLWtUDACjqIrEuijEMpz0uV1QRimKE/D92B8FKq6whBeMQu4dPpubuIyX
 7cAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8HaL0nOf7xsQRBvzxe685FoKKacHw+aq6HvggY0WJ8A=;
 b=SEPHR9wd+g86w3sa8B6islECUodbHqwogpL4SYJzWhy7ZyYvUdGgTRnmWwr7/wsAOS
 qjRGGRsbzfM9QmN9Ll73jYaJcuobort+ZFBY5G3gdlQhntE0tntiWoFCGNjdIice78H6
 Lywujip0710nVK2Y8g0c/Zl5apufV1GFMn7CkU0agETuzkzW9JatnOrELPtLQKtmx743
 TfQYjOpWpMy05N43MEFQODs7xzNBVzYw2Fcb72CoUSGSjxdLl5Pak7EYCCwBF7bEJnnz
 5PloIb1zi6WfDWHIyLqtYNcKJtwDOXUoFtfRGa77/rsfO21Ar5FX9SPWXgI5BSNukT6h
 AeHg==
X-Gm-Message-State: AFqh2krK1NSUmvOfaUwbMqWDJZVRh0FZ/yuZpmkOsocMDAAWb712YLIU
 CN7gwNBwdEb44gPmLQoA6gBhhxz2dSAhOZseIaBP5Q==
X-Google-Smtp-Source: AMrXdXvrs3ypQeK4uUYMojBw9kNIIzwm5XekIS5rXaz2TsjHOUwkr4cyC5M6+McX2UQVwh9KNYG4VAs8p1mZVTMJVdg=
X-Received: by 2002:a17:902:9890:b0:189:b0a3:cf4a with SMTP id
 s16-20020a170902989000b00189b0a3cf4amr2339100plp.60.1672920256922; Thu, 05
 Jan 2023 04:04:16 -0800 (PST)
MIME-Version: 1.0
References: <166990932074.29941.8709118178538288040-0@git.sr.ht>
 <166990932074.29941.8709118178538288040-5@git.sr.ht>
In-Reply-To: <166990932074.29941.8709118178538288040-5@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 12:04:05 +0000
Message-ID: <CAFEAcA-CamVauNm0g1tx134k-_m5yxaTm4a91xL8_bt8Pe_2wg@mail.gmail.com>
Subject: Re: [PATCH qemu.git v3 5/8] hw/timer/imx_epit: hard reset initializes
 CR with 0
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x635.google.com
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
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
> ---
>  hw/timer/imx_epit.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

