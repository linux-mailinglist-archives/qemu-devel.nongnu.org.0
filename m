Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BE14EFFB4
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 10:37:49 +0200 (CEST)
Received: from localhost ([::1]:51448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naZGV-00030z-J3
	for lists+qemu-devel@lfdr.de; Sat, 02 Apr 2022 04:37:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naZEx-0002Dv-Qz
 for qemu-devel@nongnu.org; Sat, 02 Apr 2022 04:36:13 -0400
Received: from [2607:f8b0:4864:20::b36] (port=46716
 helo=mail-yb1-xb36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naZEv-0000QO-Nc
 for qemu-devel@nongnu.org; Sat, 02 Apr 2022 04:36:11 -0400
Received: by mail-yb1-xb36.google.com with SMTP id d138so519382ybc.13
 for <qemu-devel@nongnu.org>; Sat, 02 Apr 2022 01:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=XrK/d3mAvfvG1+yLH1GQlmcnX/MtvGDCDyzU/Si6BbY=;
 b=r74PH0Q7HgP6znI4bRMKBM+Ad6y+XW3Py1sfPhesXss+JaZ9Q2RF3XWGrYLi2tXhSx
 vZhp4XMDMe5oww72nm7Uja5Uxq6iGsXYC/0XZa4Cu6sjuLyC1R5JZYblTK8+lquA83+N
 Um5ZVlS/LcvjoziBcniLTw7Y3TD0xdv5LUO2rg+4BgG+Y6ANSYexb9Ea9ELyRyueXoIU
 ZPvZm27dak5zYf5ZRbtef+oqYsQdb8fa7wanLj19kSHq0PpAxZYW2WxsmmgfZ1i+EOSw
 N7Nd/oZkG3Cebl+HX0nDEQBnm/C8pjdDDxdDT+3fjlVNzKVdAwlIoiObln2q+TRkrGhi
 yLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=XrK/d3mAvfvG1+yLH1GQlmcnX/MtvGDCDyzU/Si6BbY=;
 b=DASwPEddej1nm5bYMYQOh77ipBK4cHBFc7yUABHe8ysGf+N5JmLMhzdzpO297A5YXT
 PdqCpk020axB0uj2dGWCZBNiMbqCqhpNk3f0KBzrigr0v1su/ZPM8X27sJSaxutXC3dp
 02ni3r0TIpQKFzX/QNWsKFvPIRpLQ+8FMYih/hQmM7RrolFVGtgVnffXY46tqIcfPAmm
 R2EoOcIoL1xMj/UdFrJ26bAzUr3k6cpZMOiydcV8c/7Dh3+EmaPK6gM0t3yoac55w4F2
 hJkBmLHkOy7K7Vzcu2oDVpkT+ToAUCGlKPeBdAkINfnptYyQ1OTFEeZXqgbvrSiuRgOA
 NHAg==
X-Gm-Message-State: AOAM5307+nJNy3X5ZPmbi2XGTIT0YQZviOZ5amE9wOYSuXZJ7g1kGE9K
 deWU0iXZ4VIsxqY2zgEFBlJPUHZwtXXTY4RcENaR6pBfbrE=
X-Google-Smtp-Source: ABdhPJxmLYSqZWnPWJg+UnGUWfE2fXTGy0LxxBD6bAIeAT2U69qpIoYn1i4aSihmDdbH/tqC95heoK5/06R+54bgFJE=
X-Received: by 2002:a25:418c:0:b0:63d:84a2:2364 with SMTP id
 o134-20020a25418c000000b0063d84a22364mr4387515yba.85.1648888568456; Sat, 02
 Apr 2022 01:36:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220401150055.421608-1-peter.maydell@linaro.org>
In-Reply-To: <20220401150055.421608-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 2 Apr 2022 09:35:57 +0100
Message-ID: <CAFEAcA_7RUAkHFdAoerxmZ-GhprEzwNei-N=Zrj-LOap+ffuPw@mail.gmail.com>
Subject: Re: [PULL 0/6] target-arm queue
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 1 Apr 2022 at 16:01, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Some small arm bug fixes for rc3.
>
> -- PMM
>
> The following changes since commit 9b617b1bb4056e60b39be4c33be20c10928a6a5c:
>
>   Merge tag 'trivial-branch-for-7.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-04-01 10:23:27 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220401
>
> for you to fetch changes up to a5b1e1ab662aa6dc42d5a913080fccbb8bf82e9b:
>
>   target/arm: Don't use DISAS_NORETURN in STXP !HAVE_CMPXCHG128 codegen (2022-04-01 15:35:49 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * target/arm: Fix some bugs in secure EL2 handling
>  * target/arm: Fix assert when !HAVE_CMPXCHG128
>  * MAINTAINERS: change Fred Konrad's email address
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

