Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934BD62F969
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 16:37:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow3P4-0001A7-9c; Fri, 18 Nov 2022 10:35:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow3Ou-00019g-Qj
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 10:35:33 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow3Os-00082T-Vd
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 10:35:32 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 l22-20020a17090a3f1600b00212fbbcfb78so8622293pjc.3
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 07:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Lw5NODinhhYorcz0OqeiqHzIdlpb+FNWOMAn5anAcNM=;
 b=VioNoOO7c1eVsVXz6+eRJ72VZ8fCwdxUxMHorTbYwC6veoZrN09tYeF2QFaDVZBvNI
 3OmaYnT1HwjYgNfhqNPTE10Qv4ynZc2fbwqNivmnG7PSLopYtHn+C0zgOew0d+9RUuKK
 ZqRecoMxK5LW0CRnR3r69Bs5DZZzAkUK7sYsOBUNp3XBpVkZZHXF5mOsD/8mTDyQ6i6L
 IsVDNIjJN1lFCU5bmoFhHcpsQeojvn204dxcJtFLln5VYZ6KcvZo/whY3uCfo8I1n1zD
 TzaiMu2Jpict1CaIF6KanPYeDe0XKgmEggYCtVw+MeLerirDIp51w/IwWLGXSLrKShC9
 qm2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lw5NODinhhYorcz0OqeiqHzIdlpb+FNWOMAn5anAcNM=;
 b=dfFkhNeflZfA1mLF3IGm9cAFqXq2NTiac2baugOYVEl/WeCFqbZDPgES3iyJWG0b+X
 dfWRIMdmbn7HfaMEAXX0VlQY5yTZX3kN/kKtHzEBO3vpO1FGtCrqugVFRR93h5b8jue8
 EdhJ6ZLbI485IiJgtE0toa57HD3CC6usDzSTB75s/fli7Xjz6jeBuCO2CIGI6FVfTD6d
 t6gdihJ3JDJWmkzSqoZ56kNntpWon+QebezwTu3Jydcl8JMjL31Y4EgKthLX0tMJZTFi
 RUIDfcvEe04LloXbOJdgRW43864lONaeygaZl7RUtGS2n9g148S5j4zYZvu6Q67GrljT
 Yq5A==
X-Gm-Message-State: ANoB5pn8/nILj2rrDycoC0yf79r87b1KWjATx7UKLFo8Wf2TmLj5uBAm
 /hKgmya76DGvPswt8d4Vwzor10JNXXNxVFs9ZE4xmw==
X-Google-Smtp-Source: AA0mqf55MIc9KV3SEyVWAhQh4QmfNljfL15obD/yhdaAKeeNbdzITHRDiDyLBaTa2btzb4jhMK9oda4WH1BM7jkaWro=
X-Received: by 2002:a17:90a:7004:b0:218:8757:8f2b with SMTP id
 f4-20020a17090a700400b0021887578f2bmr3430431pjk.221.1668785729443; Fri, 18
 Nov 2022 07:35:29 -0800 (PST)
MIME-Version: 1.0
References: <166783932395.3279.1096141058484230644-0@git.sr.ht>
 <166783932395.3279.1096141058484230644-1@git.sr.ht>
In-Reply-To: <166783932395.3279.1096141058484230644-1@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Nov 2022 15:35:18 +0000
Message-ID: <CAFEAcA_BHbfO+mz3-nXGtJFcft==h4Y1OxbpGV_Y-BYPOvEexQ@mail.gmail.com>
Subject: Re: [PATCH qemu.git v2 1/9] hw/timer/imx_epit: improve comments
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
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

On Mon, 7 Nov 2022 at 16:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> Fix typos, add background information
>
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

