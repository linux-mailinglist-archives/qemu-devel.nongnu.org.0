Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C213D539128
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 14:56:08 +0200 (CEST)
Received: from localhost ([::1]:55004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw1Pr-0001ox-SI
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 08:56:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw14x-0004d9-S2
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:34:31 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:37877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw14v-0007DF-2d
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:34:30 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2ff90e0937aso137703617b3.4
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 05:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wAtGSEgm4qsc5Mve9MccJqDOEATehtP/hB7mZs1CT2s=;
 b=V637RKVEBYbNl02hsGOWkNTMoStf9GKUww3K+W0/sunLW/0cBC17Yv49QDLEOSwYeU
 Xx1NJ6X4b/AUFSE1RsLwPGV9rMGtWC0K+NLjar+NfFAsCowHY82Y64bBNKlFlbZRkVPY
 gwv/H7Ez4qnm/maD0rG59I3YXEU9/qbrNrzgJzpsyL44jj68lNyptAB/HuYsN61S1roG
 sWE3e3NZE4DvVQHu2xnK7MsZ/NRzvDt0QeeK4LU/DmO2kgY6Ywvx6humjLlzZMKSJnjK
 7G/d9xeFpx9k3iNDTjAnPWCH+Oc+EP7Aiv8eYeC1wicjnc+SOd7QwSdYaXwQtC3Nf0Gu
 LKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wAtGSEgm4qsc5Mve9MccJqDOEATehtP/hB7mZs1CT2s=;
 b=Tsg86LCnCb3daX8nDhP2UIyhtagnOcWesR2LRYoCOMdxoxTGfdIBgGJJfcHlxipzLx
 dut9Zh0hkRLB7Ykx7FKLlgdM9qFTdu+RtTYEvmaDfdaupiLoDc3XC7jfBxohbSZg7Kf9
 Zkc0h2FkFx+5DUjLSx9lsbi3ix404r7NuS86/xy0cwrLz1t8GJ4C1yltoJmMWbMLpmeg
 Op0rbISuis4TY+2y8D7Tz2k87e34i8kcUQtmBNLmk6h+gp6kUTaWNcY49cODAhQYTe+L
 um2n2IcrxPyN9hry0ggCVerIDQl8S8YeqlTT/vBW5W70nuXznmFN+QeiwBJH+Td6LzKe
 1MIA==
X-Gm-Message-State: AOAM532/p6aNVhxDMaui+S1EpLC+NX1dgr669984mx+jIImcMb14XaM0
 lHSAI3+BuzrcDBZcwDhSlXJs5yaPyw396SiisXmSDA==
X-Google-Smtp-Source: ABdhPJyAXy3CuKiLG11Sw3bVfTHk2lcOEDfERmQSf8KseOtb+XTDLt+Ay6r1rpUJTuoOoj2fcgIUh5Nd5tQIqtROxiY=
X-Received: by 2002:a81:1a4c:0:b0:30c:8363:e170 with SMTP id
 a73-20020a811a4c000000b0030c8363e170mr7188148ywa.455.1654000468269; Tue, 31
 May 2022 05:34:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220527180623.185261-1-richard.henderson@linaro.org>
 <20220527180623.185261-15-richard.henderson@linaro.org>
In-Reply-To: <20220527180623.185261-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:34:17 +0100
Message-ID: <CAFEAcA8xkm9hKPu6-XNGBJYaDj-EwUdShJjDmB5e5ZZ1XMjvVg@mail.gmail.com>
Subject: Re: [PATCH v3 14/15] target/arm: Move expand_pred_h to vec_internal.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 May 2022 at 19:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move the data to vec_helper.c and the inline to vec_internal.h.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

