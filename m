Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C30E84DC9C3
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 16:19:19 +0100 (CET)
Received: from localhost ([::1]:36214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUruI-0002qP-Th
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 11:19:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUron-0006MG-QM
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:13:39 -0400
Received: from [2607:f8b0:4864:20::b32] (port=45642
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUrol-0000PG-6T
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:13:36 -0400
Received: by mail-yb1-xb32.google.com with SMTP id t33so3186146ybt.12
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 08:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LO8B5Bl+kQoiziXoGrAYJlyNHhZ/zcbAbbAda9ejGxA=;
 b=g+/Z4AIDUbVm34zONyK+1Z1aGFErnFvo1T6dLsEXsb6OCeKPFJJjoOFKYpCBDw/4AW
 NGy3taIwmcpptFPMW3rqnNf7/Q0XwnwYBsczlo1AZWsFURplBsdiEBxzMnN9BoRCeT2f
 0JfZC9wyq7emzhHIiAihTGx8aaoMNDajz3jWIKYuinR+WvDGI9vPzOmvAEVagWVyDOpM
 k5UOGUaw1dmD8+wKH429Oh6KI0EQH8FNoD9h3gk1ef8NjNWbI3yB3G202Y7sILuTlUIE
 Udm+BdOuawJHPrmsoToA1DrqRGPX1bMjLOT97IlfbGZWhM+WEXfJN7LhoPkQtjt+IU/l
 JlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LO8B5Bl+kQoiziXoGrAYJlyNHhZ/zcbAbbAda9ejGxA=;
 b=faHxOBIM3QVw9WVs/I8tLdCzjUUy+ydIewDR/es2sKOYJPp+1cj8k9wvnUmUaF1UHJ
 ypYilG0qzpF/HkPb3dcmdFnGrzZOaYrDJKngQpEJ+szw/CQRQnUENA7/5YI1S2oE1JkV
 0NkpLWI/xYKsL+lbjxUSfAqVqW4KWmVQBhY4HF/beG9ocSTIfFZJ4IlNRp6u3CzoGWgi
 K4NmM0wI2/xaWftwKrgIiK/vlZ5Bl+Vn0dJirwMlSr1RQbC+kIh6UeeNH9+1phSFCvkD
 iQ21DZps3Ko6ak5Apx8Q2vNAXUcMcoLG0WvIThRzY76QDhQ0ZTMlDfwt6+b2KLCEDsIJ
 nAkg==
X-Gm-Message-State: AOAM531iaUPt3+yKGuknkb9dKHcm4LQUz8D+qyGme6k6VKosHt1pmFj4
 kpu6XTpjB/vUj+VyNulEkWUxe6Kl12CXqHdgmFfy4w==
X-Google-Smtp-Source: ABdhPJwwo8DcLX3YHHKNGWXI8765XKpqgyGsigewD8q6y5Xg805fyW72UW08LBsMwQJGGLbY7OL1RARTP3dFpuZadp8=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr605657ybq.67.1647530014297; Thu, 17 Mar
 2022 08:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220317050538.924111-1-richard.henderson@linaro.org>
 <20220317050538.924111-14-richard.henderson@linaro.org>
In-Reply-To: <20220317050538.924111-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2022 15:13:22 +0000
Message-ID: <CAFEAcA8iQy-Ah7tkjXD23Nk2owJffYwT5zQ+T6OGakiZr6p1LQ@mail.gmail.com>
Subject: Re: [PATCH for-7.1 v6 13/51] target/nios2: Use hw/registerfields.h
 for CR_STATUS fields
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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

On Thu, 17 Mar 2022 at 05:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add all fields; retain the helper macros for single bit fields.
> So far there are no uses of the multi-bit status fields.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

