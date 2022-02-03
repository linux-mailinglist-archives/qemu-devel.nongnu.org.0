Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF21C4A87FD
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 16:49:06 +0100 (CET)
Received: from localhost ([::1]:38686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFeM5-0008BR-R4
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 10:49:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFeFj-00012l-Kh
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 10:42:31 -0500
Received: from [2a00:1450:4864:20::433] (port=39609
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFeFh-0003Bk-AR
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 10:42:31 -0500
Received: by mail-wr1-x433.google.com with SMTP id g18so5468950wrb.6
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 07:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=03WFv9Y6mAwlm3qtqKx9wXXtFFChtzJ/t2SCEknN6PQ=;
 b=np2zCO7iBZNRvdebEJ7z50dVv1E9M730zYE4MJRqVOVh69x2rpfi/WjNDiihCj0uSa
 NDD/bXbqxGKxZSuUkeouZy3+z/kQ8DqXpnmRQ5mqYHV7CLHY32HK6ejdLAHpQEco80Ao
 J7IDpnLfzS0wjA2eQcMN9+tZwHhlp6yiQh5ty2e/SzTQCnp3bG2Oo6IuQVfHY7jaPRwS
 pvkJHv2fvIjzDU7jBOlyBvt0cDUTIiwmstXA7f/Aju3EAvSP6V1x4++FWXHZkiySj5v1
 Xacq3I5ArL9UMWe7StSlc50SQvNPLD00f7172HOSLOjVscTbBiyUGZYffH8uDE0GGiFc
 kUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=03WFv9Y6mAwlm3qtqKx9wXXtFFChtzJ/t2SCEknN6PQ=;
 b=WK3v/zJZAq7ulUBm/vXYXlLR3xB88ZgpkpgSkYFc8jUNQRTcDQAli4g8WfWs6oyEgh
 CRFmgMEsVrOYOIbFfw9CelllTxNPZuihDJKVYHG28An2vvnZttGQUZQTWQsfkJv06wuH
 DS698TQwAq2VIOZt+ecKUZu+sBhX8CT5/vSsA6q31oOmYN9tm5cvTdCwwAEhLgBw69iA
 ppdvIT1pbnNvbtw8j3qEy5ZY6d0Q69T7ZsrOyHcq5lCBzEq4yYZxwiRnAJKy47MRoINy
 ehXvmXPK2JpCYxsqQ27Xz7BJaUreGXb+DPg9jlWcRqEpQRZX1FItKTCLxjo9iK+MtDvO
 30cA==
X-Gm-Message-State: AOAM531nAaazq0PEz0V+Czv4vCkrc2O6aQYUfqSfmwa0oTd0XZmG52qK
 yzpSIXrPM0laglR6VW5+DydlH6+niwNsqgGKjhJOXA==
X-Google-Smtp-Source: ABdhPJzX3efq6LTnSh4oU31vblW+cHoM7nB4p88Vow1Lc/8ahT+8qoq9KO7X/7irfZZYBXOnl6/x3NsOXX2tbnn9vN4=
X-Received: by 2002:a5d:438a:: with SMTP id i10mr29002015wrq.295.1643902946567; 
 Thu, 03 Feb 2022 07:42:26 -0800 (PST)
MIME-Version: 1.0
References: <20220202181139.124485-1-deller@gmx.de>
In-Reply-To: <20220202181139.124485-1-deller@gmx.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Feb 2022 15:42:15 +0000
Message-ID: <CAFEAcA8oowdEN+Hogfq3bLa7v99RWmAhGyon4udjoTX6a2Jh7w@mail.gmail.com>
Subject: Re: [PULL 0/6] hppa target updates and fixes
To: Helge Deller <deller@gmx.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Sven Schnelle <svens@stackframe.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Feb 2022 at 18:11, Helge Deller <deller@gmx.de> wrote:
>
> The following changes since commit 91f5f7a5df1fda8c34677a7c49ee8a4bb5b56a36:
>
>   Merge remote-tracking branch 'remotes/lvivier-gitlab/tags/linux-user-for-7.0-pull-request' into staging (2022-01-12 11:51:47 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/hdeller/qemu-hppa.git tags/hppa-updates-pull-request
>
> for you to fetch changes up to d449eee3af37937f788c02ad88f2caa8bbfb19aa:
>
>   hw/display/artist: Fix draw_line() artefacts (2022-02-02 18:46:45 +0100)
>
> ----------------------------------------------------------------
> Fixes and updates for hppa target
>
> This patchset fixes some important bugs in the hppa artist graphics driver:
> - Fix artist graphics for HP-UX and Linux
> - Mouse cursor fixes for HP-UX
> - Fix draw_line() function on artist graphic
>
> and it adds new qemu features for hppa:
> - Allow up to 16 emulated CPUs (instead of 8)
> - Add support for an emulated TOC/NMI button
>
> A new Seabios-hppa firmware is included as well:
> - Update SeaBIOS-hppa to VERSION 3
> - New opt/hostid fw_cfg option to change hostid
> - Add opt/console fw_cfg option to select default console
> - Added 16x32 font to STI firmware
>
> Signed-off-by: Helge Deller <deller@gmx.de>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

