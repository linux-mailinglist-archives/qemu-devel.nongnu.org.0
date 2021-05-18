Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6373876DD
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:46:31 +0200 (CEST)
Received: from localhost ([::1]:50786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lixF8-0002jI-2c
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lixCA-00006i-82
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:43:26 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:43572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lixC8-0003GT-H0
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:43:25 -0400
Received: by mail-ej1-x633.google.com with SMTP id l4so13791087ejc.10
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 03:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FtHMu7bHz9n7X6gZPOCuaHwO+3dMSCUeiHZvdP5dsIc=;
 b=jGT+FpwMJwS0i8c1qItTT+t0IuHp/oBmzMGHXmsRB+RXF2yMTVa2McbWlxd0kl0DZs
 lz8FCgH//or20QWW2h0I6VBSP5iKVQULYUXcS1h7za6kD2apVHX3TdmqJroeA9TCtAz5
 kgWwPkITd40sT6MkrH+skoTQUg2HAD9zTV0zoIPCaMSsUWMtbkkZf/iGqWQFlpusYKvR
 x2F8Fl0di6SCK0bO/KzFBC3TTc5odHFHtPjOZrmh9cR9ibaDgViD/4mNmbqeKdXa0w4P
 ItZwhbvCkwyEEccJneBj+7PTQE1VKs4qTywSvNg6qAaTJ+T0U1KYtkJjDqHfdJSkeUHr
 292w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FtHMu7bHz9n7X6gZPOCuaHwO+3dMSCUeiHZvdP5dsIc=;
 b=q4dRRTm/ATY6HJ1KZRVdzXOhl4rTwVqDOVr27kbT5m2PPlcRKvhmGKMQnv82ptp7Dz
 yJ4+NsxCsA5wgA9nUh3Y1sEUD6JdD1hgvG2oGvRVtOx3dsctdfrNJoOQlHgShWIpFbAz
 DPK4WqipQnxTBPwwZJ7blcGhJMCR2GCWWvIpVmklAOK7UoweLYAZvH9g0P5hszMjyT30
 TFsVVuPBIkWdapLHYjveUf6gCK5ga8l5ijZ1vrX9iIAP4PUzLhMO9qTSSqx/L+YyOKPS
 P120a3/eDaU1v/4Bg9+cGmXDPVa1DxlkGTZWVCdw5WVqOqzNleKAF0jCX5Bjgs8OnLxu
 bxmg==
X-Gm-Message-State: AOAM531nWaWU1TvcC9Ugn0MUbcHyBXoxs7jwy33X6kr0gFfXqWbxTEzW
 ezw3iH+s3d4dbi2MNJgfX9UAqy4Wahi+3b3ZV79cJw==
X-Google-Smtp-Source: ABdhPJxY+XQujKQKx4PF2taK4m70UU12f6JPrSMeKK+rOXL3KR/ObZ2lQKZhFWnLqGcJMvYnisoHKBKwlGsjdlzlcdY=
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr5260058ejb.407.1621334602860; 
 Tue, 18 May 2021 03:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-2-richard.henderson@linaro.org>
In-Reply-To: <20210416235928.1631788-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 11:43:06 +0100
Message-ID: <CAFEAcA-dkve2515fQfm4nOsSWEO3JDG1VkF2jWQmVOVTNu1v7Q@mail.gmail.com>
Subject: Re: [PATCH v1 01/11] target/arm: Add isar_feature_{aa32, aa64,
 aa64_sve}_bf16
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Apr 2021 at 00:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Note that the SVE BFLOAT16 support does not require SVE2,
> it is an independent extension.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

