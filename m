Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8789B633EC2
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 15:21:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxU8L-0001AF-Ix; Tue, 22 Nov 2022 09:20:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxU86-00018j-EO
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:20:06 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxU84-0001ah-7H
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:20:06 -0500
Received: by mail-pg1-x52f.google.com with SMTP id s196so14218833pgs.3
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 06:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HjpQwX/QkEepYSPRKoMV1yV2gkyB3MGQc1uvI8dS9rg=;
 b=QZRlG6u5fsXv03X+9BwBIiaWN8yNYJD3OdzxUMc9AwMuonZxN6HX8mIwGq2UK7Ecrp
 IY2b4HXlKKs4X7OOmzKEAGQdW4moq8OvjpGRM5sZabCRm7B52y7Bs9YjhOHJ++qBk1t4
 vy9OwWsGSCK8kJGdBjOdszYVF/VGRouxJDf9u8voN/MILMYC2RSaUP8WNpI131z0/oW1
 P3/KEpbUpb22cjthO9vHpOlZUP/hEDPP5A7y4uPWZ2rPanPIJVpyQW5mNZUOn/lTRosv
 wlZ/8eivaCn1zSr8JnFlKXoe0nbfzuN1vod46Ym/gXTiwgCPiF1gypXOG4pvB/qWg9yy
 NDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HjpQwX/QkEepYSPRKoMV1yV2gkyB3MGQc1uvI8dS9rg=;
 b=MMrBumPHMOxG7hsFc9H5Gwh+j/LkVH58wsSPNNtplkrj6+CRUINv/dNCNOOkM0m3Fw
 boxefO2/Hkcsg8zOA6c7DlkyX1weARcMF7Jr0MKBRdPHDy6vuDcukFihqvit2ivv/7UZ
 qD5D9N4CzMyqL0Q98lXTJaArgBX26ueku9u/pxbnP3889ZciREG3eEpwDa4bsBp/Nc65
 xj7U2KHVoCyFSd4ckcxB5bFmP/q+iv9CKcGSMFUzVJoQAAGDh1/oIW2cv4FraS+mvKHd
 10EpUIgYoG28/HSlQnqcg8iRJOsmeLj5LM9xgIaw/8zw7GeSU6r5oi7Srq2sQD/ks0Lm
 bmLQ==
X-Gm-Message-State: ANoB5pnurv4YMUyTzMdXCUcZc54e0tByeVFrOgtLUdX4q9R/O7lsJLDu
 Vl1EJJ5bDsIrDCYgD8yj1JMYes+Sl/AgJoKbzcNyNg==
X-Google-Smtp-Source: AA0mqf56gQ5b23AfzW3J0/droMBm3RLBI89UWmg0+B3jMqcFfbfQy4yKz+CkR0BXTMpzbDhBsppnrRG8a9HRPDr3d/w=
X-Received: by 2002:a63:5146:0:b0:477:86c1:640f with SMTP id
 r6-20020a635146000000b0047786c1640fmr3713887pgl.231.1669126802501; Tue, 22
 Nov 2022 06:20:02 -0800 (PST)
MIME-Version: 1.0
References: <20221112042555.2622152-1-richard.henderson@linaro.org>
 <20221112042555.2622152-2-richard.henderson@linaro.org>
In-Reply-To: <20221112042555.2622152-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Nov 2022 14:19:51 +0000
Message-ID: <CAFEAcA-mjT_hTJZatLmsB+9b5_9XD_9nFbQ_5fGOWMEPbBXi3g@mail.gmail.com>
Subject: Re: [PATCH for-8.0 1/2] target/arm: Use tcg_gen_atomic_cmpxchg_i128
 for STXP
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sat, 12 Nov 2022 at 04:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-a64.h    |   6 ---
>  target/arm/helper-a64.c    | 104 -------------------------------------
>  target/arm/translate-a64.c |  60 ++++++++++++---------
>  3 files changed, 35 insertions(+), 135 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

