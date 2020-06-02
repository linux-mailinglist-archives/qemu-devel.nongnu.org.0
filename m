Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A94B1EC0D2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jun 2020 19:17:30 +0200 (CEST)
Received: from localhost ([::1]:39810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgAXZ-000409-3Z
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 13:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jgAWh-0003TR-JV
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 13:16:35 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:34036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jgAWg-0001kp-MI
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 13:16:35 -0400
Received: by mail-oi1-x229.google.com with SMTP id b8so2042996oic.1
 for <qemu-devel@nongnu.org>; Tue, 02 Jun 2020 10:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hvj2wnYDyjs32bp0FgL5etwcSReOjjpJzGnpSirPh+0=;
 b=UXPuTKjisN2wKB5yj9JQq2FtA2VTPftG1rSyZMXbbSea7clJQ1+uPFK8NKz7qYKi0j
 TvwuMKr3vW9u2Yfgj46gDBYQpeTH+9/AU3VsCUL/AfO0KeJgmu+V6XUCHngW3KqLoF9J
 8bUT+4nFHfLwjHgWbs32bLJTisEfi1WQ3vMG56Mr2hUTOZGfyA1hjwKpclde67m3xW0j
 RrgIIX41h29tcxhJn3M5qu46mTaTyO0k238a0FtyRawNOvbiJYsmn27/bm+/mrOHEvLT
 qbuicuWritMep82mxNvAWb+oeMGezJXF87TjvouJ3K6ygn4CIKQbhfVJPbQOWv6VRXsc
 Qr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hvj2wnYDyjs32bp0FgL5etwcSReOjjpJzGnpSirPh+0=;
 b=YX0ADnxeCN6pmfGd3xFDXEM2+YZEy2KedotcyMmYqXIiIzEzdclAwhhhd3s8VwogBr
 Ab8Q7zJKn4aZZJLbI+gbomwfMK/eKihWJrt3NyHgmmqUM8kpRziyt2JVIkFe8Y5VWNo8
 LGRDX54OJEUGkTofXO9NVBAFFm2OSf1v1SZiEfFg5meDdbqz6BO79mSERyv1w2rlRkLu
 7Uc+pWUV56/0k7umMPfA3q2kreLeBy+kvG1++hxTvS75kYk36+zb9/XtIae+S/xBfiFj
 vgaTq0RvQodRcs570AkLdulZyt3GtJTA8X+mD0BK4YD/a3sPQ8f0j+JvU2G5Zdea4dcQ
 rhxA==
X-Gm-Message-State: AOAM53254A/g17Aaj9+OUpmOLenhLBeaHwuu9MtqIZKUMiiaRgyHBAkd
 52OsHpSXSYanTEi5jExmSQY0tsDnxsqkY+kb4hhpxa1hlZE=
X-Google-Smtp-Source: ABdhPJxMtOP/WCzqy0+SvyQOSL/GtCC0ukp98qhpy7AXwwjXwQYF3ZChpFGmLKZMgsB4P2qPCW+LnYM4uQGGRO9dhDM=
X-Received: by 2002:aca:5152:: with SMTP id f79mr3534915oib.146.1591118193250; 
 Tue, 02 Jun 2020 10:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200602152135.774894-1-laurent@vivier.eu>
In-Reply-To: <20200602152135.774894-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Jun 2020 18:16:22 +0100
Message-ID: <CAFEAcA9VA+2ERJvppwA9ORn-07iDpO+T05_ZQWYtbSWq7eNaBA@mail.gmail.com>
Subject: Re: [PULL 0/2] M68k for 5.1 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x229.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

On Tue, 2 Jun 2020 at 16:22, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 853a60b87024b2f5d7c0c54a432d7798cb679900:
>
>   Merge remote-tracking branch 'remotes/dgilbert/tags/pull-migration-20200601a' into staging (2020-06-01 21:34:47 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu-m68k.git tags/m68k-for-5.1-pull-request
>
> for you to fetch changes up to 250b1da35d579f42319af234f36207902ca4baa4:
>
>   target/m68k: implement opcode fetoxm1 (2020-06-02 13:59:02 +0200)
>
> ----------------------------------------------------------------
> Two fixes for the 68040 FPU


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

