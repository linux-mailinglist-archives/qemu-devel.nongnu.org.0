Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E679C673D0C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 16:06:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIWUS-0002kU-2R; Thu, 19 Jan 2023 10:06:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIWTr-0002X1-Uh
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 10:05:40 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIWTp-0005Kw-TU
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 10:05:31 -0500
Received: by mail-pj1-x1031.google.com with SMTP id o13so2680869pjg.2
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 07:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P1GoBCC0X7EWqS9SeRDEzCCFgUwixn0QgTY/PiQ78HU=;
 b=SLCYnsCU6tKfnIZu0tPl/YqlNbdQ27ijyXxGxlXe7HcsLeABqmq6GevNrhZzc+m7o4
 J1KUVW2OHdwfUhdvn78Kl2WXEe+gPj4HChEXLEUKio3EMa3/adT8AYoGpBVn9cFOScap
 zZmFnh4KXs9TiSbq285Zuo+rHOwPNiCjW5Ow4LkNMOhvPEkCYVbxzhJZ+tKGBI7qRusL
 Q137BrvQQWjanhs0yGlP4vDjD18jKQcCXX4k1OGFuylYUjWfWEEnISS24SzxrjSxbtgp
 dHDknEIM9G9cUMieWjiu8BdP8HK19uvkXDEk1BW4Wo+gAlslulwxOJEFa2DF/iJXB4KY
 +0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P1GoBCC0X7EWqS9SeRDEzCCFgUwixn0QgTY/PiQ78HU=;
 b=QsWyglvZaG84H86P8xXIVAy1tueLdviksjB7Uq4sGdSzRkmvTAkaYu7fSFqZenQWlu
 o425cMng1kpe2ve4CjFmSE3LyqiSM1Woi8LiqKVY0A2P3MVlbIG+jUVzk9lCLXOXalT2
 jbqZF8BloklCIBwdnr5tiOC99oKWp7MUgBYXgtVI7WzPtfn+CN+LlEtxK90n8s3kZSAE
 EOKa3dHeCoHPnOPE1sW6CW80+ZDjXw824QW4DG/qlDVeO4GMiNTGfK3h13PsC0Aq7pvq
 bTggza/dx7cOgezCZy1WKgETM6u4PIihEbIBPtiI/+TzYy0nplNYRL1R3xNaG2chkcfT
 gEjw==
X-Gm-Message-State: AFqh2krBzM8WcXzC6lXACe4uQFNquAG2szcoLgLhpnxmzhx+NyABIGlD
 coTj0R1CzEZ53a16GF4eWt3nFLve0HcQAsHUo14oFQ==
X-Google-Smtp-Source: AMrXdXuTHzEAIt+OCIk2CBeaDLUivpIY0SD+YfQvuD8EeP6HhXDh1IgLxCFUkaKg2EjfnXtuVb7PCX98g2Byqbrb4UM=
X-Received: by 2002:a17:90a:c784:b0:229:2631:e8 with SMTP id
 gn4-20020a17090ac78400b00229263100e8mr1002960pjb.215.1674140725467; Thu, 19
 Jan 2023 07:05:25 -0800 (PST)
MIME-Version: 1.0
References: <20230117231051.354444-1-richard.henderson@linaro.org>
In-Reply-To: <20230117231051.354444-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Jan 2023 15:05:14 +0000
Message-ID: <CAFEAcA8d5sCN__dgq94qL+sAJQn3GNc6RiABRKzo8j8jLb-KbA@mail.gmail.com>
Subject: Re: [PULL 00/22] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1031.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 17 Jan 2023 at 23:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Second pull for this week, since this set is large enough by itself.
>
>
> r~
>
>
> The following changes since commit 7c9236d6d61f30583d5d860097d88dbf0fe487bf:
>
>   Merge tag 'pull-tcg-20230116' of https://gitlab.com/rth7680/qemu into staging (2023-01-17 10:24:16 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230117
>
> for you to fetch changes up to 493c9b19a7fb7f387c4fcf57d3836504d5242bf5:
>
>   tcg/riscv: Implement direct branch for goto_tb (2023-01-17 22:36:17 +0000)
>
> ----------------------------------------------------------------
> tcg: Fix race conditions in (most) goto_tb implementations
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

