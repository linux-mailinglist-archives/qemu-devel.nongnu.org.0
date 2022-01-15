Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9070848F7BE
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 17:11:26 +0100 (CET)
Received: from localhost ([::1]:41894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8leH-0005Ju-43
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 11:11:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n8lZk-0002sN-LB
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 11:06:44 -0500
Received: from [2a00:1450:4864:20::331] (port=40643
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n8lZh-0004DH-Gz
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 11:06:42 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so13651855wmo.5
 for <qemu-devel@nongnu.org>; Sat, 15 Jan 2022 08:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cCpg3A/iZ8gJ5mGomd1TjXjpLpyoFkRGhOE4NwJt3js=;
 b=igrLSgLC4g/W+teo3oYMZvgjmbiv4yfwjSacWvoQmf6WOQ38d7vapNyxNlh3o2oCQE
 yndOCUTlEujyKslQ/fRgI7bLjqUT8L/BfOAxSzXWU8PZ+eOwSjcWjoLQfTIisv5JlfRt
 SJjSW7s40Dr9mOzpXe4pxH6NJgbjj1x7olrlux1JEOP6gH76z0RdakJE7kp4ITutV11h
 Y2MFReHdA0YHTM3QD36bjVUjG2FZbImyqc4lbMBLQ/puH56WHEr2GhqnVYHrOydNj6UK
 OziCBwzVlNtZ4DsE7b9jJy2xaT7hTwW5KE5F1JYIXkNj/nNHcbU2LJUnzyO/RU3Q/9tm
 cbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cCpg3A/iZ8gJ5mGomd1TjXjpLpyoFkRGhOE4NwJt3js=;
 b=6qKoVmnwp3aPIqYzIfYKOoS0zjV3zjU+D4W5fYOcTICeoc49WHNGjQv7AV0ZkO8F/q
 iNW4yID3lnDosnJfpQMfirvjqvB4sWiUG0rDeq5+tO119/0cCXGdJx2NBHz02pCdAvyV
 RH4wg/PzevtLAdj/2bj6lnB+B15S24hpruJTwuViD+sTkwOqiKXFlkjkq05IOFDdd/9/
 v3Frf5a5X4uurYBgrMOyaUspRdbBHsxgChuhIhmhq3nGuO6uOfR20dkhKMMZIBgkN/Fe
 0D/tj8R4siNHuDPOBx36gs9GFxApenwP6L/O470R//+Gu49wcSdr76q3idRCeHE8T/Bd
 qWOQ==
X-Gm-Message-State: AOAM532IIvgU3AfoWHSXl7YyHU9Ldalpy/dkusPfZO8DDRND45L27nCT
 2iPiWXaj/vwHeFmWrnGsLKw=
X-Google-Smtp-Source: ABdhPJxoPS6JlFekkKTHOtX08Z+a99IqwxFIgf2+XhiJ2kdduacDC5xYwK4x3lfNJ6j+5cPp2DI1jA==
X-Received: by 2002:a5d:6586:: with SMTP id q6mr13036521wru.62.1642262799265; 
 Sat, 15 Jan 2022 08:06:39 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id o12sm56117wrc.51.2022.01.15.08.06.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Jan 2022 08:06:38 -0800 (PST)
Message-ID: <f02b1b04-412e-8d2f-8233-3838d59d1084@redhat.com>
Date: Sat, 15 Jan 2022 17:06:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/2] build-sys: fix undefined ARCH error
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220114084312.3725242-1-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220114084312.3725242-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/22 09:43, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> ../qga/meson.build:76:4: ERROR: Key ARCH is not in the dictionary.
> 
> Fixes commit 823eb013 ("configure, meson: move ARCH to meson.build")
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   qga/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qga/meson.build b/qga/meson.build
> index cfb1fbc0853c..613ecb980286 100644
> --- a/qga/meson.build
> +++ b/qga/meson.build
> @@ -75,7 +75,7 @@ if targetos == 'windows'
>       endif
>       qga_msi = custom_target('QGA MSI',
>                               input: files('installer/qemu-ga.wxs'),
> -                            output: 'qemu-ga-@0@.msi'.format(config_host['ARCH']),
> +                            output: 'qemu-ga-@0@.msi'.format(host_arch),
>                               depends: deps,
>                               command: [
>                                 find_program('env'),

Queued both, thanks.

Paolo

