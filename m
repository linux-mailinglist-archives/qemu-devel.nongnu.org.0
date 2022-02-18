Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CB74BBBF2
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 16:15:29 +0100 (CET)
Received: from localhost ([::1]:41032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL4yl-0000Oc-Pu
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 10:15:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL4xY-0007ue-EH
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 10:14:12 -0500
Received: from [2607:f8b0:4864:20::b32] (port=33515
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL4xV-0002WK-CO
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 10:14:11 -0500
Received: by mail-yb1-xb32.google.com with SMTP id j2so20336196ybu.0
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 07:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tiv5i1NYKOriDeo+BHWEvt4iO+2QK/GYaQeFEQh8hbQ=;
 b=DNIta3SHNP4pAMDlAu2fMmZTGsk2mMlcoVO1i65aYafT7LWQQCks7cTULcBxXYFHK5
 5Nyy7JToOPdoSHu9p6y2Su0DuUunoLbzxWjHiFT2VXWSPIrIDrOR++ulo7g6sEmfaNlZ
 YY71yXYpbkdFf4x7FDKf3U0At/UFblC4l2sFAa1mxilmJJFGRm51KwLhfX5yJIjOFfyo
 u+Rw5hqd7CWe5nxBhODnod5A3DJEw41NXXsH3yP4BAhTob+q2/zKhmr3Tz5+1x3GIbVy
 002Oqo1tpCBmP1t2BIxXNG8NprYrHpSOL6NCxlcXW2xYNv10o6STQN0fJuizrwlzme96
 tOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tiv5i1NYKOriDeo+BHWEvt4iO+2QK/GYaQeFEQh8hbQ=;
 b=3bKsEQ6fVmjtXqtAOULVDii1U9zucvrHlDczxUxOuJD0UsyrIQ+pERyp8ud5u6790C
 qJRmkOsi5nadpAZpgB9mwG/Nxyc1SeBrHpJ0DXlIWb8S2BqVnxTfs+9qHZv03wWJdxfk
 MxVq1YtJu/+YSQjPUFbJdadUvz+LVSaGDvsp8K3g+5ffywUnjFAdzIU5uNgLtStBpeHB
 rZslATNcUOABXuXi/9bvTlCahbBuu+zRGLm98bDXZFOyGIJuu831iLTLLPCdm1GTsFw0
 jwAD0Hn3qWbP1kuMf5pfh1q2ziXNdLbfLUQ++6VI8Yx4YKrYCRISRaXPEnlyr3RU7zmF
 iW2Q==
X-Gm-Message-State: AOAM533fgpWrW4seSSOLVgK02vlMGa/Ha8p8FNwx278G9+2ue8JRQEc3
 sOysm/MUlc3NcmMzX/2wK/lZfEHt913IqaHq9mNnug==
X-Google-Smtp-Source: ABdhPJwDqRmnFI5F1KqBXo1rJV4xgzb+dOUyRKaSf0iPSer5P6y1kMkrsTcCT8a2BKtJSmfuZ5DlfvXdGR9uo8hPCWo=
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr7628618ybs.140.1645197242877; Fri, 18
 Feb 2022 07:14:02 -0800 (PST)
MIME-Version: 1.0
References: <20220208233104.284425-1-venture@google.com>
In-Reply-To: <20220208233104.284425-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Feb 2022 15:13:51 +0000
Message-ID: <CAFEAcA8Zq-Unph4bRk3fsxAAtCnEpVmf4E9R=JgZ91gH8KXPpg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: add initial mori-bmc board
To: Patrick Venture <venture@google.com>
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
Cc: hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Ilkyun Choi <ikchoi@google.com>,
 Chris Rauer <crauer@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Feb 2022 at 23:31, Patrick Venture <venture@google.com> wrote:
>
> This is the BMC attached to the OpenBMC Mori board.
>
> Signed-off-by: Patrick Venture <venture@google.com>
> Reviewed-by: Chris Rauer <crauer@google.com>
> Reviewed-by: Ilkyun Choi <ikchoi@google.com>
> ---
>  docs/system/arm/nuvoton.rst |  1 +
>  hw/arm/npcm7xx_boards.c     | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)



Applied to target-arm.next, thanks.

-- PMM

