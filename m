Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 129265451CE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:25:16 +0200 (CEST)
Received: from localhost ([::1]:39006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKyA-0006pa-SQ
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzK7I-0003Q3-KY
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:30:37 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:40483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzK7E-0001eS-PM
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:30:34 -0400
Received: by mail-yb1-xb29.google.com with SMTP id w2so42352472ybi.7
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cpGcm1ihSG4SY57fwDtMVtcDbOZEzXmwYTdSQINpDKs=;
 b=k/qZPF4uQ5ylPKaobd/5zkTKYkWaOUAwUJdBZKAFmwM0WueXqXv5yCoq25IlGgFSOA
 gLc70wD0M1Iwzmo2c21D1fBl39IMy594+eYiGREbQbpk+r9CS8Wo0oCd+g8OKVC27u2b
 +cgVyv+JDGbCYEeLxfrL+HAq7uAMioaaWzs+Q1B0dL53xtYvDiYtkxoaNzXvtgHhTF7V
 7H++Qf4NpOZcjOpIq41X3nnjf/Br+2DdwdnRl7y+pSVvHi1qqNSOcLrYV9HFqVkS30W7
 Z55w7nHJWSRYWSdo5ccF5Uvbn5jZKYDG6UvH8VJimsMKZPEopWMOsRxWYcku7CHNuB+E
 NC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cpGcm1ihSG4SY57fwDtMVtcDbOZEzXmwYTdSQINpDKs=;
 b=ieFWDH2SLYrgVmd8W3IpFaL8a1QqmpPcTTmcvoxCOWAXOUI3cB5CLChEEz4ZHg/6xf
 dfBMVtwmHllk34KrzLHlA6qgSaroeZlvBdeMGGMNCOJdpsgPY98sl1Vh8q2t/8t6cGcB
 NtAAhpZCeafMieM2+f25Q5Xo/jT4Eci+bMWo3XCo9Emq9pIfmJjSFguvCIyyrLdBdW1g
 6fiCQefS9KF+QkvOS8oeJUgcD06pPeyzOvVp6CQwNPEI8E3pq3G1P+WweryebuBHYKCb
 uKruMubSAnj3+TUh8e1DNAgdHVCXhYtx6QDai9DucnD51ckYOuIbsA38yB8eYNrKxdsV
 GDLQ==
X-Gm-Message-State: AOAM531jmmeryWNQlX4w5w9UpnTe/WZ7uYRGupfKO34XuV0e3yY4Lbzs
 Bl2dc/ioQSzuuDgZJFGRzpq3bVmsyhLKOpBnsrWFsQ==
X-Google-Smtp-Source: ABdhPJyB9a5U5SFTzJIUmsSL6L+G2VBAH/qzXEWa7ct1TDxa92xDCQ52+rEiVwyoUN0jFWARjo8nrsOwiJHtXOV36gg=
X-Received: by 2002:a25:1bc3:0:b0:65d:46e8:6322 with SMTP id
 b186-20020a251bc3000000b0065d46e86322mr38479998ybb.140.1654788631544; Thu, 09
 Jun 2022 08:30:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220607203306.657998-1-richard.henderson@linaro.org>
 <20220607203306.657998-33-richard.henderson@linaro.org>
In-Reply-To: <20220607203306.657998-33-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 16:30:21 +0100
Message-ID: <CAFEAcA_7jM5VwdY2J26oCoNtUzfL5GVHMmhBJB8O_kPeFvKmuQ@mail.gmail.com>
Subject: Re: [PATCH v2 32/71] target/arm: Create ARMVQMap
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
> Pull the three sve_vq_* values into a structure.
> This will be reused for SME.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h    | 29 ++++++++++++++---------------
>  target/arm/cpu64.c  | 22 +++++++++++-----------
>  target/arm/helper.c |  2 +-
>  target/arm/kvm64.c  |  2 +-
>  4 files changed, 27 insertions(+), 28 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

