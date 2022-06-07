Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B103F53FB6F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 12:36:28 +0200 (CEST)
Received: from localhost ([::1]:43430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyWZX-0000eM-QC
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 06:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyVzT-0004cM-UR
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:59:11 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:39213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyVzQ-0004mY-K9
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:59:11 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2f83983782fso169600297b3.6
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 02:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mInI91R0PXKv0MZpXvrNXelzJblvF7ifWargfRR9fKQ=;
 b=wm9zk5C5zG8EyDvgRPAi8DhiRopWNc7d8NqrjyKfcqnZYmm56do5jvkNcXh5nG3xh2
 al7L+P30/cj83yrIqa56CCxspM2pSYy/DEMt91QT1vfaXatxjEvVYYBz9Ufwiyy3ubnG
 WytK8OJOeCyLgKW1GeZjWLUUfJJwcqlOI+w1ox3+iDJ4YabkwjeDnG7wg6LDpO8hGKr8
 HEmfF0yOOEd0U1JeWZPi0l9IKm27tCbvTaBx0d0jKZmNU+e8cWyzbE0uVPjYnIRIUOGj
 Nrrzqyolttvr2BekV3eEHRYwkuokUHWcAlcj3JVoU+F5Ol1aKOt6cvb5FemoXHGkQlfD
 7oCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mInI91R0PXKv0MZpXvrNXelzJblvF7ifWargfRR9fKQ=;
 b=qDdDafZP/SBSeREQ6VnWHFkS9CZ1lUkA5bNIdY/Pla6Ok+J4p3JL0uzLmw7jPOjH8S
 9M0X2CVnIWuZxTc6Q9LhwZcGFg1DAn7GDJDWpWi2U6mNANP94+tNOkhRluf2jq1LPQjj
 MHbtcmDLj1Klksk4rE5eeiBMs4RnyUAJlk9/2OYKWJJgIthQMPUqQgAuDWZQF8+3kMw8
 JrKVcxbyeE01m1A3u3x/TD/SpIKePW38wQxysYs5DNRCQKlZIHbLbRVvb9g8NHoraQtc
 Z5KsWp4f2BujJk7LynPapRwh/wTx9+vQmgJylyRmv8St5Q+uNap65U/7sUY1rxU90itr
 Areg==
X-Gm-Message-State: AOAM533IvjPqKKrqO5wl0eF+DmvXt8/BHD+PdfyXTJabTGHMSeWnLOEU
 Yj3oSL3dps0H3FTNX5twG1C8Tx2BNZ03pXnTv2QGbQ==
X-Google-Smtp-Source: ABdhPJy4BAUIi9tmMoF4xjgARFZRTjEsfXpwr774QJSHzQmwtokK7VFTCN+zyeYhD2lkyXoRa8HaTlAEmDlrmB5rlPk=
X-Received: by 2002:a05:690c:808:b0:30c:4f5c:b319 with SMTP id
 bx8-20020a05690c080800b0030c4f5cb319mr29878571ywb.64.1654595946122; Tue, 07
 Jun 2022 02:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-41-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-41-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jun 2022 10:58:55 +0100
Message-ID: <CAFEAcA_v=99UsZ4V4_vZSpHtb4dGGV39-sBnks2wHgAkfj2dFg@mail.gmail.com>
Subject: Re: [PATCH 40/71] target/arm: Move pred_{full, gvec}_reg_{offset,
 size} to translate-a64.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Thu, 2 Jun 2022 at 23:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We will need these functions in translate-sme.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

