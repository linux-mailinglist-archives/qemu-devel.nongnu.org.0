Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE406AC0C6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:25:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZApm-0004xE-Ue; Mon, 06 Mar 2023 08:24:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZApI-0004lK-Mj
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:24:31 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZApG-00061u-Ur
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:24:28 -0500
Received: by mail-pg1-x52f.google.com with SMTP id 132so5481115pgh.13
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678109065;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HxdjSh3vP3Rn3j0YRtRJiUB0QjYdnEH+iXJyTXIBTXc=;
 b=subXKE7givj5/HnuGLpeef3+Kryen8SfGdV++UxRtOFq02pC3HY737KSa1K0j7ppnk
 m3RdByPpD2vJxWHqmf5779Zs3N3WxWcbBKaLvLB+mpZHx/BPUHe7iNAaBSNW2G0HCRks
 Q1nukKFBbLbOL6NUCTfkOOc++TIZACexJKGbsPHvzcMfTymqoIhMAP3MqP8XywCATvKB
 70wOb3l5x0RQ5TfQc67XsPL12x6qHC1GxUBByuGV7pS8PuaQ1i0AsSCXR2jBI4JOkDRi
 8NO2Wn/9xcuWuZR2yX5RiOIsv/FBKZlstbnRWRHKI7r96YQG7PM8PyWcCgyrg0sf0bL/
 1j+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678109065;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HxdjSh3vP3Rn3j0YRtRJiUB0QjYdnEH+iXJyTXIBTXc=;
 b=EVAH/XojxziJBs0hamDyV39MPpxeh3f+mloj9c/qrpqkxN+rw7kmU0PnZInE99uLn3
 eCeTXvSAJTvGrJMHmnZ9c1ldCNHdFi9A0gh2T+BU3aoKa6Ri+3c/Wxt9/y8QWELZIyk5
 j1+tlr8W2mdq+dq72RdmY+/pKohdFkMWP1HFzzujP9U7mN+lEWib0VRZUFIUhvBLLCBx
 5f4N8RPT43JWTN/KrclaxjVZp6ztk2gRCJ8tL22hWHtJj+tTLhiRveo9HPrdLMF767P8
 rM+m4hqsnfjwL8u4KAq9L+YsFQzSZnQE3P/Y5ryzMWCcuMzz0g6zGJjiK4733rP4E+Og
 iP5Q==
X-Gm-Message-State: AO0yUKW1Ht2G3AgtGKF9dkqOE9RwBB0IRZQk0Db5GbpwEF7/TNy9ifN5
 LCd2hYGrMarUMDM02/itkoJd/Ai1hN7gmQNIWmOYGA==
X-Google-Smtp-Source: AK7set8W61a1PBspD/85mkQOmEOXV73vfziWkqfPFcTLSpbCNQ0Z+0RSO0EeLidYzYh4QdERjHNfQe96IRC11EcNEd0=
X-Received: by 2002:a63:5508:0:b0:502:fd71:d58c with SMTP id
 j8-20020a635508000000b00502fd71d58cmr4004600pgb.9.1678109065534; Mon, 06 Mar
 2023 05:24:25 -0800 (PST)
MIME-Version: 1.0
References: <20230220081252.25348-1-qianfanguijin@163.com>
 <20230220081252.25348-3-qianfanguijin@163.com>
In-Reply-To: <20230220081252.25348-3-qianfanguijin@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 13:24:14 +0000
Message-ID: <CAFEAcA9pYsD547i9eGD4sS=LXTJb-dn0Q4xsODHhCHW8mWGqqA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] hw: arm: allwinner-h3: Fix and complete H3 i2c
 devices
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52f.google.com
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

On Mon, 20 Feb 2023 at 08:13, <qianfanguijin@163.com> wrote:
>
> From: qianfan Zhao <qianfanguijin@163.com>
>
> Allwinner h3 has 4 twi(i2c) devices named twi0, twi1, twi2 and r_twi.
> The registers are compatible with TYPE_AW_I2C_SUN6I, write 1 to clear
> control register's INT_FLAG bit.
>
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

