Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FF34ED654
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 10:58:21 +0200 (CEST)
Received: from localhost ([::1]:57206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZqdI-0002HR-5h
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 04:58:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZqSC-0001An-M6
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:46:52 -0400
Received: from [2607:f8b0:4864:20::1133] (port=36557
 helo=mail-yw1-x1133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZqSB-0007w3-5b
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:46:52 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2e64a6b20eeso246400577b3.3
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 01:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QUbkAba0suRYzsDtAPVRmCBnA1HNbkcgdNMXySR3zSY=;
 b=UfV+Z62d1eRcG1vGCyVrUrog21yaMg7SE53WYgxqwCSucwJY23qz9ASjRX9kzZhggB
 NymnmrbA/e8rCqsEWDJ1EA3so4+8BLWj+a1byuXWiKRk4z6BR41aR/lRIYnU4j4yBw5m
 CUyzH2MUK3k5vyPNXLMxnXG3ReF2HvYz+JrBOp4DxbemhzVPtugEAwccU1rnCNVhhoBX
 C0sGRvZEyBWseS3h3dMq69SBkiiQLc7CL/ZuVS3S0Ko2gpKp6e3Lmb7VMcaItE/F7Apr
 FRAdT8pDIskOcpgWYA8caAntYyLO+wiHrV1Vk5SgSjUx24HIKCWVBNRaszSui7ckWjJY
 bZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QUbkAba0suRYzsDtAPVRmCBnA1HNbkcgdNMXySR3zSY=;
 b=o+3/ELkDpFBJv60ykVPlTAYoZeo+5lPDI9twtf9uviQONcUd0jsynp6SBcB0owDG/7
 5rqQscRxtsS0xlSsXlKnSI4UAWeIS1k8/NaTwSQIIIp5Yafi2DQg22+90UiMIw1GY2CC
 UYfiovaSkaAsWz0CVhLrf6HLgtgreilOcKqOR5CAKLJ6GTT12tJqzFGcSBPRJyJRejSL
 ldsu70IAaasM4/CGLRUixjNDVAApvg+VHjZ4GuUea0O3vDd1WXTY/FJIKwwUMgRT/y+z
 Q63Acr7JOPz1GxzWkIS3yJVEI1xRKT/wDTE4yx7tgtc5fwCGlYvtlOf6WbdlFBrOkiEo
 Kpzg==
X-Gm-Message-State: AOAM530akJI8/LMZGJw32UW6JX3FqBSnb2FrizNErwLjb6j/v/uU20+p
 Y6yuVyUZe9Ea7hRk6KJOc6+IcJ2qMDeXGm54ba/g5Jkiz3TBpA==
X-Google-Smtp-Source: ABdhPJxAEVCUJ9SWwSDKOEWTBzq85tjTrjIjQ11q/+U0HotrGoUN3vKjKmpQ0VuMw5dO7hXUt+E75RTPBIbtknMndEg=
X-Received: by 2002:a81:db05:0:b0:2ea:2b92:c317 with SMTP id
 u5-20020a81db05000000b002ea2b92c317mr3906637ywm.329.1648716410257; Thu, 31
 Mar 2022 01:46:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220327093427.1548629-1-idan.horowitz@gmail.com>
In-Reply-To: <20220327093427.1548629-1-idan.horowitz@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Mar 2022 09:46:39 +0100
Message-ID: <CAFEAcA_cT6HrCpBXtyJNYTsaaK0kPE1_Z-EAKpiWfOz9WGUjgA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Bug fixes related to secure 2 stage translation
To: Idan Horowitz <idan.horowitz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1133
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 27 Mar 2022 at 10:34, Idan Horowitz <idan.horowitz@gmail.com> wrote:
>
>
> Idan Horowitz (3):
>   target/arm: Check VSTCR.SW when assigning the stage 2 output PA space
>   target/arm: Take VSTCR.SW, VTCR.NSW into account in final stage 2 walk
>   target/arm: Determine final stage 2 output PA space based on original
>     IPA
>


Applied to target-arm.next, thanks. (I fixed a couple of typos in
the patch 3 commit message.)

-- PMM

