Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445002B43F4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:50:05 +0100 (CET)
Received: from localhost ([::1]:43530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedxM-0005OA-8D
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:50:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1keduX-0002Sy-B9; Mon, 16 Nov 2020 07:47:09 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:53146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1keduT-0002en-V7; Mon, 16 Nov 2020 07:47:09 -0500
Received: by mail-wm1-x342.google.com with SMTP id 10so23606640wml.2;
 Mon, 16 Nov 2020 04:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yDKUYrbVhVTNCOiYfY9csEa0hYbgukv7ixcFC0fUONo=;
 b=TuG9SC1Ohls4FZ0y6tQtBOm81jFl8vgnAenWeOwAJoHjjJl+BVUjcheLx/BJui7ZOC
 jRKXqoJnLXkm5ZlsU+19yeFxSiDsQn77++rzjgWBkAeeWmlZLrunz1m2kp9zpiUSn+vV
 ihcNtlfsMY2MNGt00x43jtLEFh5GJv7k9NvmMHm2OaG2qpU8IVrY0iICiCFrP2PLciHi
 Pdj4OZXi+PBxHKEd/flxqGlyFdA7O2APaRlswz7L5W8A7OCdfPXVO6hMDpoqk1iOX9ue
 xMrTX6QWKj9zTBsDUGwqiiOJxzL5f0usAQEfJVfsfmmWqzEZWNk6UYVejpwYycq6ZtwO
 OS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yDKUYrbVhVTNCOiYfY9csEa0hYbgukv7ixcFC0fUONo=;
 b=ckchQTEmShky5V31X2G3F0nd6YztgBxWz4R440V2n6+SIGB68TFW8Rs2U+TIICim8K
 y6uVr1jGfsHWGNAnzS61y86HlCMxragQV92j403Uj5jYOupFnwJoNf89wGAXgPCweCHP
 89/nciJTtaoF8gHeOlab7TWcnZg4XNxyGKi8tiC1RkYXLmS6SCtfVlQkiAc2IUhbDV0C
 e92IUmLoNbIw+MGcJrc59EscpdoPfh/vbs2zB2dX5o7+km0p8tg/vpYmOCY3fSo+1z3c
 ru1e7Vjn5o4D5705ajC+rlSGH1cbji/8BvF2wzgGvMIpQAPYzslQMCu5xyHtlIehMS3P
 KqNg==
X-Gm-Message-State: AOAM530gazsjMDI04UUZRH+tkZG4n06kTm8D2ZR829qdNjcmupEhBbHD
 R3g3IOqAOpRSSogFpbQB190=
X-Google-Smtp-Source: ABdhPJztf0Z2OvGOK4OqBuol5F+q9zFY+hVrhrgto0HXdIzMe0nSVFiIegUFYKuC3K1u602B4cInPQ==
X-Received: by 2002:a1c:61c5:: with SMTP id
 v188mr13762107wmb.141.1605530819992; 
 Mon, 16 Nov 2020 04:46:59 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id b124sm19662365wmh.13.2020.11.16.04.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 04:46:59 -0800 (PST)
Subject: Re: [PATCH v3 2/4] ads7846: put it into the 'input' category
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201112125824.763182-1-ganqixin@huawei.com>
 <20201112125824.763182-3-ganqixin@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2ea44c8c-2bc7-a868-e27a-59655c5e8daf@amsat.org>
Date: Mon, 16 Nov 2020 13:46:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201112125824.763182-3-ganqixin@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, thuth@redhat.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, laurent@vivier.eu,
 armbru@redhat.com, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/20 1:58 PM, Gan Qixin wrote:
> The category of the ads7846 device is not set, put it into the 'input'
> category.
> 
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/display/ads7846.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

