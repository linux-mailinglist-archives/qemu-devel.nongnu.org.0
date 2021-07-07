Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 917823BE445
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 10:22:12 +0200 (CEST)
Received: from localhost ([::1]:45488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m12ot-00049N-MC
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 04:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m12mn-0002P1-F1; Wed, 07 Jul 2021 04:20:01 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:34415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m12mm-0004cJ-4A; Wed, 07 Jul 2021 04:20:01 -0400
Received: by mail-wr1-x42d.google.com with SMTP id p8so2035559wrr.1;
 Wed, 07 Jul 2021 01:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vlLLwTSvZY5GMEjw/IRDS1ZEL4ADJORW92gO8p1AVPo=;
 b=phcjUTH/90tqdgi6GUSLEDkaCrIWLx2IBE9vSkLVswG/BkzRCrx3ftb/RAMIZ0TR92
 qLt1/jO8mDYqLNY0ewnsVJh9l/fprUfR7cq8ILWjR2Fut/fvUDYy0B9WLUvvzs9QYqz5
 y7UVMyvEUWb7LNzmIwcfkNz8f5RT/3vyYHnrQDDEaMJ4M+7fzu3bu1P3XPBEphz3D27h
 xbAPrvRR1dYhlGMxB2KAs3NTO5zu6kGfF9lF5lTZ/04+/RbaYcW75k2WPKIZgMEpwEGZ
 RNPl7WJOi+KDkfmkyprutW5zw2fH1+XT0F+ldm2Ed83Sbnfvs30C2NqoSbslTiBN+FyZ
 iRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vlLLwTSvZY5GMEjw/IRDS1ZEL4ADJORW92gO8p1AVPo=;
 b=hxHp4Z/HwTJmtt4I0x6sdUbJeoHoEsm6xk/SBcPgjp5KPA1E2IxQC9R2Ll8yUACKwj
 yiwE2pKW5kIMN/vPKU8ljWC63d0kJlnAWGXALFuTQU6rnz1BOVTsdq6VCpxTOhEpBsQY
 blhPFqRDtFChpE0pZWjc2MWlHWCTG26YfkUrNnFvUyD1Z9TEZoMbqxlDKsAoPi/OZdnP
 t5mMgex6RpAqycW+ieNkfHcQTnOhD0JZWuV+xXEhoAnlo4jtGC6iWbTRC+ZLOpYxRmXp
 KKy7oEvpeAX3I66ioUsaC5kKzzQqWHN2OCc6QbqTixmVuYrBvjOxX4n+r2JMItK55NTS
 zd/A==
X-Gm-Message-State: AOAM5335oYAelyK7SHKx6PsKmG8omoynssSQlt0bbDuCADNgWEJ1DqvQ
 h7R0dU7f+3En1idxA76p4ws=
X-Google-Smtp-Source: ABdhPJzJTFClzSqvqfF1xeaW3mPWk2eptKFj9GK+kXWU46bHE8LrCaTIlD0wCuz2SC58sruZfZVGyw==
X-Received: by 2002:a5d:6c69:: with SMTP id r9mr25733314wrz.8.1625645998604;
 Wed, 07 Jul 2021 01:19:58 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id w22sm5447122wmc.4.2021.07.07.01.19.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 01:19:58 -0700 (PDT)
Subject: Re: [PATCH v2 14/36] linux-user/arm: Drop "_v2" from symbols in
 signal.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210706234932.356913-1-richard.henderson@linaro.org>
 <20210706234932.356913-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <65540b48-3192-86b2-c176-3b6f7b2a1fad@amsat.org>
Date: Wed, 7 Jul 2021 10:19:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706234932.356913-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/21 1:49 AM, Richard Henderson wrote:
> Since we no longer support "v1", there's no need to
> distinguish "v2".
> 
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/arm/signal.c | 155 +++++++++++++++++-----------------------
>  1 file changed, 65 insertions(+), 90 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

