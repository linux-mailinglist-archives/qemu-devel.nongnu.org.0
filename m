Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 219EF5086B7
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 13:11:52 +0200 (CEST)
Received: from localhost ([::1]:42276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh8FT-0003LD-9C
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 07:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nh7sn-0000ZG-Sl
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:48:25 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:38773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nh7sm-0000bk-1a
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:48:25 -0400
Received: by mail-pg1-x52e.google.com with SMTP id s137so1269142pgs.5
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 03:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ALf61e0FyDP3HgNL/t7oF8CwZjyCHpjNR4GMxzc2DA4=;
 b=QIFsmolOySh3RVdThtENwvMjm3Gl+80fPTB0+6jpmwBfwSEqrTHX+pbqY3p/Nsr8TO
 X2WaV6mW1bBxYgan2MxtbZQXCbt3PDPOKsIhuMxptnPxiKGv03OXG8LIIhkyjEYM3kWs
 Aw0WO76XPFhqpV1VM6SCjvJ9os7lcaddvV1L2i1wSD+snTF2i70QYiX9UBB+jQwHwGP9
 Z1mNBMjL1xF2bX4//p74Sax08CUyNNeJEwcsfaidXpLkU7wgSKjJ/PRTRg+d+Xqu60jF
 vbKFymshZgkZhJ8yGcWgR0iPI16TCJermYYbPTzZSvPyAtToUK1zj0ZnhLgulR4gqkuG
 wtww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ALf61e0FyDP3HgNL/t7oF8CwZjyCHpjNR4GMxzc2DA4=;
 b=3SxqUwmOVxkrTj5x1lJj97aM9WWYnsyLJP757h8sg2H04W9/HcaaqNjx53BTxasaR9
 5dfOhql4URAq5I1AnHVD4DkS9CJnD5/jk3WK8YJHy2t84J+b6RtCbg9FzPjZzNhoDvPF
 xb+9GY/gOv4we+Ybc1KnoEY1+YFD6xkIn6fRxHF2hhJM/rGo0g0YV2ExLK0zUJ17J6To
 cwMuFqjbqKhpFY3PixDKtWL0B9P3zDrR+HE/WsvB5h5Nh6k/nzSF+Dy2Wzps/P4JirTh
 P3bAWJr7ldDreZf1BKZnF9RMka5nMIsm3vkOIPkUitaIzEDg7ISaEQ5khPRbZKkQ35Z8
 2GaQ==
X-Gm-Message-State: AOAM531k3ydiuvlT1VKXyXEorUzRrf/A2PvwtHUPjWIhGasric0ii4oB
 i+gIQ3FD7QU0lzcNpTyFj5o=
X-Google-Smtp-Source: ABdhPJwd+Baouy6sGSCizCPZ0ZIv4w71RlxmoYuV2l3MnfXQ4qnPKsG8qgNAh6I0myNkszcsoDT1Yg==
X-Received: by 2002:a63:69c7:0:b0:380:afc8:33be with SMTP id
 e190-20020a6369c7000000b00380afc833bemr18418527pgc.304.1650451701325; 
 Wed, 20 Apr 2022 03:48:21 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 h7-20020aa786c7000000b00505bf336385sm19084529pfo.124.2022.04.20.03.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 03:48:20 -0700 (PDT)
Message-ID: <c74250e9-fe8c-584c-9180-4147339b9247@gmail.com>
Date: Wed, 20 Apr 2022 19:48:17 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 31/32] RFC: Simplify softmmu/main.c
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-32-marcandre.lureau@redhat.com>
 <a5f8ae01-d1e2-2a99-e9ca-d0e5414f8674@redhat.com>
 <CAJ+F1CL9m6WR_yp8Dw87jGi4CcFCOm7+hx9mAsyHcmR0kKF8eQ@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CAJ+F1CL9m6WR_yp8Dw87jGi4CcFCOm7+hx9mAsyHcmR0kKF8eQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/04/20 16:57, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Mar 24, 2022 at 11:52 AM Paolo Bonzini <pbonzini@redhat.com 
> <mailto:pbonzini@redhat.com>> wrote:
> 
>     On 3/23/22 16:57, marcandre.lureau@redhat.com
>     <mailto:marcandre.lureau@redhat.com> wrote:
>      > From: Marc-André Lureau<marcandre.lureau@redhat.com
>     <mailto:marcandre.lureau@redhat.com>>
>      >
>      > Move qemu_main() declaration to a new header.
>      >
>      > Simplify main.c since both cocoa & sdl cannot be enabled together.
>      >
>      > (there might be some small conflict with the RFC patch "cocoa:
>     run qemu_init
>      > in the main thread", but the two look like they could be used
>     together
>      > to improve the code)
> 
>     That patch enables cocoa and SDL to be in the same binary, so I think
>     this one (while a good idea in theory) should be the one that loses.

The patch does *not* allow to enable cocoa and SDL to be in the same 
binary, but "[RFC PATCH-for-7.0 v4 0/2] cocoa: run qemu_init in the main 
thread" does.

https://patchew.org/QEMU/20220317125534.38706-1-philippe.mathieu.daude@gmail.com/

> 
>     Akihiko has ideas on how to use the standard main() for Cocoa, by
>     turning qemu_main_loop() into a function pointer, like
> 
>     -void qemu_main_loop()
>     +static void (*qemu_main_loop)(void) = qemu_default_main_loop;
>     +void qemu_default_main_loop()
>        {
>            ...
>        }
> 
>     and cocoa_display_init() would do "qemu_main_loop =
>     qemu_cocoa_main_loop;".
> 
> 
> Akihiko, do you have a patch ? Since you have reviewed this patch 
> already, are you willing to rebase on top of this one?
> 
> thanks
> 
> -- 
> Marc-André Lureau

No, I don't have but I'm willing to author one if nobody else is going to.

Regards,
Akihiko Odaki

