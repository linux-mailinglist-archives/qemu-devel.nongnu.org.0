Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBF6546725
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 15:12:48 +0200 (CEST)
Received: from localhost ([::1]:51806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzeRS-00026u-JD
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 09:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzeEl-0007Fj-Oh
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 08:59:40 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:37024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzeEk-0002v4-73
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 08:59:39 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-31332df12a6so123360167b3.4
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 05:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uTw+gjziCC3HnyLYNzMqwt4ol34oY0zGttpMaqnvARk=;
 b=NiKmnXMNiQ0CnobWTP8MG/u8hxbrpXY2tJgA+Mtscf+H0xiv/7jFd0RDtpyphNzPLT
 dkhJnjCIrYVNut6LT+Hy7PpKbBYZFMYoaZVklTdaU4pVXr8BdL+gnMl18rVuDTRHvWhX
 UekpbVqbK+RZcuUzE0qOOFw9QIqQIBiW2AJex53f6nAM2VPBviuKewEkFXKdl+X9V9H6
 TPQ9N32jauYZOT7OSWgttZJzX2qN+R6YNJ2ad/O46jAMBSsULJpY0PZAF12ssvl46rJN
 NhMpJENkRn+6VcD4w/VVghqO/eoKFbr9DbnH0L4gcPIqV6NQ3b6FfrEEooJsVfj1LI3Y
 k66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uTw+gjziCC3HnyLYNzMqwt4ol34oY0zGttpMaqnvARk=;
 b=KMgUAEwxvhPv2YQkP9v1ERhXBD/UmOamUlhi2BhZ0D3q+YKcYUdZspEH5rnFEXEX9i
 Qhg2zSU8i2fOIISxlmgmPseMPmEhayumP/GfD7tFzH2POlSd+C8z6aFIZmlruW5x6/Y7
 +3FEX21BVgOmBkRlzzAmr0I/G6EaKED69n+XbQoqmAxUjqEsSYs/4Lw2kEMB7AJ8szaY
 QLy4bHda+/jNUfXRcYmio7XB3K4uXKcqHo1TfsnRood5GqkMS9xZcoT3M/F7X2WhhVC/
 YtIHstv6BNSBqDJxhvidIuRpfOQvYcyl5V6HGnHf8yBwJPAyRkQoqavjSt7ShHDFCVlr
 u8Nw==
X-Gm-Message-State: AOAM531evBeu8qq2SiHWQy528HHhwF3/QiZXPAsHTw4jGRXX3+S+Tuw1
 +Lz5rizlhWW+fP+0TRRK5wd5kT/Wb0uYfup3vwv75Q==
X-Google-Smtp-Source: ABdhPJz0md12CJseS9kuOB+J0qcVNoyJkKRSlDF/PQrRPcYWQidy4/RaFGaJxseKlKtykx+T+FHy9nas1M/IGeiF45w=
X-Received: by 2002:a0d:cb17:0:b0:313:caaa:7839 with SMTP id
 n23-20020a0dcb17000000b00313caaa7839mr769158ywd.10.1654865976442; Fri, 10 Jun
 2022 05:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220607203306.657998-1-richard.henderson@linaro.org>
 <20220607203306.657998-30-richard.henderson@linaro.org>
In-Reply-To: <20220607203306.657998-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jun 2022 13:59:26 +0100
Message-ID: <CAFEAcA94ziZcuU0KfzpPV84sHNCNwdWMePhybRiOHAzmhsEqFw@mail.gmail.com>
Subject: Re: [PATCH v2 29/71] target/arm: Add the SME ZA storage to CPUARMState
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, 7 Jun 2022 at 21:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Place this late in the resettable section of the structure,
> to keep the most common element offsets from being > 64k.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

