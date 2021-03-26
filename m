Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25CF349F13
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 02:52:00 +0100 (CET)
Received: from localhost ([::1]:58664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPbdn-0000cB-Uy
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 21:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lPbcd-0008Tg-Gh
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 21:50:49 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:40480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lPbca-00016Q-Cl
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 21:50:47 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id a143so4301661ybg.7
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 18:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y/LtC2fR0SulBcvjdbY9L8y+ufhnJLR3VV1/kep9k9c=;
 b=JbicqZxlRHZSam6rIbfRhIu42BjilW5LF7unztS8mUcncpuVFtXqPoEiDKT9hQMdFd
 AKmQJ9hxgOnXSAf8wON1OvqmhtVsgkZG8WgUPEvaeAruEOx7rxxBfF4kEXvu6XdzNPNc
 DCjXs6QVLQqbo5u91AD1Xm8penJetgVY8lxs4chrXmVsyi0kgW5tub0vVIYUG5Kv8d1m
 U4Ibr4LO4eJzrT95vQHQ4RW7Vma9bK1Z3ZUJv//XNKMmT7YvTRwQKzxDz8DrXk8hQ6m+
 mVSMxU6mbaUbIlmyTrQcbykz25jF9i16VMjLJIovFB1uU5oEZYPHBuSy5yKq8EInBTuW
 SXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y/LtC2fR0SulBcvjdbY9L8y+ufhnJLR3VV1/kep9k9c=;
 b=WMUeBZQMpE5hUDh44+qtYDmNeZNxUrTYPJc9Ua08eZroX3wsPQ+2i2A/qjFLVNyRVN
 AOa7ePeo4SiU0Dr98zBljGDGEMVqHVW51W0nC6qfyAF007ZYT6HYU+8XW/70pL/DW6UW
 ZdrVVML1iVOPs0lDSmSLH1Acw0sXgtpHKjYWvrey34+iO5uWTNZh8igloHUmPR29acOR
 OLtFga9wGemTGJfxVEiLMyTpuOFBsdIqxS4TpmxO7VxUWz3ZaPwTCk7QgGY3qRk3Dr4S
 S9L7Zu+TZyI8MIVWUl3Bafi1JwxgFthqJARjpgynVgOU3FcGSii8ryb7Z02LbgclQgIl
 vybw==
X-Gm-Message-State: AOAM532XOiAEo6yUi5e3xKHgqWjD6PV1IifPO6SbT9gq+YG0DI5OyUsP
 U2zuS0816gzIbtGQQOnhTUOIIxKcdP5dSYvIuX8=
X-Google-Smtp-Source: ABdhPJx3i2hrYFTW/X8/AFUozyvcJrU0qKybapaAWZGIE+Thh9PEFyiH/lpfZ8PvfPQnJwkODXZWOHhV3CHK6ytsAiA=
X-Received: by 2002:a25:afca:: with SMTP id d10mr15146437ybj.517.1616723442698; 
 Thu, 25 Mar 2021 18:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <CABLmASGq42X5pEuTkWZTp_djr5qmo98BD_9wi4zFnG1DYNnJ9A@mail.gmail.com>
 <CAFEAcA-79VsatyDSP8_u+=m=PpQLyjsuNBQh_-xt2RZ-6vqkgw@mail.gmail.com>
In-Reply-To: <CAFEAcA-79VsatyDSP8_u+=m=PpQLyjsuNBQh_-xt2RZ-6vqkgw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 26 Mar 2021 09:50:31 +0800
Message-ID: <CAEUhbmUPrEkHdZ_msyr94PQJtVqSXVFGg5C_7Ybo590J7mTw1A@mail.gmail.com>
Subject: Re: Bug with Windows tap network when running qemu-system-ppc with
 Mac OS 9 guest
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Howard,

On Fri, Mar 26, 2021 at 1:35 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> (adding the relevant people to the cc list)
>
> On Thu, 25 Mar 2021 at 17:26, Howard Spoelstra <hsp.cat7@gmail.com> wrote:
> >
> > Hi,
> >
> > When running qemu-system-ppc with Mac OS guest, the guest crashes when
> > using a tap network connection. Openvpn 2.4.9-I601-win10 is installed
> > with TAP-Windows 9.24.2. A tap connection called TapQemu is bridged
> > with the default ethernet connection. It gets activated when I start
> > qemu.
> >
> > To reproduce, compile qemu-system-ppc from current source and run:
> >
> > qemu-system-ppc.exe ^
> > -L pc-bios ^
> > -M mac99 ^
> > -m 128 ^
> > -sdl -serial stdio ^
> > -boot c ^
> > -drive file=C:\Mac-disks\9.2.img,format=raw,media=disk ^
> > -device sungem,netdev=network01 -netdev tap,ifname=TapQemu,id=network01
> >
> > I bisected to the commit below. Thanks for looking into this.

Thanks for reporting.

Can you please provide some further information:

1. Does "-net user" work on Windows?
2. If running QEMU under Linux, does "-net tap" or "-net user" work?

Regards,
Bin

