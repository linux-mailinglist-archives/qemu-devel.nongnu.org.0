Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AF9612B56
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 16:52:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opAan-0006uP-5D; Sun, 30 Oct 2022 11:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1opAal-0006uH-Lc
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 11:51:19 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1opAae-0001cu-5y
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 11:51:19 -0400
Received: by mail-pl1-x62f.google.com with SMTP id j12so8818707plj.5
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 08:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JLHRL/hoaFJS8Eqc4WICQfb2r8t9jDK5ZelqJEivXw8=;
 b=oqK6I5e4pf6lIGn0sPJOnrcMjlstGnAoQVl5C//QVKZJ1/raSQ9vC8n/lZJCNm9wU0
 qKXjPCIFEaazPmRXiIcRqcSCjNmGR8k0kiCCsBWLFic5Bfasv9VnHrh4lcRUMU0D22IW
 iq0uXnS2+HHX38JYmx3FnK6hbOTAYIDaP24OLw5tHUEi3qoASHWx7POMWKUT2qt+cFPM
 rJXftj+ksZr6mUwP3iYPU5EkszqZzGi2o49L1tJttnvW6x9lM6hmue4+TfXYcXwc9ZAO
 POovsGFZKyMlijwCbRzjJte4gdrUXSReHX7cSFKlntE24RUMINCZc3LuejKxpjFOfOrk
 BVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JLHRL/hoaFJS8Eqc4WICQfb2r8t9jDK5ZelqJEivXw8=;
 b=7uOEqF4Y2sg9TARi4FjMoRbND7r4XkPF44RBC2lr2VMlN2anRTSnJJrlLxfxKRLcZ3
 g+lFvb4aY4NkPQ8HKzhQZ5t53pHZbVhmfH1evKqHlwUxmxZZyPJsNVTcvwmVepEZUUuJ
 34P7e0Mlf0CbgUAN7WfnTLcO4gBG57zpLwyKJNilTa8+PoaJ57q2dFvi5qEWJckiz+/D
 AQXncHADAXZrWkE0L6XmWq6xUtFXFwNRDUJjCfe3VV/7otHv38SE+7E13GVyada6ebWm
 Lzt6/ZWVQd4IFvkDm/JfHN61M+JjeLa5uRlikrhHVV+CGBO1v8+k3d4ylKy1louyC2Q2
 UdNw==
X-Gm-Message-State: ACrzQf2tNpUu3NCpc40qHIgNpVBnzpybKm79L61eRQn1Q9c+iw8zP96Y
 Ywgm9Yd/z+umdHFjV6SZWG1g6E4uQLT0fQKIgy+uIQ==
X-Google-Smtp-Source: AMsMyM69WBp+EXDIOUebo33tMDTLzu1zK7f4WpIFEtnjCJ0UXccwlyFYQjgT7vitTKj+Vlfq7HT3iHpDYH5ZPkHBzCo=
X-Received: by 2002:a17:902:aa8b:b0:178:8f1d:6936 with SMTP id
 d11-20020a170902aa8b00b001788f1d6936mr9851138plr.168.1667145069716; Sun, 30
 Oct 2022 08:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <20221017062445.563431-1-richard.henderson@linaro.org>
 <20221017062445.563431-3-richard.henderson@linaro.org>
In-Reply-To: <20221017062445.563431-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 30 Oct 2022 15:50:57 +0000
Message-ID: <CAFEAcA8GMr5gG-3YehQG1MxgnQiLdjq67VTLFNR8Sx6Lpcy3Mg@mail.gmail.com>
Subject: Re: [PATCH 2/3] tcg/sparc64: Rename from tcg/sparc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 17 Oct 2022 at 07:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Emphasize that we only support full 64-bit code generation.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  meson.build                                 | 4 +---
>  tcg/{sparc => sparc64}/tcg-target-con-set.h | 0
>  tcg/{sparc => sparc64}/tcg-target-con-str.h | 0
>  tcg/{sparc => sparc64}/tcg-target.h         | 0
>  tcg/{sparc => sparc64}/tcg-target.c.inc     | 0
>  5 files changed, 1 insertion(+), 3 deletions(-)
>  rename tcg/{sparc => sparc64}/tcg-target-con-set.h (100%)
>  rename tcg/{sparc => sparc64}/tcg-target-con-str.h (100%)
>  rename tcg/{sparc => sparc64}/tcg-target.h (100%)
>  rename tcg/{sparc => sparc64}/tcg-target.c.inc (100%)

You also need to update the MAINTAINERS file, which has an
entry for "F:tcg/sparc/".

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

