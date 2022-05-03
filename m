Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEA4518AC1
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 19:14:03 +0200 (CEST)
Received: from localhost ([::1]:46568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlw65-0002PC-Fi
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 13:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlw3U-00017w-4A
 for qemu-devel@nongnu.org; Tue, 03 May 2022 13:11:20 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:38333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlw3S-0003Xt-G3
 for qemu-devel@nongnu.org; Tue, 03 May 2022 13:11:19 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2f7d7e3b5bfso186947047b3.5
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 10:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r//vFGk0Yv7h62VAJMS8wStI/+Sa+nCqE1h0xk/1u2g=;
 b=fgc9ArAP2zX4As77WjJAeiW5bIPeeDnH4n7dxJaRX7Yi13xGyPz3Z1JkDSAKGRbp1N
 okDrUOOKiydeSc/pfIc3a2lazz/Kc3z2Uostv6LKp+nMB2DZaxoLkH7O4IkIZdjSmxl8
 7PwV5BWI/xO5RRoGTZ2bRXI7inlx/AE6xP5NzkHSNtZ2wFKxJKpRSfulgnZcbGzGYgOf
 SKwF4YhinywUEiW3iOBD8CBaRabhzdPKRZrrtKBwQ0dCwHAJzoAOlnU242wpDPyd+98N
 vaknmRBe9gerxoG/4weNVGbQcDNB7kdxHpr6pemajT0FdZeyprlN44hz61vPhs9+2FD0
 bVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r//vFGk0Yv7h62VAJMS8wStI/+Sa+nCqE1h0xk/1u2g=;
 b=d6C60mqFqBvBSYycVKJeB8BHg0UxgOCgDRpcRptLRhTubxtoIPqZLmyErELxSswAkO
 xSfJqgKjbwSbxH/DR6ThnPsqg8pa/FQf8FZQGtFadkkN/lyDN88Xhjn5j1cnP168QmCW
 ypEDsi98eMl/glB9EnStBsChPK0W6Qp2I6vmafDhmeM4LlRN7LYRRkcJzcHxDgN0e3D4
 wWSk4C2IM90fCFFOLR56hDFTgHWHpluSHvBkkwBicUT3YVm3Z4+UPcWYZdYq3y05cen5
 sD01kQtgJIbe0ApYmcNqqV4K8QTut7g+sM0Erz3DfvI7stLvycE6B64BtpESW3yiPg8J
 qRKw==
X-Gm-Message-State: AOAM532hTOCeKuw9b8f3alllZKSLVOlJ7lZ0Yu9NovmTnVnX29suKAo7
 XZJiaXAlU4pZAFlU9pNrNlvslvueNTApZqKB1I79SQ==
X-Google-Smtp-Source: ABdhPJwTCxZrDywE8AJ5nq8gN90B5Bob1164AddD2wksGEe4GFk6sR/K/+QIYPulKyNYVFzZ3yQo/NNCXf9D+fnARGQ=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr16061286ywj.329.1651597869116; Tue, 03
 May 2022 10:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-42-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-42-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 18:10:57 +0100
Message-ID: <CAFEAcA9fWYT-2RucwzmrNhMxsUqu3zd338aBTGv7-tFraRVrAg@mail.gmail.com>
Subject: Re: [PATCH v4 41/45] target/arm: Enable FEAT_CSV2_2 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Sun, 1 May 2022 at 08:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There is no branch prediction in TCG, therefore there is no
> need to actually include the context number into the predictor.
> Therefore all we need to do is add the state for SCXTNUM_ELx.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Update emulation.rst; clear CSV2_FRAC; use decimal; tidy access_scxtnum.
> v3: Rely on EL3-no-EL2 squashing during registration.
> ---
>  docs/system/arm/emulation.rst |  3 ++
>  target/arm/cpu.h              | 16 +++++++++
>  target/arm/cpu64.c            |  3 +-
>  target/arm/helper.c           | 61 ++++++++++++++++++++++++++++++++++-
>  4 files changed, 81 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(The handling of SCXTNUM_EL0 should Just Work for user-mode-only,
right?)

thanks
-- PMM

