Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ADB4FBC9B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 14:58:23 +0200 (CEST)
Received: from localhost ([::1]:60544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndtcb-0007GY-Uq
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 08:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndta7-0005nw-FC
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 08:55:47 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:33687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndta2-0002JW-Lu
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 08:55:44 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2eba37104a2so164668357b3.0
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 05:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gAHhXdQgTf/kSVU3weL0xlWL2d9rZi6UGQmrCdY9aUI=;
 b=AX2NldHUJx+XJ5iYXokZzr1h+jocpskqOyqtuzHdb5vtss6kOafYN5erxQMtBUzrcJ
 S2lMDwhya5NCpTybXtmw8PVqARMSCYHnYFDBUG6capEAYklamL5J/2502d45WCR4atyQ
 cQFtvuUDxdj9of7eHxPrik9nradpiwKvNRhKMg4ZjxTWFMax7Bt+eanTtvZzBFwWKPM3
 F88hXkmOIwbv9BkpBz+fL0Pe3UUqwUpEe1yn/lB5loQwQcbw9zJBfwgV0fm4gGbvCFCf
 TmEAvcVjA4V/lyYZX5iTGek1GlrSR5WN79NQllG0BrPW7f5eI7Gf+LEPtPwRvjIHg6A7
 z6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gAHhXdQgTf/kSVU3weL0xlWL2d9rZi6UGQmrCdY9aUI=;
 b=ZH1mautfRosMJBGJbx1oe+HFczRJJbGPmuLbal4M0ZEva13CGPrjRj4QNybjgva5uq
 Dwe82hjPie9g2/n5qGBtdOKJkVgneE36e0/oHrc7RDQ3sOFPMH2RamJeoZoKbE0FzKSr
 85xVcR3LWatVPxYm0rUgHCL7TmSfNrXY0PMmDJL42Ll4YFgz/jSRVhLKRD53q9LjeLL+
 p9GW7MuJvXaon1z0YOsELQ7GQNTVrR9pyVTXbxECoa2IjXA/IbnH4ZqIdvao/LU+Y38D
 5gyS2eZUDCglqrwXQNQzVVL/aia8BrS6WWBBxGHqMRjg1hkR6CRvwH9zjKx+aJJoRxwi
 IdOA==
X-Gm-Message-State: AOAM533gpsngx+isXOTQTZnwq0fuyXhF187TwcT0/fPNrr8xuasTXmVo
 LbNOeuq0u+WDZCDPZj2YpthyBF8jjIsc8Ucu5hmOZMbHueY=
X-Google-Smtp-Source: ABdhPJw17Qwu8pQ5b/u1wUcw3V8gZg3LMOKMa91LEWLTmsU0rApQ9//U+0iIt7xoejCzgnq/fMkMSuEfLWOdl/TZGbs=
X-Received: by 2002:a81:4655:0:b0:2eb:2e0e:9d47 with SMTP id
 t82-20020a814655000000b002eb2e0e9d47mr25036506ywa.455.1649681741631; Mon, 11
 Apr 2022 05:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-7-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 13:55:30 +0100
Message-ID: <CAFEAcA97+9_ZWTpiQty85fW+7yJaT+L2BvZUYiiT67D=nn9_=Q@mail.gmail.com>
Subject: Re: [PATCH 06/16] target/arm: Annotate arm_max_initfn with FEAT
 identifiers
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 9 Apr 2022 at 01:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Update the legacy feature names to the current names.
> Provide feature names for id changes that were not marked.
> Sort the field updates into increasing bitfield order.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

