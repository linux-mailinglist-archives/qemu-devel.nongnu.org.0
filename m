Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1277851328E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:35:38 +0200 (CEST)
Received: from localhost ([::1]:53818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk2Qr-0007Xu-3m
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1mp-000497-FA
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:54:16 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:43957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1mn-0002uS-12
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:54:14 -0400
Received: by mail-yb1-xb34.google.com with SMTP id g28so8272818ybj.10
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fnWy7HWaVlx6qb9olD5NiDncSntiQ6WGufZzwpPX9eM=;
 b=T9K+XLH6l9xus7mPq8s97Y4vyQFS2x5rMWg9/QF2/JbqruMhRKFe2mes5sudxr1uyn
 pghjMtlVgcYybF07cRsaEHdP2s7sVwRh2qgmQgBS1Lzr9k1jxX0Ii2rhrAF6bdrQ2yfa
 jKOZGvlPTXZx+xzVLeABolwyO7oe9nlQ0rI33MG2PBVq2t8LZt4/5wzhDSqTouv88VcZ
 LqlT3K1pMEtxzA8zxVTyDpcgTNpPmJ4zb1aeNO0HlFP5tqylm8O3pvclfTtGM4aNH+3U
 e3nEmWmb6zbvdub9f7iXXKWqS/Tn4yl76rvTogbRnB+hXkIj5ncu3648TpQBkSZhbPnJ
 RcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fnWy7HWaVlx6qb9olD5NiDncSntiQ6WGufZzwpPX9eM=;
 b=zowBMIRjHaTSUs1/M+3gKn3GL69E1cj0j1fTJ4O1WqCwI+rv0Ov7JeFr2OB4r0Pdfx
 SM8ztkVMViWil5Rd57n2w9ysfWVls5q7DR4vNh/O2JIBgbBvkvirPBPat75ojYvtfClY
 Km3+z2IZD3ocTE2UWyxV+IV33qcmQXhlUz8vxGMz0LDbLw2X7Yhnhqls+LudNLur3Am5
 4k4HB2mE6dR9w5hsIQ1KTYnK6t7Ccv7Q56kzqej3O4VZKD+hLkPyyfrM97dxXdJRH6VG
 BrsWiIrS/rXYVxdZMGszYsDujf3stGNtFPi1vs8v0PEyPvUPIDqDCyFGT/63Fkta8fT4
 h88w==
X-Gm-Message-State: AOAM533E1n+z2GGPPr3PVrcZNdSyMhZg9CA8SJ0NXm0fVBuEvlkc9OSN
 IzEtHXiEkZDfGzB7iXr84KtiusvTocSN1KA2RQPW1e7ecKY=
X-Google-Smtp-Source: ABdhPJykgN7jTiHiczX2bfJQOMDQo7Q2T7qLTOxdJp1tB/QyEO7uasB4m4g3I307QVN+y8cMM/LCyeNQ6axFaI2RQEs=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr29971491ybq.67.1651143251458; Thu, 28
 Apr 2022 03:54:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-48-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-48-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:54:00 +0100
Message-ID: <CAFEAcA8bgShHLzF94Cpkn70_csE4ehGkAFLLw3tmnx_=jzSWPw@mail.gmail.com>
Subject: Re: [PATCH 47/47] target/arm: Use tcg_constant for vector descriptor
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 at 18:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 54 ++++++++++----------------------------
>  1 file changed, 14 insertions(+), 40 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

