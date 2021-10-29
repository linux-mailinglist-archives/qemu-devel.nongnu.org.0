Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA6144054A
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 00:06:43 +0200 (CEST)
Received: from localhost ([::1]:52610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mga1J-0001K4-W3
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 18:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgZvE-0004MY-Nw
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 18:00:25 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgZvB-0005BG-M7
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 18:00:24 -0400
Received: by mail-wr1-x430.google.com with SMTP id u18so18839305wrg.5
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 15:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kxju2OX02+kAXihumREswLqZA+DgT1YYU4oI1H0N0k4=;
 b=IWiMkk1QYm1LlWJWooVcJMwhKrN27SYQIkG0mhHBfsi23UAEOyx+MZdiSzv+yr+yLM
 ElLmnh+ireXkOzcMxThv9b52rms8pnVKwMC/p69LYJlssPdsyi8bGaBEBhcW0jpNlLEa
 0m2um7D/jHNayrxUiBj7PQPFjrHwwc078H+4ir7VWZAf87GB9CKIhKCDuaIajlpNPG8K
 AlO3VdZQqyF00iy9w9sy1IQBdHhyfIHPb4h9qEbT+2RdxTXhmq7skLDeJUp5atiUPh7q
 DZA2sek7L29tY+kdBzMsekgOI16aJY/NfSobSLI6G/y0JIcIjJdR3JAIti+ZfnpZHRIF
 ekKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kxju2OX02+kAXihumREswLqZA+DgT1YYU4oI1H0N0k4=;
 b=auMq9K7zvBiF4miHw7uhgsoZAzMph4EwYvn3Gr+hk2z95VqW6Xj/axt+K9QW8cToWU
 9J22YUUBCgC+OBNKgg4N+2QJgt9D7sdnolBJsgVuuypzbn1EJE9AEXD9vukodmItmbyP
 NqCP8SfsdFN90dBxTnBJ4w6NUHzd48+KXTAsQQe3MmEaTfWj7zNYV61Z4pvTINCCinr8
 Ad+JkuzWyKlicySif3DL/a1ZgcAmrcDp4qeZ9DlvIRDIlF4PUSeuEy42D2hHNI5U8mKm
 gt1hAoRnsRIzK9WE2LxN5uN8pPcNDlxl54TuQssC6IQz7E4H8kLoJmKWFn525cyVbyMt
 dNmw==
X-Gm-Message-State: AOAM531duWMkgjgRNXg54aou4/s+9Bup3fDKpGaRHN0NBuZ/1QfCJYNI
 sEL2CyV9SfY2VqOHTjjaZCM=
X-Google-Smtp-Source: ABdhPJxZZdz10fFbtVKffKNAN86Y4auXHOaZHnbmPxVNsZwV28kfbKdvwr0as1gEwhJ9UfSaYhILwA==
X-Received: by 2002:a05:600c:4ed3:: with SMTP id
 g19mr13807334wmq.85.1635544819828; 
 Fri, 29 Oct 2021 15:00:19 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id k17sm6761975wrq.7.2021.10.29.15.00.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 15:00:19 -0700 (PDT)
Message-ID: <37a80613-3430-04c1-05f4-48db6559d0fe@amsat.org>
Date: Sat, 30 Oct 2021 00:00:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 11/30] hw/char/sh_serial: Embed QEMUTimer in state
 struct
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635541329.git.balaton@eik.bme.hu>
 <fd01eb3720ec32dab06e03019f72f3e177033679.1635541329.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <fd01eb3720ec32dab06e03019f72f3e177033679.1635541329.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.512,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 23:02, BALATON Zoltan wrote:
> Instead of allocating timer with timer_new store it directly in the
> state struct. This makes it simpler to free it together with the device.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/char/sh_serial.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

