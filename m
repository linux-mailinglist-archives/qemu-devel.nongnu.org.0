Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1839F4AD07E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 06:16:24 +0100 (CET)
Received: from localhost ([::1]:45726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHIrW-0000Ly-Ni
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 00:16:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHInN-0007sQ-8B
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 00:12:05 -0500
Received: from [2607:f8b0:4864:20::42b] (port=40537
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHInL-0008SK-C1
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 00:12:04 -0500
Received: by mail-pf1-x42b.google.com with SMTP id e6so16885797pfc.7
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 21:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=di6HnIsXkq4rU06DMDoBZgt+/B+gCPq9v91zpelbiwo=;
 b=F/xNvby1WbH6n2JeJU5FagEft4jw7tHf+LrHOiZR2o9NEj8slK1f0PN7pitPxtDg1C
 h7iZFCNN/Tg4Vca+XHjvj12ZRZDaW2UOfF/SZhWBdqSwfM1EqN01rJAu6R/+FH/9bvxE
 WIIXnq50Tcl+JE89C1RgOnrvv1mgE11rIjx8bQYv+GRoaAdRf2ULYfeIMSj3jSW8MnZS
 jtiMuZiy6mESd1OkrQr/Lzm/jCT2KMpkP4W+lhN8Bk1cSLzzM+D6jGZG7uc/jjjzRkQT
 WkUfGKSvNTvm+8FMnCY9LgC7opRTeIkdS6LEJrBomRzkqfi5hyWaafiSnKxLnGFiLoUX
 xx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=di6HnIsXkq4rU06DMDoBZgt+/B+gCPq9v91zpelbiwo=;
 b=KY54jcprhmbmaaqGTmOvJ05gpJpGv3jMjkf/WSdKNBrQA0mGgZU80CY3ZjDnk4X+3p
 1sdjWNw/PnRR6PI19G806jJTgworssiXl7/NhC3krk5GedhYCBUC5QMfITWp3G5Q5XD0
 tHk2kS86gKsTbByOu0JWaXHK7b715RldFodpP/p/E0bC82sbNzB86YllCOL5wMtCiP4O
 k+jJtDvdB68UmrMPwULtOXSNBVFfOcjFXBrshWDr62dHeA4Z7kC4mbQi1JEW1bUImoTL
 7gsx7j4/YfYsXxHqBvzr5xDe+eoPSg5cNa6ikbUVvDzFu2mxcVg0GB/TkJsz1heZPYGI
 GUGg==
X-Gm-Message-State: AOAM531nQZBQ11Cm9nhpmZvzVLSl9lrkVdW9eg/VDOxwun8yOaLfTjPn
 Lb/49r77RfxZGwFrgjPbV/s=
X-Google-Smtp-Source: ABdhPJyWXGh1SidRQSkcgj08oouLX5W4fyPPLZwJomOT7wDIRlDdo4Edh7q9q9Uqu9F13Jfqg/sQMw==
X-Received: by 2002:a63:8543:: with SMTP id u64mr2233884pgd.600.1644297121641; 
 Mon, 07 Feb 2022 21:12:01 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id b12sm927506pfl.123.2022.02.07.21.11.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 21:12:01 -0800 (PST)
Message-ID: <f9e5ecdb-a60a-3f5a-739b-cd06dadf090f@amsat.org>
Date: Tue, 8 Feb 2022 06:11:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH] MAINTAINERS: python - remove ehabkost and add bleal
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20220208000525.2601011-1-jsnow@redhat.com>
In-Reply-To: <20220208000525.2601011-1-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On 8/2/22 01:05, John Snow wrote:
> Eduardo Habkost has left Red Hat and has other daily responsibilities to
> attend to. In order to stop spamming him on every series, remove him as
> "Reviewer" for the python/ library dir and add Beraldo Leal instead.
> 
> For the "python scripts" stanza (which is separate due to level of
> support), replace Eduardo as maintainer with myself.
> 
> (Thanks for all of your hard work, Eduardo!)

Thank you Eduardo, and thank you John for taking this.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   MAINTAINERS | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9814580975..028ac0de25 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2735,13 +2735,13 @@ F: backends/cryptodev*.c
>   Python library
>   M: John Snow <jsnow@redhat.com>
>   M: Cleber Rosa <crosa@redhat.com>
> -R: Eduardo Habkost <eduardo@habkost.net>
> +R: Beraldo Leal <bleal@redhat.com>
>   S: Maintained
>   F: python/
>   T: git https://gitlab.com/jsnow/qemu.git python
>   
>   Python scripts
> -M: Eduardo Habkost <eduardo@habkost.net>
> +M: John Snow <jsnow@redhat.com>
>   M: Cleber Rosa <crosa@redhat.com>
>   S: Odd Fixes
>   F: scripts/*.py


