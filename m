Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 797C738AFD0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 15:21:37 +0200 (CEST)
Received: from localhost ([::1]:51492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljicK-0002c9-9C
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 09:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljial-0000gw-61
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:19:59 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:45632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljiaj-00089k-Fz
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:19:58 -0400
Received: by mail-ed1-x529.google.com with SMTP id a25so19337160edr.12
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 06:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q/5ORSFjEJgAf31kwGSzu+ywy7zE3Mxnq87AOx2Qan4=;
 b=ALfDlIU/G8malmyUMbWXchTRCSnsk+dzgiXY0xxXpHxe3Rx8wlQANJTZ3DmG6lvrqW
 RHCg032L+mM19KR055Vi9nogP5SnkwxdqJ0tN9dOefm7OGul4VfWIbyHOEtwe1pHdKws
 wGrKMhMny1/4LCi8Ly68463gGvY36FOfqi9a1/LhZKUPGw2dRzhEapSZASvxMwWmMgMh
 +rcD73F2aU2p04ofhDgkpXVadFQE2TaE/llqXRGgC5tEa2V2eNUW2keXsfjvOQkfA8vB
 UOID/6WSgWArM0cKo6lnB2lNLk8gREMWeDXgVGJy3Xn7wfPOv3rm+fM+8NUoW4K+BfT2
 aheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q/5ORSFjEJgAf31kwGSzu+ywy7zE3Mxnq87AOx2Qan4=;
 b=BIUEqUFDNbTcmtvQs35jh2nHt4Z2wXMW2JPYcoiwtZEQP+3duOqY1EtFRmY/4BX0Jo
 RhcwpUCwnraMUSoeQPbAd79lxP8AOkkFkuW2TIgcbbp/l9PySeKfnECRjIbP2siSN5rF
 x4Cjq9dmNGMwtzWCAC//bQE2vPjLeF8+7SuLjEUXM+pc70ZcxTD/cymp9FG1NVHSGBN6
 MvaAzv0+sQEWUWcQpXvaefJSxwBw0o9gWQqdpOssQwY7ao0eBF4oe1fuSOWe/IxlV2Fv
 tzVlMhJsOgGMZA/lmal5gust4OACxT4g6oADLqzpBhxTpvNfX++IF0+mOo7hWTL0l1vF
 7umw==
X-Gm-Message-State: AOAM532a+fkeR7iS+wH3mvVzNjNCJ5BAloRT9BmiuWLVRu/2usEdcdPN
 tA5D4Zgm79w7/qMTAeWUw8z9kFox8D9UP5K9DlG/gA==
X-Google-Smtp-Source: ABdhPJwgYZh4cBpaCl0PWThbNEyPm+O4xmIWk5FQGoNl0AWD4alCiL4VOlMggEMnh1rE079NUjWTmwbax2+ZLDV0nxo=
X-Received: by 2002:aa7:dc12:: with SMTP id b18mr4928090edu.52.1621516796026; 
 Thu, 20 May 2021 06:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210519183050.875453-1-richard.henderson@linaro.org>
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 May 2021 14:19:37 +0100
Message-ID: <CAFEAcA8NRdoZZvhY4mG6PKD628D2DW-zCkEQPNmsY-1Uk9xOpg@mail.gmail.com>
Subject: Re: [PULL 00/50] target/i386 translate cleanups
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 19 May 2021 at 19:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit c313e52e6459de2e9064767083a0c949c476e32b:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.1-pull-request' into staging (2021-05-18 16:17:22 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-x86-20210519
>
> for you to fetch changes up to 7fb7c42394c032eeaa419c869ff3b50491f6379d:
>
>   target/i386: Remove user-only i/o stubs (2021-05-19 12:17:23 -0500)
>
> ----------------------------------------------------------------
> Eliminate user-only helper stubs for privledged insns.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

