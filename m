Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD194D47F5
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:21:43 +0100 (CET)
Received: from localhost ([::1]:37864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIje-0003RF-3M
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:21:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSHsi-00023W-W4
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 07:27:02 -0500
Received: from [2607:f8b0:4864:20::1130] (port=33542
 helo=mail-yw1-x1130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSHsh-0001PA-1Z
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 07:27:00 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2dbd8777564so56420427b3.0
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 04:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N4/iZ2rrRbWmIiCDEqzO6WCMbvBDNiPu/uOT/XDtAto=;
 b=Snsa8rY6GfLE4HOOkpv69R/IxMQOBUaqAXs3QQwa5KOn8ZIQP60ZwGpVqu9eqqe6d5
 tkO4s6Zsdb6QkJE0CnaDc3dCFdotI3z1y4tz8AWfu66q3w9MY5t5MZPkOn8bbexrIWOA
 JTC5JTu9m3t+8hXPxokG0J3WuHkYM8MpqgjuG2jemGHn+iT3JVAweI+LeSwwfDlC0mf9
 AXlXGFErcxUNJaH1Kcp9U7oE981fv7pSXqeGhvqPNT2uK2du8iEbErO+bsY7u7QMcBpK
 W1xXvo3TfDpb6hMyRTYSbCLbonUz2vQ2NR6G+8I6lC9IoFzhh4PfKHKRxC9gsUCMocCD
 4oQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N4/iZ2rrRbWmIiCDEqzO6WCMbvBDNiPu/uOT/XDtAto=;
 b=BwzSy5R5HLQKFh3/GZ5o4MOF6+8/Oqc9qA8Kc3yZHcsq4vtRTqbuSnu29H4z1Fz1h8
 wEUtTGVGaP/OfqYCyAw+5NsNFsrWNx/ivTgeRYZZSESLVW+kuniinkX37q8mbdVO2dla
 /+CBxwiamnpuDLrjInHQ39w3vo26HeskNHGZD5BACTdwYOG4+U0KkZlBggJ9JmhgSeAI
 TsUsxHzRktNJlArVBLpPG8sI7yWxuLs1sWZlivi/E0rMV5t7CQkZah4dyijm2juwF75V
 dgLPLAacvaWd8BPfyF1zKb8RZmr25IxIJr+u5eltoLPIxedl06JqqUa1pggtSh+V2kSn
 xtRw==
X-Gm-Message-State: AOAM533qJ7OKwI4ht3LtRfsbNej9Uph3X5/ij2o/UvyaVr42g9XxNuq6
 4u4opp6IuZzf/znIXeztJGsc7OuYMjZN7wm2GSR5fQ==
X-Google-Smtp-Source: ABdhPJxEJ2S6uAy8mIgYvuAiZHyJ/7BNYlM/TKtRkJR1q6ECo9gP8SCQw2jdkGpcu0MCm/g1dSvNpC/ATVgADxzZQfc=
X-Received: by 2002:a81:b49:0:b0:2db:f472:dfca with SMTP id
 70-20020a810b49000000b002dbf472dfcamr3519645ywl.455.1646915217347; Thu, 10
 Mar 2022 04:26:57 -0800 (PST)
MIME-Version: 1.0
References: <20220310112725.570053-1-richard.henderson@linaro.org>
 <20220310112725.570053-18-richard.henderson@linaro.org>
In-Reply-To: <20220310112725.570053-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Mar 2022 12:26:45 +0000
Message-ID: <CAFEAcA-nT-ai2gkTnyy8=8LusMCAKqWAwqAihb66G4chu6tmWg@mail.gmail.com>
Subject: Re: [PATCH v5 17/48] target/nios2: Rename CR_TLBMISC_WR to
 CR_TLBMISC_WE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1130
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Mar 2022 at 11:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> WE is the architectural name of the field, not WR.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

