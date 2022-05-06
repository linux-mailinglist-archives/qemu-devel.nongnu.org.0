Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A7351DB33
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 16:53:35 +0200 (CEST)
Received: from localhost ([::1]:53632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmzKo-0005Pm-Og
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 10:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmzGj-0000V5-S0
 for qemu-devel@nongnu.org; Fri, 06 May 2022 10:49:21 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:47086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmzGi-0007Db-4n
 for qemu-devel@nongnu.org; Fri, 06 May 2022 10:49:21 -0400
Received: by mail-yb1-xb34.google.com with SMTP id i38so13229866ybj.13
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 07:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q1TbrZh02nIBgCbIRKSAy+OXoN3L50j3SBPFCIjcvIE=;
 b=GNzC4b5uI40dDyprVNL86EdV2lPG33eR9LWr54WHUuB5ViGw8mAvVGgIcjGP3oUWgl
 MoXcTq0jB8UEvZW8wJDUia0SUzK8Dj+nGul77coxeNKKMWnmEDtl5L9Z8K52zDJ/Y6FJ
 cU9jROz+DY/DmuZoqjjaNeu5G30oLwg/K4Irmuqby4bdZYVqvo+189c30VuYS9/LjxRb
 rWhc+OZudUA8QpHqZI2lWaCqKE5P3J9/KZe7Sr25S5rLKfGasZ3OKniqRNJvM7q+MaZ1
 2NqDykdYMoM+RMLrdkR1IsUOVyRpjfepgK7ocDMlXZAIe8StNuzGLX0QxXuGsilQwRVx
 LAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q1TbrZh02nIBgCbIRKSAy+OXoN3L50j3SBPFCIjcvIE=;
 b=akQUp5TR22BhnpAFhPlyGHD1m8H4nmLGaws4Mo97OHHe9jH3+MhL1eRayQxEvV9LRK
 i54V6IwOIa7iDvNU0xy2DksRBJ3qCoZec9WsOdgiXkEaMM5fv+WL3zI6qypNeYsnF4Sr
 SgeYr0/KMdA8PIWQrNLnHEQHec2avf4bUxdQOiRxSzjx08I9kWddQ7RcV+oreK0n/Aow
 c1AaZbebCkj9WSOtJZr2IktpJkFkyAF6qott6jeo0P9C4eGcFaewZjWDLNEP59X/pcuY
 fQ4YcY/rpAG+CAe9pIcwBeyuQVXuaCU+qurn2MalS7ipfjRdotAn/DPjieuMJi/TcE8K
 a3Yw==
X-Gm-Message-State: AOAM532J9x02GM5q88LXPtEPXaizOib1zH1ySBrie8S9mxX5dM1ArWit
 xdOuj/VEiG2sddESapHbwkNCuy44zd9/qRfFenL0IQ==
X-Google-Smtp-Source: ABdhPJz+zxcitWnr9WO21b6Vq6lCe2mwj4WZyPdXUaygz42+OgsLprM7VlwEJemhDGQMjdqWzzlAtJ0u6pwESlGVgwc=
X-Received: by 2002:a25:40c4:0:b0:645:88a3:eb8b with SMTP id
 n187-20020a2540c4000000b0064588a3eb8bmr2496389yba.193.1651848559123; Fri, 06
 May 2022 07:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220506143750.559526-1-thuth@redhat.com>
In-Reply-To: <20220506143750.559526-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 May 2022 15:49:08 +0100
Message-ID: <CAFEAcA8pPZJ-Yn2U+7G=eQOaNu0c4g3LGQvugf5vZ=vnA72Frw@mail.gmail.com>
Subject: Re: [PULL 0/9] Misc patches
To: Thomas Huth <thuth@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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

On Fri, 6 May 2022 at 15:41, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Richard!
>
> The following changes since commit 1fba9dc71a170b3a05b9d3272dd8ecfe7f26e215:
>
>   Merge tag 'pull-request-2022-05-04' of https://gitlab.com/thuth/qemu into staging (2022-05-04 08:07:02 -0700)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2022-05-06
>
> for you to fetch changes up to 0660402182ef9158e32420206f107a6798582141:
>
>   Warn user if the vga flag is passed but no vga device is created (2022-05-06 13:09:55 +0200)
>
> ----------------------------------------------------------------
> * Remove redundant/obsolete x86 and arm disassemblers (Capstone is better)
> * Limit some Xen-related code to builds where Xen is really available
> * Remove hxtool-conv.pl
> * Update MinGW and OpenBSD to a more recent version in the CI
> * Warn user if the -vga flag is passed but no vga device is created
>

I think Paolo mentioned an issue with the -vga patch here -- might
want to hold off on that one until he's had a chance to reply.

thanks
-- PMM

