Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B9C50B861
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 15:23:27 +0200 (CEST)
Received: from localhost ([::1]:47448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhtFu-0006AN-Vj
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 09:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhsqO-00085C-88
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 08:57:04 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:38704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhsqM-0002BF-NM
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 08:57:03 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2ec0bb4b715so84316517b3.5
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 05:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sxnAlhLsAhYpkuFgBbKX652E8wBJHGCr9iybK5lVwVc=;
 b=djhMuqRoBtDGZbZ3Lu93fucQ3DXF/BTWT48yYZeUS8rklCHlfO5iawmZbOgzh49LVf
 4Jjo4caqRAqFFFLoTHtGnt6E//OmRoe8CM87tIaaMizOzPLx/bQmOUYUbRs8ELKY9wz3
 LA644OwpWiO5yJHHAj6RnvtWk/yh9xXdHNUZ8lmy26lWYIUuBCsOI3pqISWZBldaBbxZ
 tGfMHj8PnCfRl7U4eLbCXK+dkC0Yk5r1mm9Bn1Jm2SLsE5S8ozvAEgaT8XoZHPgTA3Lx
 teNlPhJp7CqtwmUMHGiuM7TfPkv7AE3uFY6hPD/AgQqks5oAkaEob0TCzKXTccDoFfLk
 9BnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sxnAlhLsAhYpkuFgBbKX652E8wBJHGCr9iybK5lVwVc=;
 b=2B6RrPIp9thpKhbQgwHPwCn2DdLb5elfICg+LOZ8SjE15HRDykey9f4Qx01g2ebjrI
 0lEQZsOLlrkaw0glgxI0x/MOkZwa8WkHE0JFlMnb0BiNNDvInKLmvQC8vEwEwr1m2ucO
 1hxpiGnWWsY77HobDgXcULZSiaAx0LVwkKr1rs26Ybi0QoNraxRHeFcB3zr6lF+UPdUB
 uSKuYXmTms5UV1oARJKed38EKOpjCtG+HsK/jTzDEvNjX/vHT/jav4vYkpvLJk8aPfGL
 W+1RxARsoeki+RtpAMEwjB3Q2LbZFMSyUMon4Bo6OewhCPumVceJWtQ4fEKmn99blVfq
 upPQ==
X-Gm-Message-State: AOAM530dYNvFBatM4GndprplDuxm9BXYxIiLAQA0DWLIzQtNOBcuqLdw
 IvOUild5dKVmwm30f8poMDpDheoByCIhIiMfFrMmoQ==
X-Google-Smtp-Source: ABdhPJy1LuR2xMqH/G9pqhKbMPoUjsAsFNiYNnRTij/9GQ7SqvrWh26kumr01wOd0saSFQ9kLdVq4xP77aGkkdyckg4=
X-Received: by 2002:a81:4e11:0:b0:2f1:47a0:5972 with SMTP id
 c17-20020a814e11000000b002f147a05972mr4780374ywb.469.1650632221555; Fri, 22
 Apr 2022 05:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220421151735.31996-1-richard.henderson@linaro.org>
 <20220421151735.31996-38-richard.henderson@linaro.org>
In-Reply-To: <20220421151735.31996-38-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 13:56:50 +0100
Message-ID: <CAFEAcA_3F7b6ENRvfOC7CTfgZeVnUHM87_DcVJuwREcUHiVv9A@mail.gmail.com>
Subject: Re: [PATCH v7 37/64] target/nios2: Prevent writes to read-only or
 reserved control fields
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Apr 2022 at 16:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create an array of masks which detail the writable and readonly
> bits for each control register.  Apply them when writing to
> control registers, including the write to status during eret.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

