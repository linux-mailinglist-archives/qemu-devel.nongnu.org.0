Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B606A4BBF90
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 19:35:25 +0100 (CET)
Received: from localhost ([::1]:58332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL86G-0006f6-LV
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 13:35:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nL84i-0005KB-1u; Fri, 18 Feb 2022 13:33:48 -0500
Received: from [2607:f8b0:4864:20::432] (port=39567
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nL84g-0006Ld-Gf; Fri, 18 Feb 2022 13:33:47 -0500
Received: by mail-pf1-x432.google.com with SMTP id y11so2962587pfa.6;
 Fri, 18 Feb 2022 10:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mLhgiR6dizmlcE6SHtgCtpNauk3gtiOyydPY/Fdm0PU=;
 b=eR8q6XB6umD/h4lTkwvLrsOIESoQGS2+3D+NMtih5ML7THpqH7Q7xeCLKH+k/aR9Oj
 uyjxUdSxLHSa0EOgOiO+2fDYy//2xYDSM54kNgQVArNrdtA3CJqAPopOxgIkod9qmtz2
 NkbP7S1ZXVdQXAYxVdRn87O0eqPpl7ablwN0gtXd4IPEGIyidCktMJou5vDqr6KVyS89
 hxRWjdYv883RI1GmBd1U3JqLd0aCcdcMeNDcEU9IfghdB8fEblpUzKZq2owE+7rybi9C
 qdQxHcEqVWuCGi/oNHbJ00bO4T5jHsstL7zM/gAHH93gdcqJwIAyxj/v/rjgHoS5sqgd
 7+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mLhgiR6dizmlcE6SHtgCtpNauk3gtiOyydPY/Fdm0PU=;
 b=xIRo79MAUVhOp4ny5bIKV14ATBeCWfMh5guuvqbaZpUvgaCI90alm22aYttEr56Fp7
 yCSXFJWvcX5UwUCUYAChS9fp03jd04xpFPMrleDQwEDJEGnSsR7BMJJsAOmCOhUqNX5i
 6feP47a0lwPYgWkJCl+vYvOgxF+RPckP87MayHlZlGKbt+9ckg5TQYhOb3PdAC2sqML4
 Wz96XCUHE5tMK/RR6nYcWEsYttKAa1BK3GBSZJSv/N5XQjaKvbv4AAr3Mpz0lpTHsaz4
 PgJMQtFT1P3reGH1u5iHT6JYMz8EGaBdaowNwXFc4MMU/jEWTacS66NHk0u7B0Wu3LOg
 8hLQ==
X-Gm-Message-State: AOAM5319Ar0RvKMHX8ZmmsKLc9vFoKSGsq2YVVflnAmS065bjNiuF1+2
 OGCzQXN1ambuOItgmgPRnXg=
X-Google-Smtp-Source: ABdhPJzFAjixhuNXHBlxw3rws9/t+3hhuCBjMh5hJZib86NjXeovNGTiIpFtp5MV4Ocy3dsUpBGm/A==
X-Received: by 2002:a63:4a48:0:b0:364:402:6b2c with SMTP id
 j8-20020a634a48000000b0036404026b2cmr7452340pgl.292.1645209224146; 
 Fri, 18 Feb 2022 10:33:44 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 o12-20020a17090a4b4c00b001b8fe81ce8esm64988pjl.50.2022.02.18.10.33.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 10:33:43 -0800 (PST)
Message-ID: <5bf923f3-c733-ef73-567f-342c2c51da41@gmail.com>
Date: Sat, 19 Feb 2022 03:33:40 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] ui/cocoa: release mouse when user switches away from
 QEMU window
Content-Language: en-US
To: Carwyn Ellis <carwynellis@gmail.com>, qemu-devel@nongnu.org
References: <20220102174153.70043-1-carwynellis@gmail.com>
 <20220102174153.70043-3-carwynellis@gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220102174153.70043-3-carwynellis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>

On 2022/01/03 2:41, Carwyn Ellis wrote:
> This resolves an issue where using command-tab to switch between QEMU
> and other windows on the host can leave the mouse pointer visible.
> 
> By releasing the mouse when the user switches away, the user must left
> click on the QEMU window when switching back in order to hide the
> pointer and return control to the guest.
> 
> This appraoch ensures that the calls to NSCursor hide and unhide are
> always balanced and thus work correctly when invoked.
> 
> Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
> ---
>   ui/cocoa.m | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 01045d6698..3f7af4a8fa 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -1243,6 +1243,7 @@ QemuCocoaView *cocoaView;
>   - (void) applicationWillResignActive: (NSNotification *)aNotification
>   {
>       COCOA_DEBUG("QemuCocoaAppController: applicationWillResignActive\n");
> +    [cocoaView ungrabMouse];
>       [cocoaView raiseAllKeys];
>   }
>   
> @@ -2052,6 +2053,7 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
>               [(QemuCocoaAppController *)[[NSApplication sharedApplication] delegate] toggleFullScreen: nil];
>           });
>       }
> +
>       if (opts->has_show_cursor && opts->show_cursor) {
>           cursor_hide = 0;
>       }


