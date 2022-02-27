Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F70E4C5CD3
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 17:25:57 +0100 (CET)
Received: from localhost ([::1]:55634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOMMt-0003KI-7N
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 11:25:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOML3-0001Dx-Au
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 11:24:01 -0500
Received: from [2a00:1450:4864:20::32c] (port=45860
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOML1-0002wL-U4
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 11:24:01 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 az26-20020a05600c601a00b0037c078db59cso4642279wmb.4
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 08:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tNwUUzSUrOL6Yc7hXgzBN3Z6WNvWCtupoMC90nN4l44=;
 b=azQxCeJQygsh1lqrFS450DoSr6gKKUOTrf2O1WacmaWDkkNDyjJZvZYRLIL/i/cDYm
 dGQ6XowC6y0rW5BTY0feljItea3SMelhKyj0UhLQ+UmRb2W/ZyWlRtKs42f6kC1NBmr3
 n7ZP4Fy9Gb/yWZyPYgjwT+AVOS0judiL4i7YNuSQySiXcunzO7aHiqUP30jflN+wE+eF
 2pOSlth57bmr0eM+Uc9itJGRbdMRHYh3EcNzy21IxqreciqkkMD0Nt/zgnx/0+JoBJEp
 09mfD4mhAWi8BUaU30SStzs3spJF25cXPUowH4IgI7hHh7u28MG0VbsUTYNxFi7L58sa
 uiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tNwUUzSUrOL6Yc7hXgzBN3Z6WNvWCtupoMC90nN4l44=;
 b=O9jFWNB/biYhG2K6QvL5nMPJmdClG7fp/mQAgGhNg8jsQ9gK3lOw6C6K67X9HMPbFN
 peo2cnH4STlfURhAxXCq27Egq1nZ4mxS0UAgtlIkKqBw8t9unz8Pyq0fuZiBuXmKEL/d
 DbxTKubxbj0NEf76xiCYD9uO336Dqo8vX7ldQgJ/DU8ZAE14xPfTKnZTVLvdm1UVdrvS
 wcAxS8qceOTQBaMMa7GbMC/jJSOe9nuoODGwfyDxEsQyGlCR/0pIUI1KmgAbtKxjpKv2
 KO4FGtbKhR/UHkddIqnNnWdUyjwVVUGDKQyyElqmrbC2LAMo020pk59j6ZqAtUbfJEcL
 zNQw==
X-Gm-Message-State: AOAM532Bs3fJTO3HiIBLbk5Ir48aC5rw0jVn1MPELAsQzwZ6cVYrz6zq
 Mw9myqstSft5VWoVpBsyWrE=
X-Google-Smtp-Source: ABdhPJyCz/Kd1WADrIbrsK3dAnx573FqYFfTS8PucLxB6PRmcq5NzP6nkPt+NnWotciiSPt30jiDjA==
X-Received: by 2002:a05:600c:2282:b0:381:1938:b182 with SMTP id
 2-20020a05600c228200b003811938b182mr10291129wmf.147.1645979037611; 
 Sun, 27 Feb 2022 08:23:57 -0800 (PST)
Received: from [192.168.1.115] (32.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.32]) by smtp.gmail.com with ESMTPSA id
 p16-20020a7bcc90000000b003811049eb5asm10643643wma.21.2022.02.27.08.23.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 08:23:57 -0800 (PST)
Message-ID: <5d952a72-9e1b-919a-a735-3eba89b54146@gmail.com>
Date: Sun, 27 Feb 2022 17:23:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 4/4] net: Use bundle mechanism
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
References: <20220226124535.76885-1-akihiko.odaki@gmail.com>
 <20220226124535.76885-5-akihiko.odaki@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220226124535.76885-5-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 Programmingkid <programmingkidx@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/2/22 13:45, Akihiko Odaki wrote:
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>   configure         | 1 +
>   include/net/net.h | 2 +-
>   meson.build       | 1 +
>   net/tap.c         | 6 +++++-
>   qemu-options.hx   | 4 ++--
>   5 files changed, 10 insertions(+), 4 deletions(-)

> diff --git a/net/tap.c b/net/tap.c
> index c5cbeaa7a2b..3225d91ae00 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -508,7 +508,11 @@ static int net_bridge_run_helper(const char *helper, const char *bridge,
>       sigprocmask(SIG_BLOCK, &mask, &oldmask);
>   
>       if (!helper) {
> -        helper = default_helper = get_relocated_path(DEFAULT_BRIDGE_HELPER);
> +        helper = default_helper = find_bundle(DEFAULT_BUNDLE_BRIDGE_HELPER);
> +        if (!helper) {
> +            error_setg(errp, "birdge helper not found");

Typo "bridge".

> +            return -1;
> +        }
>       }

