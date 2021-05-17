Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1F2383D09
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:16:30 +0200 (CEST)
Received: from localhost ([::1]:56074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liij7-00053B-2t
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liiW3-0000Gu-0Z
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:02:59 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:37474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liiVw-0006oB-5R
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:02:55 -0400
Received: by mail-ed1-x534.google.com with SMTP id f1so8174602edt.4
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 12:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dc/uVxtGEsmWH51jmQ0+qJMZNzXGxQ9tLIwrv0+DYhs=;
 b=SAT598vBQ7iAUaROYDYcsx2xs7ysScm5MHXK9T1BwESZQVconOelQ5eKX/YMY0PQYK
 Omh2rVQMyN2ecrp4uBUR1+/AHC0TuVMGdrpnOL6ac0zjuOcwkzXon3CD0eXkmab4w2dv
 +Nuz7rItU349b4v1vE4SOf/3g+hRyoqSFUMfqVbED4ZUbhoCTsAtyLcAuwYTd90g5LFn
 +RW5tdQrOv5VjzNcZNJyJgnPnI75ubdLi8TJslWCj4N6FCMbuxHG+8+YCIYxhC+Ox8Vi
 yV8i4J9BUJamaeYruqoY9po+SR7kxRJ4mdZf/db7Z8VSoZXw3UgJvIcRP1XOQ9vyZKWf
 4Qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dc/uVxtGEsmWH51jmQ0+qJMZNzXGxQ9tLIwrv0+DYhs=;
 b=R+ZTlZeD0d5tDU2wu2BrD4iS/Dkt1bfdnt7bqix1Mv5+bU5xPVxcE7M6LIYBXwpDfV
 3ZGyCVI/hsghxqKf/ti4+R/EEQ85RiXKVaFlxejf7XBHbjHlM3XnO8aZhp+aDJ+pL5sa
 O6GEMmiBSPnVUCvG598zu9xAGPPV+e6QGfvbCkmYTMwLjU/N2Zt/76rYX5T2TL6ZwCPC
 cmwVlJTg5HGJnG0hewcKMPZ33+h/tI2dXDFiK3rTiJQxJQEV4yXuqNaMK/EDVMLhvk9S
 9JEbr/Tg4sXAIiOBzOJEuIhlKt+N9fa3AAhEU8AUVKNPZciWn2PfBIwSV0a9FZXdyfZr
 Aftg==
X-Gm-Message-State: AOAM530Q0osytQ5mrzSvj3Xs38NP8Vl8b0Kj5e97IiHyb4ssDANcOiXi
 mVPIxlNbvweCltG1Gn9DUjSYkqXDx7W5LF7G32QwRLRQaeE=
X-Google-Smtp-Source: ABdhPJxsz0s3AlRb6PkmCl58aH6egNgr06p5oK7/8bxsVbNhwMjVsoOl8wQcZgJT2nOOoPgN+AvVn5RQ9+mOlAMHKCI=
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr1864461edv.204.1621278170596; 
 Mon, 17 May 2021 12:02:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210515100335.1245468-1-laurent@vivier.eu>
In-Reply-To: <20210515100335.1245468-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 May 2021 20:02:35 +0100
Message-ID: <CAFEAcA8YLicpSrHE24ZhjmJ8GrJFMNAax8pTT3C_hduLf2be-Q@mail.gmail.com>
Subject: Re: [PULL 00/16] Trivial branch for 6.1 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 15 May 2021 at 11:07, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 3e9f48bcdabe57f8f90cf19f01bbbf3c86937267:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20210511' into staging (2021-05-12 17:31:52 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-for-6.1-pull-request
>
> for you to fetch changes up to 29f9c636894c462fa54fad08049e51877905e93b:
>
>   target/avr: Ignore unimplemented WDR opcode (2021-05-13 19:18:42 +0200)
>
> ----------------------------------------------------------------
> Pull request trivial-branch 20210515
>
> ----------------------------------------------------------------



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

