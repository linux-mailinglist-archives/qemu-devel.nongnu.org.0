Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E904D2E80BF
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 15:49:58 +0100 (CET)
Received: from localhost ([::1]:42542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuzH3-0007po-Ig
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 09:49:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kuzG9-0007Qh-1c
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 09:49:01 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:42517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kuzG7-00042G-8Z
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 09:49:00 -0500
Received: by mail-ej1-x634.google.com with SMTP id d17so25536155ejy.9
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 06:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WZ2Uplc6auw+D15VWNRJJNDOZL8aGa0JzhVJi+D0/kA=;
 b=GXHzUTizuIYeCL4IiDgsJLo/ghz3i+0Kq9iwqZSaPC8kZadp0I9tAc2QYPp8FneJYX
 GHEfkzP392iHSx4drgm9mW6othWLbcZmSZVuaVT6cjRWsnVOnFW5h8jgCGB7f2LFS4Zu
 JHoEo00WRPHowWnnXttCu43XQQn6bCJj+qCoFKsHnbystBGK72kdxKm6eqKhrCgdZ2R9
 JP3cFIU8EYJlvQWubJWrt5IP0y0U2yONLGWdHjEwx/sfUNPrr+j3U1XoW+0MxUSulWpH
 HwFjudsuxcIjfWCL5SZWAHuGciCv9noZem5SkVmaHsY7SP4HAmcXn/fCGmyKct3iC7Y2
 Wwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WZ2Uplc6auw+D15VWNRJJNDOZL8aGa0JzhVJi+D0/kA=;
 b=BGHzHQQculvKKItDA9V0j5C2SoIyGcfXKaqgbWg9y2efVSGEPw0F/eMB9CiZ1HMNNv
 OE1QebHKx+5mmTMMXtEKtERNHTrnnOxuvFY1nqEptAXVDU4nQuyIo8gStnIgkXSy0PrQ
 01ju4jWlT+UMwy2q829vPxKpavXpe/h8n49MyyfkVjpYrrFTiMCACmdbngfK/kx33FVB
 cVAwiUh/kztUCji0lKvXsc7bbbvA+PduGFQnKJSQL0ODb68DNsOHh6c/v8MDX7PcVKjo
 fNa4G9IpmiQs/QLTPY6I0eMV6fsCUhGWxD5YnDpkmbAg6PssdrBPL1Ip7ANoDKEbJrOr
 bNRw==
X-Gm-Message-State: AOAM532IYa8TitcHkMj5JINZE2W+0vue5j6FC0Bxcs/IuweYLA91lKXV
 zgy/IGSY9X93jWZuOepg48PqxjDUfCWiv4qkPHFxnA==
X-Google-Smtp-Source: ABdhPJwn01WCz/Q+a6TERI1IYjGTV+y3qqP/nHalnvRuwrjEDC43ZZSWvhutty8cs99GZPkWtenVWX6khAZEQYQPgUI=
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr54551791eja.250.1609426137668; 
 Thu, 31 Dec 2020 06:48:57 -0800 (PST)
MIME-Version: 1.0
References: <20201218082704.2014294-1-thuth@redhat.com>
In-Reply-To: <20201218082704.2014294-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Dec 2020 14:48:46 +0000
Message-ID: <CAFEAcA_i74odZrdxTcDxchkxX5nux6+ZGkavXNZ4VeunqeXWtA@mail.gmail.com>
Subject: Re: [PULL v2 00/14] Compile QEMU with -Wimplicit-fallthrough
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Dec 2020 at 08:27, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi!
>
> The following changes since commit 75ee62ac606bfc9eb59310b9446df3434bf6e8c2:
>
>   Merge remote-tracking branch 'remotes/ehabkost-gl/tags/x86-next-pull-request'
>   into staging (2020-12-17 18:53:36 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/huth/qemu.git tags/pull-request-2020-12-18
>
> for you to fetch changes up to 0a2ebce92a3f10a89843e4a7a8e2f2eba4f7b109:
>
>   configure: Compile with -Wimplicit-fallthrough=2 (2020-12-18 09:15:47 +0100)
>
> ----------------------------------------------------------------
> * Compile QEMU with -Wimplicit-fallthrough=2 to avoid bugs in
>   switch-case statements
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

