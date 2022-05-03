Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2915189EB
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 18:29:06 +0200 (CEST)
Received: from localhost ([::1]:53062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlvOb-0006j7-KQ
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 12:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlv4E-00037L-CC
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:08:08 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:34395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlv4C-0003O6-SW
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:08:02 -0400
Received: by mail-yb1-xb29.google.com with SMTP id y76so31920679ybe.1
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 09:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IPD9dbw61T2wlLQpQCxHtoXCtlev3liUI24xtuAWnYw=;
 b=ZKtK3G7/emLGmqb3yHmvhPwbYMbRuXK+rRBScg8s7Sd652RG46FZsJ85/ZVT2S/QIG
 JiNEG9sjVxyzAmo4OuwIyTZRhdTn8R/qha3/AT1Cw6bpJaOFqpMNsvrn7o6wv6t6bGIu
 39Yf/dy/LAoJGyNbgFbQjs7QiOtI+N7MVRzCH3VePYVwxtqRQ0pVnj2QSP8BsU28IZfP
 hkzNrmBsYC/ci3H6Y/K62leSn+0NEHjQOeVAYYqsn4SeVWoLwfCgLeWDIPDLv3K9CSUt
 rhHJjekHNdqi7Y2cZSAn4zBB2ug5Gjm+f7XpoxImcGwn9JAcHDY8s1ufj/wbAsGdGbel
 tohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IPD9dbw61T2wlLQpQCxHtoXCtlev3liUI24xtuAWnYw=;
 b=wGJp2JN0l1CMM+gB7m146b9hP5iSq8JxcWNqDgJsh1eOE7I79SPN7XUo/OnyCrsn/8
 bkWjh4yyAP8aBB9Axe3pZNCVSwETR9DV/885B0HngzFeXeUl0Qa2g8XiaO04QIJGVnpS
 aDIQPeq+QelRk1LB1YEhMiRdubYe3qPdNdAKm9JH2H2uw/4XVwXC7IgrB8kVEz9lHVUc
 shSWTjdZKOlCunzEx6V06Xs4zadjn8RGxRNp9YI+YiMLcpBwsqvZfMdL7PxAtyjEzI7r
 khoA+6BxP8R1n0mHvNChI9hnhybpfUxbgVGp+eZ3Empl6jU4DMPc9kZFEW68vjgBxf+l
 tcqw==
X-Gm-Message-State: AOAM531o/rgcxSUKJNRtTgd7QH5CUqwlBmFTKLGtnFB58IRIwbUboFgw
 M6N4CHLIteaJKGs7c2GVOX9ubDZX8zBh7yeOFTAUHg==
X-Google-Smtp-Source: ABdhPJyaRp4bMn3FXSVNGCemXkI7/vSHOj0ggURalshti0eMOetHlFTYXaFQQODnyo5v6vCnmuCMKArxz8gVw+K6kI8=
X-Received: by 2002:a25:cf4d:0:b0:645:755c:a5af with SMTP id
 f74-20020a25cf4d000000b00645755ca5afmr13556589ybg.140.1651594079798; Tue, 03
 May 2022 09:07:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-13-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 17:07:48 +0100
Message-ID: <CAFEAcA9+orqoQn=gMu9H=TJoGysC4Jds83qq7OPhTRDOTJvzMQ@mail.gmail.com>
Subject: Re: [PATCH v4 12/45] target/arm: Merge allocation of the cpreg and
 its name
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

On Sun, 1 May 2022 at 07:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Simplify freeing cp_regs hash table entries by using a single
> allocation for the entire value.
>
> This fixes a theoretical bug if we were to ever free the entire
> hash table, because we've been installing string literal constants
> into the cpreg structure in define_arm_vh_e2h_redirects_aliases.
> However, at present we only free entries created for AArch32
> wildcard cpregs which get overwritten by more specific cpregs,
> so this bug is never exposed.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

