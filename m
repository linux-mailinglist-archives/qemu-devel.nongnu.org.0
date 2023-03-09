Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBF86B2FD2
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 22:51:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paO9r-0005qG-0T; Thu, 09 Mar 2023 16:50:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1paO9o-0005q5-Kv
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 16:50:40 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1paO9m-0002fB-JZ
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 16:50:40 -0500
Received: by mail-pg1-x530.google.com with SMTP id d8so1947515pgm.3
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 13:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678398637;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wNiep6hNckJU0eyT8vf2ZCpwYh4BP9TNs8vzL1Pp3kA=;
 b=Xtuv3HBrXoFXX9LNzz03NuQooyLquTubeydlA+q4raCyd+hnGprBfMRXSAov411DIM
 n7I6wSlXly7vzyf6hFZkm/QhSG/QBJcOD7kfm5JDLuv3UmDovpuiyDa8+vc9nT8dK/Zl
 sJ8F6znjqHvJd2xb4oLDEh4sYXmBuInHviPSwubNRXPflVCUyjRUxU1vTpN79kM837Ih
 HdQmvMUMckYB6O3+gjGPWrf9zXvkt1OoL1M2h5UXEgIOwVjVBsKPaIlr1Lp8xtYNESkw
 bYEh7nEoQTsw32EZpZm1+j8yU7CQaRjSlxvnWZ9gn08tZIZRlq/g5gnN3MOd+XEakCxi
 DuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678398637;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wNiep6hNckJU0eyT8vf2ZCpwYh4BP9TNs8vzL1Pp3kA=;
 b=c9AbkFdm6V5a2r6ErG9TP4jEF2RdeY5UELQwMVOZxVeTzYqE4Cn4SfTvmxJmWLlnab
 ByWqr2LEVgglxs+SLRe8iiZSHH6/eu3+htTPwoex0A81CKkHGIievFDEzxH+SGmUFkAU
 juVqGKxX/H7c48psZPI/ntPHKl1yOgMka1X/0cAOfPplWVYv9Y56xliu9shI0KeaC/62
 ohRaDNfzwgtTty7AWZjRMZa+8RPLM7CtcQcezzKPIxk2bRrx7k02L1A9BzWrj8YFoT4b
 N2XOCRoUPY7n2EL6NQLooRLlYvheIPzbAa9JfGz9UrGRC3xR/dyTu8/4iisE6YWcTa1B
 wNsg==
X-Gm-Message-State: AO0yUKWS8+mkIDxCU+4hshx7jTAo7mI8LSzoZV7G5rrzjZBAeC81SdcI
 51v5rps+ZE5m1ukCgbqcQkYlS38+PoX9W36JDv31qA==
X-Google-Smtp-Source: AK7set+eJfvikGYGXVS64rIax2XEmFm1Wovl35fUpKM78+wHm2vCdBUXWO5CTC7oB+ppH3K9KENzHuH4YOyQTg384XU=
X-Received: by 2002:a62:1d96:0:b0:61c:67d2:a332 with SMTP id
 d144-20020a621d96000000b0061c67d2a332mr49274pfd.3.1678398637278; Thu, 09 Mar
 2023 13:50:37 -0800 (PST)
MIME-Version: 1.0
References: <20230307235455.282070-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230307235455.282070-1-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Mar 2023 21:50:26 +0000
Message-ID: <CAFEAcA_betfho_GzQmN-RyrfW6r_uRsqFuZWF4pdFcd8tV5c4g@mail.gmail.com>
Subject: Re: [PULL 0/1] qemu-openbios queue 20230307
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x530.google.com
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

On Tue, 7 Mar 2023 at 23:55, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The following changes since commit 9832009d9dd2386664c15cc70f6e6bfe062be8bd:
>
>   Merge tag 'pull-riscv-to-apply-20230306' of https://gitlab.com/palmer-dabbelt/qemu into staging (2023-03-07 12:53:00 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/mcayland/qemu.git tags/qemu-openbios-20230307
>
> for you to fetch changes up to fff1aaf4451231ac680aa278e9fafc4f8b69ff57:
>
>   roms/openbios: update OpenBIOS images to af97fd7a built from submodule (2023-03-07 22:30:06 +0000)
>
> ----------------------------------------------------------------
> qemu-openbios queue
>
> ----------------------------------------------------------------
> Mark Cave-Ayland (1):
>       roms/openbios: update OpenBIOS images to af97fd7a built from submodule
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

