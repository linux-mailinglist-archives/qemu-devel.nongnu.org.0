Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5874B5113
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 14:06:24 +0100 (CET)
Received: from localhost ([::1]:41286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJb3f-00023T-FT
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 08:06:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJaVg-00068v-DF; Mon, 14 Feb 2022 07:31:16 -0500
Received: from [2a00:1450:4864:20::42b] (port=35796
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJaVe-0003gn-JX; Mon, 14 Feb 2022 07:31:16 -0500
Received: by mail-wr1-x42b.google.com with SMTP id v12so26622520wrv.2;
 Mon, 14 Feb 2022 04:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tCuL7YOLIzrzWbSSPFf7tbDl4R3BYcsUxO1Bo/PTgVI=;
 b=L7YUQUu6liiBvQUfNKWhp8PX0UTU83qjGKqVsorwwwcjHbBz0s86pvEe0n6mRl09tY
 UVJYQi+kvLLOhOdMzGwwXmnWXXrk7fPgqNSscavbDBaalHzb4xNIf+aQgqxdYMI22ayo
 IvqFTq/3H8N+qF9ViHduk3S391OsnHn2INdoEOYYk+coF3q5uJIw1gmD8xiwps7O+p5G
 9vd7600P0fKp1hBPh8M/iJcY06VtFEpQPYT9hxmNf2nN1bCEB4dUicprrELiFjd6ykRr
 mZymNd02lQnu1VcTONNPRb8z6ZyW9wqud+OjWJdhCdzS9HjKjYbPaCXVHiJ2c3wrUB8m
 nLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tCuL7YOLIzrzWbSSPFf7tbDl4R3BYcsUxO1Bo/PTgVI=;
 b=6TOUTF01QikaslEzK/kL4/NsG1EVOwcSGqyMVcjllJ9uJKGRL9eJahaBZlxLntGXF5
 Fm2j6pnNag7cb1ILLJGRjvFKVndS7ZxX2Mw8WTfD8KQNAHJuiZzO9oUy3u8y1GnLplCd
 BeOoIK5j/cL8RcZcXt6UHBbWiAYKnkbzyPDBEK+n/G1WI/clohiQEJdYdSnqE38DKctm
 vtx8u/gzaLIJNKX91zOELPIGwLWw1zOSaD1hIVnhlh9qCblAMgOBOWy0SaQeaUErBhrD
 7aKoSxT/fR8zqYttcejdsS6i2amH/uhDg/tmUG9VEiBnRFnrrDmsypv8Mp74y4QJzKgs
 lRew==
X-Gm-Message-State: AOAM532EnQL1inm1nQfjpalSBxlKkLspZgEnhxelZrr+1dOyMKNa6pXG
 4A9/41b/Q3bUmFiI/RJAFR4=
X-Google-Smtp-Source: ABdhPJyXce8ElDwaFIVPMT4d7uUrfmLnBXTSKvMowd18HFTT4Vd96O2DdwnWLAwP9l/+OdUnhg6qhQ==
X-Received: by 2002:a05:6000:154a:: with SMTP id
 10mr2047997wry.162.1644841872654; 
 Mon, 14 Feb 2022 04:31:12 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id y10sm11675635wmi.47.2022.02.14.04.31.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 04:31:12 -0800 (PST)
Message-ID: <2ba4330a-849a-3197-1c8d-3f1d655921b1@amsat.org>
Date: Mon, 14 Feb 2022 13:31:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH] ui/cocoa: Do not alert even without block devices
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20220213021418.2155-1-akihiko.odaki@gmail.com>
In-Reply-To: <20220213021418.2155-1-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 13/2/22 03:14, Akihiko Odaki wrote:
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>   ui/cocoa.m | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index ac18e14ce01..271a2676026 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -1715,11 +1715,6 @@ static void addRemovableDevicesMenuItems(void)
>   
>       currentDevice = qmp_query_block(NULL);
>       pointerToFree = currentDevice;
> -    if(currentDevice == NULL) {
> -        NSBeep();
> -        QEMU_Alert(@"Failed to query for block devices!");
> -        return;
> -    }
>   
>       menu = [[[NSApp mainMenu] itemWithTitle:@"Machine"] submenu];
>   

Cc'ing qemu-block@ and Markus (QMP).

I always wondered the point of this annoying warning but never
found out.

Is this menu updated when removable blkdev are hot-plugged from
the monitor or QMP?

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

