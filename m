Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B6147262B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 10:51:28 +0100 (CET)
Received: from localhost ([::1]:59866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwhzT-00082R-6b
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 04:51:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mwhwu-0006O9-83
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 04:48:48 -0500
Received: from [2a00:1450:4864:20::329] (port=55054
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mwhws-0006Io-Qj
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 04:48:47 -0500
Received: by mail-wm1-x329.google.com with SMTP id i12so11449406wmq.4
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 01:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kHt/d/vHVS/aQ9X6fukyYpmuq9yh199hKrDqQzvmKNw=;
 b=gzy9QIIVgoY9wAar/wiGgrbBUQnf/bJ52UznLPpIGqz8w4+tpV1X2sMST8/eVGzzY3
 FUGl1on3R2bFKGBBpA6PuXSUE7ORcgj0je2d++Z13Z1MjZ78wT7uiyOr1ss1cGNiATUd
 GrSvdb9ZvsfNsSzWajlnAIbD+QeU1l2lmiftoZzES6YAF7CvxLiHGUyFL7oaP0jelib8
 lckAvfiwT5zJsoLpvrPzJeWGSIxGUukesZeE5v2KZmO9p1p0LpWNYGFRx+nWO8dvNval
 odknO4LWEmHzsx1qu8ouOjxu0totg5q1YLVsIkOnN5oUMW+HvLMjhkOcRKxbb8qqvZVx
 w9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kHt/d/vHVS/aQ9X6fukyYpmuq9yh199hKrDqQzvmKNw=;
 b=s46rvjNjEoASYj1psN/rSPUgNwtfl3kvG3GJEmSk4KT32zHKPZlNZDOqMR07EPUSvR
 mcke612EKmrNMR1HQYoPbEBvY8AJ9Qbo1tGj1LqgrW5MItcdtNXhbGqy/78gC95LaiSm
 /UF83k/AlgXV1TvP4CDaNqIfxwJmsjy5gadAvMI+X+hUvzJOZAP3aO85bSV7nNX0D3qx
 o8zVR8RFSGi3PsXAO8PXiYZBw4ScPqg7CEsYDfhGmmTyMhnRpg4EkLl5yoCL6DzyKwlf
 +VBsNhCuOp79hSFZ1bf0l7KEak7kU7H4dksAsdiDlGuSTJbPfkFEX2XONy04z4WvLUnu
 4fAw==
X-Gm-Message-State: AOAM53289owrMLmOJCyq3O7g7hnydi/eXmGzeAFhBhcxyujs1W5MU17s
 irnDbIEM/ENQ4RnCXitFfHiGks4NQhXaWSm6ap6QIg==
X-Google-Smtp-Source: ABdhPJwkA4XNL5WD43Zzcwaac6JlM6FhTt9jAzWiQWsxjWF6cNdmR/5YOAaoRmsJ4JZCJt5gBsYqCyLWpqI7626Hcwc=
X-Received: by 2002:a05:600c:1993:: with SMTP id
 t19mr36859104wmq.21.1639388920720; 
 Mon, 13 Dec 2021 01:48:40 -0800 (PST)
MIME-Version: 1.0
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-12-peter.maydell@linaro.org>
 <6458979b-3162-570f-e5af-1f3baff70d04@linaro.org>
In-Reply-To: <6458979b-3162-570f-e5af-1f3baff70d04@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Dec 2021 09:48:29 +0000
Message-ID: <CAFEAcA-ZWwnyzoq6-D343dMN+8AZjke8ej+fp79g0bEZ+m6n0Q@mail.gmail.com>
Subject: Re: [PATCH 11/26] hw/intc/arm_gicv3_its: Use 1ULL when shifting by
 (DTE.SIZE + 1)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 12 Dec 2021 at 20:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/11/21 11:11 AM, Peter Maydell wrote:
> >
> >       if (dte_valid) {
> > -        max_eventid = 1UL << (FIELD_EX64(dte, DTE, SIZE) + 1);
> > +        max_eventid = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
>
> Without changing the type of max_eventid, I think it'd be easiest to fix the off-by-one
> bug by not changing the comparisions, but changing this computation.  E.g.
>
>    max_eventid = (2 << FIELD_EX64(dte, DTE, SIZE)) - 1;
>
> so that the value becomes UINT32_MAX for SIZE=31.

I think I'd prefer to use a uint64_t. I think that part of the reason
for all these off-by-one errors is a lack of consistency in how we
chose to name variables and whether we put in them the max-allowed
value or the 2^n value, so the series tries to standardize on
"always call it num_thingy and always use the 2^n value". I prefer
to keep the consistency rather than rearrange things in this
one case so it can use a uint32_t.

-- PMM

