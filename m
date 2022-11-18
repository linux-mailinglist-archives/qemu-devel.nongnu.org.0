Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CDA62F9E7
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 17:07:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow3sX-0000Ey-LB; Fri, 18 Nov 2022 11:06:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow3s9-000051-0B
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 11:05:46 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow3s7-0004ng-2I
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 11:05:44 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 v4-20020a17090a088400b00212cb0ed97eso5442834pjc.5
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 08:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bi4ZAZJvkgJv41SrJLHt1DuZHHcsY5lnonEqW8hQ3j4=;
 b=uwAKI4WL2uvffHlebNWmcAOjzw+MDlMMSScYCOpnl2+hXnVon9THTUbV2FllNcd6TV
 S3C4GDsAgYjMEXi2N06ELYq8d/Ni/tIpcMEvvpTvHfZYv+83KAp1vCB2W7RHAMmyQgg6
 TMiEJtAI8YetF8ekEZxRTWxQtECQbx0tSPAPWK/UR3+yYc9wRGNPX9kXs4nyb3Zo1S6W
 yfGRD3cS/PF4fatPrG+zbkdJ7hDX3GcLy2jifTvkKUu2wI8oXn0WUxVmtSNIG1Akpnmz
 ULHSUCS9QzhZju4PNCvrP3xEK5cGTwhw++tX7mnRsKlyE6ssgZRjkAeyd+2UjlZMJq5C
 pNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bi4ZAZJvkgJv41SrJLHt1DuZHHcsY5lnonEqW8hQ3j4=;
 b=KXk3WVDIF4Y0lvZ9ZEQMKJn8TMailIaBd7Y8CUou8vl7GRDEqV8IyZn8SZN8Jlf8Na
 t29tgMRjBqDxHeYz/Rs1WfR86CJpwyxxxFi+DSGfNBqq+30Q4ZPrnOaF6hlC9L1/Y6MO
 wCtczNSqlTecLFI4O3S3Gx5fE0ShGvBlE5PeSFtY2QtZ6gVFc0MKWQ6rnym3jVjlonhs
 uh9yd5qy1wpwEFE6oUlMdImvbQAlQZX3oUUgt97ph+mvr+ZgM4Yf/GQe6PoYry0amDpB
 Rg2h0zLXIO93HoEjm0iQaqVxfgLEnr4lU9gLPF4+BaGmHGCfvQnUxcLDD0afolS7LtiE
 3Srw==
X-Gm-Message-State: ANoB5plPmzjOn0ALsB4ih8x4j2Qx3Ovqf8ekE8GGgsWnj6ucUfnL23gR
 o9B3hhtdCHhNqULLfqKKvaUuuNXPOeEFp9CXZLkvpQ==
X-Google-Smtp-Source: AA0mqf6e90FqjFIRIJpQazJhxvfhfYAKG8HvYdbaMVQ28T7p5PU6mFs3K5QLGOepQbtxIn1Iw86NGezeAgwzIyAO3MY=
X-Received: by 2002:a17:902:e950:b0:188:bc8f:5fb2 with SMTP id
 b16-20020a170902e95000b00188bc8f5fb2mr213266pll.48.1668787541420; Fri, 18 Nov
 2022 08:05:41 -0800 (PST)
MIME-Version: 1.0
References: <166783932395.3279.1096141058484230644-0@git.sr.ht>
 <166783932395.3279.1096141058484230644-7@git.sr.ht>
In-Reply-To: <166783932395.3279.1096141058484230644-7@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Nov 2022 16:05:29 +0000
Message-ID: <CAFEAcA-TcDhKLFJGpT67OJLq2PG3qk-2S9mbDix7BdviXDeyEg@mail.gmail.com>
Subject: Re: [PATCH qemu.git v2 7/9] hw/timer/imx_epit: factor out register
 write handlers
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
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

On Mon, 7 Nov 2022 at 16:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
> ---
>  hw/timer/imx_epit.c | 211 ++++++++++++++++++++++++--------------------
>  1 file changed, 115 insertions(+), 96 deletions(-)

Good idea (unfortunate that git diff has not shown the change
in a very clear way, but it does that sometimes). I won't
review this one for now because changes I've suggested for
earlier patches are going to affect the detail on this one.

(If you don't already, you might try setting
   git config --global diff.algorithm histogram
which I think often produces nicer patches. I don't know
whether it will help in this particular case, though.)

thanks
-- PMM

