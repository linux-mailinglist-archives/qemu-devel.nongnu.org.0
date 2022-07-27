Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1840B58275B
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 15:05:32 +0200 (CEST)
Received: from localhost ([::1]:51108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGgjD-0004zz-3o
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 09:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGgd5-0001zy-FC
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 08:59:17 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:45646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGgd3-0005Zq-K6
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 08:59:11 -0400
Received: by mail-yb1-xb35.google.com with SMTP id a82so24500769ybb.12
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 05:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BNpzrrIJUdSWAIxF6BWPh4upFFo8fQMFIBZ8Qf+l1Ek=;
 b=DvDcRmNMEuHuBVjCUFEm44OLrPvfew0CZfAlswD86v9zPM9A7NYQQA1+Ozh+pd+NFk
 mizrSovUq3mOeJQfC6OQcIWmYDpc2H51Oo0u+CXFwO2LLNuE2JoFw4UMrrdCCS0T/uMl
 xyLYAuSaXt2LoToEKBYULw2yx7VzuYEWSL7Y2dPON4BMMoVKTQOMPBtrEDtxjObXKTET
 o/gN+aCjU9Qt+XMzNYb8ZaddoEc9oo6iVnbe4sVB9YeE/AwYSN6H0650mcSk8x1hzORc
 Q6TOqK+JvMg2K06l3ZxJHF7KVsnXV7jnxblcrVsPkkrsRvLtV++TGTuFDSbQGvx/o39P
 TFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BNpzrrIJUdSWAIxF6BWPh4upFFo8fQMFIBZ8Qf+l1Ek=;
 b=8BkeFKbYRQO5v0CLpzKdmVLIsfT8n3GGrHAk9UxItToFG7OebJknMimxy3kcpUrjDC
 OT/Mzhc/weFza+EY9HUhXzuSID/bg8yiomDA52pHnFZZIU9VH/mhbUE8pJWeHjmKqg9z
 UTgEnz2MjoPnjMV3NP58vEsgSoUUmchroFwJPrcdEmMmDmFQEYF5Gc/V3PsKPU1B67D9
 Z07YpyujMuN1PIAHrj3cwSIKpBtbK42Pv8EekNec/uoE06yEF2PyMCOeXpuAKyyPPOpu
 Zv+YVsAokzGLh8s9o59fVH/9Gh5iSIOb+bJja/fgnLhMb+D8itG9dZYJGN6K3AJDclmV
 0CCQ==
X-Gm-Message-State: AJIora8As/2E9RIvDuSdJ+UcdpFOEtXnsvuyEHAjec02EcdHJpLAJcSU
 SjRGvVDM7BVNfqCJKnhNiVbTvqid0LpM7laTmjhaHg==
X-Google-Smtp-Source: AGRyM1vX/hp8IUThI2bYWFZt2ObDEXmFz8PQl6GKtHQRxp7HN9Ycy9WfzWe00y4Do6B93I02pIlwbv7r28IGM4bRAR4=
X-Received: by 2002:a25:d617:0:b0:671:79bd:69bf with SMTP id
 n23-20020a25d617000000b0067179bd69bfmr5203063ybg.85.1658926748670; Wed, 27
 Jul 2022 05:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220718115433.802-1-quic_trohmel@quicinc.com>
 <1bd12eb5-86fa-fe28-c07c-2b538156ece2@rwth-aachen.de>
In-Reply-To: <1bd12eb5-86fa-fe28-c07c-2b538156ece2@rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 27 Jul 2022 13:58:28 +0100
Message-ID: <CAFEAcA_48umuKdaZgD5rSqHSc7NVhLHJPHBf3bq0Nm6+EwqfKg@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] Add Cortex-R52
To: Tobias Roehmel <tobias.roehmel@rwth-aachen.de>
Cc: Tobias Roehmel <quic_trohmel@quicinc.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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

On Wed, 27 Jul 2022 at 12:43, Tobias Roehmel
<tobias.roehmel@rwth-aachen.de> wrote:
>
> On 18.07.22 13:54, Tobias Roehmel wrote:
> ping
>
> https://patchew.org/QEMU/20220718115433.802-1-quic._5Ftrohmel@quicinc.com/
> https://lore.kernel.org/qemu-devel/20220718115433.802-1-quic_trohmel@quicinc.com/
>
> I didn't reply to the previous review, because I did what was suggested
> and summarized it here.
> I hope that did break the etiquette.

That's fine. I missed this series, so thanks for the ping; I've
added it to my list to review. Note that because we're now in
freeze for the 7.1 release, I may need to prioritize for-7.1
work ahead of this, but I should get to it in the next week or so.

-- PMM

