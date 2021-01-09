Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E982F046C
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 00:43:01 +0100 (CET)
Received: from localhost ([::1]:44064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyNsq-0006P6-PG
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 18:43:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyNrx-0005zK-Bh
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 18:42:05 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyNrv-0006U3-9K
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 18:42:04 -0500
Received: by mail-wr1-x431.google.com with SMTP id d26so12489454wrb.12
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 15:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GQL2ac2ZMZq9mrfoDaAuod3sl2d2h/SN6agfRY5EWLA=;
 b=p6nnJJSIXMQ49W9GeoR8uacSttU0TgnwePAMrucK14A0v6y51RTQI652/GA4akKZ54
 /4gRhyG5Wj0cZEMEYD2n72qWw1CNrDfmF/q5o7JfpUf4MzPUyEbHLPF5ffyNRElh+bdX
 9f/vrPeiIEpzBaGuYrm62ktp0JKBNEANubRmOjWGJlRQkELkciX1QI6oj2ivJkPRTSYF
 cxhxfL2GG5enO91YPIoH/GmKld+vyDeDLZwGep/+HifxM4k2mw/j6+T30SEDt3NkWm7r
 s0TN0fHhjSZ2/z/VGUr6dQgn9Cqua5enMJpdYtIRgpfU2IMJG2/zWN1tO6QyMxJV17JA
 FM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GQL2ac2ZMZq9mrfoDaAuod3sl2d2h/SN6agfRY5EWLA=;
 b=ucqTlkzqYA0P0nGSKLF6YPlNs1ZtZvsuT0nJRMMwYcJY7668lePvRsh4MVHqSwUwHQ
 OG0FrYs8HjOocWTWnUBLZdpcG9yDhNcJGkbj1MaRloZ4E+2SV/R+UMFoNbAEr+i6+u2O
 JOrfRW38lHGfdnNi7dYaCldlYhM/Qeq5syGzfpckBsyFiMXEGPq8ri7GnQpcp4PrjrFT
 +9KuMZjHP4N9jZTq8PsFHBV+GsK37kVh4lZVfnIIc0NvLqmwRpArCStn9jZf9+F9Jop9
 g4vwIoQr194pGnUjArhU4FHa6g9cjDo/Ikvm2alkcmwtVvlHsjX8+hTkscm6jelZ6u+H
 qMTQ==
X-Gm-Message-State: AOAM533Zwaf5HhG0ZYRPMBYOlk9NScrre0hzuLITIx/+y822J31M+HQ3
 JwPPUAJSCvJW1zF4R+4/ESA=
X-Google-Smtp-Source: ABdhPJy/QLDqwqJ0MdPAL7bGDzRPWB1Nf+GkxybKnzudx/wQ6lKCviWhzAYaB5i6hmfmb96TTSyIZw==
X-Received: by 2002:a5d:6cad:: with SMTP id a13mr9652597wra.275.1610235721243; 
 Sat, 09 Jan 2021 15:42:01 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id o125sm16973991wmo.30.2021.01.09.15.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Jan 2021 15:42:00 -0800 (PST)
Subject: Re: [PATCH v2 05/13] vt82c686: Set user_creatable=false for
 VT82C686B_PM
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1610223396.git.balaton@eik.bme.hu>
 <d0a806fed5e8055aee4fcf5b2f4790e6dd0f9dc6.1610223397.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <284f3f00-c362-6a6a-8c40-b3c578258106@amsat.org>
Date: Sun, 10 Jan 2021 00:41:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <d0a806fed5e8055aee4fcf5b2f4790e6dd0f9dc6.1610223397.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.255,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/9/21 9:16 PM, BALATON Zoltan wrote:
> This device is part of the multifunction VIA superio/south bridge chip
> so not useful in itself.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

