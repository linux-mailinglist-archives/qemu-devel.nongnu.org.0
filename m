Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968E23323B8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 12:15:26 +0100 (CET)
Received: from localhost ([::1]:54466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJaKj-0002dH-Lw
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 06:15:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJaI3-0001KP-Tt
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:12:41 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:40372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJaHy-0004vK-2D
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:12:37 -0500
Received: by mail-ej1-x62a.google.com with SMTP id ci14so26523246ejc.7
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 03:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xdNNfBaF27fGYFRBFAyj19is/iaT2FeZEt9Jne8EM1o=;
 b=pb/0ELYjPJHx1wOkswMUEAHQ5ko2E2tdiVQ5tkIFgTQEfPLeEQ8zOKSk+dtAQrqXu1
 71d0KlQ4Pqv56qqYqulMT9eLj3rCjD40GXdD1cxrs9Zxi1Th+XPEN5HBTCXne6mSv9ti
 yhyVRW4oWcY1i5BSFAiaWzFE3bw+/LFf1pNB26fm8E+/a3BIdN4my6e2dsOdJFUBIQ0j
 HCWusVs78VWQ/MeQk/yde0HiLOT2hsYvIWcMJe4VPOQtndGX1DndLRvqglx435C5XPCZ
 LzwD4No3bJ4z5L4eBe6Ul6XXoYZggN+BDfahaLeeIoSNl2hqh6KA/1YtLRyAyPUIJ8We
 gjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xdNNfBaF27fGYFRBFAyj19is/iaT2FeZEt9Jne8EM1o=;
 b=VNqaSjEiscxNqAIwdh/5pi9VHLEabsCzq8wfcf4ffVFsWRbNmzuyEzbuY17v8T+Wno
 1g45ou5vZid9aM0T5tYXSt+O1Et1Zm63AKSP6SXF0lHeIzZtt6RUuncQcC7jzq6sRVmK
 xQRnpHAFbgCiGmokJK1rpDJCfqk4XkAcIUtjr4peR5tsWnAkUuK/+4HTBCYFWDACE4lJ
 0F4IoZfjaStysgy+u7ZnrM79fqrI1uJRRs8eMMNiy/IZaZddZkVLy5GUlEcz/NRDu+4G
 XTosHUVPEFH/6pNRocs/txQ1sCQ6CxhILkxOcyXzK4z4rHnXJ8KY3PcR9pUoAlyi48/d
 cWmw==
X-Gm-Message-State: AOAM531OfCpmK8vJyXBDt9/omOIq+BRcBPD9pkIM9hF+0wdZdrFkJDFj
 0JnMb6ExBeYcI8innVWyCmdpPvRh60fuDT/kWV0i4g==
X-Google-Smtp-Source: ABdhPJy/Qk4ScoHxnz2wsEGw8OJzrq3wxA11yHwAeEOk/rP67WJ9/BhKitqwNb5OELEJZVX/dJGb+nh1Ut6MXhbT6xc=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr19937762ejg.482.1615288351577; 
 Tue, 09 Mar 2021 03:12:31 -0800 (PST)
MIME-Version: 1.0
References: <20210223110640.73974-1-akihiko.odaki@gmail.com>
In-Reply-To: <20210223110640.73974-1-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Mar 2021 11:12:15 +0000
Message-ID: <CAFEAcA_VcMD=Arqebgi0b_xLTLOG+M0SQwJJH1PpXLzrkg3fwA@mail.gmail.com>
Subject: Re: [PATCH] ui/cocoa: Do not rely on the first argument
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Feb 2021 at 11:06, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> The first argument of the executable was used to get its path, but it is
> not reliable because the executer can specify any arbitrary string. Use the
> interfaces provided by QEMU and the platform to get those paths.
>
> This change also changes the icon shown in the "about" window to QEMU's
> cute one.

This patch seems to be doing two things at once:
 * we get the executable path via the OSX APIs rather than using argv[0]

 * we get an image from the icon directory rather than using the
   executable's built-in icon

Please don't put more than one change in the same patch: it makes it
harder to review.

Could you split this up so that there is one patch per change
(ie make it a 2-patch series), please ?

> @@ -1401,18 +1402,13 @@ - (void)make_about_window
>      y = about_height - picture_height - 10;
>      NSRect picture_rect = NSMakeRect(x, y, picture_width, picture_height);
>
> -    /* Get the path to the QEMU binary */
> -    NSString *binary_name = [NSString stringWithCString: gArgv[0]
> -                                      encoding: NSASCIIStringEncoding];
> -    binary_name = [binary_name lastPathComponent];
> -    NSString *program_path = [[NSString alloc] initWithFormat: @"%@/%@",
> -    [[NSBundle mainBundle] bundlePath], binary_name];
> -
>      /* Make the picture of QEMU */
>      NSImageView *picture_view = [[NSImageView alloc] initWithFrame:
>                                                       picture_rect];
> -    NSImage *qemu_image = [[NSWorkspace sharedWorkspace] iconForFile:
> -                                                         program_path];
> +    char *qemu_image_path_c = get_relocated_path(CONFIG_QEMU_ICONDIR "/hicolor/512x512/apps/qemu.png");
> +    NSString *qemu_image_path = [NSString stringWithUTF8String:qemu_image_path_c];
> +    g_free(qemu_image_path_c);
> +    NSImage *qemu_image = [[NSImage alloc] initWithContentsOfFile:qemu_image_path];
>      [picture_view setImage: qemu_image];
>      [picture_view setImageScaling: NSImageScaleProportionallyUpOrDown];
>      [superView addSubview: picture_view];
> @@ -1427,9 +1423,7 @@ - (void)make_about_window
>      [name_label setBezeled: NO];
>      [name_label setDrawsBackground: NO];
>      [name_label setAlignment: NSTextAlignmentCenter];
> -    NSString *qemu_name = [[NSString alloc] initWithCString: gArgv[0]
> -                                            encoding: NSASCIIStringEncoding];
> -    qemu_name = [qemu_name lastPathComponent];
> +    NSString *qemu_name = [[[NSBundle mainBundle] executablePath] lastPathComponent];

The API docs for NSBundle mainBundle say it can return nil and you
always have to check the return value.

https://developer.apple.com/documentation/foundation/nsbundle/1410786-mainbundle

It's not clear to me what the fallback should be if it does return nil...

>      [name_label setStringValue: qemu_name];
>      [superView addSubview: name_label];
>
> --
> 2.24.3 (Apple Git-128)

thanks
-- PMM

