Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C510A4CFFEC
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 14:25:25 +0100 (CET)
Received: from localhost ([::1]:48682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRDMa-00057x-NG
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 08:25:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRDJW-0002eP-PN
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:22:14 -0500
Received: from [2607:f8b0:4864:20::b33] (port=36757
 helo=mail-yb1-xb33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRDJT-000357-Ec
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:22:12 -0500
Received: by mail-yb1-xb33.google.com with SMTP id f38so30906703ybi.3
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 05:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RpPfrGycsYh/7zNoc8DaCWKrJ6yRcBKjUlJ0Rb/fFew=;
 b=X/UFdSvvd7NLLYXImb3etEtKSCHXWiAigaqOQzt82ykHSRgsyzT7hAx9EqaO2rnBTA
 s81UwioKCb8PCz2/u3k9t6fi9VM1ahCLUh1+flaRmYkUPSN4keK9tbW3Q15f5ahNFeVe
 xB99hgT28vsZAw3GujWRenALfMBgSy4/ZQkWRqTAiDFVrEurYNKC/svr4iZIcUhF6IXo
 Gkl84U2tvLfBOrY0ItlnOd4TgGEIA75xZl22FcFY8oUlwUMiN0KBE9INJjDa5KMEJuLf
 To7HD5Y/GW+dGohYNksgUvCXWWVBhZwapkczYEfZO/rhrXRFaaFKf1ql3/2NN6lSqL82
 0McA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RpPfrGycsYh/7zNoc8DaCWKrJ6yRcBKjUlJ0Rb/fFew=;
 b=YMuA8EIG7M8N1dWvbnVkNJm+t+MRTqoRNbsuD+5z7Oo6I9hjJjHb8EumgrHxOquqbp
 vDxTHV8Uodpzb4mDuvgb2KK9aLbVxUWX55h9gUWyA/k/wYYTCA4VvXou/go1Gn+x1j2M
 yAaiVncmZPKyuWeC7RWYERKUgU7tkbEDE3KDovjYbSsZsM6fMktJ5T6Le3GabxIGj+o6
 k/mbHK0hfs7xpxV/FJlaXwKsz3yvCgwjIXeUeAxKfmWPiZbdi4zGj1OH1PIKZadQ7z5D
 +G75V6QiBWaE1vTQqGV74J1XzTPIcNbdRoz6nzPjQoEGcfyMuun6QF74IM6xLjEEGFue
 3t7A==
X-Gm-Message-State: AOAM533hm3l3mjeJ3DocvfsUGlwhWMNWh9VwtzqI5wIRL2MSUyT4YQ6b
 TYHiTmTLU1k5gpG/X0GLbyzZp14O0E8e1j4iLyHqtg==
X-Google-Smtp-Source: ABdhPJyQfoyiU4Qlnl/PMrMAQOwHXirie8yaAvyV2z0qASG1TLZGamiie3xH6PE7xz4wXzefb9BmZu5b8zn7CpWQwzw=
X-Received: by 2002:a25:d181:0:b0:629:1919:d8e5 with SMTP id
 i123-20020a25d181000000b006291919d8e5mr6714023ybg.85.1646659329057; Mon, 07
 Mar 2022 05:22:09 -0800 (PST)
MIME-Version: 1.0
References: <20220306065747.46486-1-akihiko.odaki@gmail.com>
In-Reply-To: <20220306065747.46486-1-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Mar 2022 13:21:57 +0000
Message-ID: <CAFEAcA-pAVs76=+Cttd9z64pLpSCdXhoN6pgCM3uL8OAaL6HzA@mail.gmail.com>
Subject: Re: [PATCH v2] ui/cocoa: Create menus in iothread
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 6 Mar 2022 at 06:57, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> Commit 0439c5a4623d674efa0c72abd62ca6e98bb7cf87 introduced an
> assertion that blk_all_next is called in the main thread. The function
> is called in the following chain:
> - blk_all_next
> - qmp_query_block
> - addRemovableDevicesMenuItems
> - main
>
> This change moves the menu creation to the iothread. This also changes
> the menu creation procedure to construct the entire menu tree before
> setting to NSApp, which is necessary because a menu set once cannot be
> modified if NSApp is already running.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  ui/cocoa.m | 209 +++++++++++++++++++++++++----------------------------
>  1 file changed, 98 insertions(+), 111 deletions(-)
>
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 8ab9ab5e84d..edacbef9f7a 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -1604,97 +1604,6 @@ - (void)sendEvent:(NSEvent *)event
>  }
>  @end
>
> -static void create_initial_menus(void)
> -{
> -    // Add menus
> -    NSMenu      *menu;
> -    NSMenuItem  *menuItem;
> -
> -    [NSApp setMainMenu:[[NSMenu alloc] init]];
> -    [NSApp setServicesMenu:[[NSMenu alloc] initWithTitle:@"Services"]];
> -
> -    // Application menu



> +static void create_menus(void)
> +{
> +    // Add menus
> +    NSString    *title = [[[NSBundle mainBundle] executablePath] lastPathComponent];
> +    NSMenu      *mainMenu;
> +    NSMenu      *menu;
> +    NSMenuItem  *menuItem;
> +
> +    mainMenu = [[NSMenu alloc] initWithTitle:@"Main Menu"];
> +    [NSApp setServicesMenu:[[NSMenu alloc] initWithTitle:@"Services"]];
> +
> +    // Application menu

Why have you moved this function around in the source file ?
It makes the patch harder to review. If you need to do this, please
do the code-motion as a separate "this patch only moves code without
changing it" step first.

thanks
-- PMM

