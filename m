Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EA86A9F92
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 19:51:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYAUX-0001Yz-2Y; Fri, 03 Mar 2023 13:50:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAUV-0001Yj-KW
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:50:51 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAUU-0002L4-4J
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:50:51 -0500
Received: by mail-pj1-x102d.google.com with SMTP id x34so3583222pjj.0
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 10:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869448;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3tedVeNjogK4knQjMdZiXbJqYYoMooAY0dZ0PwBr1fM=;
 b=k9MmJtlhVO57bp+C8Bosmderp7rQxPt9Pk0n6UrZERM7iin6QwiwFJN5J+9hZjWHC+
 aSEvq4mlVdfAZn0Eb9kTDwMeIVbWMk2+LnYpk0BmDhcjkfayoO+fSPIwntkbeU/rwMvP
 Ky+eDPvbOOzjxYHKrVyn4vnoPSWhvn5TQa/Mexsb3XoDmsraZq4cgPJbxAkxKBlKDPNr
 ld1AxSnIcC3aiVMEo7HdNmOaZQNGmse3cj05fiscaLXqgJYnUCnkgEvlBQIUJVnKMRwW
 SC1QHXQoHYAvHr2uXznEa6AsZTSWiARccH06wKhxKYWgDn1Ew82IagiTPHo1wVlCn4Ok
 6JaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869448;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3tedVeNjogK4knQjMdZiXbJqYYoMooAY0dZ0PwBr1fM=;
 b=0d5dQnIJdf75MEn1gGa+yoB+on/Uu2VeAo9ff8E98wxLNoP/fnkI9VcLuD4p2Ycyxk
 dRPtY9IbMQ7kBBTJqm75py/JtmntfrVA2zkmQqLPdAYYo/YUd/RNkVsI1DyOSKxIxYpe
 gn87sbNJWu58jbCdHytZ3OYCqu5kY4pE5qA8x3Z0MkobcSHfTernpwPsA3ge3Tf8JeCV
 H7P2POsLgVyLODiVPidCxcmLyXuqK87IQnBbMhR03uLX8O3WmgYjc4r138UrmzMyOITE
 ACG9n4dELR7JsMrFVZV0Ib4D2UTO01oMmgLKsfODSP/vR5+NgVANvnral//TNMZpskox
 mOqw==
X-Gm-Message-State: AO0yUKUcSIq3gXdiO+Qe/ZMjSDzg7pS/hWA4bP4pidAWM+iMclsfVe5a
 27jqYEDnFsOpYtUF71rDoyWt3qsKYFZ0ajmNcVA8Gw==
X-Google-Smtp-Source: AK7set+TqCilDYIKZmBl7pKK6zaSDm//damYHvtwR77RanLgJ6NTTe+HoCqhv6BBuVx5BBo9zt09/5XfOQSU2IGvFsc=
X-Received: by 2002:a17:903:258f:b0:19a:98ea:5ef1 with SMTP id
 jb15-20020a170903258f00b0019a98ea5ef1mr1067363plb.13.1677869448571; Fri, 03
 Mar 2023 10:50:48 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-55-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-55-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:50:37 +0000
Message-ID: <CAFEAcA8Wc1_kmgakVTtL0Xcut+fnFFqN1ttot05F7q0kcLioJw@mail.gmail.com>
Subject: Re: [PATCH v2 54/76] target/rx: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
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

On Mon, 27 Feb 2023 at 05:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

